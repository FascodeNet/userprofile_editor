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
    signal clicked_savebutton();
    signal stdout_sig(string data);
    signal do_copy_face_sig(string data);
    signal reset_txt_box_sig();
    function stdout(data){
        stdout_sig(data);
    }
    function do_copy_face(data){
        do_copy_face_sig(data);
    }
    function reset_txt_box(){
        reset_txt_box_sig();
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

    Label {
        id: label
        x: 254
        y: 133
        text: "Display Name"
    }

    TextField {
        id: textField
        x: 362
        y: 126
        placeholderText: qsTr("Display Name")
        text:display_Name
    }

    Label {
        id: label1
        x: 254
        y: 184
        text: qsTr("Email")
    }

    TextField {
        id: email_textField1
        x: 362
        y: 176
        placeholderText: qsTr("email")
        text:email_field
    }

    Button {
        id: button
        x: 41
        y: 428
        text: qsTr("Reset")
        onClicked: {
            reset_txt_box();
        }
    }

    Button {
        id: button1
        x: 261
        y: 428
        text: qsTr("Save")
        onClicked: {
            clicked_savebutton();
        }
    }

    Button {
        id: button2
        x: 523
        y: 428
        text: qsTr("OK")
    }

    Label {
        id: label2
        x: 255
        y: 228
        text: qsTr("realName")
    }

    TextField {
        id: textField1
        x: 362
        y: 220
        placeholderText: qsTr("Text Field")
        text: realName_txt
    }
    Component.onCompleted: {
    }

}


