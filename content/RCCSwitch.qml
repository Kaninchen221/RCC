

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
    id: root

    implicitWidth: backgroundItem.implicitWidth
    implicitHeight: backgroundItem.implicitHeight
    width: 200
    height: 100

    readonly property int baseSize: 12
    property alias text1Text: text1.text

    signal switchOn
    signal switchOff

    background: backgroundItem
    Rectangle {
        id: backgroundItem
        color: "#ffffff"
        radius: 4
        implicitWidth: root.baseSize * 6.0
        implicitHeight: root.baseSize * 3.8
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
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Rectangle {
            id: switchHandle
            implicitWidth: root.baseSize * 4.8
            implicitHeight: root.baseSize * 2.6
            color: "#e9e9e9"
            radius: root.baseSize * 1.3
            Layout.bottomMargin: 5
            Layout.fillWidth: false
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.row: 2

            Rectangle {
                id: rectangle
                width: 31.2
                height: 31.2

                radius: root.baseSize * 1.3
                anchors.verticalCenter: parent.verticalCenter
                color: "#e9e9e9"
            }
        }
    }
    states: [
        State {
            name: "off"
            when: !root.checked && !root.down

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
            when: root.checked && !root.down

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
            when: !root.checked && root.down

            PropertyChanges {
                target: rectangle
                color: "#e9e9e9"
            }

            PropertyChanges {
                target: switchHandle
                color: "#00000000"
                border.color: "#047eff"
            }

            StateChangeScript {
                name: "SwitchOff"
                script: {
                    root.switchOff()
                }
            }
        },
        State {
            name: "on_down"
            when: root.checked && root.down

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

            StateChangeScript {
                name: "SwitchOn"
                script: {
                    root.switchOn()
                }
            }
        }
    ]
}
