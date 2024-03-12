import QtQuick 6.2
import QtQuick.Controls 6.2
import RCC

Rectangle {
    id: root

    property alias labelText: label.text
    property alias inputText: textInput.text
    property alias editable: textInput.readOnly

    width: 400
    height: 200
    visible: true
    radius: 4

    states: [
        State {
            name: "clicked"
            when: textInput.activeFocus
            PropertyChanges {
                target: underscore
                visible: true
            }
        }
    ]

    Rectangle {
        id: rectangle
        color: Constants.itemsPrimaryColor
        radius: 4
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 12
        anchors.bottomMargin: 12

        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            anchors.fill: parent

            Text {
                id: label
                text: qsTr("Address")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                font.pixelSize: Constants.textSecondarySize
            }

            Pane {
                id: pane1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 30
                anchors.bottomMargin: 0
                padding: 0
                leftPadding: 0
                topPadding: 0

                Rectangle {
                    id: textBackground
                    color: Constants.itemsSecondaryColor
                    radius: 4
                    anchors.fill: parent
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0

                    Rectangle {
                        id: underscore
                        y: 146
                        height: 2
                        visible: false
                        color: Constants.textUnderscoreColor
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        layer.enabled: false
                        enabled: true
                    }
                }

                TextInput {
                    id: textInput
                    x: 12
                    y: 12
                    text: "Example Text"
                    anchors.fill: parent
                    font.pixelSize: Constants.textPrimarySize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    selectByMouse: false
                    maximumLength: 18
                }

            }
        }
    }
}
