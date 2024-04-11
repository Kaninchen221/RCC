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

            onClicked: {
                console.log("Clicked Up")

                let method = "GET"
                let ip = "192.168.4.1"
                let command = "{\"T\":1,\"L\":164,\"R\":164}"
                let url = "http://" + ip + "/js?json=" + command
                console.log("Requested url: ", url)
                let request = new XMLHttpRequest();

                request.onreadystatechange = function() {
                    if (request.readyState === XMLHttpRequest.DONE) {
                        let response = {
                            status : request.status,
                            headers : request.getAllResponseHeaders(),
                            contentType : request.responseType,
                            content : request.response
                        };

                        //callback(response);
                    }
                }

                request.open("GET", url);
                request.send();
            }
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
