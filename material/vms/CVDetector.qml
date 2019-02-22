import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtMultimedia 5.12
import com.amin.classes 1.0

Rectangle
{
    id: cvdetector
    color: "transparent"
    property string source

    CvDetectFilter
    {
        id: testFilter
        onObjectDetected:
        {
            if((w == 0) || (h == 0))
            {
                smile.visible = false;
            }
            else
            {
                var r = video.mapNormalizedRectToItem(Qt.rect(x, y, w, h));
                smile.x = r.x;
                smile.y = r.y;
                smile.width = r.width;
                smile.height = r.height;
                smile.visible = true;
            }
        }
    }


    MediaPlayer {
        id : mediaplayer
        source: cvdetector.source
        autoPlay: true
    }

    ShaderEffect
    {
        id: videoShader
        property variant src: video
        property variant source: video
    }

    Page
    {
        padding: 5
        GroupBox
        {
            anchors.fill: parent
            padding: 5
            ColumnLayout
            {
                anchors.fill: parent
                VideoOutput
                {
                    id: video
                    source: mediaplayer
                    autoOrientation: false

                    filters: [testFilter]

                    Image
                    {
                        id: smile
                        source: "qrc:/images/smile.png"
                        visible: false
                    }
                }

            }
        }
    }


}
