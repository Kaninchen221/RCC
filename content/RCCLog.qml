import QtQuick 6.2
import RCC
import QtQuick.Layouts
import QtQuick.Controls 6.2

Rectangle {
    width: 640
    height: 480
    radius: 4
    color: Constants.backgroundColor

    readonly property var sentLog: sentLog
    readonly property var receivedLog: receivedLog

    ColumnLayout {
        id: columnLayout
        width: parent.width
        anchors.fill: parent
        //anchors.margins: 10

        Rectangle {
            id: rectangle
            height: 200
            width: parent.width
            color: "#ffffff"
            radius: 4
            Layout.fillHeight: true
            Layout.fillWidth: true

            RowLayout {
                id: rowLayout
                anchors.fill: parent
                anchors.topMargin: 10
                spacing: 20

                ColumnLayout {
                    id: sent
                    width: 100
                    height: 100
                    spacing: 0

                    Text {
                        id: text1
                        text: qsTr("Sent")
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }

                    RCCScrollableText {
                        id: sentLog
                        text: ""
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.minimumHeight: 20
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200
                        Layout.minimumWidth: 20
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                }

                ColumnLayout {
                    id: received
                    width: 100
                    height: 100
                    spacing: 0

                    Text {
                        id: text2
                        text: qsTr("Received")
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                    }

                    RCCScrollableText {
                        id: receivedLog
                        text: ""
                        Layout.minimumHeight: 20
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200
                        Layout.minimumWidth: 20
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        RCCController.onMessageReceived.connect(messageReceived)
        RCCController.onMessageSent.connect(messageSent)
    }

    function messageReceived(message) {
        addLogMessage(message, receivedLog)
    }

    function messageSent(message) {
        addLogMessage(message, sentLog)
    }

    function addLogMessage(message, target) {
        if (target.text[target.text.length - 1] === "\n")
            target.text = target.text.slice(0, -1);

        var date = new Date();
        var datetime = "["
                + date.getHours() + ":"
                + date.getMinutes() + ":"
                + date.getSeconds() + ":"
                + date.getMilliseconds() + "]"
        if (target.text.length > 10000)
            target.text = target.text.substring(target.text.indexOf("\n") + 1);

        target.text += "\n" + datetime + "\t" + message
        target.text += "\n"
        target.scrollToBottom()
    }
}
