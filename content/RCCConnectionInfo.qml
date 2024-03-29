import QtQuick 6.2
import QtQuick.Layouts
import RCC

Rectangle {
    id: rectangle

    width: 300
    height: 100
    color: Constants.itemsPrimaryColor

    property alias addressText: address.text
    property alias portText: port.text

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        rows: 1
        columns: 2

        Text {
            id: address
            width: 100
            height: 85
            text: qsTr("Address")
            font.pixelSize: Constants.textPrimarySize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Text {
            id: port
            width: 200
            text: qsTr("Port")
            font.pixelSize: Constants.textPrimarySize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
