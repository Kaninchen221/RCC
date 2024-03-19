// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import RCC
import QtQuick.Controls 6.2
import QtQuick.Layouts

Window {
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
            currentIndex: 2
            width: 100
            height: 100

            RCCWelcomeScreen {
                id: welcomeScreen
            }

            RCCServerAndConnections {
                id: serverAndConnectionsScreen
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.fillWidth: true
            }

            RCCLog {
                id: logScreen
            }
        }

    }

}

