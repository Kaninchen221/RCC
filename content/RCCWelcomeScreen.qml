import QtQuick 6.2
import RCC

Rectangle {
    id: welcomeScreen
    width: Constants.width
    height: Constants.height
    radius: 4

    color: Constants.itemsPrimaryColor

    Text {
        id: text1
        text: qsTr("Main Menu")
        anchors.fill: parent
        font.pixelSize: Constants.textPrimarySize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
