import QtQuick 1.1
import QtDesktop 0.1
import "config.js" as Config
import "util.js" as Util

ToolBar {
  id: toolbar
  anchors.right: parent.right
  anchors.left: parent.left
  property bool aboutToHide: false

  function toggleVisible(){
    aboutToHide = !aboutToHide
  }

  states: [
    State {
      name: "visible"; when: !aboutToHide
      PropertyChanges { target: toolbar; y:0 }
    },
    State {
      name: "hidden"; when: aboutToHide
      PropertyChanges { target: toolbar; y:-height}
    }
  ]

  transitions: Transition {
    SequentialAnimation {
      NumberAnimation {
        duration: Config.slowTransition
        properties: "y"
        easing.type: Easing.OutBack
      }
    }
  }

  ToolButton {
    id: toolDownload
    text: _("Download")
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
  }

  ToolButton {
    id: toolPlay
    text: _("Play")
    anchors.left: toolDownload.right
    anchors.verticalCenter: parent.verticalCenter
    onClicked: controller.onPlayback
  }

  ToolButton {
    id: toolCancel
    text: _("Cancel")
    anchors.left: toolPlay.right
    anchors.verticalCenter: parent.verticalCenter
  }

  ToolButton {
    id: toolPreferences
    text: _("Preferences")
    anchors.left: toolCancel.right
    anchors.verticalCenter: parent.verticalCenter
    onClicked: Util.createWindow(parent, "Preferences.qml")
  }

  ToolButton {
    id: toolQuit
    text: _("Quit")
    anchors.left: toolPreferences.right
    anchors.verticalCenter: parent.verticalCenter
    onClicked: controller.quit()
  }
}
