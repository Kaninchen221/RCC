import QtQuick 6.2
import RCC
import QtQuick.Layouts
import QtQuick.Controls 6.2

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.itemsPrimaryColor
    radius: 4

    GridLayout {
        id: gridLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        rowSpacing: 5
        columnSpacing: 5
        width: 800
        height: 500
        rows: 3
        columns: 3

        RCCButton {
            text: qsTr("Up")
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 1
        }

        RCCButton {
            text: qsTr("Left")
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 0
        }

        RCCButton {
            text: qsTr("Right")
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 2
        }

        RCCButton {
            text: qsTr("Down")
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 1
        }
    }
}
