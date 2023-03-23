from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.CDM import *
from OCC.Core.TCollection import *
from OCC.Core.PCDM import *
from OCC.Core.Message import *


class CDF_StoreSetNameStatus(IntEnum):
    CDF_SSNS_OK: int = ...
    CDF_SSNS_ReplacingAnExistentDocument: int = ...
    CDF_SSNS_OpenDocument: int = ...

CDF_SSNS_OK = CDF_StoreSetNameStatus.CDF_SSNS_OK
CDF_SSNS_ReplacingAnExistentDocument = CDF_StoreSetNameStatus.CDF_SSNS_ReplacingAnExistentDocument
CDF_SSNS_OpenDocument = CDF_StoreSetNameStatus.CDF_SSNS_OpenDocument

class CDF_SubComponentStatus(IntEnum):
    CDF_SCS_Consistent: int = ...
    CDF_SCS_Unconsistent: int = ...
    CDF_SCS_Stored: int = ...
    CDF_SCS_Modified: int = ...

CDF_SCS_Consistent = CDF_SubComponentStatus.CDF_SCS_Consistent
CDF_SCS_Unconsistent = CDF_SubComponentStatus.CDF_SCS_Unconsistent
CDF_SCS_Stored = CDF_SubComponentStatus.CDF_SCS_Stored
CDF_SCS_Modified = CDF_SubComponentStatus.CDF_SCS_Modified

class CDF_TryStoreStatus(IntEnum):
    CDF_TS_OK: int = ...
    CDF_TS_NoCurrentDocument: int = ...
    CDF_TS_NoDriver: int = ...
    CDF_TS_NoSubComponentDriver: int = ...

CDF_TS_OK = CDF_TryStoreStatus.CDF_TS_OK
CDF_TS_NoCurrentDocument = CDF_TryStoreStatus.CDF_TS_NoCurrentDocument
CDF_TS_NoDriver = CDF_TryStoreStatus.CDF_TS_NoDriver
CDF_TS_NoSubComponentDriver = CDF_TryStoreStatus.CDF_TS_NoSubComponentDriver

class CDF_TypeOfActivation(IntEnum):
    CDF_TOA_New: int = ...
    CDF_TOA_Modified: int = ...
    CDF_TOA_Unchanged: int = ...

CDF_TOA_New = CDF_TypeOfActivation.CDF_TOA_New
CDF_TOA_Modified = CDF_TypeOfActivation.CDF_TOA_Modified
CDF_TOA_Unchanged = CDF_TypeOfActivation.CDF_TOA_Unchanged

class CDF_Application(CDM_Application):
    def CanClose(self, aDocument: CDM_Document) -> CDM_CanCloseStatus: ...
    @overload
    def CanRetrieve(self, theFolder: str, theName: str, theAppendMode: bool) -> PCDM_ReaderStatus: ...
    @overload
    def CanRetrieve(self, theFolder: str, theName: str, theVersion: str, theAppendMode: bool) -> PCDM_ReaderStatus: ...
    def Close(self, aDocument: CDM_Document) -> None: ...
    def DefaultFolder(self) -> Standard_ExtString: ...
    def Format(self, aFileName: str, theFormat: str) -> bool: ...
    def GetRetrieveStatus(self) -> PCDM_ReaderStatus: ...
    def InitDocument(self, theDoc: CDM_Document) -> None: ...
    @staticmethod
    def Load(aGUID: Standard_GUID) -> CDF_Application: ...
    def MetaDataDriver(self) -> CDF_MetaDataDriver: ...
    def NewDocument(self, theFormat: str, theDoc: CDM_Document) -> None: ...
    def Open(self, aDocument: CDM_Document) -> None: ...
    def ReaderFromFormat(self, aFormat: str) -> PCDM_Reader: ...
    @overload
    def Retrieve(self, aFolder: str, aName: str, UseStorageConfiguration: Optional[bool] = True, theFilter: Optional[PCDM_ReaderFilter] = PCDM_ReaderFilter(), theRange: Optional[Message_ProgressRange] = Message_ProgressRange()) -> CDM_Document: ...
    @overload
    def Retrieve(self, aFolder: str, aName: str, aVersion: str, UseStorageConfiguration: Optional[bool] = True, theFilter: Optional[PCDM_ReaderFilter] = PCDM_ReaderFilter(), theRange: Optional[Message_ProgressRange] = Message_ProgressRange()) -> CDM_Document: ...
    def SetDefaultFolder(self, aFolder: Standard_ExtString) -> bool: ...
    def WriterFromFormat(self, aFormat: str) -> PCDM_StorageDriver: ...

class CDF_Directory(Standard_Transient):
    def __init__(self) -> None: ...
    def Add(self, aDocument: CDM_Document) -> None: ...
    def Contains(self, aDocument: CDM_Document) -> bool: ...
    def IsEmpty(self) -> bool: ...
    def Last(self) -> CDM_Document: ...
    def Length(self) -> int: ...
    def Remove(self, aDocument: CDM_Document) -> None: ...

class CDF_MetaDataDriver(Standard_Transient):
    def BuildFileName(self, aDocument: CDM_Document) -> str: ...
    def CreateDependsOn(self, aFirstData: CDM_MetaData, aSecondData: CDM_MetaData) -> None: ...
    def CreateMetaData(self, aDocument: CDM_Document, aFileName: str) -> CDM_MetaData: ...
    def CreateReference(self, aFrom: CDM_MetaData, aTo: CDM_MetaData, aReferenceIdentifier: int, aToDocumentVersion: int) -> None: ...
    def DefaultFolder(self) -> str: ...
    @overload
    def Find(self, aFolder: str, aName: str, aVersion: str) -> bool: ...
    @overload
    def Find(self, aFolder: str, aName: str) -> bool: ...
    def FindFolder(self, aFolder: str) -> bool: ...
    def HasReadPermission(self, aFolder: str, aName: str, aVersion: str) -> bool: ...
    def HasVersion(self, aFolder: str, aName: str) -> bool: ...
    def HasVersionCapability(self) -> bool: ...
    def LastVersion(self, aMetaData: CDM_MetaData) -> CDM_MetaData: ...
    @overload
    def MetaData(self, aFolder: str, aName: str, aVersion: str) -> CDM_MetaData: ...
    @overload
    def MetaData(self, aFolder: str, aName: str) -> CDM_MetaData: ...
    def ReferenceIterator(self, theMessageDriver: Message_Messenger) -> PCDM_ReferenceIterator: ...
    def SetName(self, aDocument: CDM_Document, aName: str) -> str: ...

class CDF_MetaDataDriverFactory(Standard_Transient):
    def Build(self) -> CDF_MetaDataDriver: ...

class CDF_Store:
    def __init__(self, aDocument: CDM_Document) -> None: ...
    def AssociatedStatusText(self) -> Standard_ExtString: ...
    def Comment(self) -> TCollection_HExtendedString: ...
    def CurrentIsConsistent(self) -> bool: ...
    def Description(self) -> TCollection_HExtendedString: ...
    def Folder(self) -> TCollection_HExtendedString: ...
    def HasAPreviousVersion(self) -> bool: ...
    def IsConsistent(self) -> bool: ...
    def IsMainDocument(self) -> bool: ...
    def IsModified(self) -> bool: ...
    def IsStored(self) -> bool: ...
    def MetaDataPath(self) -> TCollection_HExtendedString: ...
    def Name(self) -> TCollection_HExtendedString: ...
    def Path(self) -> Standard_ExtString: ...
    def PreviousVersion(self) -> TCollection_HExtendedString: ...
    def Realize(self, theRange: Optional[Message_ProgressRange] = Message_ProgressRange()) -> None: ...
    def RecheckName(self) -> CDF_StoreSetNameStatus: ...
    def SetComment(self, aComment: Standard_ExtString) -> None: ...
    def SetCurrent(self, aPresentation: Standard_ExtString) -> None: ...
    @overload
    def SetFolder(self, aFolder: str) -> bool: ...
    @overload
    def SetFolder(self, aFolder: Standard_ExtString) -> bool: ...
    def SetMain(self) -> None: ...
    @overload
    def SetName(self, aName: Standard_ExtString) -> CDF_StoreSetNameStatus: ...
    @overload
    def SetName(self, aName: str) -> CDF_StoreSetNameStatus: ...
    def SetPreviousVersion(self, aPreviousVersion: Standard_ExtString) -> bool: ...
    def StoreStatus(self) -> PCDM_StoreStatus: ...

class CDF_StoreList(Standard_Transient):
    def __init__(self, aDocument: CDM_Document) -> None: ...
    def Init(self) -> None: ...
    def IsConsistent(self) -> bool: ...
    def More(self) -> bool: ...
    def Next(self) -> None: ...
    def Store(self, aMetaData: CDM_MetaData, aStatusAssociatedText: str, theRange: Optional[Message_ProgressRange] = Message_ProgressRange()) -> PCDM_StoreStatus: ...
    def Value(self) -> CDM_Document: ...

class CDF_FWOSDriver(CDF_MetaDataDriver):
    def __init__(self, theLookUpTable: CDM_MetaDataLookUpTable) -> None: ...
    def BuildFileName(self, aDocument: CDM_Document) -> str: ...
    def DefaultFolder(self) -> str: ...
    def Find(self, aFolder: str, aName: str, aVersion: str) -> bool: ...
    def FindFolder(self, aFolder: str) -> bool: ...
    def HasReadPermission(self, aFolder: str, aName: str, aVersion: str) -> bool: ...
    def SetName(self, aDocument: CDM_Document, aName: str) -> str: ...

#classnotwrapped
class CDF_DirectoryIterator: ...

# harray1 classes
# harray2 classes
# hsequence classes

CDF_Application_Load = CDF_Application.Load
