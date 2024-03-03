

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import RCC

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Button {
        id: button
        text: qsTr("Press me")
        anchors.verticalCenter: parent.verticalCenter
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: button
            onClicked: animation.start()
        }
    }

    Item {
        id: inputText
        x: 473
        y: 161
        width: 433
        height: 90

        Rectangle {
            id: background
            x: 0
            y: 0
            color: "#666666"
            radius: 0
            border.width: 0
            anchors.fill: parent

            Row {
                id: row
                anchors.fill: parent

                Text {
                    id: label
                    text: qsTr("Text")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }

                TextInput {
                    id: textInput
                    width: 80
                    height: 20
                    text: qsTr("Text Input")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    Pane {
        id: pane
        x: 419
        y: 433
        width: 380
        height: 143

        Column {
            id: column
            anchors.fill: parent

            Flow {
                id: flow1
                anchors.fill: parent
                flow: Flow.LeftToRight

                Text {
                    id: text1
                    text: qsTr("Address")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 10
                    anchors.rightMargin: 0
                    font.pixelSize: 20
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

                    Rectangle {
                        id: rectangle1
                        color: "#3aa0a0a0"
                        radius: 4
                        anchors.fill: parent
                    }
                    TextInput {
                        id: textInput1
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 10
                        anchors.bottomMargin: 10
                        font.pixelSize: 24
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        maximumLength: 20
                    }
                }
            }
        }
    }
    states: [
        State {
            name: "clicked"
            when: button.checked
        }
    ]
}
