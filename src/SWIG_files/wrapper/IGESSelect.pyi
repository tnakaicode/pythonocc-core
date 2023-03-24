from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IGESData import *
from OCC.Core.Interface import *
from OCC.Core.IFSelect import *
from OCC.Core.TColStd import *
from OCC.Core.TCollection import *


class igesselect:
    @staticmethod
    def Run() -> None: ...
    @staticmethod
    def WhatIges(ent: IGESData_IGESEntity, G: Interface_Graph, sup: IGESData_IGESEntity) -> Tuple[int, int]: ...

class IGESSelect_Activator(IFSelect_Activator):
    def __init__(self) -> None: ...
    def Do(self, number: int, pilot: IFSelect_SessionPilot) -> IFSelect_ReturnStatus: ...
    def Help(self, number: int) -> str: ...

class IGESSelect_CounterOfLevelNumber(IFSelect_SignCounter):
    def __init__(self, withmap: Optional[bool] = True, withlist: Optional[bool] = False) -> None: ...
    def AddLevel(self, ent: Standard_Transient, level: int) -> None: ...
    def AddSign(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> None: ...
    def Clear(self) -> None: ...
    def HighestLevel(self) -> int: ...
    def Levels(self) -> TColStd_HSequenceOfInteger: ...
    def NbTimesLevel(self, level: int) -> int: ...
    def Sign(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> TCollection_HAsciiString: ...

class IGESSelect_DispPerDrawing(IFSelect_Dispatch):
    def __init__(self) -> None: ...
    def CanHaveRemainder(self) -> bool: ...
    def Label(self) -> str: ...
    def Remainder(self, G: Interface_Graph) -> Interface_EntityIterator: ...

class IGESSelect_DispPerSingleView(IFSelect_Dispatch):
    def __init__(self) -> None: ...
    def CanHaveRemainder(self) -> bool: ...
    def Label(self) -> str: ...
    def Remainder(self, G: Interface_Graph) -> Interface_EntityIterator: ...

class IGESSelect_Dumper(IFSelect_SessionDumper):
    def __init__(self) -> None: ...
    def ReadOwn(self, file: IFSelect_SessionFile, type: str, item: Standard_Transient) -> bool: ...
    def WriteOwn(self, file: IFSelect_SessionFile, item: Standard_Transient) -> bool: ...

class IGESSelect_EditDirPart(IFSelect_Editor):
    def __init__(self) -> None: ...
    def Apply(self, form: IFSelect_EditForm, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...
    def Label(self) -> str: ...
    def Load(self, form: IFSelect_EditForm, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...
    def Recognize(self, form: IFSelect_EditForm) -> bool: ...
    def StringValue(self, form: IFSelect_EditForm, num: int) -> TCollection_HAsciiString: ...
    def Update(self, form: IFSelect_EditForm, num: int, newval: TCollection_HAsciiString, enforce: bool) -> bool: ...

class IGESSelect_EditHeader(IFSelect_Editor):
    def __init__(self) -> None: ...
    def Apply(self, form: IFSelect_EditForm, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...
    def Label(self) -> str: ...
    def Load(self, form: IFSelect_EditForm, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...
    def Recognize(self, form: IFSelect_EditForm) -> bool: ...
    def StringValue(self, form: IFSelect_EditForm, num: int) -> TCollection_HAsciiString: ...
    def Update(self, form: IFSelect_EditForm, num: int, newval: TCollection_HAsciiString, enforce: bool) -> bool: ...

class IGESSelect_FileModifier(IFSelect_GeneralModifier):
    def Perform(self, ctx: IFSelect_ContextWrite, writer: IGESData_IGESWriter) -> None: ...

class IGESSelect_IGESName(IFSelect_Signature):
    def __init__(self) -> None: ...
    def Value(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> str: ...

class IGESSelect_IGESTypeForm(IFSelect_Signature):
    def __init__(self, withform: Optional[bool] = True) -> None: ...
    def SetForm(self, withform: bool) -> None: ...
    def Value(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> str: ...

class IGESSelect_ModelModifier(IFSelect_Modifier):
    def Perform(self, ctx: IFSelect_ContextModif, target: Interface_InterfaceModel, protocol: Interface_Protocol, TC: Interface_CopyTool) -> None: ...
    def PerformProtocol(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, proto: IGESData_Protocol, TC: Interface_CopyTool) -> None: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_SelectBasicGeom(IFSelect_SelectExplore):
    def __init__(self, mode: int) -> None: ...
    def CurvesOnly(self) -> bool: ...
    def Explore(self, level: int, ent: Standard_Transient, G: Interface_Graph, explored: Interface_EntityIterator) -> bool: ...
    def ExploreLabel(self) -> str: ...
    @staticmethod
    def SubCurves(ent: IGESData_IGESEntity, explored: Interface_EntityIterator) -> bool: ...

class IGESSelect_SelectBypassGroup(IFSelect_SelectExplore):
    def __init__(self, level: Optional[int] = 0) -> None: ...
    def Explore(self, level: int, ent: Standard_Transient, G: Interface_Graph, explored: Interface_EntityIterator) -> bool: ...
    def ExploreLabel(self) -> str: ...

class IGESSelect_SelectBypassSubfigure(IFSelect_SelectExplore):
    def __init__(self, level: Optional[int] = 0) -> None: ...
    def Explore(self, level: int, ent: Standard_Transient, G: Interface_Graph, explored: Interface_EntityIterator) -> bool: ...
    def ExploreLabel(self) -> str: ...

class IGESSelect_SelectDrawingFrom(IFSelect_SelectDeduct):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def RootResult(self, G: Interface_Graph) -> Interface_EntityIterator: ...

class IGESSelect_SelectFaces(IFSelect_SelectExplore):
    def __init__(self) -> None: ...
    def Explore(self, level: int, ent: Standard_Transient, G: Interface_Graph, explored: Interface_EntityIterator) -> bool: ...
    def ExploreLabel(self) -> str: ...

class IGESSelect_SelectFromDrawing(IFSelect_SelectDeduct):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def RootResult(self, G: Interface_Graph) -> Interface_EntityIterator: ...

class IGESSelect_SelectFromSingleView(IFSelect_SelectDeduct):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def RootResult(self, G: Interface_Graph) -> Interface_EntityIterator: ...

class IGESSelect_SelectLevelNumber(IFSelect_SelectExtract):
    def __init__(self) -> None: ...
    def ExtractLabel(self) -> str: ...
    def LevelNumber(self) -> IFSelect_IntParam: ...
    def SetLevelNumber(self, levnum: IFSelect_IntParam) -> None: ...
    def Sort(self, rank: int, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...

class IGESSelect_SelectName(IFSelect_SelectExtract):
    def __init__(self) -> None: ...
    def ExtractLabel(self) -> str: ...
    def Name(self) -> TCollection_HAsciiString: ...
    def SetName(self, name: TCollection_HAsciiString) -> None: ...
    def Sort(self, rank: int, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...

class IGESSelect_SelectPCurves(IFSelect_SelectExplore):
    def __init__(self, basic: bool) -> None: ...
    def Explore(self, level: int, ent: Standard_Transient, G: Interface_Graph, explored: Interface_EntityIterator) -> bool: ...
    def ExploreLabel(self) -> str: ...

class IGESSelect_SelectSingleViewFrom(IFSelect_SelectDeduct):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def RootResult(self, G: Interface_Graph) -> Interface_EntityIterator: ...

class IGESSelect_SelectSubordinate(IFSelect_SelectExtract):
    def __init__(self, status: int) -> None: ...
    def ExtractLabel(self) -> str: ...
    def Sort(self, rank: int, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...
    def Status(self) -> int: ...

class IGESSelect_SelectVisibleStatus(IFSelect_SelectExtract):
    def __init__(self) -> None: ...
    def ExtractLabel(self) -> str: ...
    def Sort(self, rank: int, ent: Standard_Transient, model: Interface_InterfaceModel) -> bool: ...

class IGESSelect_SignColor(IFSelect_Signature):
    def __init__(self, mode: int) -> None: ...
    def Value(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> str: ...

class IGESSelect_SignLevelNumber(IFSelect_Signature):
    def __init__(self, countmode: bool) -> None: ...
    def Value(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> str: ...

class IGESSelect_SignStatus(IFSelect_Signature):
    def __init__(self) -> None: ...
    def Matches(self, ent: Standard_Transient, model: Interface_InterfaceModel, text: str, exact: bool) -> bool: ...
    def Value(self, ent: Standard_Transient, model: Interface_InterfaceModel) -> str: ...

class IGESSelect_SplineToBSpline(IFSelect_Transformer):
    def __init__(self, tryC2: bool) -> None: ...
    def Label(self) -> str: ...
    def OptionTryC2(self) -> bool: ...
    def Perform(self, G: Interface_Graph, protocol: Interface_Protocol, checks: Interface_CheckIterator, newmod: Interface_InterfaceModel) -> bool: ...
    def Updated(self, entfrom: Standard_Transient, entto: Standard_Transient) -> bool: ...

class IGESSelect_ViewSorter(Standard_Transient):
    def __init__(self) -> None: ...
    def Add(self, ent: Standard_Transient) -> bool: ...
    def AddEntity(self, igesent: IGESData_IGESEntity) -> bool: ...
    def AddList(self, list: TColStd_HSequenceOfTransient) -> None: ...
    def AddModel(self, model: Interface_InterfaceModel) -> None: ...
    def Clear(self) -> None: ...
    def NbEntities(self) -> int: ...
    def NbSets(self, final: bool) -> int: ...
    def SetItem(self, num: int, final: bool) -> IGESData_IGESEntity: ...
    def SetModel(self, model: IGESData_IGESModel) -> None: ...
    def Sets(self, final: bool) -> IFSelect_PacketList: ...
    def SortDrawings(self, G: Interface_Graph) -> None: ...
    def SortSingleViews(self, alsoframes: bool) -> None: ...

class IGESSelect_WorkLibrary(IFSelect_WorkLibrary):
    def __init__(self, modefnes: Optional[bool] = False) -> None: ...
    @staticmethod
    def DefineProtocol() -> IGESData_Protocol: ...
    def ReadFile(self, name: str, model: Interface_InterfaceModel, protocol: Interface_Protocol) -> int: ...
    def WriteFile(self, ctx: IFSelect_ContextWrite) -> bool: ...

class IGESSelect_AddFileComment(IGESSelect_FileModifier):
    def __init__(self) -> None: ...
    def AddLine(self, line: str) -> None: ...
    def AddLines(self, lines: TColStd_HSequenceOfHAsciiString) -> None: ...
    def Clear(self) -> None: ...
    def Label(self) -> str: ...
    def Line(self, num: int) -> str: ...
    def Lines(self) -> TColStd_HSequenceOfHAsciiString: ...
    def NbLines(self) -> int: ...
    def Perform(self, ctx: IFSelect_ContextWrite, writer: IGESData_IGESWriter) -> None: ...

class IGESSelect_AddGroup(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_AutoCorrect(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_ChangeLevelList(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def HasNewNumber(self) -> bool: ...
    def HasOldNumber(self) -> bool: ...
    def Label(self) -> str: ...
    def NewNumber(self) -> IFSelect_IntParam: ...
    def OldNumber(self) -> IFSelect_IntParam: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...
    def SetNewNumber(self, param: IFSelect_IntParam) -> None: ...
    def SetOldNumber(self, param: IFSelect_IntParam) -> None: ...

class IGESSelect_ChangeLevelNumber(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def HasOldNumber(self) -> bool: ...
    def Label(self) -> str: ...
    def NewNumber(self) -> IFSelect_IntParam: ...
    def OldNumber(self) -> IFSelect_IntParam: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...
    def SetNewNumber(self, param: IFSelect_IntParam) -> None: ...
    def SetOldNumber(self, param: IFSelect_IntParam) -> None: ...

class IGESSelect_ComputeStatus(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_FloatFormat(IGESSelect_FileModifier):
    def __init__(self) -> None: ...
    def Format(self, mainform: str, forminrange: str) -> Tuple[bool, bool, float, float]: ...
    def Label(self) -> str: ...
    def Perform(self, ctx: IFSelect_ContextWrite, writer: IGESData_IGESWriter) -> None: ...
    def SetDefault(self, digits: Optional[int] = 0) -> None: ...
    def SetFormat(self, format: Optional[str] = "%E") -> None: ...
    def SetFormatForRange(self, format: Optional[str] = "%f", Rmin: Optional[float] = 0.1, Rmax: Optional[float] = 1000.0) -> None: ...
    def SetZeroSuppress(self, mode: bool) -> None: ...

class IGESSelect_RebuildDrawings(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_RebuildGroups(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_RemoveCurves(IGESSelect_ModelModifier):
    def __init__(self, UV: bool) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_SetGlobalParameter(IGESSelect_ModelModifier):
    def __init__(self, numpar: int) -> None: ...
    def GlobalNumber(self) -> int: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...
    def SetValue(self, text: TCollection_HAsciiString) -> None: ...
    def Value(self) -> TCollection_HAsciiString: ...

class IGESSelect_SetLabel(IGESSelect_ModelModifier):
    def __init__(self, mode: int, enforce: bool) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_SetVersion5(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_UpdateCreationDate(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_UpdateFileName(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

class IGESSelect_UpdateLastChange(IGESSelect_ModelModifier):
    def __init__(self) -> None: ...
    def Label(self) -> str: ...
    def Performing(self, ctx: IFSelect_ContextModif, target: IGESData_IGESModel, TC: Interface_CopyTool) -> None: ...

# harray1 classes
# harray2 classes
# hsequence classes

igesselect_Run = igesselect.Run
igesselect_WhatIges = igesselect.WhatIges
IGESSelect_SelectBasicGeom_SubCurves = IGESSelect_SelectBasicGeom.SubCurves
IGESSelect_WorkLibrary_DefineProtocol = IGESSelect_WorkLibrary.DefineProtocol
