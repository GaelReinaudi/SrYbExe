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
    ./../LabExe/src \
    ./../LabExe/include \
    ./GeneratedFiles \
    .

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

RC_FILE = SrYbExe.rc

include(SrYbExe.pri)
