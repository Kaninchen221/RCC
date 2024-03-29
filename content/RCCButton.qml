import QtQuick 6.2
import QtQuick.Controls 6.2

Rectangle {
    id: root
    width: 150
    height: 100
    border.width: 1
    radius: 4
    border.color: "#424242"
    property alias text: internalButton.text

    ToolButton {
        id: internalButton
        anchors.fill: parent
        text: "Up"

        function setIsCurrentMenu(isCurrentMenu) {
            root.down = isCurrentMenu
        }
    }
}
