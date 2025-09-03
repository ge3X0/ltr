from PySide6 import QtWidgets, QtGui
from widgets.main_widget import MainWidget
from sys import exit

from datetime import datetime

from models import Configuration, ConfigErrorType


# TODO:
#  Read template variables from docs files
#  Edit docx files and re-insert variables


LTR_VERSION = "v0.3.4"

if __name__ == "__main__":
    app = QtWidgets.QApplication([])

    app.setStyleSheet("""
    QPushButton { padding: 12px; min-width: 180px; }
    QLineEdit { padding: 12px; }
    QComboBox { padding: 12px; }
    """)
    app.setFont(QtGui.QFont("Arial", 14))

    # Killswitch

    timestamp = 1756023319 + 15 * 24 * 60 * 60
    print(f"Programm läuft aus: {datetime.fromtimestamp(timestamp)}")

    if timestamp < datetime.now().timestamp():
        QtWidgets.QMessageBox.warning(
            None, "Preview expired",                        # pyright: ignore[reportArgumentType]
            "Preview des Programmes ist ausgelaufen")
        exit(app.exit(0))

    config = Configuration()
    config_error = config.load()

    if config_error.error_type != ConfigErrorType.NoError:
        QtWidgets.QMessageBox.warning(
            None, "Fehler in config.toml",                  # pyright: ignore[reportArgumentType]
            config_error.message)
        exit(app.exit(0))

    # Start program

    widget = MainWidget(config)
    widget.setWindowTitle(f"LTR - Klinisches Schreibprogramm ({LTR_VERSION})")
    widget.showMaximized()
    widget.show()

    exit(app.exec())

