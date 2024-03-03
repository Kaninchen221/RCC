import QtQuick 6.2
import QtQuick.Layouts

Rectangle {
    id: rectangle1
    width: 300
    height: 100
    color: "#ffffff"
    radius: 4

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        rows: 1
        columns: 2

        Text {
            id: label
            width: 100
            height: 85
            text: qsTr("Status:")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 0
        }

        StackLayout {
            id: stackLayout
            width: 100
            height: 100
            currentIndex: 0
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                id: firstState
                width: 200
                color: "#000000"
                text: qsTr("Not Listening")
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Text {
                id: secondState
                width: 200
                height: 100
                color: "#000000"
                text: qsTr("Listening")
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.column: 1
            }
        }
    }
}
