TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += "./OSApi/inc"
LIBS        += -L$$PWD/OSApi/lib/host/release
LIBS        += -L. -lOSApi -pthread -lrt
DEFINES += OS_LINUX

SOURCES += main.cpp \
    SubscriberId.cpp \
    SubscriberHelper.cpp \
    Subscriber.cpp \
    Publisher.cpp \
    MessageHandler.cpp \
    MessageDistributionSystem.cpp

HEADERS += \
    SubscriberId.hpp \
    SubscriberHelper.hpp \
    Subscriber.hpp \
    Publisher.hpp \
    MessageHandler.hpp \
    MessageDistributionSystem.hpp

