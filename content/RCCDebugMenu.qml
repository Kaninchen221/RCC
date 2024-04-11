import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import RCC

Item {
    id: debug
    width: Constants.width
    height: Constants.height
    property var welcomeScreen
    property var serverAndConnectionsScreen
    property var logScreen

    ColumnLayout {
        id: columnLayout
        width: 100
        height: 100
        spacing: 1

        Button {
            id: sendToAllTestMessageDebug
            x: 0
            y: 0
            text: qsTr("Send to all test message")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                RControllerTCP.sendToAll("Hello from RCCController");
            }
        }

        Button {
            id: newConnectionDebug
            x: 0
            y: 58
            text: qsTr("New connection")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                serverAndConnectionsScreen.listOfConnections.newConnection("TestAddress", "TestPort")
            }
        }

        Button {
            id: connectionDisconnectedDebug
            x: 0
            y: 116
            text: qsTr("Connection disconnected")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                serverAndConnectionsScreen.listOfConnections.connectionDisconnected("TestAddress", "TestPort")
            }
        }

        Button {
            id: button
            text: qsTr("AddToSent")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                logScreen.addLogMessage("NewMessage", logScreen.sentLog)
            }
        }

        Button {
            id: button2
            text: qsTr("SpamSent")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                for (let i = 0; i < 50; i++)
                    logScreen.addLogMessage("NewMessage", logScreen.sentLog)
            }
        }

        Button {
            id: button3
            text: qsTr("AddToReceived")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                logScreen.addLogMessage("NewMessage", logScreen.receivedLog)
            }
        }

        Button {
            id: button4
            text: qsTr("SpamReceived")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                for (let i = 0; i < 50; i++)
                    logScreen.addLogMessage("NewMessage", logScreen.receivedLog)
            }
        }
    }
}
