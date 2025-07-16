import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.1

Rectangle {
    id: root
    width: 800
    height: 480
    color: "#31313D"
    focus: true  // ✅ Root can take focus to clear input

    MouseArea {
        id: backgroundMouseArea
        anchors.fill: parent
        z: 0
        onClicked: {
            console.log("Background clicked")
            inputField.focus = false
            root.forceActiveFocus()
            Qt.inputMethod.hide()  // ✅ FORCE keyboard to hide
        }
    }

    Column {
        id: mainContent
        spacing: 20
        anchors.centerIn: parent
        z: 1

        Label {
            text: "Welcome to Home Screen (SmartQR V2)!"
            font.pixelSize: 30
            color: "white"
        }

        TextField {
            id: inputField
            width: 300
            placeholderText: "Enter something..."
            font.pixelSize: 18

            Keys.onReturnPressed: {
                console.log("Return pressed: " + inputField.text)
                outputLabel.text = inputField.text
                inputField.focus = false
                root.forceActiveFocus()
                Qt.inputMethod.hide()
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Input clicked")
                    inputField.forceActiveFocus()
                }
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
                root.forceActiveFocus()
                Qt.inputMethod.hide()
            }
        }
    }

    // ✅ FINAL: Bind both visible & height
    InputPanel {
        id: inputPanel
        anchors.left: parent.left
        anchors.right: parent.right

        visible: Qt.inputMethod.visible   // ✅ This makes it truly hide/show
        height: visible ? implicitHeight : 0
        y: parent.height - height
    }

    Connections {
        target: Qt.inputMethod
        function onVisibleChanged() {
            if (Qt.inputMethod.visible) {
                console.log("Keyboard is shown")
            } else {
                console.log("Keyboard is hidden")
            }
        }
    }
}
