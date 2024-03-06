import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts


Rectangle {
    id: root
    color: "#ffffff"
    radius: 4

    Component.onCompleted: {
        RCCController.onNewConnection.connect(newConnection)
    }

    function newConnection(address, port) {
        console.log("New connection arrived!")
        console.log(`${address} ${port}`);
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

    ScrollView {
        id: scrollView
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Grid {
            id: grid
            anchors.fill: parent
            rows: 999
            columns: 1
        }
    }
}
