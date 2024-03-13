import QtQuick 6.2
import QtQuick.Controls 6.2

ToolButton {
    id: mainMenuButton
    text: qsTr("Main Menu")
    display: AbstractButton.TextOnly

    property int screenIndex: 0
}
