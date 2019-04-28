import QtQuick 2.9
import QtQuick.Controls 2.0
import "../../Config"
Rectangle {
    id: root
    property url normalUrl
    property url hoveredUrl
    property url pressedUrl
    property url disabledUrl

    property alias imageItem: img
    property alias imageUrl: img.source

    property alias imageWidth: img.width
    property alias imageHeight: img.height
    property alias imageAnchors: img.anchors
    property alias containsMouse: area.containsMouse
    property alias containsPress: area.containsPress
    signal click();

    border.color: TConfig.buttonStyle.borderColor
    border.width: (containsPress || containsMouse) ? 1 : 0
    Image {
        id: img
        anchors.fill: parent
        source: root.enabled ? (containsPress ? pressedUrl : (containsMouse ? hoveredUrl : normalUrl)) : disabledUrl
    }

    MouseArea {
        id: area
        anchors.fill: parent;
        hoverEnabled: parent.enabled;
        onClicked: root.click();
        cursorShape: Qt.PointingHandCursor
    }
}
