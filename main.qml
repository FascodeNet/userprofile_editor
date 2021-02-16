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
    title: qsTr("Fascode UserProfile Editor")
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
    function clicked_save(){
        clicked_savebutton();
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
        y: 87
        width: 126
        height: 33
        text: UserNameKun
    }

    Label {
        id: label
        x: 254
        y: 133
        text: "Display Name"
    }

    TextField {
        id: textField_displayname
        objectName: "textfield_dispname"
        x: 362
        y: 126
        width: 278
        height: 40
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
        objectName: "email_field"
        x: 362
        y: 172
        width: 278
        height: 44
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
            clicked_save();
        }
    }

    Button {
        id: button2
        x: 523
        y: 428
        text: qsTr("OK")
        onClicked: {
            clicked_save();
            mainWindow.close();
        }
    }

    Label {
        id: label2
        x: 255
        y: 228
        text: qsTr("realName")
    }

    TextField {
        id: textField1
        objectName: "textfield_realname_box"
        x: 362
        y: 220
        width: 278
        height: 46
        placeholderText: qsTr("Real Name")
        text: realName_txt
    }
    Component.onCompleted: {
    }

}


