import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.1

Rectangle {
    id: root
    width: 800
    height: 480
    color: "#31313D"

    // ✅ Main UI
    Column {
        id: mainContent
        anchors.centerIn: parent
        spacing: 20

        Label {
            text: "Welcome to Home Screen!"
            font.pixelSize: 30
            color: "white"
        }

        TextField {
            id: inputField
            width: 200
            placeholderText: "Enter something..."
            font.pixelSize: 18
        }

        Label {
            id: outputLabel
            text: ""
            font.pixelSize: 20
            color: "white"
        }

        Button {
            text: "Show Text"
            onClicked: outputLabel.text = inputField.text
        }
    }

    // ✅ Tap anywhere to clear focus
    MouseArea {
        anchors.fill: parent
        z: 2
        onClicked: {
            inputField.focus = false
        }
    }

    // ✅ InputPanel with robust hide logic
    InputPanel {
        id: inputPanel

        anchors.left: parent.left
        anchors.right: parent.right

        visible: Qt.inputMethod.visible
        height: Qt.inputMethod.visible ? implicitHeight : 0
        y: Qt.inputMethod.visible ? parent.height - implicitHeight : parent.height
    }
}
