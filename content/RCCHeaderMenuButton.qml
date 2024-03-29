import QtQuick 6.2
import QtQuick.Controls 6.2

ToolButton {
    id: root
    text: "Main Menu"
    display: AbstractButton.TextOnly

    property int screenIndex: 0

    function setIsCurrentMenu(isCurrentMenu) {
        root.down = isCurrentMenu
    }
}
