TARGET = WinLabExe
TEMPLATE = app

QT += core gui widgets
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
