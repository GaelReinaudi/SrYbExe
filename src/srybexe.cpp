#include "srybexe.h"
#include "Device/GDevice.h"
#ifdef Q_OS_WIN32
#include "LabExeImaging/labexeimaging.h"
// #include "LabExeOptimizing/labexeoptimizing.h"
// #include "LabExeSequencer/labexesequencer.h"
#endif
#ifdef Q_OS_LINUX
#include "LabExeImaging/labexeimaging.h"
#include "LabExeOptimizing/labexeoptimizing.h"
// #include "LabExeSequencer/labexesequencer.h"
#endif

#ifdef Q_OS_WIN32
namespace{
// int uhgf = _crtBreakAlloc = 0x75b9c41f;
//	int gfd = _CrtSetDbgFlag(0);
}
#endif

SrYbExe::SrYbExe(QString controlPanelIniFilePath, QWidget *parent, Qt::WindowFlags flags)
    : GLabControlPanel(parent, controlPanelIniFilePath)
{
    Q_UNUSED(flags);

    // loads the plugins that defined derived classes of GDevice
    LoadPluginsInDeviceManager();

// that makes the code enter those respective dlls so that the workbenches get registered.
#ifdef Q_OS_WIN32
    LabExeImaging();
//    LabExeSequencer();
//	LabExeOptimizing();
#endif
#ifdef Q_OS_LINUX
    LabExeImaging();
    //	LabExeSequencer();
    LabExeOptimizing();
#endif

}

SrYbExe::~SrYbExe()
{
}

void SrYbExe::CheckForUpdate()
{
}
