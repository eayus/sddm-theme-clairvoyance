import QtQuick 2.0

Item {

  width: 250
  height: 250

  property string name: model.name
  property string icon: model.icon

  //User's Name
  Text {
    id: usersName

    color: "white"
    font {
      family: "FiraMono"
      pointSize: 20
    }
    text: name
    anchors.horizontalCenter: parent.horizontalCenter
  }

  //User's Profile Pic
  Image {
    id: usersPic

    width: 128
    height: 128
    anchors {
      top: usersName.bottom
      topMargin: 50
      horizontalCenter: parent.horizontalCenter
    }
    source: icon
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      listView.currentIndex = index;
      page.state = "login";
      loginFrame.name = name
      loginFrame.icon = icon
      listView.focus = false
      loginFrame.focus = true
    }
  }

}
