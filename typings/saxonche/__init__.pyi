from typing import Iterable


class PyXdmValue:
    def __iter__(self) -> PyXdmValue:
        ...

    def __next__(self) -> PyXdmValue | None:
        ...

    @property
    def string_value(self) -> str:
        ...


class PyXdmItem(PyXdmValue):
    def __init__(self) -> None:
        ...



class PyXdmNode(PyXdmItem):
    pass


class PyXsltExecutable:
    def transform_to_string(self, xdm_node: PyXdmNode) -> str:
        ...


class PyXPathProcessor:
    def declare_namespace(self, prefix: str, url: str) -> None:
        ...

    def set_context(self, xdm_item: PyXdmNode) -> None:
        ...

    def evaluate(self, xdm_path: str) -> PyXdmItem | None:
        ...


class PyXslt30Processor:
    def set_parameter(self, name: str, value: PyXdmValue) -> None:
        ...

    def compile_stylesheet(self, stylesheet_file: str) -> PyXsltExecutable:
        ...


class PySaxonProcessor:
    def __init__(self, license: bool = False) -> None:
        ...

    def new_xslt30_processor(self) -> PyXslt30Processor:
        ...

    def new_xpath_processor(self) -> PyXPathProcessor:
        ...

    def make_string_value(self, value: str) -> PyXdmValue:
        ...

    def parse_xml(self, xml_text: str = "", xml_file_name: str = "") -> PyXdmNode:
        ...

