import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtMultimedia 5.12
import com.amin.classes 1.0


Item {

    property alias source: player.source
    property alias play: player.play


    MediaPlayer {
        id: player
    }

    VideoOutput {
        anchors.fill: parent
        source: player
    }


}

