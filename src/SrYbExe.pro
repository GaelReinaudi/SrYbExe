TARGET = WinLabExe
TEMPLATE = app

QT += core gui widgets
include($$PWD/../LabExe/common.pri)

INCLUDEPATH += \
    $$PWD/../LabExe/src \
    $$PWD/../LabExe/include \
    ./GeneratedFiles \
    $$PWD

LIBS += \
-L"./LabExe/"

CONFIG(debug, debug|release) {
        LIBS += -llabexe_D \
        -lLabExeImaging_D \
        # -lLabExeOptimizing_D
} else {
        LIBS += -llabexe \
        -lLabExeImaging \
        # -lLabExeOptimizing
}

RC_FILE = $$PWD/SrYbExe.rc

include(SrYbExe.pri)

win32 {
    DEPLOY_COMMAND = windeployqt $$shell_quote($$OUT_PWD/WinLabExe.exe)
    QMAKE_POST_LINK += $$DEPLOY_COMMAND$$escape_expand(\\n\\t)
}
