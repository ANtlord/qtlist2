import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQml.Models 2.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Scroll")

    ScrollView {
        background: Rectangle {
            color: "#333"
        }

        id: contactList
        // anchors.right: messageList.left
        width: 200;
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        // anchors.fill: parent

        ListView {
            boundsBehavior: Flickable.StopAtBounds
            width: parent.width
            model: 20
            delegate: ItemDelegate {
                Text {
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    text: "Item " + (index + 1)
                    color: "#999"
                }
                width: parent.width
            }
        }
    }

    ScrollView {

        id: messageList
        anchors.bottom: messageInput.top
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: contactList.right
        ScrollBar.vertical.interactive: false

        ListView {
            boundsBehavior: Flickable.StopAtBounds
            width: parent.width
            model: 25
            delegate: ItemDelegate {
                text: "message " + (index + 1)
                width: parent.width
            }
        }
    }

    TextArea {
        id: messageInput
        background: Rectangle {
            border.color: "#ccc"
        }

        height: 100
        anchors.bottom: parent.bottom
        anchors.right: genDataListView.left
        anchors.left: contactList.right

        MouseArea {
            anchors.fill: parent
            onClicked: function() {

            }
        }

    }

    ListView {
        model: [{"name": "Heading1.qml", "text": "XYN"}, {"name": "Heading2.qml", "text": "no comments"}]
        id: genDataListView
        width: 100
        anchors.top: messageList.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        // delegate: Text {
        //     text: modelData
        // }

        delegate: Loader {
            id: loader1
            source: modelData["name"]
            onLoaded: loader1.item.mytext = modelData["text"]
        }
    }
}
