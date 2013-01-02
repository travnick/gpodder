import QtQuick 1.1
import QtDesktop 0.1

Window {
  id: addpodcast
  width: 400
  height: 100

  Text {
    id: label_add
    text: _("URL:")
    anchors.left: parent.left
    anchors.verticalCenter: entry_url.verticalCenter
  }

  TextField {
    id: entry_url
    anchors.right: btn_paste.left
    anchors.left: label_add.right
    anchors.verticalCenter: parent.verticalCenter
  }

  Button {
    id: btn_paste
    text: _("Paste")
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
  }

  Button {
    id: btn_add
    text: _("Add")
    anchors.bottom: parent.bottom
    anchors.right: parent.right
  }

  Button {
    id: btn_close
    text: _("Cancel")
    anchors.right: btn_add.left
    anchors.bottom: parent.bottom
  }
}