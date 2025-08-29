from pathlib import Path
import tomllib as toml
from typing import Any
import os
from enum import Enum
from dataclasses import dataclass


class ConfigErrorType(Enum):
    NoError = 0
    NoTemplateFilesKey = 1
    TemplateFilesNotFound = 2
    TemplateFilesMissing = 3
    NoConfigFound = 4
    NoXslKey = 5
    XslFileNotFound = 6
    NoFileDBKey = 7
    FileDBNotFound = 8
    DiagnosisSubstitutionFormat = 9
    FormNotFound = 10


@dataclass
class ConfigError:
    error_type: ConfigErrorType = ConfigErrorType.NoError
    message: str = ""


def process_path(path: str | Path, base_path: Path) -> Path:
    """Expand system envvars and set path onto current base path"""
    return base_path / Path(os.path.expandvars(path))


def expand_paths(configs: dict[str, Any], base_path: Path):
    check_paths = ["file_db", "xsl_file", "save_path", "output_path"]

    for path in check_paths:
        if path in configs:
            configs[path] = process_path(configs[path], base_path)

    if "template_files" in configs:
        configs["template_files"] = [process_path(p, base_path) for p in configs["template_files"]]

    if "forms" in configs:
        configs["forms"] = [process_path(f"./forms/{p}.toml", base_path) for p in configs["forms"]]


class Configuration:

    def __extend_configs(self, add_config: dict[str, Any]):
        """Extends the dictionary config with values from add_config
        :param config: dictionary to extend. Should be adict loaded from a toml file
        :param add_config: used to extend config, can overwrite values"""

        for k, v in add_config.items():
            if k in self.configs:
                if isinstance(self.configs[k], dict) and isinstance(v, dict):
                    self.configs[k] |= v

                elif isinstance(self.configs[k], list) and isinstance(v, list):
                    if k == "forms":
                        for new_path in v:
                            for i, old_path in enumerate(self.configs[k]):
                                if old_path.stem == new_path.stem:
                                    self.configs[k][i] = new_path
                                    break
                            else:
                                self.configs[k].append(new_path)
                    else:
                        self.configs[k].extend(v)
                    # self.configs[k] = list(set(self.configs[k]))

                else:
                    self.configs[k] = v

            else:
                self.configs[k] = v


    def __check_templates(self) -> ConfigError:
        if "template_files" not in self.configs:
            return ConfigError(
                ConfigErrorType.NoTemplateFilesKey,
                "config.toml muss Schlüssel template_files beinhalten")

        if len(self.configs["template_files"]) == 0:
            return ConfigError(
                ConfigErrorType.NoTemplateFilesKey,
                "config.toml beinhaltet keine Template Dateien")

        warning_missing_templates = [str(p) for p in self.configs["template_files"] if not p.exists()]

        if warning_missing_templates:

            if len(warning_missing_templates) == len(self.configs["template_files"]):
                return ConfigError(
                    ConfigErrorType.TemplateFilesNotFound,
                    "Keine der Template-Dateien in config.toml wurde gefunden")

            return ConfigError(
                ConfigErrorType.TemplateFilesMissing,
                f"Die Template-Dateien {', '.join(warning_missing_templates)} konnten nicht gefunden werden")

        return ConfigError()


    def __init__(self):
        self.configs: dict[str, Any] = {
            "save_path": "./data",
            "output_path": "./output",
            "forms": [],
            "ignore_meds": [],
            "substitute_meds": {},
            "substitute_diagnoses": {},
            "process_files": ["word/document.xml", "word/header1.xml"],
        }


    def __getitem__(self, key: str) -> Any:
        return self.configs[key]


    def __setitem__(self, key: str, value: Any):
        self.configs[key] = value


    def load(self) -> ConfigError:

        # Look for global configs

        config_path = Path("config.toml")

        if config_loaded := config_path.exists():
            with config_path.open("rb") as config_file:
                self.configs.update(toml.load(config_file))
            expand_paths(self.configs, config_path.parent)

        # Look for user configs

        config_path = Path.home() / ".ltr/config.toml"

        if config_path.exists():
            with config_path.open("rb") as config_file:
                usr_configs = toml.load(config_file)
            expand_paths(usr_configs, config_path.parent)

            self.__extend_configs(usr_configs)
            config_loaded = True


        if not config_loaded:
            return ConfigError(
                ConfigErrorType.NoConfigFound,
                "Eine config.toml muss mindestens im Ausführungsverzeichnis oder im Benutzerverzeichnis vorliegen")

        if "file_db" not in self.configs:
            return ConfigError(
                ConfigErrorType.NoFileDBKey,
                "config.toml muss einen file_db Schlüssel beinhalten")

        if not self.configs["file_db"].exists():
            return ConfigError(
                ConfigErrorType.FileDBNotFound,
                "Datenbank-Datei nicht gefunden")

        res = self.__check_templates()
        if res.error_type != ConfigErrorType.NoError:
            return res

        if "forms" in self.configs:
            for form_file in self.configs["forms"]:
                if not form_file.exists():
                    return ConfigError(
                        ConfigErrorType.FormNotFound,
                        f"Formulardatei '{form_file}' nicht gefunden")

        # Find stylesheet-File

        if "xsl_file" not in self.configs:
            return ConfigError(
                ConfigErrorType.NoXslKey,
                "config.toml muss Schlüssel xsl_file beinhalten")

        if not self.configs["xsl_file"].exists():
            return ConfigError(
                ConfigErrorType.XslFileNotFound,
                "xsl_file existiert nicht")

        # Easy transfer of template change to other widgets
        self.configs["current_template"] = self.configs["template_files"][0]

        if "substitute_diagnoses" in self.configs:
            for _, subst in self.configs["substitute_diagnoses"].items():
                # Substitution is not empty, but does not match required params
                if subst and len(subst) != 2:
                    return ConfigError(
                        ConfigErrorType.DiagnosisSubstitutionFormat,
                        "Diagnosen-substitution muss genau 2 Elemente enthalten")
        
        return ConfigError()
