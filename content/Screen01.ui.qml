

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
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    InputBox {
        id: address2
        x: 243
        y: 315
        width: 271
        height: 103
        textInput1Text: "192.168.1.101"
    }

    InputBox {
        id: port2
        x: 520
        y: 315
        width: 271
        height: 103
        textInput1Text: "5000"
        text1Text: "Port"
    }

    SimpleStatus {
        id: listetningStatus
        height: 103
        width: 295
        x: 954
        y: 315
    }

    Rectangle {
        id: rectangle2
        x: 797
        y: 315
        width: 151
        height: 103
        color: "#ffffff"
        radius: 4

        Button {
            id: button
            text: qsTr("Listen")
            anchors.fill: parent
            font.pointSize: 20
            flat: true
        }
    }
}
