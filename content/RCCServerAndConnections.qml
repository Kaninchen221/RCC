

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import RCC
import QtQuick.Layouts

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    readonly property var listOfConnections: listOfConnections

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        layoutDirection: Qt.LeftToRight
        flow: GridLayout.LeftToRight
        rowSpacing: 4
        columnSpacing: 1
        rows: 6
        columns: 1

        RowLayout {
            id: serverControllsLayout
            Layout.fillHeight: false
            Layout.minimumWidth: 620
            Layout.minimumHeight: 90
            spacing: 6
            Layout.maximumHeight: 120
            Layout.preferredHeight: 80
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.fillWidth: true

            RCCInputBox {
                id: addressInputBox
                Layout.minimumWidth: 200
                Layout.fillWidth: true
                Layout.fillHeight: true
                inputText: "192.168.1.101"
            }

            RCCInputBox {
                id: portInputBox
                Layout.minimumWidth: 100
                Layout.fillWidth: true
                Layout.fillHeight: true
                inputText: "5000"
                labelText: "Port"
            }

            RCCSwitch {
                id: listenSwitch
                Layout.minimumWidth: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                text1Text: "Listen"

                onSwitchOn: {
                    console.log("Listen switch on")
                    RCCController.startListening(addressInputBox.inputText,
                                                 portInputBox.inputText)
                    informAboutIsListening()
                }
                onSwitchOff: {
                    console.log("Listen switch off")
                    RCCController.stopListening()
                    informAboutIsListening()
                }

                function informAboutIsListening() {
                    listeningSimpleStatus.status = RCCController.isListening
                    addressInputBox.editable = RCCController.isListening
                    portInputBox.editable = RCCController.isListening

                }
            }

            RCCSimpleStatus {
                id: listeningSimpleStatus
                Layout.minimumWidth: 220
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        RCCListOfConnections {
            id: listOfConnections
            width: serverControllsLayout.width
            Layout.minimumWidth: 300
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}


