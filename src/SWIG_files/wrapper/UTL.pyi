from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Storage import *
from OCC.Core.TCollection import *
from OCC.Core.OSD import *
from OCC.Core.Resource import *


class utl:
    @staticmethod
    def AddToUserInfo(aData: Storage_Data, anInfo: str) -> None: ...
    @staticmethod
    def CString(anExtendedString: str) -> str: ...
    @staticmethod
    def Disk(aPath: OSD_Path) -> str: ...
    @staticmethod
    def ExtendedString(anAsciiString: str) -> str: ...
    @overload
    @staticmethod
    def Extension(aPath: OSD_Path) -> str: ...
    @overload
    @staticmethod
    def Extension(aFileName: str) -> str: ...
    @staticmethod
    def FileIterator(aPath: OSD_Path, aMask: str) -> OSD_FileIterator: ...
    @staticmethod
    def Find(aResourceManager: Resource_Manager, aResourceName: str) -> bool: ...
    @staticmethod
    def GUID(anXString: str) -> Standard_GUID: ...
    @staticmethod
    def IntegerValue(anExtendedString: str) -> int: ...
    @staticmethod
    def IsReadOnly(aFileName: str) -> bool: ...
    @staticmethod
    def LocalHost() -> str: ...
    @staticmethod
    def Name(aPath: OSD_Path) -> str: ...
    @staticmethod
    def OpenFile(aFile: Storage_BaseDriver, aName: str, aMode: Storage_OpenMode) -> Storage_Error: ...
    @staticmethod
    def Path(aFileName: str) -> OSD_Path: ...
    @staticmethod
    def Trek(aPath: OSD_Path) -> str: ...
    @staticmethod
    def Value(aResourceManager: Resource_Manager, aResourceName: str) -> str: ...
    @staticmethod
    def xgetenv(aCString: str) -> str: ...

# harray1 classes
# harray2 classes
# hsequence classes

utl_AddToUserInfo = utl.AddToUserInfo
utl_CString = utl.CString
utl_Disk = utl.Disk
utl_ExtendedString = utl.ExtendedString
utl_Extension = utl.Extension
utl_Extension = utl.Extension
utl_FileIterator = utl.FileIterator
utl_Find = utl.Find
utl_GUID = utl.GUID
utl_IntegerValue = utl.IntegerValue
utl_IsReadOnly = utl.IsReadOnly
utl_LocalHost = utl.LocalHost
utl_Name = utl.Name
utl_OpenFile = utl.OpenFile
utl_Path = utl.Path
utl_Trek = utl.Trek
utl_Value = utl.Value
utl_xgetenv = utl.xgetenv
