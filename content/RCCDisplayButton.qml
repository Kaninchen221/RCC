import QtQuick 6.2
import RCC

Item {
    id: root
    property alias buttonText: buttonText.text
    property double marginsPercent: 0.48

    Text {
        id: buttonText
        text: " "
        anchors.fill: parent
        font.pixelSize: Constants.textPrimarySize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        id: buttonBackground2
        border.color: "#000000"
        color: "#00ffffff"
        radius: 4
        border.width: 2
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2
        width: buttonText.contentWidth + 20
        height: buttonText.contentHeight + 20
    }

    function setText(newText) {
        buttonText.text = newText.toUpperCase()
    }
}
