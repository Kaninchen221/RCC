import QtQuick 6.2
import QtQuick.Controls 6.2

Item {
    id: debug
    width: 200
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
            for (let i = 0; i < 5; i++) {
                listOfConnections.newConnection("TestAddress", "TestPort")
            }
        }
    }
}
