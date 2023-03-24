/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define EXPRESSDOCSTRING
"Express module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_express.html"
%enddef
%module (package="OCC.Core", docstring=EXPRESSDOCSTRING) Express


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Express_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Express_Field)
%wrap_handle(Express_Item)
%wrap_handle(Express_Schema)
%wrap_handle(Express_Type)
%wrap_handle(Express_Alias)
%wrap_handle(Express_ComplexType)
%wrap_handle(Express_Entity)
%wrap_handle(Express_Enum)
%wrap_handle(Express_NamedType)
%wrap_handle(Express_PredefinedType)
%wrap_handle(Express_Reference)
%wrap_handle(Express_Select)
%wrap_handle(Express_Boolean)
%wrap_handle(Express_Integer)
%wrap_handle(Express_Logical)
%wrap_handle(Express_Real)
%wrap_handle(Express_String)
%wrap_handle(Express_HSequenceOfEntity)
%wrap_handle(Express_HSequenceOfField)
%wrap_handle(Express_HSequenceOfItem)
/* end handles declaration */

/* templates */
%template(Express_DataMapOfAsciiStringItem) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<Express_Item>,TCollection_AsciiString>;
%template(Express_SequenceOfEntity) NCollection_Sequence<opencascade::handle<Express_Entity>>;

%extend NCollection_Sequence<opencascade::handle<Express_Entity>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Express_SequenceOfField) NCollection_Sequence<opencascade::handle<Express_Field>>;

%extend NCollection_Sequence<opencascade::handle<Express_Field>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Express_SequenceOfItem) NCollection_Sequence<opencascade::handle<Express_Item>>;

%extend NCollection_Sequence<opencascade::handle<Express_Item>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Express_ComplexType Express_Array;
typedef Express_ComplexType Express_Bag;
typedef NCollection_DataMap <TCollection_AsciiString, opencascade::handle <Express_Item>, TCollection_AsciiString> Express_DataMapOfAsciiStringItem;
typedef Express_ComplexType Express_List;
typedef Express_Integer Express_Number;
typedef NCollection_Sequence <opencascade::handle <Express_Entity>> Express_SequenceOfEntity;
typedef NCollection_Sequence <opencascade::handle <Express_Field>> Express_SequenceOfField;
typedef NCollection_Sequence <opencascade::handle <Express_Item>> Express_SequenceOfItem;
typedef Express_ComplexType Express_Set;
/* end typedefs declaration */

/****************
* class Express *
****************/
%rename(express) Express;
class Express {
	public:
		/****************** EnumPrefix ******************/
		/**** md5 signature: f3d5dd051f27fc5150d37036a4fe8409 ****/
		%feature("compactdefaultargs") EnumPrefix;
		%feature("autodoc", "Converts item name from cascade to step style e.g. boundedcurve -> bounded_curve.

Parameters
----------
theName: str

Returns
-------
TCollection_AsciiString
") EnumPrefix;
		static TCollection_AsciiString EnumPrefix(TCollection_AsciiString theName);

		/****************** Schema ******************/
		/**** md5 signature: d7631a712c68c637dc10e39212b26902 ****/
		%feature("compactdefaultargs") Schema;
		%feature("autodoc", "Returns (modifiable) handle to static schema object.

Returns
-------
opencascade::handle<Express_Schema>
") Schema;
		static opencascade::handle<Express_Schema> & Schema();

		/****************** ToStepName ******************/
		/**** md5 signature: c9b2c426eb8123caca301df5c3ff67f2 ****/
		%feature("compactdefaultargs") ToStepName;
		%feature("autodoc", "Converts item name from cascade to step style e.g. boundedcurve -> bounded_curve.

Parameters
----------
theName: str

Returns
-------
TCollection_AsciiString
") ToStepName;
		static TCollection_AsciiString ToStepName(TCollection_AsciiString theName);


        %feature("autodoc", "1");
        %extend{
            std::string WriteFileStampToString() {
            std::stringstream s;
            self->WriteFileStamp(s);
            return s.str();}
        };
};


%extend Express {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Express_Field *
**********************/
class Express_Field : public Standard_Transient {
	public:
		/****************** Express_Field ******************/
		/**** md5 signature: 3e21608350f7637caf3ae622554008bf ****/
		%feature("compactdefaultargs") Express_Field;
		%feature("autodoc", "Create object and initialize it.

Parameters
----------
theName: str
theType: Express_Type
theOpt: bool

Returns
-------
None
") Express_Field;
		 Express_Field(Standard_CString theName, const opencascade::handle<Express_Type> & theType, const Standard_Boolean theOpt);

		/****************** Express_Field ******************/
		/**** md5 signature: da5074e31510f263cedd558630316d6f ****/
		%feature("compactdefaultargs") Express_Field;
		%feature("autodoc", "Create object and initialize it.

Parameters
----------
theName: TCollection_HAsciiString
theType: Express_Type
theOpt: bool

Returns
-------
None
") Express_Field;
		 Express_Field(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<Express_Type> & theType, const Standard_Boolean theOpt);

		/****************** HName ******************/
		/**** md5 signature: 47c0ef4120e7b045183f3038bf0f7267 ****/
		%feature("compactdefaultargs") HName;
		%feature("autodoc", "Returns a pointer to the field name to modify it.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") HName;
		opencascade::handle<TCollection_HAsciiString> HName();

		/****************** IsOptional ******************/
		/**** md5 signature: 9c52f00f8741fdeb63e0063a710dbe63 ****/
		%feature("compactdefaultargs") IsOptional;
		%feature("autodoc", "Returns true if field is optional.

Returns
-------
bool
") IsOptional;
		Standard_Boolean IsOptional();

		/****************** Name ******************/
		/**** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** Type ******************/
		/**** md5 signature: bba84362c27eb84a45b31580d12eb904 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns field type.

Returns
-------
opencascade::handle<Express_Type>
") Type;
		const opencascade::handle<Express_Type> & Type();

};


%make_alias(Express_Field)

%extend Express_Field {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Express_Item *
*********************/
%nodefaultctor Express_Item;
class Express_Item : public Standard_Transient {
	public:
/* public enums */
enum GenMode {
	GM_NoGen = 0,
	GM_GenByUser = 1,
	GM_GenByAlgo = 2,
	GM_Undefined = 3,
	GM_Generated = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GenMode(IntEnum):
	GM_NoGen = 0
	GM_GenByUser = 1
	GM_GenByAlgo = 2
	GM_Undefined = 3
	GM_Generated = 4
GM_NoGen = GenMode.GM_NoGen
GM_GenByUser = GenMode.GM_GenByUser
GM_GenByAlgo = GenMode.GM_GenByAlgo
GM_Undefined = GenMode.GM_Undefined
GM_Generated = GenMode.GM_Generated
};
/* end python proxy for enums */

		/****************** CPPName ******************/
		/**** md5 signature: bf818f2de6e4c89b1e935ff8e00caa71 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns (generated) name for the item in cxx-style (package_class).

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** Category ******************/
		/**** md5 signature: 3b3e63627e46a752b9d0ac0aa07ae3de ****/
		%feature("compactdefaultargs") Category;
		%feature("autodoc", "Get item category.

Returns
-------
TCollection_AsciiString
") Category;
		const TCollection_AsciiString & Category();

		/****************** CheckFlag ******************/
		/**** md5 signature: 7b2b532ac36c6ae9d21d6c9a6827746a ****/
		%feature("compactdefaultargs") CheckFlag;
		%feature("autodoc", "Get flag resposible for presence of method check in the class.

Returns
-------
bool
") CheckFlag;
		Standard_Boolean CheckFlag();

		/****************** FillSharedFlag ******************/
		/**** md5 signature: 8494ab0383394e373a97d1cdf38468c2 ****/
		%feature("compactdefaultargs") FillSharedFlag;
		%feature("autodoc", "Get flag resposible for presence of method fillshared in the class.

Returns
-------
bool
") FillSharedFlag;
		Standard_Boolean FillSharedFlag();

		/****************** Generate ******************/
		/**** md5 signature: 9996e1c5378f3ceda1ecd58341ba38bd ****/
		%feature("compactdefaultargs") Generate;
		%feature("autodoc", "Checks that item is marked for generation and if yes, generate it by calling generateclass. but firstly define packagename to 'stepstep' if not yet defined and drop mark flag.

Returns
-------
bool
") Generate;
		Standard_Boolean Generate();

		/****************** GenerateClass ******************/
		/**** md5 signature: eadc65a43819aae92d8fe0daa7ee69e5 ****/
		%feature("compactdefaultargs") GenerateClass;
		%feature("autodoc", "General interface for creating hxx/cxx files from item.

Returns
-------
bool
") GenerateClass;
		virtual Standard_Boolean GenerateClass();

		/****************** GetGenMode ******************/
		/**** md5 signature: 05dd755647cdf8803101a1b7b8f64f86 ****/
		%feature("compactdefaultargs") GetGenMode;
		%feature("autodoc", "Returns item generation mode.

Returns
-------
GenMode
") GetGenMode;
		GenMode GetGenMode();

		/****************** GetPackageName ******************/
		/**** md5 signature: 8593ed4b6ee31f35a57ab9ba23838e5f ****/
		%feature("compactdefaultargs") GetPackageName;
		%feature("autodoc", "Returns package name if not defined, returns unknown package name: 'stepstep'.

Returns
-------
TCollection_AsciiString
") GetPackageName;
		const TCollection_AsciiString & GetPackageName();

		/****************** GetUnknownPackageName ******************/
		/**** md5 signature: 1ca1fe34a5248ece4dea8b0d625eae53 ****/
		%feature("compactdefaultargs") GetUnknownPackageName;
		%feature("autodoc", "Returns unknown package name: 'stepstep'.

Returns
-------
TCollection_AsciiString
") GetUnknownPackageName;
		static TCollection_AsciiString & GetUnknownPackageName();

		/****************** HName ******************/
		/**** md5 signature: 47c0ef4120e7b045183f3038bf0f7267 ****/
		%feature("compactdefaultargs") HName;
		%feature("autodoc", "Returns a pointer to the item name to modify it.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") HName;
		opencascade::handle<TCollection_HAsciiString> HName();

		/****************** Index ******************/
		/**** md5 signature: 95d5c53013bca9fb3828eb9b54beb2b9 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Get current entity index.

Returns
-------
int
") Index;
		static Standard_Integer Index();

		/****************** IsPackageNameSet ******************/
		/**** md5 signature: a7d6c018792fca9cd0bea9f1893ce117 ****/
		%feature("compactdefaultargs") IsPackageNameSet;
		%feature("autodoc", "Returns whether the package name is set.

Returns
-------
bool
") IsPackageNameSet;
		Standard_Boolean IsPackageNameSet();

		/****************** Name ******************/
		/**** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns item name.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** PropagateUse ******************/
		/**** md5 signature: 8817a0032ac082e6fa8f5c4f6d5073c6 ****/
		%feature("compactdefaultargs") PropagateUse;
		%feature("autodoc", "Propagates the calls of use function.

Returns
-------
None
") PropagateUse;
		virtual void PropagateUse();

		/****************** ResetLoopFlag ******************/
		/**** md5 signature: df3d1e4cc099b47d43acd294a3465fb4 ****/
		%feature("compactdefaultargs") ResetLoopFlag;
		%feature("autodoc", "Reset loop flag.

Returns
-------
None
") ResetLoopFlag;
		void ResetLoopFlag();

		/****************** SetCategory ******************/
		/**** md5 signature: fa2b06d8d2bbe66dc5be9bc8d407d9a3 ****/
		%feature("compactdefaultargs") SetCategory;
		%feature("autodoc", "Set category for item.

Parameters
----------
theCateg: TCollection_HAsciiString

Returns
-------
None
") SetCategory;
		void SetCategory(const opencascade::handle<TCollection_HAsciiString> & theCateg);

		/****************** SetCheckFlag ******************/
		/**** md5 signature: 38d05291c2d82707d676eb8430731c9e ****/
		%feature("compactdefaultargs") SetCheckFlag;
		%feature("autodoc", "Set flag for presence of method check in the class.

Parameters
----------
theCheckFlag: bool

Returns
-------
None
") SetCheckFlag;
		void SetCheckFlag(const Standard_Boolean theCheckFlag);

		/****************** SetFillSharedFlag ******************/
		/**** md5 signature: f89d1ee07a0da640480f524336c959b6 ****/
		%feature("compactdefaultargs") SetFillSharedFlag;
		%feature("autodoc", "Set flag for presence of method fillshared in the class.

Parameters
----------
theFillSharedFlag: bool

Returns
-------
None
") SetFillSharedFlag;
		void SetFillSharedFlag(const Standard_Boolean theFillSharedFlag);

		/****************** SetGenMode ******************/
		/**** md5 signature: 69530e8076d880380d6d56eeeb3aae1e ****/
		%feature("compactdefaultargs") SetGenMode;
		%feature("autodoc", "Change generation mode for item.

Parameters
----------
theGenMode: GenMode

Returns
-------
None
") SetGenMode;
		void SetGenMode(const GenMode theGenMode);

		/****************** SetIndex ******************/
		/**** md5 signature: 592c12dcbff871b99141aaf9f1e1fbaa ****/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Set start entity index.

Parameters
----------
theIndex: int

Returns
-------
void
") SetIndex;
		static void SetIndex(const Standard_Integer theIndex);

		/****************** SetPackageName ******************/
		/**** md5 signature: 682bd7afdf84d1b1f963146578ca180a ****/
		%feature("compactdefaultargs") SetPackageName;
		%feature("autodoc", "Sets package name.

Parameters
----------
thePack: str

Returns
-------
None
") SetPackageName;
		void SetPackageName(TCollection_AsciiString thePack);

		/****************** SetShortName ******************/
		/**** md5 signature: 7177848cf400660272ff0398fc2c5223 ****/
		%feature("compactdefaultargs") SetShortName;
		%feature("autodoc", "Set short name for item.

Parameters
----------
theShName: TCollection_HAsciiString

Returns
-------
None
") SetShortName;
		void SetShortName(const opencascade::handle<TCollection_HAsciiString> & theShName);

		/****************** ShortName ******************/
		/**** md5 signature: d02e63488ec4c1c3b3677dfe28439c58 ****/
		%feature("compactdefaultargs") ShortName;
		%feature("autodoc", "Get item short name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ShortName;
		opencascade::handle<TCollection_HAsciiString> ShortName();

		/****************** Use ******************/
		/**** md5 signature: fb1a7cb6894d8933ad5a27dff81a2420 ****/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "Declares item as used by other item being generated if item is not mentioned by the user (as new or existed) but is used, then it sets genmode to gm_genbyalgo and calls generate().

Returns
-------
bool
") Use;
		Standard_Boolean Use();

		/****************** Use2 ******************/
		/**** md5 signature: 4d200108f9a464679845e0b24c1d8a2a ****/
		%feature("compactdefaultargs") Use2;
		%feature("autodoc", "Mark item as visited in propagateuse flow and defined the package name if not set.

Parameters
----------
theRefName: str
theRefPack: str

Returns
-------
None
") Use2;
		void Use2(TCollection_AsciiString theRefName, TCollection_AsciiString theRefPack);

};


%make_alias(Express_Item)

%extend Express_Item {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Express_Schema *
***********************/
class Express_Schema : public Standard_Transient {
	public:
		/****************** Express_Schema ******************/
		/**** md5 signature: 819b34cbef6fb0cad3c4cbcbd3917543 ****/
		%feature("compactdefaultargs") Express_Schema;
		%feature("autodoc", "Creates a schema with given name and given set of items and calls prepare().

Parameters
----------
theName: str
theItems: Express_HSequenceOfItem

Returns
-------
None
") Express_Schema;
		 Express_Schema(Standard_CString theName, const opencascade::handle<Express_HSequenceOfItem> & theItems);

		/****************** Express_Schema ******************/
		/**** md5 signature: 591b66c71cfca8870acd60de52d2a18f ****/
		%feature("compactdefaultargs") Express_Schema;
		%feature("autodoc", "Creates a schema with given name and given set of items and calls prepare().

Parameters
----------
theName: TCollection_HAsciiString
theItems: Express_HSequenceOfItem

Returns
-------
None
") Express_Schema;
		 Express_Schema(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<Express_HSequenceOfItem> & theItems);

		/****************** Item ******************/
		/**** md5 signature: 0a7cdb390c641998fcaa72c70d46d0df ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns item by index.

Parameters
----------
theNum: int

Returns
-------
opencascade::handle<Express_Item>
") Item;
		opencascade::handle<Express_Item> Item(const Standard_Integer theNum);

		/****************** Item ******************/
		/**** md5 signature: ddd40bb099d108249a47d3cefcf583d2 ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns item by name.

Parameters
----------
theName: str
theSilent: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Express_Item>
") Item;
		opencascade::handle<Express_Item> Item(Standard_CString theName, const Standard_Boolean theSilent = Standard_False);

		/****************** Item ******************/
		/**** md5 signature: a25260269b9259ec7734a7043e57b192 ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns item by name.

Parameters
----------
theName: str

Returns
-------
opencascade::handle<Express_Item>
") Item;
		opencascade::handle<Express_Item> Item(TCollection_AsciiString theName);

		/****************** Item ******************/
		/**** md5 signature: fbcbb8f1f4813733cfefa9dd4d4ca090 ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns item by name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
opencascade::handle<Express_Item>
") Item;
		opencascade::handle<Express_Item> Item(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** Items ******************/
		/**** md5 signature: 3f6cc0c675744714a35fcf77932758ca ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns sequence of items.

Returns
-------
opencascade::handle<Express_HSequenceOfItem>
") Items;
		const opencascade::handle<Express_HSequenceOfItem> & Items();

		/****************** Name ******************/
		/**** md5 signature: 81c2b1e099b435e791894b7df0d09da3 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns schema name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		const opencascade::handle<TCollection_HAsciiString> & Name();

		/****************** NbItems ******************/
		/**** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ****/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Returns number of items.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

};


%make_alias(Express_Schema)

%extend Express_Schema {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Express_Type *
*********************/
%nodefaultctor Express_Type;
class Express_Type : public Standard_Transient {
	public:
		/****************** CPPName ******************/
		/**** md5 signature: 072faee1ef8195112eff271a9f6e02dc ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns cpp-style name of the type.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** IsHandle ******************/
		/**** md5 signature: c5b68444c86c58e0f118ceba8d8edbb6 ****/
		%feature("compactdefaultargs") IsHandle;
		%feature("autodoc", "Return true if type is transient (by default returns ! issimple()).

Returns
-------
bool
") IsHandle;
		virtual Standard_Boolean IsHandle();

		/****************** IsSimple ******************/
		/**** md5 signature: ab60ab32dcb825c51d6463ea2e58a7c1 ****/
		%feature("compactdefaultargs") IsSimple;
		%feature("autodoc", "Return true if type is simple (not a class) (by default returns isstandard()).

Returns
-------
bool
") IsSimple;
		virtual Standard_Boolean IsSimple();

		/****************** IsStandard ******************/
		/**** md5 signature: 292218a1fa7936c16de00e759d86e0f8 ****/
		%feature("compactdefaultargs") IsStandard;
		%feature("autodoc", "Return true if type is defined in package standard (false by default).

Returns
-------
bool
") IsStandard;
		virtual Standard_Boolean IsStandard();

		/****************** Use ******************/
		/**** md5 signature: 538f54caae9947d3329175fd413326ed ****/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "Declares type as used by some item being generated. calls use() for all referred types and schema items. default instantiation does nothing.

Returns
-------
bool
") Use;
		virtual Standard_Boolean Use();

		/****************** Use2 ******************/
		/**** md5 signature: 198939c8ec9a64764b5819ecead0f3e3 ****/
		%feature("compactdefaultargs") Use2;
		%feature("autodoc", "Declares type as used by some item being generated. calls use() for all referred types and schema items. default instantiation does nothing.

Parameters
----------
theRefName: str
theRefPack: str

Returns
-------
None
") Use2;
		virtual void Use2(TCollection_AsciiString theRefName, TCollection_AsciiString theRefPack);

};


%make_alias(Express_Type)

%extend Express_Type {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Express_Alias *
**********************/
class Express_Alias : public Express_Item {
	public:
		/****************** Express_Alias ******************/
		/**** md5 signature: f5608c5f676127b218a06460121ca3a8 ****/
		%feature("compactdefaultargs") Express_Alias;
		%feature("autodoc", "Create alias item and initialize it.

Parameters
----------
theName: str
theType: Express_Type

Returns
-------
None
") Express_Alias;
		 Express_Alias(Standard_CString theName, const opencascade::handle<Express_Type> & theType);

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns name of aliased type.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** GenerateClass ******************/
		/**** md5 signature: 6d28c4fccb2a67e6b3871120a1153a90 ****/
		%feature("compactdefaultargs") GenerateClass;
		%feature("autodoc", "Create hxx/cxx files from item.

Returns
-------
bool
") GenerateClass;
		virtual Standard_Boolean GenerateClass();

		/****************** PropagateUse ******************/
		/**** md5 signature: d07548d469389e0d0b9da7264874cc7e ****/
		%feature("compactdefaultargs") PropagateUse;
		%feature("autodoc", "Propagates the calls of use function.

Returns
-------
None
") PropagateUse;
		virtual void PropagateUse();

		/****************** Type ******************/
		/**** md5 signature: bba84362c27eb84a45b31580d12eb904 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns aliased type.

Returns
-------
opencascade::handle<Express_Type>
") Type;
		const opencascade::handle<Express_Type> & Type();

};


%make_alias(Express_Alias)

%extend Express_Alias {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Express_ComplexType *
****************************/
class Express_ComplexType : public Express_Type {
	public:
		/****************** Express_ComplexType ******************/
		/**** md5 signature: 9ed6c2fa42c693d0589cce24a1996359 ****/
		%feature("compactdefaultargs") Express_ComplexType;
		%feature("autodoc", "Creates an object and initializes fields.

Parameters
----------
theImin: int
theImax: int
theType: Express_Type

Returns
-------
None
") Express_ComplexType;
		 Express_ComplexType(const Standard_Integer theImin, const Standard_Integer theImax, const opencascade::handle<Express_Type> & theType);

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns cpp-style name of the type.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** Type ******************/
		/**** md5 signature: bba84362c27eb84a45b31580d12eb904 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns type of complex type items.

Returns
-------
opencascade::handle<Express_Type>
") Type;
		const opencascade::handle<Express_Type> & Type();

		/****************** Use ******************/
		/**** md5 signature: d270d9928e35767ea65c7c68f6a98708 ****/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "Declares type as used by some item being generated. calls use() for type of elements.

Returns
-------
bool
") Use;
		virtual Standard_Boolean Use();

		/****************** Use2 ******************/
		/**** md5 signature: 3620c2e5c4e214fbb7bd77ab56e18e8c ****/
		%feature("compactdefaultargs") Use2;
		%feature("autodoc", "Declares type as used by some item being generated. calls use() for type of elements.

Parameters
----------
theRefName: str
theRefPack: str

Returns
-------
None
") Use2;
		virtual void Use2(TCollection_AsciiString theRefName, TCollection_AsciiString theRefPack);

};


%make_alias(Express_ComplexType)

%extend Express_ComplexType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Express_Entity *
***********************/
class Express_Entity : public Express_Item {
	public:
		/****************** Express_Entity ******************/
		/**** md5 signature: c09519365b86ba3492a0e19ce9c470ac ****/
		%feature("compactdefaultargs") Express_Entity;
		%feature("autodoc", "Create entity item and initialize it flags hascheck and hasfillshared mark if generated class has methods check and fillshared correspondingly.

Parameters
----------
theName: str
theInherit: TColStd_HSequenceOfHAsciiString
theFields: Express_HSequenceOfField

Returns
-------
None
") Express_Entity;
		 Express_Entity(Standard_CString theName, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & theInherit, const opencascade::handle<Express_HSequenceOfField> & theFields);

		/****************** AbstractFlag ******************/
		/**** md5 signature: e7bc7af26ca79c1b672748894029eaa8 ****/
		%feature("compactdefaultargs") AbstractFlag;
		%feature("autodoc", "Returns abstract flag.

Returns
-------
inline bool
") AbstractFlag;
		inline Standard_Boolean AbstractFlag();

		/****************** Fields ******************/
		/**** md5 signature: 6834440b7951db882506ab46f7ad913c ****/
		%feature("compactdefaultargs") Fields;
		%feature("autodoc", "Returns sequence of fields.

Returns
-------
opencascade::handle<Express_HSequenceOfField>
") Fields;
		const opencascade::handle<Express_HSequenceOfField> & Fields();

		/****************** Inherit ******************/
		/**** md5 signature: a8c6996d2e82f787d69c5f82e1200f5d ****/
		%feature("compactdefaultargs") Inherit;
		%feature("autodoc", "Returns sequence of inherited items.

Returns
-------
opencascade::handle<Express_HSequenceOfEntity>
") Inherit;
		const opencascade::handle<Express_HSequenceOfEntity> & Inherit();

		/****************** NbFields ******************/
		/**** md5 signature: 49ad2d1ff28df84e326552b81b9e9dfd ****/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns number of fields (only own fields if inherited is false and including fields of all supertypes if it is true).

Parameters
----------
theInherited: bool,optional
	default value is Standard_False

Returns
-------
int
") NbFields;
		Standard_Integer NbFields(const Standard_Boolean theInherited = Standard_False);

		/****************** SetAbstractFlag ******************/
		/**** md5 signature: feba06fedf7c2cdd35f98a6733095c28 ****/
		%feature("compactdefaultargs") SetAbstractFlag;
		%feature("autodoc", "Sets abstruct flag for entity;.

Parameters
----------
theIsAbstract: bool

Returns
-------
None
") SetAbstractFlag;
		void SetAbstractFlag(const Standard_Boolean theIsAbstract);

		/****************** SuperTypes ******************/
		/**** md5 signature: 82d96f5be8e5100fc6734d2ec6bbf628 ****/
		%feature("compactdefaultargs") SuperTypes;
		%feature("autodoc", "Returns sequence of inherited classes (names).

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") SuperTypes;
		const opencascade::handle<TColStd_HSequenceOfHAsciiString> & SuperTypes();

};


%make_alias(Express_Entity)

%extend Express_Entity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Express_Enum *
*********************/
class Express_Enum : public Express_Item {
	public:
		/****************** Express_Enum ******************/
		/**** md5 signature: 1754c4486c659b270056d988e7a76e66 ****/
		%feature("compactdefaultargs") Express_Enum;
		%feature("autodoc", "Create enum item and initialize it.

Parameters
----------
theName: str
theNames: TColStd_HSequenceOfHAsciiString

Returns
-------
None
") Express_Enum;
		 Express_Enum(Standard_CString theName, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & theNames);

		/****************** GenerateClass ******************/
		/**** md5 signature: 6d28c4fccb2a67e6b3871120a1153a90 ****/
		%feature("compactdefaultargs") GenerateClass;
		%feature("autodoc", "Create hxx/cxx files from item.

Returns
-------
bool
") GenerateClass;
		virtual Standard_Boolean GenerateClass();

		/****************** Names ******************/
		/**** md5 signature: 088c5c0477cf801b64a2bb5044d2fe11 ****/
		%feature("compactdefaultargs") Names;
		%feature("autodoc", "Returns names of enumeration variants.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Names;
		const opencascade::handle<TColStd_HSequenceOfHAsciiString> & Names();

		/****************** PropagateUse ******************/
		/**** md5 signature: d07548d469389e0d0b9da7264874cc7e ****/
		%feature("compactdefaultargs") PropagateUse;
		%feature("autodoc", "Propagates the calls of use function.

Returns
-------
None
") PropagateUse;
		virtual void PropagateUse();

};


%make_alias(Express_Enum)

%extend Express_Enum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Express_NamedType *
**************************/
class Express_NamedType : public Express_Type {
	public:
		/****************** Express_NamedType ******************/
		/**** md5 signature: 67794bdac568d20ae0655c3209c8040f ****/
		%feature("compactdefaultargs") Express_NamedType;
		%feature("autodoc", "Creates an object and initializes by name.

Parameters
----------
theName: str

Returns
-------
None
") Express_NamedType;
		 Express_NamedType(Standard_CString theName);

		/****************** Express_NamedType ******************/
		/**** md5 signature: ccdd3f40a9b9c6caabd3d64a8006de4d ****/
		%feature("compactdefaultargs") Express_NamedType;
		%feature("autodoc", "Creates an object and initializes by name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") Express_NamedType;
		 Express_NamedType(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns cpp-style name of the type.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** HName ******************/
		/**** md5 signature: 47c0ef4120e7b045183f3038bf0f7267 ****/
		%feature("compactdefaultargs") HName;
		%feature("autodoc", "Returns a pointer to the type name to modify it.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") HName;
		opencascade::handle<TCollection_HAsciiString> HName();

		/****************** IsHandle ******************/
		/**** md5 signature: 2d3ff0def94e20ff52cb4852545150f4 ****/
		%feature("compactdefaultargs") IsHandle;
		%feature("autodoc", "Return true if type is inherited from transient.

Returns
-------
bool
") IsHandle;
		virtual Standard_Boolean IsHandle();

		/****************** IsSimple ******************/
		/**** md5 signature: a3c902dacd7b41a4429ef54a28739d4f ****/
		%feature("compactdefaultargs") IsSimple;
		%feature("autodoc", "Return true if type is simple (not a class).

Returns
-------
bool
") IsSimple;
		virtual Standard_Boolean IsSimple();

		/****************** IsStandard ******************/
		/**** md5 signature: 908e350000bb948eec9cc7e27e5b73e4 ****/
		%feature("compactdefaultargs") IsStandard;
		%feature("autodoc", "Return true if type is defined in package standard.

Returns
-------
bool
") IsStandard;
		virtual Standard_Boolean IsStandard();

		/****************** Item ******************/
		/**** md5 signature: c20c7e79e8c67dae9a900fda424c0ffb ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns handle to referred item in schema.

Returns
-------
opencascade::handle<Express_Item>
") Item;
		const opencascade::handle<Express_Item> & Item();

		/****************** Name ******************/
		/**** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns name of type (item in schema).

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** SetItem ******************/
		/**** md5 signature: 51eab14690ac3028c4177314d9f5111d ****/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets handle to referred item in schema.

Parameters
----------
theItem: Express_Item

Returns
-------
None
") SetItem;
		void SetItem(const opencascade::handle<Express_Item> & theItem);

		/****************** Use ******************/
		/**** md5 signature: d270d9928e35767ea65c7c68f6a98708 ****/
		%feature("compactdefaultargs") Use;
		%feature("autodoc", "Declares type as used by some item being generated. calls use() for referred item (found by name).

Returns
-------
bool
") Use;
		virtual Standard_Boolean Use();

		/****************** Use2 ******************/
		/**** md5 signature: 3620c2e5c4e214fbb7bd77ab56e18e8c ****/
		%feature("compactdefaultargs") Use2;
		%feature("autodoc", "Declares type as used by some item being generated. calls use() for referred item (found by name).

Parameters
----------
theRefName: str
theRefPack: str

Returns
-------
None
") Use2;
		virtual void Use2(TCollection_AsciiString theRefName, TCollection_AsciiString theRefPack);

};


%make_alias(Express_NamedType)

%extend Express_NamedType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Express_PredefinedType *
*******************************/
%nodefaultctor Express_PredefinedType;
class Express_PredefinedType : public Express_Type {
	public:
		/****************** IsStandard ******************/
		/**** md5 signature: 908e350000bb948eec9cc7e27e5b73e4 ****/
		%feature("compactdefaultargs") IsStandard;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsStandard;
		virtual Standard_Boolean IsStandard();

};


%make_alias(Express_PredefinedType)

%extend Express_PredefinedType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Express_Reference *
**************************/
class Express_Reference : public Express_Item {
	public:
		/****************** Express_Reference ******************/
		/**** md5 signature: 658cb7bc3ab6a6e5d9d48357f4af29f6 ****/
		%feature("compactdefaultargs") Express_Reference;
		%feature("autodoc", "Create reference item and initialize it.

Parameters
----------
theName: str
theTypes: TColStd_HSequenceOfHAsciiString

Returns
-------
None
") Express_Reference;
		 Express_Reference(Standard_CString theName, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & theTypes);

		/****************** GenerateClass ******************/
		/**** md5 signature: 6d28c4fccb2a67e6b3871120a1153a90 ****/
		%feature("compactdefaultargs") GenerateClass;
		%feature("autodoc", "Redefined to empty (in order to be able to instantiate) return false.

Returns
-------
bool
") GenerateClass;
		virtual Standard_Boolean GenerateClass();

		/****************** Items ******************/
		/**** md5 signature: a3d0784ef42a8ebbaa255a0fae91e3a5 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns handle to sequence of items corresponding to listed types.

Returns
-------
opencascade::handle<Express_HSequenceOfItem>
") Items;
		const opencascade::handle<Express_HSequenceOfItem> & Items();

		/****************** PropagateUse ******************/
		/**** md5 signature: d07548d469389e0d0b9da7264874cc7e ****/
		%feature("compactdefaultargs") PropagateUse;
		%feature("autodoc", "Propagates the calls of use function.

Returns
-------
None
") PropagateUse;
		virtual void PropagateUse();

		/****************** Types ******************/
		/**** md5 signature: 0d6fa49959a2b81aece0f8df27f34547 ****/
		%feature("compactdefaultargs") Types;
		%feature("autodoc", "Returns list of types referenced.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Types;
		const opencascade::handle<TColStd_HSequenceOfHAsciiString> & Types();

};


%make_alias(Express_Reference)

%extend Express_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Express_Select *
***********************/
class Express_Select : public Express_Item {
	public:
		/****************** Express_Select ******************/
		/**** md5 signature: bcd850e3f5d808b45671ee28e316029e ****/
		%feature("compactdefaultargs") Express_Select;
		%feature("autodoc", "Create select item and initialize it.

Parameters
----------
theName: str
theNames: TColStd_HSequenceOfHAsciiString

Returns
-------
None
") Express_Select;
		 Express_Select(Standard_CString theName, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & theNames);

		/****************** GenerateClass ******************/
		/**** md5 signature: 6d28c4fccb2a67e6b3871120a1153a90 ****/
		%feature("compactdefaultargs") GenerateClass;
		%feature("autodoc", "Create hxx/cxx files from item.

Returns
-------
bool
") GenerateClass;
		virtual Standard_Boolean GenerateClass();

		/****************** Items ******************/
		/**** md5 signature: 3f6cc0c675744714a35fcf77932758ca ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Returns sequence of items corresponding to typenames.

Returns
-------
opencascade::handle<Express_HSequenceOfItem>
") Items;
		const opencascade::handle<Express_HSequenceOfItem> & Items();

		/****************** Names ******************/
		/**** md5 signature: 088c5c0477cf801b64a2bb5044d2fe11 ****/
		%feature("compactdefaultargs") Names;
		%feature("autodoc", "Returns names of types included in this select.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Names;
		const opencascade::handle<TColStd_HSequenceOfHAsciiString> & Names();

		/****************** PropagateUse ******************/
		/**** md5 signature: d07548d469389e0d0b9da7264874cc7e ****/
		%feature("compactdefaultargs") PropagateUse;
		%feature("autodoc", "Propagates the calls of use function.

Returns
-------
None
") PropagateUse;
		virtual void PropagateUse();

};


%make_alias(Express_Select)

%extend Express_Select {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Express_Boolean *
************************/
class Express_Boolean : public Express_PredefinedType {
	public:
		/****************** Express_Boolean ******************/
		/**** md5 signature: 4af8ad8f86b529c1f4007d8eb6194182 ****/
		%feature("compactdefaultargs") Express_Boolean;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Express_Boolean;
		 Express_Boolean();

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns 'standard_boolean'.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

};


%make_alias(Express_Boolean)

%extend Express_Boolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Express_Integer *
************************/
class Express_Integer : public Express_PredefinedType {
	public:
		/****************** Express_Integer ******************/
		/**** md5 signature: b52a4e34e38dfeca9c0eb5760722dcc9 ****/
		%feature("compactdefaultargs") Express_Integer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Express_Integer;
		 Express_Integer();

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns 'standard_integer'.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

};


%make_alias(Express_Integer)

%extend Express_Integer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Express_Logical *
************************/
class Express_Logical : public Express_PredefinedType {
	public:
		/****************** Express_Logical ******************/
		/**** md5 signature: 8f179cfa0b472eb7388e72a6fc8f197a ****/
		%feature("compactdefaultargs") Express_Logical;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Express_Logical;
		 Express_Logical();

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns 'stepdata_logical'.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** IsHandle ******************/
		/**** md5 signature: 2d3ff0def94e20ff52cb4852545150f4 ****/
		%feature("compactdefaultargs") IsHandle;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsHandle;
		virtual Standard_Boolean IsHandle();

		/****************** IsSimple ******************/
		/**** md5 signature: a3c902dacd7b41a4429ef54a28739d4f ****/
		%feature("compactdefaultargs") IsSimple;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsSimple;
		virtual Standard_Boolean IsSimple();

		/****************** IsStandard ******************/
		/**** md5 signature: 908e350000bb948eec9cc7e27e5b73e4 ****/
		%feature("compactdefaultargs") IsStandard;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsStandard;
		virtual Standard_Boolean IsStandard();

};


%make_alias(Express_Logical)

%extend Express_Logical {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Express_Real *
*********************/
class Express_Real : public Express_PredefinedType {
	public:
		/****************** Express_Real ******************/
		/**** md5 signature: a9ea476f5615768503595310752b9746 ****/
		%feature("compactdefaultargs") Express_Real;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Express_Real;
		 Express_Real();

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns 'standard_real'.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

};


%make_alias(Express_Real)

%extend Express_Real {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Express_String *
***********************/
class Express_String : public Express_PredefinedType {
	public:
		/****************** Express_String ******************/
		/**** md5 signature: 16505367eec330c2dc6a601a60a9e0bc ****/
		%feature("compactdefaultargs") Express_String;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Express_String;
		 Express_String();

		/****************** CPPName ******************/
		/**** md5 signature: 74208491d6feaace7ae771835ddee5c5 ****/
		%feature("compactdefaultargs") CPPName;
		%feature("autodoc", "Returns 'tcollection_hasciistring'.

Returns
-------
TCollection_AsciiString
") CPPName;
		virtual const TCollection_AsciiString CPPName();

		/****************** IsStandard ******************/
		/**** md5 signature: 908e350000bb948eec9cc7e27e5b73e4 ****/
		%feature("compactdefaultargs") IsStandard;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsStandard;
		virtual Standard_Boolean IsStandard();

};


%make_alias(Express_String)

%extend Express_String {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Express_HSequenceOfEntity : public Express_SequenceOfEntity, public Standard_Transient {
  public:
    Express_HSequenceOfEntity();
    Express_HSequenceOfEntity(const Express_SequenceOfEntity& theOther);
    const Express_SequenceOfEntity& Sequence();
    void Append (const Express_SequenceOfEntity::value_type& theItem);
    void Append (Express_SequenceOfEntity& theSequence);
    Express_SequenceOfEntity& ChangeSequence();
};
%make_alias(Express_HSequenceOfEntity)


class Express_HSequenceOfField : public Express_SequenceOfField, public Standard_Transient {
  public:
    Express_HSequenceOfField();
    Express_HSequenceOfField(const Express_SequenceOfField& theOther);
    const Express_SequenceOfField& Sequence();
    void Append (const Express_SequenceOfField::value_type& theItem);
    void Append (Express_SequenceOfField& theSequence);
    Express_SequenceOfField& ChangeSequence();
};
%make_alias(Express_HSequenceOfField)


class Express_HSequenceOfItem : public Express_SequenceOfItem, public Standard_Transient {
  public:
    Express_HSequenceOfItem();
    Express_HSequenceOfItem(const Express_SequenceOfItem& theOther);
    const Express_SequenceOfItem& Sequence();
    void Append (const Express_SequenceOfItem::value_type& theItem);
    void Append (Express_SequenceOfItem& theSequence);
    Express_SequenceOfItem& ChangeSequence();
};
%make_alias(Express_HSequenceOfItem)


/* class aliases */
%pythoncode {
Express_Array=Express_ComplexType
Express_Bag=Express_ComplexType
Express_List=Express_ComplexType
Express_Number=Express_Integer
Express_Set=Express_ComplexType
}
