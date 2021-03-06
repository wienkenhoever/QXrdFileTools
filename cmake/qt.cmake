if(NOT QT_FOUND)
  set(QTVERSION "${_QTVERSION}" CACHE STRING "Set Qt Version to use. If not specified: Automatically detect.")
  set(QTV "${QTVERSION}")
  if ("${QTV}" STREQUAL "")
    message(STATUS "No specific Qt version specified. Searching for defaults.")
    message(STATUS "Searching for Qt5")
    FIND_PACKAGE(Qt5Core QUIET)
    if (Qt5Core_FOUND)
      set(QT_FOUND true)
      add_definitions(${Qt5Core_DEFINITIONS})
      include_directories(${Qt5Core_INCLUDE_DIRS})
      set(QT_INCLUDES ${Qt5Core_INCLUDE_DIRS})
      set(QT_LIBRARIES ${Qt5Core_LIBRARIES})
      set(QT_VERSIONSTRING ${Qt5Core_VERSION_STRING})
      message(STATUS "Found Qt5 version ${QT_VERSIONSTRING}")
      set(QTV "5")
    endif()
    if (NOT QT_FOUND)
      message(STATUS "Qt5 not found")
      message(STATUS "Searching for Qt4")
      find_package(Qt4 COMPONENTS QtCore QUIET)
      if (QT4_FOUND)
        set(QT_FOUND true)
        add_definitions(${QT4_DEFINITIONS})
        include(${QT_USE_FILE})
        set(QT_VERSIONSTRING "${QT_VERSION_MAJOR}.${QT_VERSION_MINOR}.${QT_VERSION_PATCH}")
        set(QT_VERSIONSTRING "${QT_VERSIONSTRING}")
        message(STATUS "Found Qt4 version ${QT_VERSIONSTRING}")
        set(QTV "4")
      endif()
      if (NOT QT_FOUND)
        message(STATUS "Qt4 not found")
      endif()
    endif()

  elseif("${QTV}" STREQUAL "5")
    message(STATUS "Searching for Qt5")
    find_package(Qt5Core QUIET REQUIRED)
    if (Qt5Core_FOUND)
      set(QT_FOUND true)
      add_definitions(${Qt5Core_DEFINITIONS})
      include_directories(${Qt5Core_INCLUDE_DIRS})
      set(QT_INCLUDES ${Qt5Core_INCLUDE_DIRS})
      set(QT_LIBRARIES ${Qt5Core_LIBRARIES})
      set(QT_VERSIONSTRING ${Qt5Core_VERSION_STRING})
      message(STATUS "Found Qt5 version ${QT_VERSIONSTRING}")
      set(QTV "5")
    endif()
  elseif("${QTV}" STREQUAL "4")
    message(STATUS "Searching for Qt4")
      find_package(Qt4 COMPONENTS QtCore QUIET REQUIRED)
      if (QT4_FOUND)
        set(QT_FOUND true)
        add_definitions(${QT4_DEFINITIONS})
        include(${QT_USE_FILE})
        set(QT_VERSIONSTRING "${QT_VERSION_MAJOR}.${QT_VERSION_MINOR}.${QT_VERSION_PATCH}")
        set(QT_VERSIONSTRING "${QT_VERSIONSTRING}")
        message(STATUS "Found Q4 version ${QT_VERSIONSTRING}")
        set(QTV "4")
      endif()
  endif()
endif()
