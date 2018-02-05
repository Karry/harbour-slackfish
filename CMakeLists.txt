cmake_minimum_required(VERSION 2.8.11)

project(harbour-slackfish C CXX)

set(QT_MIN_VERSION       "5.2.0")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_HOME_DIRECTORY}/CMakeMod")

find_package( Qt5 ${QT_MIN_VERSION} 
              REQUIRED NO_MODULE COMPONENTS 
              Core
              Network
              Gui
              Positioning
              Xml
              Svg
              Qml
              Quick
)
find_package(Qt5LinguistTools)
find_package(SailfishApp) # https://github.com/sailfish-sdk/libsailfishapp

set(LANG_FILES
    translations/harbour-slackfish-fi.ts
    translations/harbour-slackfish-cs.ts
)

QT5_CREATE_TRANSLATION(LANG_SRC ${LANG_FILES})
ADD_CUSTOM_TARGET (translations ALL DEPENDS ${LANG_SRC})

set(HEADER_FILES
  src/QtWebsocket/QTlsServer.h
  src/QtWebsocket/QWsFrame.h
  src/QtWebsocket/QWsHandshake.h
  src/QtWebsocket/QWsServer.h
  src/QtWebsocket/QWsSocket.h
  src/QtWebsocket/WsEnums.h
  src/QtWebsocket/functions.h
  src/dbusadaptor.h
  src/networkaccessmanager.h
  src/networkaccessmanagerfactory.h
  src/notificationlistener.h
  src/filemodel.h
  src/messageformatter.h
  src/slackclient.h
  src/slackconfig.h
  src/slackstream.h
  src/storage.h
)

set(SOURCE_FILES
  src/QtWebsocket/QTlsServer.cpp
  src/QtWebsocket/QWsFrame.cpp
  src/QtWebsocket/QWsServer.cpp
  src/QtWebsocket/functions.cpp
  src/QtWebsocket/QWsHandshake.cpp
  src/QtWebsocket/QWsSocket.cpp
  src/dbusadaptor.cpp
  src/networkaccessmanager.cpp
  src/networkaccessmanagerfactory.cpp
  src/notificationlistener.cpp
  src/filemodel.cpp
  src/harbour-slackfish.cpp
  src/messageformatter.cpp
  src/slackclient.cpp
  src/slackconfig.cpp
  src/slackstream.cpp
  src/storage.cpp

  qml/cover/CoverPage.qml
  qml/pages/Attachment.qml
  qml/pages/AttachmentFieldGrid.qml
  qml/pages/ChannelListView.qml
  qml/pages/ChannelSelect.qml
  qml/pages/ChatSelect.qml
  qml/pages/ConnectionPanel.qml
  qml/pages/GroupLeaveDialog.qml
  qml/pages/Image.qml
  qml/pages/RichTextLabel.qml
  qml/pages/Spacer.qml
  qml/pages/About.qml
  qml/pages/Channel.qml
  qml/pages/ChannelList.qml
  qml/pages/FileSend.qml
  qml/pages/Loader.qml
  qml/pages/LoginPage.qml
  qml/pages/MessageInput.qml
  qml/pages/MessageListItem.qml
  qml/pages/MessageListView.qml
  qml/dialogs/ImagePicker.qml
  qml/harbour-slackfish.qml

  qml/pages/Channel.js
  qml/pages/ChannelList.js
  qml/pages/MessageLoader.js
  qml/pages/Settings.js

  ${LANG_FILES}
)

add_executable(harbour-slackfish ${SOURCE_FILES} ${HEADER_FILES})
add_dependencies(harbour-slackfish translations)

message(STATUS "LIBSAILFISHAPP_INCLUDEDIR: ${LIBSAILFISHAPP_INCLUDEDIR}")
target_include_directories(harbour-slackfish PRIVATE
    ${LIBSAILFISHAPP_INCLUDEDIR}/sailfishapp
)

target_link_libraries(harbour-slackfish
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
    Qt5::Svg

    ${LIBSAILFISHAPP_LIBRARIES}
)
