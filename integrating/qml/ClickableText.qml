import QtQuick 2.0

Text {
    id: clickableText
    text: "ClickableText"
    font.pixelSize: 16
    color: "grey"

    signal clicked()

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            clickableText.clicked()
        }
    }
}
