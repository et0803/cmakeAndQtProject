import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Hello World")
    width: 1920
    height: 1080
    visible: true
    DCamera
    {
        anchors.fill: parent;
    }
}
