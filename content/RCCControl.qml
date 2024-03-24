import QtQuick 6.2
import RCC
import QtQuick.Layouts

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.itemsPrimaryColor
    radius: 4
    focus: true

    readonly property string defaultText: "Press any button"

    FocusScope {
        id: focusScope
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        focus: true

        Keys.onPressed: (event) => {
            console.log("onPressed", event.key)
            lastPressedButton.setText(event.text)
        }

        onActiveFocusChanged: {
            if (!activeFocus) {
                lastPressedButton.buttonText = defaultText
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: { focusScope.focus = true }

            RCCDisplayButton {
                id: lastPressedButton
                anchors.fill: parent
                buttonText: defaultText
            }

            Text {
                id: text1
                text: "Click this window!"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 383
                font.pixelSize: Constants.textPrimarySize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                visible: !focusScope.activeFocus
            }
        }
    }
}
