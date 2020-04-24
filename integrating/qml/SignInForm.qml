import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5
import AuthManager 1.0

Item {
    id: signInItem
    visible: true
    AuthManager{
        id: authManager
        onRegistererRequestCompleted: {
            console.log(token);
            console.log(error);

        }
    }

    Text{
        id: titleSignIn
        color: "black"
        text: "SIGN IN"
        font.pixelSize: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField{
        id:loginSignIn
        width: 250
        font.pixelSize: 16
        placeholderText: "login"
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleSignIn.bottom
    }

    TextField{
        id:passwordSignIn
        width: 250
        font.pixelSize: 16
        placeholderText: "password"
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loginSignIn.bottom
        echoMode: TextInput.Password
    }

    Button{
        id: signInButton
        text: "sign in"
        width: 100
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passwordSignIn.bottom
        anchors.topMargin: 10
        enabled: loginSignIn.length > 5 && passwordSignIn.length > 5
        onClicked: {
            loadingIndicator.running = true;
            authManager.authenticate(loginSingIn.text,passwordSingIn.text)
        }
    }

    BusyIndicator{
        id: loadingIndicator
        anchors.top: signInButton.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        running: false
    }
}
