/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Switch {
    id: control

    implicitWidth: backgroundItem.implicitWidth
    implicitHeight: backgroundItem.implicitHeight

    readonly property int baseSize: 12
    width: 200
    height: 100
    property alias text1Text: text1.text

    background: backgroundItem
    Rectangle {
        id: backgroundItem
        color: "#ffffff"
        radius: 4
        implicitWidth: control.baseSize * 6.0
        implicitHeight: control.baseSize * 3.8
    }

    leftPadding: 4

    indicator: switchHandle

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        rows: 2
        columns: 1

        Text {
            id: text1
            text: qsTr("SwitchText")
            font.pixelSize: 24
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: switchHandle
            implicitWidth: control.baseSize * 4.8
            implicitHeight: control.baseSize * 2.6
            color: "#e9e9e9"
            radius: control.baseSize * 1.3
            anchors.verticalCenter: parent.verticalCenter
            Layout.fillWidth: false
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            anchors.verticalCenterOffset: 15

            Rectangle {
                id: rectangle
                width: 31.2
                height: 31.2

                radius: control.baseSize * 1.3
                anchors.verticalCenter: parent.verticalCenter
                color: "#e9e9e9"
            }
        }
    }
    states: [
        State {
            name: "off"
            when: !control.checked && !control.down

            PropertyChanges {
                target: rectangle
                color: "#cccccc"
            }

            PropertyChanges {
                target: switchHandle
                color: "#00000000"
                border.color: "#aeaeae"
            }
        },
        State {
            name: "on"
            when: control.checked && !control.down

            PropertyChanges {
                target: switchHandle
                color: "#047eff"
                border.color: "#ffffff"
            }

            PropertyChanges {
                target: rectangle
                x: parent.width - width
            }
        },
        State {
            name: "off_down"
            when: !control.checked && control.down

            PropertyChanges {
                target: rectangle
                color: "#e9e9e9"
            }

            PropertyChanges {
                target: switchHandle
                color: "#00000000"
                border.color: "#047eff"
            }
        },
        State {
            name: "on_down"
            when: control.checked && control.down

            PropertyChanges {
                target: rectangle
                x: parent.width - width
                color: "#e9e9e9"
            }

            PropertyChanges {
                target: switchHandle
                color: "#b1047eff"
                border.color: "#ffffff"
            }
        }
    ]
}
