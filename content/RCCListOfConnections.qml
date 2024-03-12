import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import RCC

Rectangle {
    id: root
    color: Constants.itemsPrimaryColor
    radius: 4

    Component.onCompleted: {
        RCCController.onNewConnection.connect(newConnection)
        RCCController.onConnectionDisconnected.connect(connectionDisconnected)
    }

    function newConnection(address, port) {
        console.log(`New connection arrived! ${address} ${port}`)
        listOfConnections.addConnectionInfo(address, port)
    }

    function addConnectionInfo(address, port) {
        var component = Qt.createComponent("RCCConnectionInfo.qml");
        var connectionInfo = component.createObject(
                    grid,
                    {width: root.width, addressText: address, portText: port}
                    );
        updateScrollViewContentHeight()
    }

    function updateScrollViewContentHeight() {
        var totalHeight = 0
        for(var i = 0; i < grid.children.length; ++i) {
            totalHeight += grid.children[i].height
        }
        scrollView.contentHeight = totalHeight
    }

    function connectionDisconnected(address, port) {
        console.log(`Connection disconnected! ${address} ${port}`)
        for(var i = 0; i < grid.children.length; ++i) {
            var child = grid.children[i]
            if (String(child.addressText) === String(address) && String(child.portText) === String(port)) {
                child.destroy()
                break
            }
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        //ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Grid {
            id: grid
            anchors.fill: parent
            rows: 100
            columns: 1
        }
    }
}
