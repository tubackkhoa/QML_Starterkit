import QtQuick 2.12
import QtQuick.Controls 2.5
Text {
    anchors.fill: parent
    anchors.leftMargin: 5
    color: "#dddddd"
    font {
        pixelSize: 10
    }
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
    renderType: Text.NativeRendering
}
