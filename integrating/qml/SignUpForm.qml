import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5
import AuthManager 1.0

Item {
    id: signUpLoader
    visible: true

    AuthManager{
        id: authManager
    }

    Text{
        id: titleSignUp
        color: "black"
        text: "SIGN UP"
        font.pixelSize: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField{
        id:loginSignUp
        width: 250
        font.pixelSize: 16
        placeholderText: "login"
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleSignUp.bottom
    }

    TextField{
        id:passwordSignUp
        width: 250
        font.pixelSize: 16
        placeholderText: "password"
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: loginSignUp.bottom
	echoMode: TextInput.Password
    }

    TextField{
        id:passwordCheckSignUp
        width: 250
        font.pixelSize: 16
        placeholderText: "repeat password"
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passwordSignUp.bottom
	echoMode: TextInput.Password
    }

    TextField{
        id:nickName
        width: 250
        font.pixelSize: 16
        placeholderText: "nickname"
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passwordCheckSignUp.bottom
    }

    Text{
        id: passwordWarning
        text: "password values aren't same!"
        font.pixelSize: 16
        visible: false
        anchors.top: signUpButton.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "red"
    }

    Button{
        id: signUpButton
        width: 150
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top: nickName.bottom
        text: "sign up"
        enabled: loginSignUp.length > 5 && nickName.length > 5 && passwordSignUp.length > 5 && passwordCheckSignUp.length > 5
        onClicked:{
            console.log("signUpBottom is pressed")
            if (passwordSignUp.text != passwordCheckSignUp.text){
                passwordWarning.visible = true
                loadingIndicatorlogin.running = false
                authManager.register(loginSignUp.text, passwordSignUp.text)
            }
            else{
                passwordWarning.visible = false
                loadingIndicatorlogin.running = true
            }
            ;
        }
    }

    BusyIndicator{
        id: loadingIndicatorlogin
        anchors.top: signUpButton.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        running: false
    }
}
