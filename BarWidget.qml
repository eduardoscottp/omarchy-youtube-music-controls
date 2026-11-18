import QtQuick
import qs.Ui
import qs.Commons

BarWidget {
  id: root
  moduleName: "io.github.eduardoscottp.youtube-music-controls"
  readonly property var media: bar?.shell?.firstPartyServiceFor("omarchy.media")
  readonly property var player: media ? media.activePlayer : null
  readonly property bool visibleTrack: !!player && !!(player.trackTitle || player.trackArtist)
  visible: visibleTrack
  implicitWidth: visibleTrack ? row.implicitWidth + Style.space(12) : 0
  implicitHeight: barSize

  function action(name) { if (media) media.runAction(name, false) }
  function control(icon, tooltip, enabled, actionName) {
    return null
  }

  Row {
    id: row
    anchors.centerIn: parent
    spacing: Style.space(6)
    Repeater {
      model: [
        { icon: "󰒮", hint: "Previous track", action: "previous", enabled: root.player && root.player.canGoPrevious },
        { icon: root.player && root.player.isPlaying ? "󰏤" : "󰐊", hint: root.player && root.player.isPlaying ? "Pause" : "Play", action: "playPause", enabled: root.player && (root.player.canTogglePlaying || root.player.canPlay || root.player.canPause) },
        { icon: "󰒭", hint: "Next track", action: "next", enabled: root.player && root.player.canGoNext }
      ]
      Text {
        required property var modelData
        textFormat: Text.PlainText
        text: modelData.icon
        visible: !!modelData.enabled
        color: root.bar.barForeground
        font.family: root.bar.fontFamily
        font.pixelSize: Style.font.body
        MouseArea { anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor; onClicked: root.action(parent.modelData.action); onEntered: root.bar.showTooltip(parent, parent.modelData.hint); onExited: root.bar.hideTooltip(parent) }
      }
    }
    Text {
      textFormat: Text.PlainText
      text: root.player ? (root.player.trackTitle + (root.player.trackArtist ? " — " + root.player.trackArtist : "")) : ""
      color: root.bar.barForeground
      font.family: root.bar.fontFamily
      font.pixelSize: Style.font.body
      elide: Text.ElideRight
      width: Math.min(Style.space(180), implicitWidth)
    }
  }
}
