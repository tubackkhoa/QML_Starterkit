TEMPLATE = app
TARGET = vms

QT += quick \
    quickcontrols2 \
    multimedia

CONFIG += c++11

HEADERS += \
    qcvdetectfilter.h

SOURCES += \
    main.cpp \
    qcvdetectfilter.cpp

INCLUDEPATH += /usr/local/include
LIBS += -L/usr/local/lib \
     -lopencv_core \
     -lopencv_imgproc \
     -lopencv_videoio \
     -lopencv_highgui \
     -lopencv_objdetect

RESOURCES += \
    icons/icons.qrc \
    images/album-cover.jpg \
    images/smile.png \
    imagine-assets/imagine-assets.qrc \
    qtquickcontrols2.conf \
    vms.qml \
    CVDetector.qml \
    faceclassifier.xml

target.path = $$[QT_INSTALL_EXAMPLES]/material/vms
INSTALLS += target

DISTFILES += \
    CVDetector.qml \
    vms.qml

