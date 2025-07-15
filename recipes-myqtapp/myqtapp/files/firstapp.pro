QT += quick

# Use C++11 standard (recommended for modern Qt)
CONFIG += c++11

# Your main source file(s)
SOURCES += \
    main.cpp

# Embed your QML files with the resource system
RESOURCES += qml.qrc

# Optional: If you have translations
#TRANSLATIONS += \
#    firstapp_en_IN.ts

# Automatically build the translation file and embed
#CONFIG += lrelease
#CONFIG += embed_translations

# Additional QML import paths (not needed for standard modules)
QML_IMPORT_PATH =

# Additional path for the Qt Quick Designer (optional, usually empty)
QML_DESIGNER_IMPORT_PATH =

# Tell qmake where to install the binary on Unix/Linux (Yocto)
# Yocto's do_install step uses this path if you run make install manually
target.path = /usr/bin
INSTALLS += target