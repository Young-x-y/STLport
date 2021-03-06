# Time-stamp: <04/04/30 23:41:02 ptr>
# $Id: targetdirs.mak 2695 2006-10-26 19:36:35Z dums $

!ifdef TARGET_PROC
TARGET_NAME=$(COMPILER_NAME)-$(TARGET_PROC)
!else
TARGET_NAME=$(COMPILER_NAME)
!endif

# special case for evc3/evc4 emulator compiles
!if "$(TARGET_PROC)-$(TARGET_PROC_SUBTYPE)" == "x86-emulator"
TARGET_NAME=$(COMPILER_NAME)-$(TARGET_PROC_SUBTYPE)
!endif

OUTPUT_ROOT_DIR        = obj
OUTPUT_TARGET_DIR      = $(OUTPUT_ROOT_DIR)\$(TARGET_NAME)
OUTPUT_DIR             = $(OUTPUT_TARGET_DIR)\shared$(EXTRA_DIRS)
OUTPUT_DIR_DBG         = $(OUTPUT_TARGET_DIR)\shared-g$(EXTRA_DIRS)
OUTPUT_DIR_STLDBG      = $(OUTPUT_TARGET_DIR)\shared-stlg$(EXTRA_DIRS)
OUTPUT_DIR_A           = $(OUTPUT_TARGET_DIR)\static$(EXTRA_DIRS)
OUTPUT_DIR_A_DBG       = $(OUTPUT_TARGET_DIR)\static-g$(EXTRA_DIRS)
OUTPUT_DIR_A_STLDBG    = $(OUTPUT_TARGET_DIR)\static-stlg$(EXTRA_DIRS)

# file to store generated dependencies for make:
DEPENDS_COLLECTION     = $(OUTPUT_TARGET_DIR)\.make.depend

SRCROOT = $(SRCROOT:/=\)
!ifdef CROSS_COMPILING
TARGET_LIB_BIN_SUBFOLDER=$(TARGET_NAME)
!else
TARGET_LIB_BIN_SUBFOLDER=
!endif
INSTALL_LIB_DIR        = $(SRCROOT)\..\lib\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_LIB_DIR_DBG    = $(SRCROOT)\..\lib\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_LIB_DIR_STLDBG = $(SRCROOT)\..\lib\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_STATIC_LIB_DIR = $(SRCROOT)\..\lib\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_STATIC_LIB_DIR_DBG    = $(SRCROOT)\..\lib\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_STATIC_LIB_DIR_STLDBG = $(SRCROOT)\..\lib\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_BIN_DIR        = $(SRCROOT)\..\bin\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_BIN_DIR_DBG    = $(SRCROOT)\..\bin\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_BIN_DIR_STLDBG = $(SRCROOT)\..\bin\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_STATIC_BIN_DIR        = $(SRCROOT)\..\bin\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_STATIC_BIN_DIR_DBG    = $(SRCROOT)\..\bin\$(TARGET_LIB_BIN_SUBFOLDER)
INSTALL_STATIC_BIN_DIR_STLDBG = $(SRCROOT)\..\bin\$(TARGET_LIB_BIN_SUBFOLDER)


OUTPUT_DIRS = $(OUTPUT_DIR) $(OUTPUT_DIR_DBG) $(OUTPUT_DIR_STLDBG)
!if "$(OUTPUT_DIR_A)" != "$(OUTPUT_DIR)"
OUTPUT_DIRS = $(OUTPUT_DIRS) $(OUTPUT_DIR_A)
!endif
!if "$(OUTPUT_DIR_A_DBG)" != "$(OUTPUT_DIR_DBG)"
OUTPUT_DIRS = $(OUTPUT_DIRS) $(OUTPUT_DIR_A_DBG)
!endif
!if "$(OUTPUT_DIR_A_STLDBG)" != "$(OUTPUT_DIR_STLDBG)"
OUTPUT_DIRS = $(OUTPUT_DIRS) $(OUTPUT_DIR_A_STLDBG)
!endif


# shortcut: all install lib dirs are the same
INSTALL_LIB_DIRS = $(INSTALL_LIB_DIR)

# shortcut: all install bin dirs are the same
INSTALL_BIN_DIRS = $(INSTALL_BIN_DIR)

INSTALL_DIRS = $(INSTALL_LIB_DIRS) $(INSTALL_BIN_DIRS)

# replace slashes with backslashes; mkdir and copy don't like them.
INSTALL_DIRS = $(INSTALL_DIRS:/=\)


dirs:	$(OUTPUT_DIRS) $(INSTALL_DIRS)

output-dirs: $(OUTPUT_DIRS)
install-dirs: $(INSTALL_DIRS)

install-lib-dirs:	$(INSTALL_LIB_DIRS)
install-bin-dirs:	$(INSTALL_BIN_DIRS)

$(OUTPUT_DIRS):
	@if not exist $@ mkdir $@

$(INSTALL_DIRS):
	@if not exist $@ mkdir $@
