TARGET = WinLabExe
TEMPLATE = app

# Reset Qt modules first
QT = core gui widgets

# Add additional modules
QT += printsupport script

lessThan(QT_MAJOR_VERSION, 6) {
    QT -= core5compat  # Ensure we're not using Qt6 compatibility module
}

include($$PWD/../LabExe/common.pri)

INCLUDEPATH += \
    $$PWD/../LabExe/src \
    $$PWD/../LabExe/include \
    $$PWD/GeneratedFiles \
    $$PWD

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
