import QtQuick 6.2
import QtQuick.Controls 6.2

Item {
    id: debug
    width: 220
    height: 200

    Button {
        id: sendToAllTestMessageDebug
        x: 0
        y: 0
        text: qsTr("Send to all test message")

        onClicked: {
            RCCController.sendToAll("Hello from RCCController");
        }
    }

    Button {
        id: newConnectionDebug
        x: 0
        y: 58
        text: qsTr("New connection")

        onClicked: {
            listOfConnections.newConnection("TestAddress", "TestPort")
        }
    }

    Button {
        id: connectionDisconnectedDebug
        x: 0
        y: 116
        text: qsTr("Connection disconnected")

        onClicked: {
            listOfConnections.connectionDisconnected("TestAddress", "TestPort")
        }
    }
}
