# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-slackfish

CONFIG += sailfishapp

INCLUDEPATH += ./QtWebsocket

SOURCES += src/harbour-slackfish.cpp \
    src/slackclient.cpp \
    src/slackconfig.cpp \
    src/QtWebsocket/QWsSocket.cpp \
    src/QtWebsocket/QWsFrame.cpp \
    src/QtWebsocket/functions.cpp \
    src/QtWebsocket/QWsHandshake.cpp \
    src/networkaccessmanagerfactory.cpp \
    src/networkaccessmanager.cpp

OTHER_FILES += qml/harbour-slackfish.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-slackfish.changes.in \
    rpm/harbour-slackfish.spec \
    rpm/harbour-slackfish.yaml \
    translations/*.ts \
    harbour-slackfish.desktop \
    harbour-slackfish.png

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-slackfish-fi.ts

HEADERS += \
    src/slackclient.h \
    src/slackconfig.h \
    src/QtWebsocket/QWsSocket.h \
    src/QtWebsocket/QWsFrame.h \
    src/QtWebsocket/functions.h \
    src/QtWebsocket/QWsHandshake.h \
    src/networkaccessmanagerfactory.h \
    src/networkaccessmanager.h

DISTFILES += \
    qml/pages/Settings.js \
    qml/pages/LoginPage.qml \
    qml/pages/Loader.qml \
    qml/pages/ChannelList.qml \
    qml/pages/ChannelList.js \
    qml/pages/Channel.qml \
    qml/pages/MessageListItem.qml \
    qml/pages/MessageInput.qml \
    qml/pages/Icons.qml \
    qml/pages/Image.qml \
    qml/pages/ConnectionPanel.qml \
    qml/pages/Testing.qml \
    qml/pages/ChannelListView.qml \
    qml/pages/MessageListView.qml \
    qml/pages/About.qml
