// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts
import RCC

Window {
    id: rootWindow
    width: 1280
    height: 800

    visible: true
    title: "RCC"

    color: Constants.backgroundColor

    Component.onCompleted: {
        visibility = RCPPConstants.IsSteamdeck ? Window.FullScreen : Window.Windowed
    }

    HoverHandler {
        acceptedPointerTypes: PointerDevice.Finger
        cursorShape: Qt.BlankCursor
    }

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

        SwipeView {
            id: screens
            wheelEnabled: true
            spacing: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            currentIndex: 1

            function informHeaderMenuAboutCurrentMenu() {
                headerMenu.setCurrentMenu(currentIndex - RCPPConstants.IsDebugBuild)
            }

            onCurrentIndexChanged: {
                informHeaderMenuAboutCurrentMenu()
            }

            Component.onCompleted: {
                informHeaderMenuAboutCurrentMenu()
            }

            RCCDebugMenu {
                id: debugScreen
                welcomeScreen: welcomeScreen
                serverAndConnectionsScreen: serverAndConnectionsScreen
                logScreen: logScreen
                visible: false

                Component.onCompleted: {
                    if (RCPPConstants.IsDebugBuild) {
                        visible = true
                    }
                    else {
                        screens.removeItem(screens.itemAt(0))
                    }
                }
            }

            RCCWelcomeScreen {
                id: welcomeScreen
            }

            RCCServerAndConnections {
                id: serverAndConnectionsScreen
            }

            RCCHttpConfigScreen {
                id: httpConfigScreen
            }

            RCCLog {
                id: logScreen
            }

            RCCControl {
                id: controlScreen
            }
        }
    }
}
