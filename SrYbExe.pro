TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS += \
        LabExe/src/labexe.pro \
#	MapExe/src/LabExeGraphicsMap.pro \
        LabExe/src/LabExeImaging \
#	LabExe/src/LabExeSequencer \
#       LabExe/src/LabExeOptimizing \
    LabExe-UserPlugins/SoftwarePlugins/SoftwarePlugins.pro \
    # LabExe-UserPlugins/HardwarePlugins/HardwarePlugins.pro \
    # Deployement/UserPluginWizard/UserPluginWizard.pro \
    src/SrYbExe.pro

LabExeImaging.depends = labexe
#LabExeOptimizing.depends = labexe
SoftwarePlugins.depends = labexe LabExeImaging
#HardwarePlugins.depends = labexe LabExeImaging
SrYbExe.depends = labexe LabExeImaging SoftwarePlugins # HardwarePlugins # LabExeOptimizing LabExeSequencer LabExeGraphicsMap

