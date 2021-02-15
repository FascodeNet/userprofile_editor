import QtQuick 2.0
import QtQuick.Window 2.14
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id:mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    signal clicked_usericon();
    signal stdout_sig(string data);
    signal do_copy_face_sig(string data);
    function stdout(data){
        stdout_sig(data);
    }
    function do_copy_face(data){
        do_copy_face_sig(data);
    }

    FileDialog{
        id: usericon_dialog
        title:qsTr("Please select icon")

        width: 640
        height: 480
        nameFilters:["Image Files (*.jpg *.png *.jpeg)","All Files (*)"]
        onAccepted: {
            //stdout(fileUrl);
            do_copy_face(fileUrl);
        }
        onRejected: {

            visible= false;
        }
        visible: false;
    }

    Image {
        id: usericonimage
        x: 34
        y: 126
        width: 200
        height: 200
        source: UserIconSrc
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onClicked: {
                usericon_dialog.visible=true;
                clicked_usericon();
            }
        }
    }

    Label {
        id: username_label
        x: 92
        y: 96
        text: UserNameKun
    }
    Component.onCompleted: {

    }

}


