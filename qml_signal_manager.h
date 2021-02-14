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
signals:
    void clicked_icon_signal();
    void stdout_sig(QString);
    void do_copy_face_sig(QString);
};

#endif // QML_SIGNAL_MANAGER_H
