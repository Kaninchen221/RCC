import QtQuick 6.2
import RCC
import QtQuick.Layouts

Rectangle {
    id: welcomeScreen
    width: Constants.width
    height: Constants.height
    radius: 4

    color: Constants.itemsPrimaryColor

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.leftMargin: parent.width * 0.4
        anchors.rightMargin: parent.width * 0.4

        Text {
            id: text1
            text: qsTr("Main Menu")
            Layout.preferredHeight: 50
            font.pixelSize: Constants.textPrimarySize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.preferredWidth: 40
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.minimumWidth: 40
            Layout.minimumHeight: 20
        }

        RCCButton {
            id: exitButton
            text: qsTr("Exit")
            Layout.preferredWidth: 40
            Layout.preferredHeight: 50
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.minimumWidth: 40
            Layout.minimumHeight: 20

            onClicked: {
                Qt.quit()
            }
        }
    }
}
