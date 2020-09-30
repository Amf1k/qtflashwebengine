#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

#ifdef Q_OS_MAC
  qDebug() << QString("--ppapi-flash-path=%1/PepperFlashPlayer.plugin").arg(QCoreApplication::applicationDirPath());
  qputenv("QTWEBENGINE_CHROMIUM_FLAGS",
          QByteArray(QString("--ppapi-flash-path=%1/"
                             "PepperFlashPlayer.plugin")
                         .arg(QCoreApplication::applicationDirPath())
                         .toStdString()
                         .c_str()));
#else
  qDebug() << QString("--ppapi-flash-path=%1/pepflashplayer64_32_0_0_433.dll").arg(QCoreApplication::applicationDirPath());
  qputenv("QTWEBENGINE_CHROMIUM_FLAGS",
          QByteArray(QString("--ppapi-flash-path=%1/"
                             "pepflashplayer64_32_0_0_433.dll")
                         .arg(QCoreApplication::applicationDirPath())
                         .toStdString()
                         .c_str()));
#endif

  QtWebEngine::initialize();
  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
