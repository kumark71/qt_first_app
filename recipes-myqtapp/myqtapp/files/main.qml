import QtQuick 2.15
import QtQuick.Window 2.15


Window {
    id: window
    width: 800
    height: 480
    visible: true
    title: qsTr("Splash")

    property real progressValue: 0.0
    property int barWidth: window.width * 0.69

    Loader {
        id: screenLoader
        anchors.fill: parent
        sourceComponent: splashScreen
    }

    Component {
        id: splashScreen

        Item {
            width: window.width
            height: window.height

            Image {
                anchors.fill: parent
                source: "qrc:/images/splash_screen_img.png"
            }

            // ✅ Single progress fill Rectangle directly
            Rectangle {
                id: progressFill
                width: barWidth * Math.min(progressValue, 1.0)
                height: 30
                x: (window.width - barWidth) / 2   // Centered horizontally
                y: 360                               // Adjust to match your bar position in image
                radius: 5
                color: "#BDC3C7"

                Behavior on width {
                    NumberAnimation { duration: 100 }
                }
            }

            Timer {
                interval: 200
                running: true
                repeat: true
                onTriggered: {
                    if (progressValue < 1.0) {
                        progressValue += 0.05
                    } else {
                        progressValue = 1.0
                        stop()
                        screenLoader.source = "qrc:/home_screen.qml"
                    }
                }
            }
        }
    }
}
