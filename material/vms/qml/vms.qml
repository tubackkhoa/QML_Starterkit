import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.12
import com.amin.classes 1.0
import "table"
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: window
    width: Screen.width - 100
    height: Screen.height - 100
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
        color: "#202f3f"
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


    Table {
//        checkable: true
        anchors.fill: parent
        dividerColor: "#202f3f"
        dividerWidth: 2
        headerColor: "#284860"
        rowColor:"#202f3f"
        rowAlternateColor: "#202f3f"
        currentColor: "transparent"
        hoveredColor: "blue"
        columns: [
            TableColumn {
                width: 40

                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignHCenter
                    ToolButton {
                        anchors { horizontalCenter: parent.horizontalCenter;fill:parent}
                        icon.height: 18
                        icon.width: 18
                        icon.color: "#dddddd"
                        icon.name: "folder"
                    }
                }
                content:TableColumnContent {
                    horizontalAlignment: Text.AlignHCenter

                    Image {
                        anchors { horizontalCenter: parent.horizontalCenter}
                           fillMode: Image.PreserveAspectFit
                           source: "qrc:/icons/vms/32x32/"+model.icon+".png"
                           sourceSize.width: 10
                           sourceSize.height: 10
                           ColorOverlay {
                                   anchors.fill: parent
                                   source: parent
                                   color: model.level
                               }
                        }

                }
            },
            TableColumn {
                width: 50

                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignHCenter
                    text: "Mức độ"
                }
                content:TableColumnContent {
                    horizontalAlignment: Text.AlignHCenter
                    Rectangle {
                        anchors { horizontalCenter: parent.horizontalCenter}
                        width: 8
                        height: 8
                        radius: 4
                        border.color: "transparent"
                        border.width: 0
                        color: model.level
                    }
                }
            },
            TableColumn {
                width: 150
                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignLeft
                    text: "Thời gian"
                }
                content: TableColumnContent {
                    horizontalAlignment: Text.AlignLeft
                    text: model.time
                }
            },
            TableColumn {
                width: 150
                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignLeft
                    text: "Tên camera"
                }
                content: TableColumnContent {
                    horizontalAlignment: Text.AlignLeft
                    text: model.camera
                }
            },
            TableColumn {
                width: 200
                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignLeft
                    text: "Chi tiết"
                }
                content: TableColumnContent {
                    horizontalAlignment: Text.AlignLeft
                    text: model.detail
                }
            },
            TableColumn {
                width: 150
                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignLeft
                    text: "Người xử lý"
                }
                content: TableColumnContent {
                    horizontalAlignment: Text.AlignLeft
                    text: model.person
                }
            },
            TableColumn {
                width: 150
                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignLeft
                    text: "Trạng thái"
                }
                content: TableColumnContent {
                    horizontalAlignment: Text.AlignLeft
                    text: model.status
                }
            },
            TableColumn {
                width: 150
                header: TableColumnHeader {
                    horizontalAlignment: Text.AlignLeft
                    text: "Thời gian cập nhật"
                }
                content: TableColumnContent {
                    horizontalAlignment: Text.AlignLeft
                    text: model.updateTime
                }
            }

        ]
        model: ListModel {
            ListElement {
                icon: "power"
                level: "red"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "cart"
                level: "green"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "settings"
                level: "#ffce00"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "music"
                level: "#ff5554"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "power"
                level: "red"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "cart"
                level: "green"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "settings"
                level: "#ffce00"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "music"
                level: "#ff5554"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "power"
                level: "red"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "cart"
                level: "green"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "settings"
                level: "#ffce00"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "music"
                level: "#ff5554"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "power"
                level: "red"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "cart"
                level: "green"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "settings"
                level: "#ffce00"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
            ListElement {
                icon: "music"
                level: "#ff5554"
                time: "20/12/2018 10:12"
                camera: "X03-khu B"
                detail: "Giấy phép trong danh sách"
                person: "Nguyễn Hoàng An"
                status: "Được xác định"
                updateTime: "20/12/2018 10:12"
            }
        }

    }



}
