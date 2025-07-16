import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.1

Rectangle {
    id: root
    width: 800
    height: 480
    color: "#31313D"

    // ✅ Full-screen MouseArea to close keyboard when clicking outside
    MouseArea {
        id: backgroundMouseArea
        anchors.fill: parent
        z: 0
        onClicked: {
            inputField.focus = false  // Remove focus from TextField
        }
    }

    Column {
        id: mainContent
        spacing: 20
        anchors.centerIn: parent
        z: 1  // Bring input above MouseArea

        Label {
            text: "Welcome to Home Screen (SmartQR V1)!"
            font.pixelSize: 30
            color: "white"
        }

        TextField {
            id: inputField
            width: 300
            placeholderText: "Enter something..."
            font.pixelSize: 18

            inputMethodHints: Qt.ImhNone

            Keys.onReturnPressed: {
                console.log("Return pressed: " + inputField.text)
                outputLabel.text = inputField.text
                inputField.focus = false
            }

            // ✅ MouseArea inside TextField to handle click focus
            MouseArea {
                anchors.fill: parent
                onClicked: inputField.forceActiveFocus()
            }
        }

        Label {
            id: outputLabel
            text: ""
            font.pixelSize: 20
            color: "white"
        }

        Button {
            text: "Show Text"
            onClicked: {
                outputLabel.text = inputField.text
                inputField.focus = false
            }
        }
    }

    InputPanel {
        id: inputPanel
        anchors.left: parent.left
        anchors.right: parent.right

        // ✅ This makes keyboard appear only when needed
        height: Qt.inputMethod.visible ? implicitHeight : 0
        y: parent.height - height
    }
}
