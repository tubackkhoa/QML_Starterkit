TEMPLATE = subdirs
SUBDIRS += \
    gallery \
    chattutorial \
    texteditor \
    contactlist \
    sidepanel \
    swipetoremove \
    wearable \
    vms \
    imagine/automotive \
    imagine/musicplayer
    wearable

qtHaveModule(widgets): SUBDIRS += flatstyle
