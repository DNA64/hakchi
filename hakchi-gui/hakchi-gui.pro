QT+=core gui
greaterThan(QT_MAJOR_VERSION,4):QT+=widgets
TARGET=hakchi-gui
TEMPLATE=app

INCLUDEPATH+=$${PWD}/../3rdparty/sunxi-tools $${PWD}/../3rdparty/sunxi-tools/include $${PWD}/../3rdparty/mkbootimg
DEPENDPATH+=$${PWD}/src $${PWD}/../3rdparty/sunxi-tools $${PWD}/../3rdparty/sunxi-tools/include
LIBS += $$system(pkg-config --libs \"libusb-1.0 >= 1.0.0\" --static)
QMAKE_CFLAGS += $$system(pkg-config --cflags \"libusb-1.0 >= 1.0.0\") -std=gnu99 -DNDEBUG -Wall -Wextra
QMAKE_CXXFLAGS += $$system(pkg-config --cflags \"libusb-1.0 >= 1.0.0\") -Wall -Wextra

SOURCES += $${PWD}/../3rdparty/sunxi-tools/fel_lib.c
SOURCES += $${PWD}/../3rdparty/sunxi-tools/soc_info.c
SOURCES += $${PWD}/../3rdparty/sunxi-tools/progress.c

SOURCES += $${PWD}/src/*.cpp
SOURCES += $${PWD}/src/*.c
HEADERS += $${PWD}/src/*.h
FORMS += $${PWD}/src/*.ui
