import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import RCC

Rectangle {
    id: root
    color: Constants.itemsPrimaryColor
    radius: 4

    Component.onCompleted: {
        RCC_Controller.onNewConnection.connect(newConnection)
        RCC_Controller.onConnectionDisconnected.connect(connectionDisconnected)
    }

    function newConnection(address, port) {
        console.log(`New connection arrived! ${address} ${port}`)
        listOfConnections.addConnectionInfo(address, port)
    }

    function addConnectionInfo(address, port) {
        let component = Qt.createComponent("RCCConnectionInfo.qml");
        let connectionInfo = component.createObject(
                    grid,
                    {width: root.width, addressText: address, portText: port}
                    );
        updateScrollViewContentHeight()
    }

    function updateScrollViewContentHeight() {
        let totalHeight = 0
        for(let i = 0; i < grid.children.length; ++i) {
            totalHeight += grid.children[i].height
        }
        scrollView.contentHeight = totalHeight
    }

    function connectionDisconnected(address, port) {
        console.log(`Connection disconnected! ${address} ${port}`)
        for(let i = 0; i < grid.children.length; ++i) {
            let child = grid.children[i]
            if (String(child.addressText) === String(address) && String(child.portText) === String(port)) {
                child.destroy()
                break
            }
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Grid {
            id: grid
            anchors.fill: parent
            rows: 100
            columns: 1
        }
    }
}
