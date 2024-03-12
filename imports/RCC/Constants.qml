pragma Singleton
import QtQuick 6.2
import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    // Colors
    readonly property color backgroundColor: "#EAEAEA"

    readonly property color itemsPrimaryColor: "#ffffff"
    readonly property color itemsSecondaryColor: "#3aa0a0a0"

    readonly property color transparentColor: "#00000000"

    // Text
    readonly property color textUnderscoreColor: "#000000"

    readonly property color textValidColor: "#b5cb00"
    readonly property color textInvalidColor: "#ff0000"

    readonly property double textPrimarySize: 24
    readonly property double textSecondarySize: 18

    property StudioApplication application: StudioApplication {
        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
    }
}
