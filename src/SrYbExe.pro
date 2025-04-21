TARGET = WinLabExe
TEMPLATE = app

# Reset Qt modules first
QT = core gui widgets

# Add additional modules
QT += printsupport script

# Remove any Qt 6 compatibility modules
QT -= core5compat

include($$PWD/../LabExe/common.pri)

INCLUDEPATH += \
    ./../LabExe/src \
    ./../LabExe/include \
    ./GeneratedFiles \
    .

LIBS += \
-L"./LabExe/"

CONFIG(debug, debug|release) {
    LIBS += -llabexe_D \
    -lLabExeImaging_D \
    -lLabExeOptimizing_D
} else {
    LIBS += -llabexe \
    -lLabExeImaging \
    -lLabExeOptimizing
}

RC_FILE = SrYbExe.rc

include(SrYbExe.pri)
