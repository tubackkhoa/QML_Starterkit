import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.12

ApplicationWindow {
    id: window
    width: 800
    height: 500
    visible: true
    title: "VMS"

    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem {
                text: qsTr("&Open...")
                icon.name: "document-open"
                onTriggered: fileOpenDialog.open()
            }
        }

        Menu {
            title: "&Help"
            MenuItem {
                text: "&About..."
                onTriggered: aboutDialog.open()
            }
        }
    }

    header: ToolBar {
        Flow {
            id: headerRowLayout
            anchors.fill: parent
            spacing: 0

            ToolButton {
                text: "Open"
                icon.name: "folder"
                onClicked: fileOpenDialog.open()
            }
            ToolButton {
                icon.name: "settings"
            }

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                icon.name: "power"
                onClicked: Qt.quit()
            }
        }
    }



    background: Rectangle {
        color: "darkGray"
    }

    FileDialog {
        id: fileOpenDialog
        title: "Select a video file"
        folder: shortcuts.documents
        nameFilters: [
            "Video files (*.mp4 *.ogg *.flv)",
        ]
        onAccepted: {
            player.source = fileOpenDialog.fileUrl
            player.play();
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Video Viewer")
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: StandardButton.Ok
    }


    MediaPlayer {
        id: player
    }

    VideoOutput {
        anchors.fill: parent
        source: player
    }



    JSConsole {
        anchors.fill: parent
    }

}
