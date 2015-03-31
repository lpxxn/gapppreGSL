#-------------------------------------------------
#
# Project created by QtCreator 2015-02-03T15:00:07
#
#-------------------------------------------------

QT       += core script

TARGET = gapppre
TEMPLATE = lib
CONFIG += plugin, c++11

SOURCES += gappprescriptextensionplugin.cpp

HEADERS += gappprescriptextensionplugin.h
DISTFILES += gapppre.json

THIRDPARTYINCLUDE = $$PWD/include/3rdparty

INCLUDEPATH *= $$THIRDPARTYINCLUDE

SIMCUBE_SOURCE_TREE = $$PWD

SIMCUBE_APP_PATH = $$SIMCUBE_SOURCE_TREE/bin/$${CURRENTHOST}_$$DEBUG_RELEASE
SIMCUBE_LIBRARY_PATH = $$SIMCUBE_SOURCE_TREE/lib/$${CURRENTHOST}_$$DEBUG_RELEASE


include(simcube.pri)
#include(rpath.pri)
include(sc_Gsl.pri)

DESTDIR = $$SIMCUBE_APP_PATH

unix {
    target.path = /usr/lib
    INSTALLS += target
}
