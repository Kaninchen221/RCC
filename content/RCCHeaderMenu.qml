import QtQuick 6.2
import QtQuick.Layouts
import RCC

Rectangle {
    id: root
    width: 600
    height: 100
    color: Constants.itemsPrimaryColor
    radius: 4

    Layout.preferredHeight: 40
    Layout.minimumHeight: 20
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    Layout.fillWidth: true

    signal indexChanged(index: int)

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 0

        readonly property var menus: ["Main Menu", "TCP Server", "HTTP", "Log", "Control"]

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
                   if (RCC_CPP_Constants.IsDebugBuild) {
                        screens.currentIndex = screenIndex + 1
                    }
                    else {
                        screens.currentIndex = screenIndex
                    }
                    root.indexChanged(screens.currentIndex)
                }
            }
        }
    }

    function setCurrentMenu(index) {
        for (let i = 0; i < repeater.count; i++) {
            repeater.itemAt(i).setIsCurrentMenu(index === i)
        }
        root.indexChanged(screens.currentIndex)
    }

    function getMenus() { return rowLayout.menus }
}
