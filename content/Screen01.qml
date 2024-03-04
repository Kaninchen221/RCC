

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

    RCCInputBox {
        id: addressInputBox
        x: 445
        y: 233
        width: 254
        height: 107
        textInputText: "192.168.1.101"
    }

    RCCInputBox {
        id: portInputBox
        x: 705
        y: 233
        width: 150
        height: 107
        textInputText: "5000"
        labelText: "Port"
    }

    RCCSimpleStatus {
        id: listeningSimpleStatus
        x: 1009
        y: 233
        width: 300
        height: 107
    }

    RCCSwitch {
        id: listenSwitch
        x: 861
        y: 233
        width: 142
        height: 107
        text1Text: "Listen"

        onSwitchOn: {
            RCCController.startListening()
            //console.log("Listen switch on")
        }
        onSwitchOff: {
            RCCController.stopListening()
            //console.log("Listen switch off")
        }
    }
}
