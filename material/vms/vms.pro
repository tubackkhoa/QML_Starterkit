TEMPLATE = app
TARGET = vms
QT += quick quickcontrols2

SOURCES += \
    main.cpp

RESOURCES += \
    icons/icons.qrc \
    images/album-cover.jpg \
    imagine-assets/imagine-assets.qrc \
    qtquickcontrols2.conf \
    vms.qml

target.path = $$[QT_INSTALL_EXAMPLES]/material/vms
INSTALLS += target

