import QtQuick 6.2
import QtQuick.Layouts
import RCC

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    radius: 4

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
            inputText: "192.168.4.1"

            Component.onCompleted: {
                RControllerHTTP.setAddress(inputText);
            }

            onInputTextChanged: {
                RControllerHTTP.setAddress(inputText);
            }
        }
    }

}
