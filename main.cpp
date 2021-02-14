#include <QGuiApplication>
#include <QUrl>
#include <QQmlApplicationEngine>
#include <QStandardPaths>
#include <QQmlContext>
#include <iostream>
#include <QQuickStyle>
#include <QFile>
#include <QTranslator>
#include <QProcess>
#include "qml_signal_manager.h"
int main(int argc, char *argv[])
{
    QQuickStyle::setStyle("Material");
    QGuiApplication app(argc,argv);
    QString lang_path = "userprofile_editor_" + QLocale::system().name();
    std::cout << lang_path.toStdString() << std::endl;
        QTranslator qtTranslator;
        std::cout << lang_path.toStdString() << std::endl;
        qtTranslator.load(lang_path,"/opt/lang/userprofile_editor");
        app.installTranslator(&qtTranslator);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
        QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                         &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    QString facefile_path="file://" + QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + "/.face";
    std::cout << facefile_path.toStdString() << std::endl;
    qml_signal_manager sigman;
    engine.rootContext()->setContextProperty("UserIconSrc",facefile_path);
    engine.load(url);
    QObject *root = engine.rootObjects().first();
    QObject::connect(root,SIGNAL(clicked_usericon()),&sigman,SLOT(clicked_icon()));
    QObject::connect(&sigman,&qml_signal_manager::clicked_icon_signal,[=]() {
        //clicked icon
    });

    QObject::connect(root,SIGNAL(stdout_sig(QString)),&sigman,SLOT(stdoutkun(QString)));
    QObject::connect(&sigman,&qml_signal_manager::stdout_sig,[=](QString data) {
        std::cout << data.toStdString() << std::endl;
    });
    QObject::connect(root,SIGNAL(do_copy_face_sig(QString)),&sigman,SLOT(do_copy_face(QString)));
    QObject::connect(&sigman,&qml_signal_manager::do_copy_face_sig,[=](QString data){
        QString file_path=data.replace("file://","");
        std::cout << file_path.toStdString() << std::endl;
        QProcess cpkun;
        QStringList cp_list;
        cp_list << "-f";
        cp_list << file_path;
        cp_list << QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + "/.face";
        cpkun.start("cp",cp_list);
        QProcess setfacl_1st;
        QStringList setfacl_1st_list;
        setfacl_1st_list << "-m";
        setfacl_1st_list << "u:lightdm:x";
        setfacl_1st_list << QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + "/";
        setfacl_1st.start("setfacl",setfacl_1st_list);
        QProcess setfacl_2nd;
        QStringList setfacl_2nd_list;
        setfacl_2nd_list << "-m";
        setfacl_2nd_list << "u:lightdm:r";
        setfacl_2nd_list << QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + "/.face";
        setfacl_2nd.start("setfacl",setfacl_2nd_list);

    });
    return app.exec();
}
