import QtQuick 1.1
import QtDesktop 0.1

import 'config.js' as Config
import "util.js" as Util

Window {
  id: preferences
  property variant myController: undefined

  width: Config.windowWidth
  height: Config.windowHeight

  TabFrame {
    id: notebook
    anchors.bottom: action_area.top
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottomMargin: Config.smallSpacing

    TabBar {
      id: general
      property string title: Util._("General")
      anchors.fill: parent

      Item {
        id: generalRow1
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: combo_audio_player_app.height

        Label {
          id: label_audio_player
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          text: Util._("Audio player:")
          verticalAlignment: Text.AlignVCenter
        }

        ComboBox {
          id: combo_audio_player_app
          anchors.verticalCenter: parent.verticalCenter
          anchors.left: label_audio_player.right
          anchors.right: button_audio_player.left
        }

        ToolButton {
          id: button_audio_player
          text: iconName ? "" : Util._("Edit")
          iconName: "document-edit"
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: parent.right
        }
      }

      Item {
        id: generalRow2
        anchors.top:generalRow1.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: combo_video_player_app.height

        Label {
          id: label_video_player
          anchors.verticalCenter: parent.verticalCenter
          anchors.left: parent.left
          text: Util._("Video player:")
          verticalAlignment: Text.AlignVCenter
        }

        ComboBox {
          id: combo_video_player_app
          anchors.verticalCenter: parent.verticalCenter
          anchors.left: label_video_player.right
          anchors.right: button_video_player.left
        }

        ToolButton {
          id: button_video_player
          text: iconName ? "" : Util._("Edit")
          iconName: "document-edit"
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: parent.right
        }
      }
    }


    ScrollArea {
      id: extensions
      property string title: Util._("Extensions")
      anchors.fill: parent

      ListView {
        id: list_view1
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        height: count*40
        delegate: Item {
          x: 5
          height: 40
          Row {
            id: row1
            spacing: 10
            Rectangle {
              width: 40
              height: 40
              color: colorCode
            }

            Text {
              text: name
              anchors.verticalCenter: parent.verticalCenter
              font.bold: true
            }
          }
        }
        model: ListModel {
          ListElement {
            name: "Grey"
            colorCode: "grey"
          }

          ListElement {
            name: "Red"
            colorCode: "red"
          }

          ListElement {
            name: "Blue"
            colorCode: "blue"
          }

          ListElement {
            name: "Green"
            colorCode: "green"
          }
        }
      }
    }

    TabBar {
      id: flattr_config
      property string title: Util._("Flattr")
      anchors.fill: parent

      Label {
        id: label_flattr
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        text: Util._("Please sign in with Flattr and Support Publishers")
        verticalAlignment: Text.AlignVCenter
      }

      Button {
        id: button_flattr_login
        anchors.top: label_flattr.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        text: Util._("Sign in")
      }

      CheckBox {
        id: checkbutton_flattr_on_play
        anchors.top: button_flattr_login.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        text: Util._("Automatically flattr episodes on playback")
      }
    }


    TabBar {
      id: mygpo_config
      property string title: Util._("Gpodder config")
      anchors.fill: parent

      CheckBox {
        id: checkbutton_enable
        text: Util._("Synchronize subscriptions and episode actions")
        anchors.top: parent.top
      }

      Grid {
        id: grid1
        anchors.top: checkbutton_enable.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        rows: 4
        columns: 2

        Label {
          id: label_username
          text: Util._("Username:")
          horizontalAlignment: Text.AlignRight
          verticalAlignment: Text.AlignVCenter
        }

        TextField {
          id: entry_username
        }

        Label {
          id: label_password
          text: Util._("Password:")
          horizontalAlignment: Text.AlignRight
          verticalAlignment: Text.AlignVCenter
        }

        TextField {
          id: entry_password
        }

        Label {
          id: label_caption
          text: Util._("Device name:")
          horizontalAlignment: Text.AlignRight
          verticalAlignment: Text.AlignVCenter
        }

        TextField {
          id: entry_caption
        }
      }


      Button {
        id: button_overwrite
        text: Util._("Replace list on server with local subscriptions")
        anchors.top: grid1.bottom
      }
    }

    TabBar {
      id: updating
      property string title: Util._("Updating")
      anchors.fill: parent

      Item {
        id: name

        Label {
          id: label_update_interval
          text: Util._("Update interval:")
          anchors.top: parent.top
          anchors.left: parent.left
        }

        Slider {
          id: hscale_update_interval
          anchors.left: label_update_interval.right
          anchors.top: parent.top
          anchors.right: parent.right
        }
      }

      Item {
        id: name2
        anchors.top: name.bottom

        Label {
          id: label_episode_limit
          text: Util._("Maximum number of episodes per podcast:")
        }

        SpinBox {
          id: spinbutton_episode_limit
        }
      }

      Label {
        id: label_auto_download
        text: Util._("When new episodes are found:")
      }

      ComboBox {
        id: combo_auto_download
      }
    }

    TabBar {
      id: downloads
      property string title: Util._("Downloads")
      anchors.fill: parent

      Label {
        id: label_expiration
        text: Util._("Delete played episodes:")
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.verticalCenter: hscale_expiration.verticalCenter
      }

      Slider {
        id: hscale_expiration
        anchors.top: parent.top
        anchors.left: label_expiration.right
        anchors.right: parent.right
      }

      CheckBox {
        id: checkbutton_expiration_unfinished
        text: Util._("Remove played episodes even if unfinished")
        anchors.top: hscale_expiration.bottom
        anchors.left: parent.left
      }

      CheckBox {
        id: checkbutton_expiration_unplayed
        text: Util._("Also remove unplayed episodes")
        anchors.top: checkbutton_expiration_unfinished.bottom
        anchors.left: parent.left
      }
    }

    TabBar {
      id: devices
      property string title: Util._("Devices")
      anchors.fill: parent

      Label {
        id: label_device_type
        anchors.left: parent.left
        anchors.verticalCenter: combobox_device_type.verticalCenter
        text: Util._("Device type:")
      }

      ComboBox {
        id: combobox_device_type
        anchors.top: parent.top
        anchors.left: label_device_type.right
        anchors.right: parent.right
      }

      Label {
        id: label_device_mount
        anchors.left: parent.left
        anchors.verticalCenter: btn_filesystemMountpoint.verticalCenter
        text: Util._("Mountpoint:")
      }

      ComboBox {
        id: btn_filesystemMountpoint
        anchors.top: combobox_device_type.bottom
        anchors.left: label_device_mount.right
        anchors.right: parent.right
      }

      Label {
        id: label_on_sync
        anchors.left: parent.left
        anchors.verticalCenter: combobox_on_sync.verticalCenter
        text: Util._("After syncing an episode:")
      }

      ComboBox {
        id: combobox_on_sync
        anchors.top: btn_filesystemMountpoint.bottom
        anchors.left: label_on_sync.right
        anchors.right: parent.right
      }
      CheckBox {
        id: checkbutton_skip_played_episodes
        anchors.top: combobox_on_sync.bottom
        anchors.left: parent.left
        text: Util._("Only sync unplayed episodes")
      }
    }
  }

  ButtonRow {
    id: action_area
    anchors.bottom: parent.bottom
    anchors.bottomMargin: Config.smallSpacing
    anchors.right: parent.right
    anchors.rightMargin: Config.smallSpacing
    spacing: Config.smallSpacing

    Button {
      id: button_advanced
      text: Util._("Edit config")
      onClicked: controller.createWindow(preferences, "ConfigEditor.qml")
    }

    ToolButton {
      id: button_close
      text: iconName ? "" : Util._("Close")
      iconName: "window-close"
      onClicked: myController.close()
    }
  }
}

