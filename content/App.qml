// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import RCC
import QtQuick.Controls 6.2
import QtQuick.Layouts

Window {
    id: rootWindow
    width: 1920
    height: 1080

    visible: true
    title: "RCC"

    color: Constants.backgroundColor

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        spacing: 10

        RCCHeaderMenu {
            id: headerMenu
        }

        StackLayout {
            id: screens
            currentIndex: 0
            width: 100
            height: 100

            RCCWelcomeScreen {
                id: welcomeScreen
            }

            RCCServerAndConnections {
                id: serverAndConnectionsScreen
            }

            RCCLog {
                id: logScreen
            }
        }
    }

    Window {
        width: 300
        height: 300
        visible: false
        title: "Debug Menu"

        RCCDebugMenu {
            anchors.fill: parent
            welcomeScreen: welcomeScreen
            serverAndConnectionsScreen: serverAndConnectionsScreen
            logScreen: logScreen
        }

        Component.onCompleted: {
            if (RCCConstants.IsDebugBuild)
            {
                visible = true
            }
        }
    }
}
