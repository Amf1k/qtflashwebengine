QT += quick webengine

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

win32 {
    CONFIG(release, debug|release): 3rdparty_files.path = $$OUT_PWD/release
    else:CONFIG(debug, debug|release):  3rdparty_files.path = $$OUT_PWD/debug
    3rdparty_files.files += 3rdparty/pepper-plugin/*.dll
    INSTALLS += 3rdparty_files
}
macx{
    3rdparty_files.path = $$OUT_PWD/'$$TARGET'.app/Contents/MacOS
    3rdparty_files.files += 3rdparty/pepper-plugin/*.plugin
    INSTALLS += 3rdparty_files
}
