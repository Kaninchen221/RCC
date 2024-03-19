import QtQuick 6.2
import QtQuick.Controls 6.2

ScrollView {
    id: scrollView
    contentWidth: scrollView.availableWidth
    contentHeight: logText.height
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
    ScrollBar.vertical.policy: ScrollBar.AlwaysOn

    property string text : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." +
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." +
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. " +
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    Text {
        id: logText
        width: parent.parent.width
        text: scrollView.text
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.rightMargin: 20
        font.pixelSize: 12
        wrapMode: Text.WordWrap
    }

    function scrollToBottom() {
        scrollView.ScrollBar.vertical.position = 1 - scrollView.ScrollBar.vertical.size
    }
}
