import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.0
import QtWebEngine 1.6

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Test Flash and Web games")

    TextField {
        id: url
        width: 400
        anchors.horizontalCenter: btn.horizontalCenter
        anchors.bottom: btn.top
        anchors.bottomMargin: 20
        text: "http://projects.iarke.us/codenamelumberjack/"
    }

    Button {
        id: btn
        anchors.centerIn: parent
        text: "PLAY"
        onClicked: {
            game.visible = true
        }
        enabled: !game.visible
    }

    Window {
        id: game
        title: "Game Window"
        width: 640
        height: 480
        visible: false
        WebEngineView {
            id: webView
            anchors.fill: parent
            url: url.text
            backgroundColor: "transparent"
            settings {
                showScrollBars: false
                pluginsEnabled: true
            }
        }
    }
}
