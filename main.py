from PySide6 import QtWidgets, QtGui
from pathlib import Path
import tomllib as toml
from widgets.main_widget import MainWidget


# TODO:
#  Read template variables from docs files
#  Edit docx files and re-insert variables

<<<<<<< HEAD
LTR_VERSION = "v0.2.2"
=======
LTR_VERSION = "v0.2.3"
>>>>>>> 8a334aa7150962d24c75ab1ad3c729f347e7fc07


if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setStyleSheet("""
    QPushButton { padding: 12px; }
    QLineEdit { padding: 12px; }
    QComboBox { padding: 12px; }
    """)
    app.setFont(QtGui.QFont("Arial", 14))

    # Look for user configs

    config_path = Path.home() / ".ltr/config.toml"

    # Otherwise, use main config

    if not config_path.exists():
        config_path = Path("config.toml")

    # TODO: "Merge" local and central configs?
    base_path = config_path.parent

    if not config_path.exists():
        QtWidgets.QMessageBox.warning(
            None, "Config nicht gefunden",
            "Eine config.toml Datei muss erstellt werden")
        exit(app.exit(0))

    # Load Configurations

    with config_path.open("rb") as config_file:
        configs = toml.load(config_file)

    configs["base_path"] = base_path

    # Load template files and check for existence

    if "template_files" not in configs:
        QtWidgets.QMessageBox.warning(
            None, "Fehler in config.toml",
            "config.toml muss Schlüssel template_files beinhalten")
        exit(app.exit(0))

    # Check which template files exist

    template_files: list[Path] = []
    warning_missing_templates: list[str] = []
    for filename in configs["template_files"]:
        current_file = base_path / filename
        if current_file.exists():
            template_files.append(current_file)
        else:
            warning_missing_templates.append(str(current_file))

    # Display missing template files

    if warning_missing_templates:
        # Abort, if no template file exists
        if len(warning_missing_templates) == len(configs["template_files"]):
            QtWidgets.QMessageBox.warning(
                None, "Fehler in config.toml",
                "Keine der Template-Dateien in config.toml wurde gefunden"
            )
            exit(app.exit(0))

        QtWidgets.QMessageBox.warning(
            None, "Fehler in config.toml",
            f"Die Template-Dateien {', '.join(warning_missing_templates)} konnten nicht gefunden werden")

    configs["template_files"] = template_files

    # Find stylesheet-File

    if "xsl_file" not in configs:
        QtWidgets.QMessageBox.warning(
            None, "Fehler in config.toml",
            "config.toml muss Schlüssel xsl_file beinhalten")
        exit(app.exit(0))

    configs["xsl_file"] = base_path / configs["xsl_file"]
    if not configs["xsl_file"].exists():
        QtWidgets.QMessageBox.warning(
            None, "Datei nicht gefunden",
            "xsl_file existiert nicht")
        exit(app.exit(0))

    # Start program

    widget = MainWidget(configs)
    widget.setWindowTitle(f"LTR - Klinisches Schreibprogramm ({LTR_VERSION})")
    widget.showMaximized()
    widget.show()

    exit(app.exec())

