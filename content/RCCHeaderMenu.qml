import QtQuick 6.2
import QtQuick.Layouts
import RCC

Rectangle {
    id: headerMenu
    width: 600
    height: 100
    color: Constants.itemsPrimaryColor
    radius: 4

    Layout.preferredHeight: 40
    Layout.minimumHeight: 20
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    Layout.fillWidth: true

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 0

        readonly property var menus: ["Main Menu", "Server && Connections", "Log", "Control"]

        Repeater {
            id: repeater
            model: rowLayout.menus.length

            delegate : RCCHeaderMenuButton {
                text: rowLayout.menus[index]
                screenIndex: index
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.preferredHeight: parent.height
                Layout.maximumHeight: parent.height
                Layout.fillWidth: true
                Layout.minimumWidth: 10
                Layout.preferredWidth: 10

                onClicked: {
                    screens.currentIndex = screenIndex
                }
            }
        }
    }
}
