#ifndef QML_SIGNAL_MANAGER_H
#define QML_SIGNAL_MANAGER_H

#include <QObject>

class qml_signal_manager : public QObject
{
    Q_OBJECT
public:
    explicit qml_signal_manager(QObject *parent = nullptr);
public slots:
    void clicked_icon();
    void stdoutkun(QString);
    void do_copy_face(QString);
    void reset_txt_box();
    void clicked_savebutton();
signals:
    void clicked_icon_signal();
    void stdout_sig(QString);
    void do_copy_face_sig(QString);
    void reset_txt_box_sig();
    void clicked_savebutton_sig();
};

#endif // QML_SIGNAL_MANAGER_H
