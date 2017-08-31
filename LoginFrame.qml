import QtQuick 2.7
import SddmComponents 2.0

Item {
  id: loginFrame
  property int sessionIndex: sessionModel.lastIndex

  width: 400
  height: 500
  anchors.horizontalCenter: page.horizontalCenter
  y: 340

  Connections {
    target: sddm
    onLoginSucceeded: Qt.quit()

    onLoginFailed: passwordInput.focus = false //Add error here
  }

  Text {
    id: userText
    text: "Ellis"
    anchors.horizontalCenter: parent.horizontalCenter
    y: 0
    color: "white"
    font.family: "FiraMono"
    style: Text.Raised;
    styleColor: "#4DFFFFFF"
    font.pointSize: 20
  }

  Image {
    id: profilePic
    width: 128
    height: 128
    source: "Assets/profile.jpg"

    anchors {
        horizontalCenter: parent.horizontalCenter
        top: userText.bottom
        topMargin: 50
    }

  }

  Item {
    id: passwordBox

    anchors.horizontalCenter: parent.horizontalCenter
    width: 300
    height: 50
    anchors.top: profilePic.bottom
    anchors.topMargin: 50

    Text {
      id: defaultPasswordText
      anchors {
        fill: parent
        topMargin: 15
        leftMargin: 15
      }

      font {
        pointSize: 14
        family: "FiraMono"
      }

      color: "white"
      opacity: 0.3
      text: "Password..."

      states: State {
        name: "hide"; when: passwordInput.activeFocus == true || (passwordInput.text != "")
        PropertyChanges {
          target: defaultPasswordText
          opacity: 0
        }

      }

      transitions: Transition {
        from: ""; to: "hide"; reversible: true
        PropertyAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 750 }
      }

    }

    TextInput {
      id: passwordInput

      anchors {
        fill: parent
        leftMargin: 15
        rightMargin: 50
      }

      font {
        pointSize: 14
        family: "FiraMono"
        letterSpacing: 2
      }

      echoMode: TextInput.Password
      verticalAlignment: TextInput.AlignVCenter
      color: "white"
      clip: true

      onAccepted: {
        sddm.login("ellis", passwordInput.text, sessionIndex)
      }

    }

    Image {
      id: submitPassword

      source: "Assets/RightArrow.png"
      x: 260
      y: 10
      width: 30
      height: 30
      opacity: 0.0

      states: State {
        name: "show"; when: passwordInput.activeFocus == true || (passwordInput.text != "")
        PropertyChanges {
          target: submitPassword
          opacity: 1.0
        }

      }

      transitions: Transition {
        from: ""; to: "show"; reversible: true
        PropertyAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 750 }
      }

    }

  }

  Rectangle {
    id: passwordUnderline

    anchors.bottom: passwordBox.bottom
    anchors.left: passwordBox.left
    width: passwordBox.width
    height: 1
    color: "white"
    opacity: 0.3
    radius: 4

    states: State {
      name: "expand"; when: passwordInput.activeFocus == true || (passwordInput.text != "")
      PropertyChanges {
        target: passwordUnderline
        height: 50
      }
    }

    transitions: Transition {
      from: ""; to: "expand"; reversible: true
      PropertyAnimation { properties: "height"; easing.type: Easing.InOutQuad; duration: 750 }
    }

  }

}
