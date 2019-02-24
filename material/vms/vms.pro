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

#OTHER_FILES += \
#    qml/*.qml

RESOURCES += \
    vms.qrc

RESOURCES += \
    vms.qrc \
    icons/icons.qrc \
    imagine-assets/imagine-assets.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/material/vms
INSTALLS += target




