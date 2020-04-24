import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5
import "qml"
import AuthManager 1.0

Window {
    AuthManager{

    }

    id: window
    visible: true
    width: 280
    height: 500
    title: "Authorization"
    property int instance: 1

    Loader {
        id: authLoader
        anchors.fill: parent
        anchors.top: top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: (window.instance == 1) ? "qml/SignInForm.qml" : "qml/SignUpForm.qml"
    }

    Row {
        id: clickRow
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        ClickableText {
            id:signIN
            enabled: !instance
            text: "Sign in"
            font.underline: instance
            onClicked: {
                window.instance = 1
            }
        }
        Text {
            id: slash
            text: "/"
            font.pixelSize: 16
            color: "#404040"
        }
        ClickableText {
            id:signUP
            enabled: instance
            text: "Sign up"
            font.underline: !instance
            onClicked: {
                window.instance = 0
            }
        }
    }
}
