#include "qml_signal_manager.h"

qml_signal_manager::qml_signal_manager(QObject *parent) : QObject(parent)
{

}
void qml_signal_manager::clicked_icon(){
    clicked_icon_signal();
}
void qml_signal_manager::stdoutkun(QString data){
    stdout_sig(data);
}
void qml_signal_manager::do_copy_face(QString data){
    do_copy_face_sig(data);
}
void qml_signal_manager::reset_txt_box(){
    reset_txt_box_sig();
}

void qml_signal_manager::clicked_savebutton(){
    clicked_savebutton_sig();
}
void qml_signal_manager::set_dispname(QString data){
    set_dispname_sig(data);
}
