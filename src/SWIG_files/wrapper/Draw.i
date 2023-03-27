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
%define DRAWDOCSTRING
"Draw module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_draw.html"
%enddef
%module (package="OCC.Core", docstring=DRAWDOCSTRING) Draw


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
#include<Draw_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<Quantity_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<OSD_module.hxx>
#include<Aspect_module.hxx>
#include<Graphic3d_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import Quantity.i
%import gp.i
%import Message.i
%import Bnd.i
%import OSD.i
%import Aspect.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Draw_ColorKind {
	Draw_blanc = 0,
	Draw_rouge = 1,
	Draw_vert = 2,
	Draw_bleu = 3,
	Draw_cyan = 4,
	Draw_or = 5,
	Draw_magenta = 6,
	Draw_marron = 7,
	Draw_orange = 8,
	Draw_rose = 9,
	Draw_saumon = 10,
	Draw_violet = 11,
	Draw_jaune = 12,
	Draw_kaki = 13,
	Draw_corail = 14,
};

enum Draw_MarkerShape {
	Draw_Square = 0,
	Draw_Losange = 1,
	Draw_X = 2,
	Draw_Plus = 3,
	Draw_Circle = 4,
	Draw_CircleZoom = 5,
};

enum console_semaphore_value {
	STOP_CONSOLE = 0,
	WAIT_CONSOLE_COMMAND = 1,
	HAS_CONSOLE_COMMAND = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Draw_ColorKind(IntEnum):
	Draw_blanc = 0
	Draw_rouge = 1
	Draw_vert = 2
	Draw_bleu = 3
	Draw_cyan = 4
	Draw_or = 5
	Draw_magenta = 6
	Draw_marron = 7
	Draw_orange = 8
	Draw_rose = 9
	Draw_saumon = 10
	Draw_violet = 11
	Draw_jaune = 12
	Draw_kaki = 13
	Draw_corail = 14
Draw_blanc = Draw_ColorKind.Draw_blanc
Draw_rouge = Draw_ColorKind.Draw_rouge
Draw_vert = Draw_ColorKind.Draw_vert
Draw_bleu = Draw_ColorKind.Draw_bleu
Draw_cyan = Draw_ColorKind.Draw_cyan
Draw_or = Draw_ColorKind.Draw_or
Draw_magenta = Draw_ColorKind.Draw_magenta
Draw_marron = Draw_ColorKind.Draw_marron
Draw_orange = Draw_ColorKind.Draw_orange
Draw_rose = Draw_ColorKind.Draw_rose
Draw_saumon = Draw_ColorKind.Draw_saumon
Draw_violet = Draw_ColorKind.Draw_violet
Draw_jaune = Draw_ColorKind.Draw_jaune
Draw_kaki = Draw_ColorKind.Draw_kaki
Draw_corail = Draw_ColorKind.Draw_corail

class Draw_MarkerShape(IntEnum):
	Draw_Square = 0
	Draw_Losange = 1
	Draw_X = 2
	Draw_Plus = 3
	Draw_Circle = 4
	Draw_CircleZoom = 5
Draw_Square = Draw_MarkerShape.Draw_Square
Draw_Losange = Draw_MarkerShape.Draw_Losange
Draw_X = Draw_MarkerShape.Draw_X
Draw_Plus = Draw_MarkerShape.Draw_Plus
Draw_Circle = Draw_MarkerShape.Draw_Circle
Draw_CircleZoom = Draw_MarkerShape.Draw_CircleZoom

class console_semaphore_value(IntEnum):
	STOP_CONSOLE = 0
	WAIT_CONSOLE_COMMAND = 1
	HAS_CONSOLE_COMMAND = 2
STOP_CONSOLE = console_semaphore_value.STOP_CONSOLE
WAIT_CONSOLE_COMMAND = console_semaphore_value.WAIT_CONSOLE_COMMAND
HAS_CONSOLE_COMMAND = console_semaphore_value.HAS_CONSOLE_COMMAND
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Draw_Drawable3D)
%wrap_handle(Draw_Printer)
%wrap_handle(Draw_ProgressIndicator)
%wrap_handle(Draw_Axis3D)
%wrap_handle(Draw_Box)
%wrap_handle(Draw_Chronometer)
%wrap_handle(Draw_Circle3D)
%wrap_handle(Draw_Drawable2D)
%wrap_handle(Draw_Grid)
%wrap_handle(Draw_Marker3D)
%wrap_handle(Draw_Number)
%wrap_handle(Draw_Segment3D)
%wrap_handle(Draw_Text3D)
%wrap_handle(Draw_Axis2D)
%wrap_handle(Draw_Circle2D)
%wrap_handle(Draw_Marker2D)
%wrap_handle(Draw_Segment2D)
%wrap_handle(Draw_Text2D)
/* end handles declaration */

/* templates */
%template(Draw_MapOfAsciiString) NCollection_IndexedMap<TCollection_AsciiString,TCollection_AsciiString>;
%template(Draw_SequenceOfDrawable3D) NCollection_Sequence<opencascade::handle<Draw_Drawable3D>>;

%extend NCollection_Sequence<opencascade::handle<Draw_Drawable3D>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef void ( * FDraw_InitAppli ) ( Draw_Interpretor & );
typedef NCollection_IndexedMap <TCollection_AsciiString, TCollection_AsciiString> Draw_MapOfAsciiString;
typedef Tcl_Interp * Draw_PInterp;
typedef NCollection_Sequence <opencascade::handle <Draw_Drawable3D>> Draw_SequenceOfDrawable3D;
typedef unsigned long Drawable;
typedef unsigned long Pixmap;
typedef unsigned long Window;
/* end typedefs declaration */

/*************
* class Draw *
*************/
%rename(draw) Draw;
class Draw {
	public:
		/****************** Atof ******************/
		/**** md5 signature: 6ac868fd54edc0a88bb4c08198459870 ****/
		%feature("compactdefaultargs") Atof;
		%feature("autodoc", "@name argument parsing tools converts numeric expression, that can involve draw variables, to real value.

Parameters
----------
Name: str

Returns
-------
float
") Atof;
		static Standard_Real Atof(Standard_CString Name);

		/****************** Atoi ******************/
		/**** md5 signature: d736b2de7bfd00ff8393617ca59a6cdc ****/
		%feature("compactdefaultargs") Atoi;
		%feature("autodoc", "Converts numeric expression, that can involve draw variables, to integer value. implemented as cast of atof() to integer.

Parameters
----------
Name: str

Returns
-------
int
") Atoi;
		static Standard_Integer Atoi(Standard_CString Name);

		/****************** BasicCommands ******************/
		/**** md5 signature: 9e9f0a3a29e9d22a18e3524ef09e07f7 ****/
		%feature("compactdefaultargs") BasicCommands;
		%feature("autodoc", "Defines draw basic commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") BasicCommands;
		static void BasicCommands(Draw_Interpretor & I);

		/****************** Commands ******************/
		/**** md5 signature: b1436e94c1e76639a89ea4ef2d18f6d8 ****/
		%feature("compactdefaultargs") Commands;
		%feature("autodoc", "@name methods loading standard command sets defines all draw commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") Commands;
		static void Commands(Draw_Interpretor & I);

		/****************** Drawables ******************/
		/**** md5 signature: fa1b745d22eec22f52348599cf8778aa ****/
		%feature("compactdefaultargs") Drawables;
		%feature("autodoc", "Returns a map of draw_drawable3d variables.

Returns
-------
NCollection_Map<opencascade::handle<Draw_Drawable3D>>
") Drawables;
		static const NCollection_Map<opencascade::handle<Draw_Drawable3D>> & Drawables();

		/****************** Get ******************/
		/**** md5 signature: 79300f077468234ea514ea77ce9339d7 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns a variable value. the name '.' does a graphic selection; in this case thename will be is overwritten with the name of the variable.

Parameters
----------
theName: str

Returns
-------
opencascade::handle<Draw_Drawable3D>
") Get;
		static opencascade::handle<Draw_Drawable3D> Get(Standard_CString theName);

		/****************** Get ******************/
		/**** md5 signature: e8ff80afa51c1575d8eb59a760c56f58 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Gets a numeric variable. returns true if the variable exist.

Parameters
----------
Name: str

Returns
-------
val: float
") Get;
		static Standard_Boolean Get(Standard_CString Name, Standard_Real &OutValue);

		/****************** GetExisting ******************/
		/**** md5 signature: 252ece5e9813f2e72c462d61269cdfe5 ****/
		%feature("compactdefaultargs") GetExisting;
		%feature("autodoc", "Returns a variable value.

Parameters
----------
theName: str

Returns
-------
opencascade::handle<Draw_Drawable3D>
") GetExisting;
		static opencascade::handle<Draw_Drawable3D> GetExisting(Standard_CString theName);

		/****************** GetInterpretor ******************/
		/**** md5 signature: 9d97fb1762a1c51188c5addac57bf8a7 ****/
		%feature("compactdefaultargs") GetInterpretor;
		%feature("autodoc", "Returns main draw interpretor.

Returns
-------
Draw_Interpretor
") GetInterpretor;
		static Draw_Interpretor & GetInterpretor();

		/****************** GetProgressBar ******************/
		/**** md5 signature: 4ba678a4b6d39ae7c99e076a005a7e4c ****/
		%feature("compactdefaultargs") GetProgressBar;
		%feature("autodoc", "Gets progress indicator.

Returns
-------
opencascade::handle<Draw_ProgressIndicator>
") GetProgressBar;
		static opencascade::handle<Draw_ProgressIndicator> GetProgressBar();

		/****************** GraphicCommands ******************/
		/**** md5 signature: e6f18bf3c3ce2ffb394ff5541026fd81 ****/
		%feature("compactdefaultargs") GraphicCommands;
		%feature("autodoc", "Defines draw variables handling commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") GraphicCommands;
		static void GraphicCommands(Draw_Interpretor & I);

		/****************** LastPick ******************/
		/**** md5 signature: 7689ad1a547a89baea412b761d9af8b8 ****/
		%feature("compactdefaultargs") LastPick;
		%feature("autodoc", "Returns last graphic selection description.

Parameters
----------

Returns
-------
view: int
X: int
Y: int
button: int
") LastPick;
		static void LastPick(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Load ******************/
		/**** md5 signature: 8063cededc274544ad3710113e0ac3d4 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "(re)load a draw harness plugin. @param thedi [in] [out] tcl interpretor to append loaded commands @param thekey [in] plugin code name to be resolved in resource file @param theresourcefilename [in] description file name @param thedefaultsdirectory [in] default folder for looking description file @param theuserdefaultsdirectory [in] user folder for looking description file @param theisverbose [in] print verbose messages.

Parameters
----------
theDI: Draw_Interpretor
theKey: str
theResourceFileName: str
theDefaultsDirectory: str
theUserDefaultsDirectory: str
theIsVerbose: bool,optional
	default value is Standard_False

Returns
-------
void
") Load;
		static void Load(Draw_Interpretor & theDI, TCollection_AsciiString theKey, TCollection_AsciiString theResourceFileName, TCollection_AsciiString theDefaultsDirectory, TCollection_AsciiString theUserDefaultsDirectory, const Standard_Boolean theIsVerbose = Standard_False);

		/****************** MessageCommands ******************/
		/**** md5 signature: 34cbd459e11274e23a4b5036c8ae0a55 ****/
		%feature("compactdefaultargs") MessageCommands;
		%feature("autodoc", "Defines draw message commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") MessageCommands;
		static void MessageCommands(Draw_Interpretor & I);

		/****************** ParseColor ******************/
		/**** md5 signature: b6783a806a72b8d4ce19c1ff587b10e8 ****/
		%feature("compactdefaultargs") ParseColor;
		%feature("autodoc", "Parses rgb(a) color argument(s) specified within theargvec[0], theargvec[1], theargvec[2] and theargvec[3]. handles either color specified by name (single argument) or by rgb(a) components (3-4 arguments) in range 0..1. the result is stored in thecolor on success. //! usage code sample for command argument in form 'cmd -color {colorname|r g b [a]|colorhex}': @code for (int anargiter = 1; anargiter < thenbargs; ++anargiter) { tcollection_asciistring aparam (theargvec[anargiter]); aparam.lowercase(); if (aparam == '-color') { quantity_colorrgba acolor; standard_integer anbparsed = draw::parsecolor (theargnb - anargiter - 1,   theargvec + anargiter + 1, acolor); anargiter += anbparsed; if (anbparsed == 0) { std::cerr << 'syntax error at '' << aparam << '''; return 1; } // process color } } @endcode //! @param theargnb [in] number of available arguments in theargvec (array limits) @param theargvec [in] argument list @param thecolor [out] retrieved color returns number of handled arguments (1, 2, 3 or 4) or 0 on syntax error.

Parameters
----------
theArgNb: int
theArgVec: char *  *
theColor: Quantity_ColorRGBA

Returns
-------
int
") ParseColor;
		static Standard_Integer ParseColor(const Standard_Integer theArgNb, const char * const * const theArgVec, Quantity_ColorRGBA & theColor);

		/****************** ParseColor ******************/
		/**** md5 signature: 97159d45f19f6948ae4466cf56eba814 ****/
		%feature("compactdefaultargs") ParseColor;
		%feature("autodoc", "Parses rgb color argument(s). @param theargnb [in] number of available arguments in theargvec (array limits) @param theargvec [in] argument list @param thecolor [out] retrieved color returns number of handled arguments (1 or 3) or 0 on syntax error.

Parameters
----------
theArgNb: int
theArgVec: char *  *
theColor: Quantity_Color

Returns
-------
int
") ParseColor;
		static Standard_Integer ParseColor(const Standard_Integer theArgNb, const char * const * const theArgVec, Quantity_Color & theColor);

		/****************** ParseInteger ******************/
		/**** md5 signature: 68b71b0de1c9a4e6c5df8e25823ed9f8 ****/
		%feature("compactdefaultargs") ParseInteger;
		%feature("autodoc", "Converts the numeric expression, that can involve draw variables, to an integer value @param theexpressionstring the strings that contains the expression involving draw variables to be parsed @param theparsedintegervalue an integer value that is a result of parsing returns true if parsing was successful, or false otherwise.

Parameters
----------
theExpressionString: str

Returns
-------
theParsedIntegerValue: int
") ParseInteger;
		static bool ParseInteger(Standard_CString theExpressionString, Standard_Integer &OutValue);

		/****************** ParseOnOff ******************/
		/**** md5 signature: 9dfd6dac9a4bdd1e3d5efd7bf9e7f59a ****/
		%feature("compactdefaultargs") ParseOnOff;
		%feature("autodoc", "Parses boolean argument. handles either flag specified by 0|1 or on|off. //! usage code sample for command argument in form 'cmd -usefeature [on|off|1|0]=on': @code for (int anargiter = 1; anargiter < thenbargs; ++anargiter) { tcollection_asciistring aparam (theargvec[anargiter]); aparam.lowercase(); if (aparam == '-usefeature') { bool tousefeature = true; if (anargiter + 1 < thenbargs && draw::parseonoff (theargvec[anargiter + 1])) { ++anargiter; } // process feature } } @endcode //! @param thearg [in] argument value @param theison [out] decoded boolean flag returns false on syntax error.

Parameters
----------
theArg: str

Returns
-------
theIsOn: bool
") ParseOnOff;
		static Standard_Boolean ParseOnOff(Standard_CString theArg, Standard_Boolean &OutValue);

		/****************** ParseOnOffIterator ******************/
		/**** md5 signature: 42df5f4e0f0176f8acfde7058c3e4bab ****/
		%feature("compactdefaultargs") ParseOnOffIterator;
		%feature("autodoc", "Parses boolean argument at specified iterator position with optional on/off coming next. //! usage code sample for command argument in form 'cmd -usefeature [on|off|1|0]=on': @code for (int anargiter = 1; anargiter < thenbargs; ++anargiter) { if (strcasecmp (theargvec[anargiter], '-usefeature') == 0) { bool tousefeature = draw::parseonoffiterator (thenbargs, theargvec, anargiter); // process feature } } @endcode //! @param theargsnb [in] overall number of arguments @param theargvec [in] vector of arguments @param theargiter [in] [out] argument position to parse returns flag value.

Parameters
----------
theArgsNb: int
theArgVec: char * *

Returns
-------
theArgIter: int
") ParseOnOffIterator;
		static Standard_Boolean ParseOnOffIterator(Standard_Integer theArgsNb, const char * * theArgVec, Standard_Integer &OutValue);

		/****************** ParseOnOffNoIterator ******************/
		/**** md5 signature: f9c3b3ebd058df7a294a669d5d33a442 ****/
		%feature("compactdefaultargs") ParseOnOffNoIterator;
		%feature("autodoc", "Parses boolean argument at specified iterator position with optional on/off coming next. similar to parseonoffiterator() but also reverses returned value if argument name starts with 'no' prefix. e.g. if nominal argument is 'cmd -usefeature [on|off|1|0]=on', then '-nousefeature' argument will return false. @param theargsnb [in] overall number of arguments @param theargvec [in] vector of arguments @param theargiter [in] [out] argument position to parse returns flag value.

Parameters
----------
theArgsNb: int
theArgVec: char * *

Returns
-------
theArgIter: int
") ParseOnOffNoIterator;
		static Standard_Boolean ParseOnOffNoIterator(Standard_Integer theArgsNb, const char * * theArgVec, Standard_Integer &OutValue);

		/****************** ParseReal ******************/
		/**** md5 signature: 6a5747802d28934e8a85848dd8129884 ****/
		%feature("compactdefaultargs") ParseReal;
		%feature("autodoc", "Converts the numeric expression, that can involve draw variables, to a real value @param theexpressionstring the strings that contains the expression involving draw variables to be parsed @param theparsedrealvalue a real value that is a result of parsing returns true if parsing was successful, or false otherwise.

Parameters
----------
theExpressionString: str

Returns
-------
theParsedRealValue: float
") ParseReal;
		static bool ParseReal(Standard_CString theExpressionString, Standard_Real &OutValue);

		/****************** PloadCommands ******************/
		/**** md5 signature: ae805e7e4098bb9645c3d8637e3e639f ****/
		%feature("compactdefaultargs") PloadCommands;
		%feature("autodoc", "Defines loads draw plugins commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") PloadCommands;
		static void PloadCommands(Draw_Interpretor & I);

		/****************** Repaint ******************/
		/**** md5 signature: 6696046607348d7f5eb301164feed3a4 ****/
		%feature("compactdefaultargs") Repaint;
		%feature("autodoc", "Asks to repaint the screen after the current command.

Returns
-------
void
") Repaint;
		static void Repaint();

		/****************** Set ******************/
		/**** md5 signature: 7a71dc26e5d15e8f5a3d7eb280cdbd92 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "@name tcl variables management tools sets a variable. display it if <disp> is true.

Parameters
----------
Name: str
D: Draw_Drawable3D
Disp: bool

Returns
-------
void
") Set;
		static void Set(Standard_CString Name, const opencascade::handle<Draw_Drawable3D> & D, const Standard_Boolean Disp);

		/****************** Set ******************/
		/**** md5 signature: b3c802f508f118e7fe41686a88663011 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a variable, a null handle clear the vartiable. automatic display is context driven.

Parameters
----------
Name: str
D: Draw_Drawable3D

Returns
-------
void
") Set;
		static void Set(Standard_CString Name, const opencascade::handle<Draw_Drawable3D> & D);

		/****************** Set ******************/
		/**** md5 signature: 8611bf9945502ca34c90b88993ce9b7d ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a numeric variable.

Parameters
----------
Name: str
val: float

Returns
-------
void
") Set;
		static void Set(Standard_CString Name, const Standard_Real val);

		/****************** Set ******************/
		/**** md5 signature: 445b623768040bcc196cf7567aada01b ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a tcl string variable.

Parameters
----------
Name: str
val: str

Returns
-------
void
") Set;
		static void Set(Standard_CString Name, Standard_CString val);

		/****************** SetProgressBar ******************/
		/**** md5 signature: a6480627e30825bf92717f1b7b5e637d ****/
		%feature("compactdefaultargs") SetProgressBar;
		%feature("autodoc", "Sets progress indicator.

Parameters
----------
theProgress: Draw_ProgressIndicator

Returns
-------
void
") SetProgressBar;
		static void SetProgressBar(const opencascade::handle<Draw_ProgressIndicator> & theProgress);

		/****************** UnitCommands ******************/
		/**** md5 signature: 1ada83b0f5ecdc64e1b5ce664183dc86 ****/
		%feature("compactdefaultargs") UnitCommands;
		%feature("autodoc", "Defines draw unit commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") UnitCommands;
		static void UnitCommands(Draw_Interpretor & I);

		/****************** VariableCommands ******************/
		/**** md5 signature: bac54c5b6e85f4a74eb1b91585454501 ****/
		%feature("compactdefaultargs") VariableCommands;
		%feature("autodoc", "Defines draw variables handling commands.

Parameters
----------
I: Draw_Interpretor

Returns
-------
void
") VariableCommands;
		static void VariableCommands(Draw_Interpretor & I);

};


%extend Draw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Draw_Color *
*******************/
class Draw_Color {
	public:
		/****************** Draw_Color ******************/
		/**** md5 signature: 8e90be76cced41ed5c02e4ce3d2b5c1f ****/
		%feature("compactdefaultargs") Draw_Color;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draw_Color;
		 Draw_Color();

		/****************** Draw_Color ******************/
		/**** md5 signature: b31420b819fa43c627e3e39aa4c4f593 ****/
		%feature("compactdefaultargs") Draw_Color;
		%feature("autodoc", "No available documentation.

Parameters
----------
c: Draw_ColorKind

Returns
-------
None
") Draw_Color;
		 Draw_Color(const Draw_ColorKind c);

		/****************** ID ******************/
		/**** md5 signature: e4e59cfc46fd54221997a525b5258979 ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "No available documentation.

Returns
-------
Draw_ColorKind
") ID;
		Draw_ColorKind ID();

};


%extend Draw_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Draw_Display *
*********************/
class Draw_Display {
	public:
		/****************** Draw_Display ******************/
		/**** md5 signature: 154915f7b8e7986703fae53d54d46e3c ****/
		%feature("compactdefaultargs") Draw_Display;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draw_Display;
		 Draw_Display();

		/****************** Draw ******************/
		/**** md5 signature: ba59265502109dbfbacd76ff5c0d09aa ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "No available documentation.

Parameters
----------
p1: gp_Pnt
p2: gp_Pnt

Returns
-------
None
") Draw;
		void Draw(const gp_Pnt & p1, const gp_Pnt & p2);

		/****************** Draw ******************/
		/**** md5 signature: facb5a8a53e7cfb57c5a9f732d729a21 ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "No available documentation.

Parameters
----------
p1: gp_Pnt2d
p2: gp_Pnt2d

Returns
-------
None
") Draw;
		void Draw(const gp_Pnt2d & p1, const gp_Pnt2d & p2);

		/****************** Draw ******************/
		/**** md5 signature: 236664283b1b1fcd4d810e50997f9f78 ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Draw a circle <c> from angle <a1> to <a2> (radians). if modifywithzoom = 0, then rayon of circle is convert to integer.

Parameters
----------
C: gp_Circ
A1: float
A2: float
ModifyWithZoom: bool,optional
	default value is Standard_True

Returns
-------
None
") Draw;
		void Draw(const gp_Circ & C, const Standard_Real A1, const Standard_Real A2, const Standard_Boolean ModifyWithZoom = Standard_True);

		/****************** Draw ******************/
		/**** md5 signature: 3a899523a8eeb530b61bb68c92c6c847 ****/
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "Draw a 2d circle <c> from angle <a1> to <a2> (radians). if modifywithzoom = 0, then rayon of circle is convert to integer.

Parameters
----------
C: gp_Circ2d
A1: float
A2: float
ModifyWithZoom: bool,optional
	default value is Standard_True

Returns
-------
None
") Draw;
		void Draw(const gp_Circ2d & C, const Standard_Real A1, const Standard_Real A2, const Standard_Boolean ModifyWithZoom = Standard_True);

		/****************** DrawMarker ******************/
		/**** md5 signature: 6320694fa50c918b925f4cdc7160cd08 ****/
		%feature("compactdefaultargs") DrawMarker;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt
S: Draw_MarkerShape
Size: int,optional
	default value is 5

Returns
-------
None
") DrawMarker;
		void DrawMarker(const gp_Pnt & pt, const Draw_MarkerShape S, const Standard_Integer Size = 5);

		/****************** DrawMarker ******************/
		/**** md5 signature: 4c9d965d70a9e0b584eaedbda6f63695 ****/
		%feature("compactdefaultargs") DrawMarker;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt2d
S: Draw_MarkerShape
Size: int,optional
	default value is 5

Returns
-------
None
") DrawMarker;
		void DrawMarker(const gp_Pnt2d & pt, const Draw_MarkerShape S, const Standard_Integer Size = 5);

		/****************** DrawMarker ******************/
		/**** md5 signature: d73928f8e4a7cbc97bf045afe5ce7813 ****/
		%feature("compactdefaultargs") DrawMarker;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt
S: Draw_MarkerShape
Size: float

Returns
-------
None
") DrawMarker;
		void DrawMarker(const gp_Pnt & pt, const Draw_MarkerShape S, const Standard_Real Size);

		/****************** DrawMarker ******************/
		/**** md5 signature: fef952d4a4b579299ef7d30347d9a956 ****/
		%feature("compactdefaultargs") DrawMarker;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt2d
S: Draw_MarkerShape
Size: float

Returns
-------
None
") DrawMarker;
		void DrawMarker(const gp_Pnt2d & pt, const Draw_MarkerShape S, const Standard_Real Size);

		/****************** DrawString ******************/
		/**** md5 signature: 3dc9f6274eaeadd04823ce25d05f87a4 ****/
		%feature("compactdefaultargs") DrawString;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt
S: str

Returns
-------
None
") DrawString;
		void DrawString(const gp_Pnt & pt, Standard_CString S);

		/****************** DrawString ******************/
		/**** md5 signature: 0c16faa35d7116ffff88a9c0dfd378e9 ****/
		%feature("compactdefaultargs") DrawString;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt2d
S: str

Returns
-------
None
") DrawString;
		void DrawString(const gp_Pnt2d & pt, Standard_CString S);

		/****************** DrawString ******************/
		/**** md5 signature: 0c381707d5e82ecd3838cf0c5ec8181d ****/
		%feature("compactdefaultargs") DrawString;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt
S: str
moveX: float
moveY: float

Returns
-------
None
") DrawString;
		void DrawString(const gp_Pnt & pt, Standard_CString S, const Standard_Real moveX, const Standard_Real moveY);

		/****************** DrawString ******************/
		/**** md5 signature: a123d63a8f595fb93dec28ba336bb566 ****/
		%feature("compactdefaultargs") DrawString;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt2d
S: str
moveX: float
moveY: float

Returns
-------
None
") DrawString;
		void DrawString(const gp_Pnt2d & pt, Standard_CString S, const Standard_Real moveX, const Standard_Real moveY);

		/****************** DrawTo ******************/
		/**** md5 signature: 57e26bbd31b9f36232955d56b06f7a39 ****/
		%feature("compactdefaultargs") DrawTo;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt

Returns
-------
None
") DrawTo;
		void DrawTo(const gp_Pnt & pt);

		/****************** DrawTo ******************/
		/**** md5 signature: 36f032a5bf5e201fbb4df16422ccab08 ****/
		%feature("compactdefaultargs") DrawTo;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt2d

Returns
-------
None
") DrawTo;
		void DrawTo(const gp_Pnt2d & pt);

		/****************** Flush ******************/
		/**** md5 signature: 830d69b359199d4d948a95b052c600ac ****/
		%feature("compactdefaultargs") Flush;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Flush;
		void Flush();

		/****************** HasPicked ******************/
		/**** md5 signature: 78ccc6fc87b2d0de263f09ced9b2a703 ****/
		%feature("compactdefaultargs") HasPicked;
		%feature("autodoc", "Returns true if the last drawing operations generated a pick hit. when haspicked is true the drawing should be resumed. //! this function is used to shorten the drawing when picking and to save the picked sub-parts.

Returns
-------
bool
") HasPicked;
		Standard_Boolean HasPicked();

		/****************** MoveTo ******************/
		/**** md5 signature: 1aa27b3c91d2a75da841549df144c5cc ****/
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt

Returns
-------
None
") MoveTo;
		void MoveTo(const gp_Pnt & pt);

		/****************** MoveTo ******************/
		/**** md5 signature: ee6e06da2c64aa0a5f329e16fa2342f1 ****/
		%feature("compactdefaultargs") MoveTo;
		%feature("autodoc", "No available documentation.

Parameters
----------
pt: gp_Pnt2d

Returns
-------
None
") MoveTo;
		void MoveTo(const gp_Pnt2d & pt);

		/****************** Project ******************/
		/**** md5 signature: 1541b8c8be2d7b812115f7c88eb1f0fe ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Returns the 2d projection of a 3d point.

Parameters
----------
pt: gp_Pnt

Returns
-------
gp_Pnt2d
") Project;
		gp_Pnt2d Project(const gp_Pnt & pt);

		/****************** Project ******************/
		/**** md5 signature: 3119a2ae5508520faeafae06eea3837c ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Returns the 2d projection of a 3d point.

Parameters
----------
pt: gp_Pnt
pt2d: gp_Pnt2d

Returns
-------
None
") Project;
		void Project(const gp_Pnt & pt, gp_Pnt2d & pt2d);

		/****************** SetColor ******************/
		/**** md5 signature: a16f0e137ed06e03fd922ae2fc2bdf3d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Following drawings will use this color.

Parameters
----------
col: Draw_Color

Returns
-------
None
") SetColor;
		void SetColor(const Draw_Color & col);

		/****************** SetMode ******************/
		/**** md5 signature: cea492c7c157d8315308a8f75fac27b2 ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Set the drawing mode, 3 = copy, 6 = xor.

Parameters
----------
M: int

Returns
-------
None
") SetMode;
		void SetMode(const Standard_Integer M);

		/****************** ViewId ******************/
		/**** md5 signature: 7374cfc0cc41101a32ee8635c894f123 ****/
		%feature("compactdefaultargs") ViewId;
		%feature("autodoc", "Returns the identifier of the view where the display is drawing.

Returns
-------
int
") ViewId;
		Standard_Integer ViewId();

		/****************** Zoom ******************/
		/**** md5 signature: e8d75e12cceffa4bb451f731170318c7 ****/
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "Returns the current zoom value.

Returns
-------
float
") Zoom;
		Standard_Real Zoom();

};


%extend Draw_Display {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Draw_Drawable3D *
************************/
%nodefaultctor Draw_Drawable3D;
class Draw_Drawable3D : public Standard_Transient {
	public:
		/****************** Bounds ******************/
		/**** md5 signature: 7febb2830bbec65a02faad332e872dfa ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theXMin: float
theXMax: float
theYMin: float
theYMax: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		/**** md5 signature: b2b6c4f882d4d0fd3b5208c8ea6e7322 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "For variable copy.

Returns
-------
opencascade::handle<Draw_Drawable3D>
") Copy;
		virtual opencascade::handle<Draw_Drawable3D> Copy();

		/****************** DrawOn ******************/
		/**** md5 signature: c18c2ede79fed7fc065017d88dba69cf ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "@def draw_drawable3d_factory auxiliary macros defining draw_drawable3d restoration api to sub-class.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		virtual void DrawOn(Draw_Display & dis);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Is3D ******************/
		/**** md5 signature: d8c2bd18d2b6f3e5a81671055236841b ****/
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "Is a 3d object. (default true).

Returns
-------
bool
") Is3D;
		virtual bool Is3D();

		/****************** IsDisplayable ******************/
		/**** md5 signature: d69996919b65a7a66ee6364bbb0c7698 ****/
		%feature("compactdefaultargs") IsDisplayable;
		%feature("autodoc", "Return true if object can be displayed.

Returns
-------
bool
") IsDisplayable;
		virtual bool IsDisplayable();

		/****************** Name ******************/
		/**** md5 signature: dbebb34a777ed2cce75639b98f8c3cbf ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
str
") Name;
		Standard_CString Name();

		/****************** Name ******************/
		/**** md5 signature: 1dc4b88328d7ac6a92e4b5d41598ac0a ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: str

Returns
-------
None
") Name;
		virtual void Name(Standard_CString N);

		/****************** PickReject ******************/
		/**** md5 signature: 8c3e37b169a7fdc771e737101bb46688 ****/
		%feature("compactdefaultargs") PickReject;
		%feature("autodoc", "Returns true if the pick is outside the box.

Parameters
----------
X: float
Y: float
Prec: float

Returns
-------
bool
") PickReject;
		virtual Standard_Boolean PickReject(const Standard_Real X, const Standard_Real Y, const Standard_Real Prec);

		/****************** Protected ******************/
		/**** md5 signature: 4cf497e7cef415b40c2d6d8e0745f1b9 ****/
		%feature("compactdefaultargs") Protected;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Protected;
		Standard_Boolean Protected();

		/****************** Protected ******************/
		/**** md5 signature: 57396b8574cc61106b41c32241aa9321 ****/
		%feature("compactdefaultargs") Protected;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: bool

Returns
-------
None
") Protected;
		void Protected(const Standard_Boolean P);

		/****************** RegisterFactory ******************/
		/**** md5 signature: 7399362d5afd2d834da94c13d466e155 ****/
		%feature("compactdefaultargs") RegisterFactory;
		%feature("autodoc", "Register factory for restoring drawable from stream (opposite to draw_drawable3d::save()). @param thetype [in] class name @param thefactory [in] factory function.

Parameters
----------
theType: str
theFactory: FactoryFunction_t

Returns
-------
void
") RegisterFactory;
		static void RegisterFactory(Standard_CString theType, const FactoryFunction_t & theFactory);


        %feature("autodoc", "1");
        %extend{
            std::string SaveToString() {
            std::stringstream s;
            self->Save(s);
            return s.str();}
        };
		/****************** SetBounds ******************/
		/**** md5 signature: 534fb7dc7dc5ea1761af3f40eeb874fc ****/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
theXMin: float
theXMax: float
theYMin: float
theYMax: float

Returns
-------
None
") SetBounds;
		void SetBounds(const Standard_Real theXMin, const Standard_Real theXMax, const Standard_Real theYMin, const Standard_Real theYMax);

		/****************** Visible ******************/
		/**** md5 signature: 9a1ab734bd6fb03c228f3faab26a42df ****/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Visible;
		Standard_Boolean Visible();

		/****************** Visible ******************/
		/**** md5 signature: 0f01cf1c6e97ef9527494ea96b4b0b9a ****/
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: bool

Returns
-------
None
") Visible;
		void Visible(const Standard_Boolean V);

		/****************** Whatis ******************/
		/**** md5 signature: a6e5eb66a96d5c8e52cf2405dc7a6ada ****/
		%feature("compactdefaultargs") Whatis;
		%feature("autodoc", "For variable whatis command. set as a result the type of the variable.

Parameters
----------
I: Draw_Interpretor

Returns
-------
None
") Whatis;
		virtual void Whatis(Draw_Interpretor & I);

};


%make_alias(Draw_Drawable3D)

%extend Draw_Drawable3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Draw_Interpretor *
*************************/
class Draw_Interpretor {
	public:
		class CallBackData {};
		class CallBackDataFunc {};
		class CallBackDataMethod {};
		/****************** Draw_Interpretor ******************/
		/**** md5 signature: fa2e3203eeb71a0a266163e7de828552 ****/
		%feature("compactdefaultargs") Draw_Interpretor;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Draw_Interpretor;
		 Draw_Interpretor();

		/****************** Draw_Interpretor ******************/
		/**** md5 signature: f05e5ca535c4a09b45bde4a27d3714b9 ****/
		%feature("compactdefaultargs") Draw_Interpretor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theInterp: Draw_PInterp

Returns
-------
None
") Draw_Interpretor;
		 Draw_Interpretor(const Draw_PInterp & theInterp);

		/****************** Add ******************/
		/**** md5 signature: b13a5adf12594e600f907ab4c051947c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Creates a new command with name <thecommandname>, help string <thehelp> in group <thegroup>. @param thefunction callback implementation.

Parameters
----------
theCommandName: str
theHelp: str
theFunction: CommandFunction
theGroup: str,optional
	default value is 'UserCommands'

Returns
-------
inline void
") Add;
		inline void Add(Standard_CString theCommandName, Standard_CString theHelp, CommandFunction theFunction, Standard_CString theGroup = "UserCommands");

		/****************** Add ******************/
		/**** md5 signature: 90e9d86bdb5bf924e3e2b4e515580996 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Creates a new command with name <thecommandname>, help string <thehelp> in group <thegroup>. @thefunction callback implementation @thefilename the name of the file that contains the implementation of the command.

Parameters
----------
theCommandName: str
theHelp: str
theFileName: str
theFunction: CommandFunction
theGroup: str,optional
	default value is 'UserCommands'

Returns
-------
inline void
") Add;
		inline void Add(Standard_CString theCommandName, Standard_CString theHelp, Standard_CString theFileName, CommandFunction theFunction, Standard_CString theGroup = "UserCommands");

		/****************** AddLog ******************/
		/**** md5 signature: d847cb3a8171d7852c9323247059690c ****/
		%feature("compactdefaultargs") AddLog;
		%feature("autodoc", "Writes a text string to the log (if opened); end of line is not appended.

Parameters
----------
theStr: str

Returns
-------
None
") AddLog;
		void AddLog(Standard_CString theStr);

		/****************** Append ******************/
		/**** md5 signature: 6a23b8ee8e02217caec26fb748e5eaa4 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends to the result.

Parameters
----------
theResult: str

Returns
-------
Draw_Interpretor
") Append;
		Draw_Interpretor & Append(Standard_CString theResult);

		/****************** Append ******************/
		/**** md5 signature: cd8f12eb8dd27b7d4810c4c911d45005 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends to the result.

Parameters
----------
theResult: str

Returns
-------
Draw_Interpretor
") Append;
		Draw_Interpretor & Append(TCollection_AsciiString theResult);

		/****************** Append ******************/
		/**** md5 signature: 807dad20cc73571e1a74f19f171ba867 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends to the result.

Parameters
----------
theResult: str

Returns
-------
Draw_Interpretor
") Append;
		Draw_Interpretor & Append(TCollection_ExtendedString theResult);

		/****************** Append ******************/
		/**** md5 signature: 4a62f957e1e322b589d3298670626a35 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends to the result.

Parameters
----------
theResult: int

Returns
-------
Draw_Interpretor
") Append;
		Draw_Interpretor & Append(const Standard_Integer theResult);

		/****************** Append ******************/
		/**** md5 signature: e4fda64c43f955837fde5dc129e53a6d ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends to the result.

Parameters
----------
theResult: float

Returns
-------
Draw_Interpretor
") Append;
		Draw_Interpretor & Append(const Standard_Real theResult);

		/****************** Append ******************/
		/**** md5 signature: 19dad981032ab875a336b8b057ca5091 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Appends to the result.

Parameters
----------
theResult: Standard_SStream

Returns
-------
Draw_Interpretor
") Append;
		Draw_Interpretor & Append(const Standard_SStream & theResult);

		/****************** AppendElement ******************/
		/**** md5 signature: d08b832def9b21ad7256287e307302af ****/
		%feature("compactdefaultargs") AppendElement;
		%feature("autodoc", "Appends to the result the string as a list element.

Parameters
----------
theResult: str

Returns
-------
None
") AppendElement;
		void AppendElement(Standard_CString theResult);

		/****************** Complete ******************/
		/**** md5 signature: a9a81ab95b52a44152e27f65375cd84f ****/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "Returns true if the script is complete, no pending closing braces. (}).

Parameters
----------
theScript: str

Returns
-------
bool
") Complete;
		static Standard_Boolean Complete(Standard_CString theScript);

		/****************** Eval ******************/
		/**** md5 signature: 4894dc0ba015c8790b2a274942d8db91 ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Eval the script and returns ok = 0, error = 1.

Parameters
----------
theScript: str

Returns
-------
int
") Eval;
		Standard_Integer Eval(Standard_CString theScript);

		/****************** EvalFile ******************/
		/**** md5 signature: cc4ec6059c31e336b5d1e94cbcbfc85a ****/
		%feature("compactdefaultargs") EvalFile;
		%feature("autodoc", "Eval the content on the file and returns status.

Parameters
----------
theFileName: str

Returns
-------
int
") EvalFile;
		Standard_Integer EvalFile(Standard_CString theFileName);

		/****************** GetDoEcho ******************/
		/**** md5 signature: eee2a7ffa6a09ea8351f95e8cc112764 ****/
		%feature("compactdefaultargs") GetDoEcho;
		%feature("autodoc", "Returns true if echoing of commands is enabled.

Returns
-------
bool
") GetDoEcho;
		Standard_Boolean GetDoEcho();

		/****************** GetDoLog ******************/
		/**** md5 signature: db733017bd8203cc720539ece81bab60 ****/
		%feature("compactdefaultargs") GetDoLog;
		%feature("autodoc", "Returns true if logging of commands is enabled.

Returns
-------
bool
") GetDoLog;
		Standard_Boolean GetDoLog();

		/****************** GetLog ******************/
		/**** md5 signature: c3c40ba95f2156fcbfb32518ac5b7e2b ****/
		%feature("compactdefaultargs") GetLog;
		%feature("autodoc", "Returns current content of the log file as a text string.

Returns
-------
TCollection_AsciiString
") GetLog;
		TCollection_AsciiString GetLog();

		/****************** GetLogFileDescriptor ******************/
		/**** md5 signature: 21fbd1b7f2b72eae722870a12f6961b6 ****/
		%feature("compactdefaultargs") GetLogFileDescriptor;
		%feature("autodoc", "Returns current value of the log file descriptor.

Returns
-------
int
") GetLogFileDescriptor;
		Standard_Integer GetLogFileDescriptor();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize tcl interpretor.

Returns
-------
None
") Init;
		void Init();

		/****************** Interp ******************/
		/**** md5 signature: 62b4105273048344338348faa84a32e4 ****/
		%feature("compactdefaultargs") Interp;
		%feature("autodoc", "No available documentation.

Returns
-------
Draw_PInterp
") Interp;
		Draw_PInterp Interp();

		/****************** PrintHelp ******************/
		/**** md5 signature: c5f04cf87e890b5a3712f17a63aca6ad ****/
		%feature("compactdefaultargs") PrintHelp;
		%feature("autodoc", "Eval the script 'help command_name'.

Parameters
----------
theCommandName: str

Returns
-------
int
") PrintHelp;
		Standard_Integer PrintHelp(Standard_CString theCommandName);

		/****************** RecordAndEval ******************/
		/**** md5 signature: bf98927efb02a0423e4205c7cf80537d ****/
		%feature("compactdefaultargs") RecordAndEval;
		%feature("autodoc", "Eval the script and returns ok = 0, error = 1 store the script in the history record.

Parameters
----------
theScript: str
theFlags: int,optional
	default value is 0

Returns
-------
int
") RecordAndEval;
		Standard_Integer RecordAndEval(Standard_CString theScript, const Standard_Integer theFlags = 0);

		/****************** Remove ******************/
		/**** md5 signature: 9a50571e06d48e0034295604cd0c4354 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes <thecommandname>, returns true if success (the command existed).

Parameters
----------
theCommandName: str

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(Standard_CString theCommandName);

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets the result to empty string.

Returns
-------
None
") Reset;
		void Reset();

		/****************** ResetLog ******************/
		/**** md5 signature: 96508627f554a76254f3011cadb104c2 ****/
		%feature("compactdefaultargs") ResetLog;
		%feature("autodoc", "Resets log (if opened) to zero size.

Returns
-------
None
") ResetLog;
		void ResetLog();

		/****************** Result ******************/
		/**** md5 signature: 7b68abdd820ab17a42c65a5acb659a62 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
str
") Result;
		Standard_CString Result();

		/****************** Set ******************/
		/**** md5 signature: 142c34c30cfce2bbb19ce79903b14fc0 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
theInterp: Draw_PInterp

Returns
-------
None
") Set;
		void Set(const Draw_PInterp & theInterp);

		/****************** SetDoEcho ******************/
		/**** md5 signature: 6e3dadf6480ea69088db4391b9921aee ****/
		%feature("compactdefaultargs") SetDoEcho;
		%feature("autodoc", "Enables or disables eachoing of all commands and their results to cout.

Parameters
----------
theDoEcho: bool

Returns
-------
None
") SetDoEcho;
		void SetDoEcho(const Standard_Boolean theDoEcho);

		/****************** SetDoLog ******************/
		/**** md5 signature: 5868a826f694b8a6423682af95d944fd ****/
		%feature("compactdefaultargs") SetDoLog;
		%feature("autodoc", "Enables or disables logging of all commands and their results.

Parameters
----------
theDoLog: bool

Returns
-------
None
") SetDoLog;
		void SetDoLog(const Standard_Boolean theDoLog);

		/****************** SetToColorize ******************/
		/**** md5 signature: 088ad41ce08a642386b5b8368876e6e0 ****/
		%feature("compactdefaultargs") SetToColorize;
		%feature("autodoc", "Set if console output should be colorized.

Parameters
----------
theToColorize: bool

Returns
-------
None
") SetToColorize;
		void SetToColorize(Standard_Boolean theToColorize);

		/****************** ToColorize ******************/
		/**** md5 signature: 8b29b99ccd01eee1376b6c14a1d2e81a ****/
		%feature("compactdefaultargs") ToColorize;
		%feature("autodoc", "Return true if console output should be colorized; true by default.

Returns
-------
bool
") ToColorize;
		Standard_Boolean ToColorize();

};


%extend Draw_Interpretor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Draw_Printer *
*********************/
class Draw_Printer : public Message_Printer {
	public:
		/****************** Draw_Printer ******************/
		/**** md5 signature: ab432e10b5e981a0a495478d83f6a85d ****/
		%feature("compactdefaultargs") Draw_Printer;
		%feature("autodoc", "Creates a printer connected to the interpretor.

Parameters
----------
theTcl: Draw_Interpretor

Returns
-------
None
") Draw_Printer;
		 Draw_Printer(Draw_Interpretor & theTcl);

};


%make_alias(Draw_Printer)

%extend Draw_Printer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Draw_ProgressIndicator *
*******************************/
class Draw_ProgressIndicator : public Message_ProgressIndicator {
	public:
		/****************** Draw_ProgressIndicator ******************/
		/**** md5 signature: d71fdc2a27500bc946a407e175ec9a43 ****/
		%feature("compactdefaultargs") Draw_ProgressIndicator;
		%feature("autodoc", "Creates a progress indicator and remembers pointer to draw_interpretor //! @param theupdatethreshold defines minimal progress (in percents) between updates of the indicator (non-forced updates of the progress bar will be disabled until that progress is reached since last update).

Parameters
----------
di: Draw_Interpretor
theUpdateThreshold: float,optional
	default value is 1

Returns
-------
None
") Draw_ProgressIndicator;
		 Draw_ProgressIndicator(const Draw_Interpretor & di, Standard_Real theUpdateThreshold = 1);

		/****************** DefaultConsoleMode ******************/
		/**** md5 signature: a28fc92c68919ef5761466e0d04a8174 ****/
		%feature("compactdefaultargs") DefaultConsoleMode;
		%feature("autodoc", "Get/set default value for console mode.

Returns
-------
bool
") DefaultConsoleMode;
		static Standard_Boolean & DefaultConsoleMode();

		/****************** DefaultGraphMode ******************/
		/**** md5 signature: 1bd6727294b3dceed0c247ac99a1bd57 ****/
		%feature("compactdefaultargs") DefaultGraphMode;
		%feature("autodoc", "Get/set default value for graph mode.

Returns
-------
bool
") DefaultGraphMode;
		static Standard_Boolean & DefaultGraphMode();

		/****************** DefaultTclMode ******************/
		/**** md5 signature: df6a784078b1bc41fbd8575b50129c86 ****/
		%feature("compactdefaultargs") DefaultTclMode;
		%feature("autodoc", "Get/set default value for tcl mode.

Returns
-------
bool
") DefaultTclMode;
		static Standard_Boolean & DefaultTclMode();

		/****************** GetConsoleMode ******************/
		/**** md5 signature: 4638fb3228ae92ba0e0faa437fd62484 ****/
		%feature("compactdefaultargs") GetConsoleMode;
		%feature("autodoc", "Gets console output mode (on/off).

Returns
-------
bool
") GetConsoleMode;
		Standard_Boolean GetConsoleMode();

		/****************** GetGraphMode ******************/
		/**** md5 signature: 36bb8de007d6b212ac203027f90a0bd6 ****/
		%feature("compactdefaultargs") GetGraphMode;
		%feature("autodoc", "Gets graphical output mode (on/off).

Returns
-------
bool
") GetGraphMode;
		Standard_Boolean GetGraphMode();

		/****************** GetTclMode ******************/
		/**** md5 signature: 312b7807cbbe1133eeccf257d731c8ab ****/
		%feature("compactdefaultargs") GetTclMode;
		%feature("autodoc", "Gets tcl output mode (on/off). .

Returns
-------
bool
") GetTclMode;
		Standard_Boolean GetTclMode();

		/****************** Reset ******************/
		/**** md5 signature: a8d049aa9a5c227d2bfb5f9eaf0b65b8 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Clears/erases opened tcl windows if any and sets mybreak to false.

Returns
-------
None
") Reset;
		virtual void Reset();

		/****************** SetConsoleMode ******************/
		/**** md5 signature: 24ac28fd22412a26fee2fbb90c7822f8 ****/
		%feature("compactdefaultargs") SetConsoleMode;
		%feature("autodoc", "Sets console output mode (on/off). if it is on then progress is shown in the standard output.

Parameters
----------
theMode: bool

Returns
-------
None
") SetConsoleMode;
		void SetConsoleMode(const Standard_Boolean theMode);

		/****************** SetGraphMode ******************/
		/**** md5 signature: df57c1c58792ffd4bac4790056c0095f ****/
		%feature("compactdefaultargs") SetGraphMode;
		%feature("autodoc", "Sets graphical output mode (on/off).

Parameters
----------
theGraphMode: bool

Returns
-------
None
") SetGraphMode;
		void SetGraphMode(const Standard_Boolean theGraphMode);

		/****************** SetTclMode ******************/
		/**** md5 signature: 18c06fc73d609494deb2695d4a11d756 ****/
		%feature("compactdefaultargs") SetTclMode;
		%feature("autodoc", "Sets tcl output mode (on/off).

Parameters
----------
theTclMode: bool

Returns
-------
None
") SetTclMode;
		void SetTclMode(const Standard_Boolean theTclMode);

		/****************** Show ******************/
		/**** md5 signature: f1c9d58fff6285eff252f5850c36fc0c ****/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "Defines method show of progress indicator.

Parameters
----------
theScope: Message_ProgressScope
force: bool,optional
	default value is Standard_True

Returns
-------
None
") Show;
		virtual void Show(const Message_ProgressScope & theScope, const Standard_Boolean force = Standard_True);

		/****************** StopIndicator ******************/
		/**** md5 signature: bb4b6adad02ebf19d52380a324149a94 ****/
		%feature("compactdefaultargs") StopIndicator;
		%feature("autodoc", "Internal method for implementation of userbreak mechanism; note that it uses static variable and thus not thread-safe! .

Returns
-------
Standard_Address
") StopIndicator;
		static Standard_Address & StopIndicator();

		/****************** UserBreak ******************/
		/**** md5 signature: 27f2670dc432efdede724b85580cc162 ****/
		%feature("compactdefaultargs") UserBreak;
		%feature("autodoc", "Redefines method userbreak of progress indicator.

Returns
-------
bool
") UserBreak;
		virtual Standard_Boolean UserBreak();

};


%make_alias(Draw_ProgressIndicator)

%extend Draw_ProgressIndicator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Viewer *
********************/
class Draw_Viewer {
	public:
		/****************** Draw_Viewer ******************/
		/**** md5 signature: ba2fa850edb5da94dacfd57db9c91a3e ****/
		%feature("compactdefaultargs") Draw_Viewer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draw_Viewer;
		 Draw_Viewer();

		/****************** AddDrawable ******************/
		/**** md5 signature: c5994816ce82dd2b761dbd57d6a0ab8a ****/
		%feature("compactdefaultargs") AddDrawable;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: Draw_Drawable3D

Returns
-------
None
") AddDrawable;
		void AddDrawable(const opencascade::handle<Draw_Drawable3D> & D);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Clear2D ******************/
		/**** md5 signature: 93fc4ef14a0094f1fa3b32d7d50e959a ****/
		%feature("compactdefaultargs") Clear2D;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear2D;
		void Clear2D();

		/****************** Clear3D ******************/
		/**** md5 signature: 64fe993bdec18d676a69e3dc4b90439b ****/
		%feature("compactdefaultargs") Clear3D;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear3D;
		void Clear3D();

		/****************** ClearView ******************/
		/**** md5 signature: 7d398dae640fa17f77b9f5d66c44f3f8 ****/
		%feature("compactdefaultargs") ClearView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") ClearView;
		void ClearView(const Standard_Integer id);

		/****************** ConfigView ******************/
		/**** md5 signature: ced04154e2b12c53d9765549fd5530ad ****/
		%feature("compactdefaultargs") ConfigView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") ConfigView;
		void ConfigView(const Standard_Integer id);

		/****************** DefineColor ******************/
		/**** md5 signature: 4976c9f5325cf80864c8995f215e1a3b ****/
		%feature("compactdefaultargs") DefineColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
i: int
colname: char *

Returns
-------
bool
") DefineColor;
		Standard_Boolean DefineColor(const Standard_Integer i, const char * colname);

		/****************** DeleteView ******************/
		/**** md5 signature: b9bc84b7696e758ad013a96ef87bca2a ****/
		%feature("compactdefaultargs") DeleteView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") DeleteView;
		void DeleteView(const Standard_Integer id);

		/****************** DisplayView ******************/
		/**** md5 signature: 6ff7dc9d7caf0d29a25b2e956e52f4f2 ****/
		%feature("compactdefaultargs") DisplayView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") DisplayView;
		void DisplayView(const Standard_Integer id);

		/****************** DrawOnView ******************/
		/**** md5 signature: 5acf16855bad0d6661b107fae3baccaf ****/
		%feature("compactdefaultargs") DrawOnView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
D: Draw_Drawable3D

Returns
-------
None
") DrawOnView;
		void DrawOnView(const Standard_Integer id, const opencascade::handle<Draw_Drawable3D> & D);

		/****************** FitView ******************/
		/**** md5 signature: 2fff80a3fc31af8cc1c1e6913bfcc14c ****/
		%feature("compactdefaultargs") FitView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
frame: int

Returns
-------
None
") FitView;
		void FitView(const Standard_Integer id, const Standard_Integer frame);

		/****************** Flush ******************/
		/**** md5 signature: 7df46c8de5607dcfd7ff19dad73048c8 ****/
		%feature("compactdefaultargs") Flush;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Flush;
		void Flush();

		/****************** Focal ******************/
		/**** md5 signature: 6163c39cecfdc7008ebe27437fe8b753 ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
float
") Focal;
		Standard_Real Focal(const Standard_Integer id);

		/****************** GetDrawables ******************/
		/**** md5 signature: 7a71d5d69dc57f0909e3e7c498a7d039 ****/
		%feature("compactdefaultargs") GetDrawables;
		%feature("autodoc", "No available documentation.

Returns
-------
Draw_SequenceOfDrawable3D
") GetDrawables;
		const Draw_SequenceOfDrawable3D & GetDrawables();

		/****************** GetFrame ******************/
		/**** md5 signature: 14ba1a0298f253d0300f57b752db38cb ****/
		%feature("compactdefaultargs") GetFrame;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
xmin: int
ymin: int
xmax: int
ymax: int
") GetFrame;
		void GetFrame(const Standard_Integer id, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetPan ******************/
		/**** md5 signature: 1bf30a4fd2bdd23a759e4de920dbfaf6 ****/
		%feature("compactdefaultargs") GetPan;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
DX: int
DY: int
") GetPan;
		void GetPan(const Standard_Integer id, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetPosSize ******************/
		/**** md5 signature: 708b3956b8687c2729dc67aac471aa4d ****/
		%feature("compactdefaultargs") GetPosSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
X: int
Y: int
W: int
H: int
") GetPosSize;
		void GetPosSize(const Standard_Integer id, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTrsf ******************/
		/**** md5 signature: 467bd56f1740e87e9f56865a2910727d ****/
		%feature("compactdefaultargs") GetTrsf;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
T: gp_Trsf

Returns
-------
None
") GetTrsf;
		void GetTrsf(const Standard_Integer id, gp_Trsf & T);

		/****************** GetType ******************/
		/**** md5 signature: ac84a5beeac04fc4a5f49181d8f2c0b6 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
char *
") GetType;
		char * GetType(const Standard_Integer id);

		/****************** HasView ******************/
		/**** md5 signature: d2d18e8fd779d0c126b71dd6a08c2d14 ****/
		%feature("compactdefaultargs") HasView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
bool
") HasView;
		Standard_Boolean HasView(const Standard_Integer id);

		/****************** HideView ******************/
		/**** md5 signature: 3d39ba16358e3b295df8fa0755b9e58f ****/
		%feature("compactdefaultargs") HideView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") HideView;
		void HideView(const Standard_Integer id);

		/****************** HighlightOnView ******************/
		/**** md5 signature: e0563c53022bfec43ca5bf4123d0c152 ****/
		%feature("compactdefaultargs") HighlightOnView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
D: Draw_Drawable3D
C: Draw_ColorKind,optional
	default value is Draw_blanc

Returns
-------
None
") HighlightOnView;
		void HighlightOnView(const Standard_Integer id, const opencascade::handle<Draw_Drawable3D> & D, const Draw_ColorKind C = Draw_blanc);

		/****************** Is3D ******************/
		/**** md5 signature: 98179f7139ce9c9d81b57cbed8d5dd03 ****/
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
bool
") Is3D;
		Standard_Boolean Is3D(const Standard_Integer id);

		/****************** LastPick ******************/
		/**** md5 signature: dafe4e5bab5a41ac562b7d5b5579ed59 ****/
		%feature("compactdefaultargs") LastPick;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
Param: float
") LastPick;
		void LastPick(gp_Pnt & P1, gp_Pnt & P2, Standard_Real &OutValue);

		/****************** MakeDisplay ******************/
		/**** md5 signature: c0d9b1b0a40e01b4c20ee096001214c1 ****/
		%feature("compactdefaultargs") MakeDisplay;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
Draw_Display
") MakeDisplay;
		Draw_Display MakeDisplay(const Standard_Integer id);

		/****************** MakeView ******************/
		/**** md5 signature: 9898db94a6b3aa2000566593bbbea439 ****/
		%feature("compactdefaultargs") MakeView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
typ: char *
X: int
Y: int
W: int
H: int

Returns
-------
None
") MakeView;
		void MakeView(const Standard_Integer id, const char * typ, const Standard_Integer X, const Standard_Integer Y, const Standard_Integer W, const Standard_Integer H);

		/****************** MakeView ******************/
		/**** md5 signature: 54afa9e226a9d9bd5d9781f32375d4f8 ****/
		%feature("compactdefaultargs") MakeView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
typ: char *
X: int
Y: int
W: int
H: int
win: HWND
useBuffer: bool,optional
	default value is Standard_False

Returns
-------
None
") MakeView;
		void MakeView(const Standard_Integer id, const char * typ, const Standard_Integer X, const Standard_Integer Y, const Standard_Integer W, const Standard_Integer H, HWND win, const Standard_Boolean useBuffer = Standard_False);

		/****************** MakeView ******************/
		/**** md5 signature: bafce84e0aa7950bf6b912a76d0445d2 ****/
		%feature("compactdefaultargs") MakeView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
typ: char *
window: char *

Returns
-------
None
") MakeView;
		void MakeView(const Standard_Integer id, const char * typ, const char * window);

		/****************** PanView ******************/
		/**** md5 signature: fb7390a8571aa0a7051c63f380e9c04e ****/
		%feature("compactdefaultargs") PanView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
DX: int
DY: int

Returns
-------
None
") PanView;
		void PanView(const Standard_Integer id, const Standard_Integer DX, const Standard_Integer DY);

		/****************** Pick ******************/
		/**** md5 signature: f035971991dbafc83be1ec0bfbcb8c1f ****/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
X: int
Y: int
Prec: int
D: Draw_Drawable3D
First: int,optional
	default value is 0

Returns
-------
int
") Pick;
		Standard_Integer Pick(const Standard_Integer id, const Standard_Integer X, const Standard_Integer Y, const Standard_Integer Prec, opencascade::handle<Draw_Drawable3D> & D, const Standard_Integer First = 0);

		/****************** PostColor ******************/
		/**** md5 signature: 34faf60137f25922c402e9e1f8ab172d ****/
		%feature("compactdefaultargs") PostColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
icol: int
width: int
gray: float

Returns
-------
None
") PostColor;
		void PostColor(const Standard_Integer icol, const Standard_Integer width, const Standard_Real gray);

		/****************** PostScriptView ******************/
		/**** md5 signature: 638c236352cc43459e93dd1301beb094 ****/
		%feature("compactdefaultargs") PostScriptView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
VXmin: int
VYmin: int
VXmax: int
VYmax: int
PXmin: int
PYmin: int
PXmax: int
PYmax: int
sortie: std::ostream

Returns
-------
None
") PostScriptView;
		void PostScriptView(const Standard_Integer id, const Standard_Integer VXmin, const Standard_Integer VYmin, const Standard_Integer VXmax, const Standard_Integer VYmax, const Standard_Integer PXmin, const Standard_Integer PYmin, const Standard_Integer PXmax, const Standard_Integer PYmax, std::ostream & sortie);

		/****************** RemoveDrawable ******************/
		/**** md5 signature: edf2fb57332f08c17a65e6189e8b4a01 ****/
		%feature("compactdefaultargs") RemoveDrawable;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: Draw_Drawable3D

Returns
-------
None
") RemoveDrawable;
		void RemoveDrawable(const opencascade::handle<Draw_Drawable3D> & D);

		/****************** RemoveView ******************/
		/**** md5 signature: 6b5a4d51602d9e7932dc1e4536745a9f ****/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") RemoveView;
		void RemoveView(const Standard_Integer id);

		/****************** Repaint2D ******************/
		/**** md5 signature: 4a4521728f25aead320537affddfa8cf ****/
		%feature("compactdefaultargs") Repaint2D;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Repaint2D;
		void Repaint2D();

		/****************** Repaint3D ******************/
		/**** md5 signature: b8f10570355758868d70e03bc30b6d80 ****/
		%feature("compactdefaultargs") Repaint3D;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Repaint3D;
		void Repaint3D();

		/****************** RepaintAll ******************/
		/**** md5 signature: e3da9e16cf9011b7cb1f0045c1e17095 ****/
		%feature("compactdefaultargs") RepaintAll;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RepaintAll;
		void RepaintAll();

		/****************** RepaintView ******************/
		/**** md5 signature: f60e6a553c67177164532af011a326d7 ****/
		%feature("compactdefaultargs") RepaintView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") RepaintView;
		void RepaintView(const Standard_Integer id);

		/****************** ResetView ******************/
		/**** md5 signature: be656bd068b3aa09c043972614a40d30 ****/
		%feature("compactdefaultargs") ResetView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") ResetView;
		void ResetView(const Standard_Integer id);

		/****************** ResizeView ******************/
		/**** md5 signature: 695397fac5dc4e6f0518d5d43b18dc2d ****/
		%feature("compactdefaultargs") ResizeView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") ResizeView;
		void ResizeView(const Standard_Integer id);

		/****************** RotateView ******************/
		/**** md5 signature: 639d465130b2b18b2fd7662a9ba30459 ****/
		%feature("compactdefaultargs") RotateView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
&: gp_Dir2d
Standard_Real: 

Returns
-------
None
") RotateView;
		void RotateView(const Standard_Integer id, const gp_Dir2d &, const Standard_Real);

		/****************** RotateView ******************/
		/**** md5 signature: 1f87d661d3214a51a56ad2626041cdca ****/
		%feature("compactdefaultargs") RotateView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
&: gp_Pnt
&: gp_Dir
Standard_Real: 

Returns
-------
None
") RotateView;
		void RotateView(const Standard_Integer id, const gp_Pnt &, const gp_Dir &, const Standard_Real);

		/****************** SaveView ******************/
		/**** md5 signature: a2a7650c34ca19e6257a8497fa22b08c ****/
		%feature("compactdefaultargs") SaveView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
filename: char *

Returns
-------
bool
") SaveView;
		Standard_Boolean SaveView(const Standard_Integer id, const char * filename);

		/****************** Select ******************/
		/**** md5 signature: 8d336f6856cf3d2aacc4cdff6d8f7b57 ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "No available documentation.

Parameters
----------
waitclick: bool,optional
	default value is Standard_True

Returns
-------
id: int
X: int
Y: int
Button: int
") Select;
		void Select(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Boolean waitclick = Standard_True);

		/****************** SetFocal ******************/
		/**** md5 signature: ea383cd47272457a8eba2d2268507082 ****/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
FocalDist: float

Returns
-------
None
") SetFocal;
		void SetFocal(const Standard_Integer id, const Standard_Real FocalDist);

		/****************** SetPan ******************/
		/**** md5 signature: b10a6b2245521923d26baef17be0f6d7 ****/
		%feature("compactdefaultargs") SetPan;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
DX: int
DY: int

Returns
-------
None
") SetPan;
		void SetPan(const Standard_Integer id, const Standard_Integer DX, const Standard_Integer DY);

		/****************** SetTitle ******************/
		/**** md5 signature: 30561051c61c9e6c68c42b6fef91667c ****/
		%feature("compactdefaultargs") SetTitle;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
name: char *

Returns
-------
None
") SetTitle;
		void SetTitle(const Standard_Integer id, const char * name);

		/****************** SetTrsf ******************/
		/**** md5 signature: 8db71ce7b9a8de28bd31da9b93368983 ****/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
T: gp_Trsf

Returns
-------
None
") SetTrsf;
		void SetTrsf(const Standard_Integer id, gp_Trsf & T);

		/****************** SetZoom ******************/
		/**** md5 signature: 31d5a7bceab3b10a42db9ace497df276 ****/
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
z: float

Returns
-------
None
") SetZoom;
		void SetZoom(const Standard_Integer id, const Standard_Real z);

		/****************** UpdateView ******************/
		/**** md5 signature: c82f8f72aa9ae78b65a1dd190a14d8cc ****/
		%feature("compactdefaultargs") UpdateView;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int
forced: bool,optional
	default value is Standard_False

Returns
-------
None
") UpdateView;
		void UpdateView(const Standard_Integer id, const Standard_Boolean forced = Standard_False);

		/****************** Zoom ******************/
		/**** md5 signature: 9aaee4296f0bfe056f4ae953f3a1fedc ****/
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
float
") Zoom;
		Standard_Real Zoom(const Standard_Integer id);

};


%extend Draw_Viewer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Window *
********************/
/**********************
* class Draw_XSegment *
**********************/
class Draw_XSegment {
	public:
		/****************** Init ******************/
		/**** md5 signature: 3f1174cbc703bfb84287db68676d5f61 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theXStart: int
theYStart: int
theXEnd: int
theYEnd: int

Returns
-------
None
") Init;
		void Init(Standard_Integer theXStart, Standard_Integer theYStart, Standard_Integer theXEnd, Standard_Integer theYEnd);

};


%extend Draw_XSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Axis3D *
********************/
class Draw_Axis3D : public Draw_Drawable3D {
	public:
		/****************** Draw_Axis3D ******************/
		/**** md5 signature: b069de920182007cc8cbb402bc2df89b ****/
		%feature("compactdefaultargs") Draw_Axis3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
col: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Axis3D;
		 Draw_Axis3D(const Draw_Color & col, const Standard_Integer Size = 5);

		/****************** Draw_Axis3D ******************/
		/**** md5 signature: ff8eafd73e7d59007a1cf015307008ad ****/
		%feature("compactdefaultargs") Draw_Axis3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt
col: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Axis3D;
		 Draw_Axis3D(const gp_Pnt & p, const Draw_Color & col, const Standard_Integer Size = 5);

		/****************** Draw_Axis3D ******************/
		/**** md5 signature: 3235192e32dc72b75d52eaefb96457fc ****/
		%feature("compactdefaultargs") Draw_Axis3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax3
col: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Axis3D;
		 Draw_Axis3D(const gp_Ax3 & A, const Draw_Color & col, const Standard_Integer Size = 5);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

};


%make_alias(Draw_Axis3D)

%extend Draw_Axis3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class Draw_Box *
*****************/
class Draw_Box : public Draw_Drawable3D {
	public:
		/****************** Draw_Box ******************/
		/**** md5 signature: 6ddf50c41cdcd2b6269e0ff9613fa03f ****/
		%feature("compactdefaultargs") Draw_Box;
		%feature("autodoc", "Constructor.

Parameters
----------
theOBB: Bnd_OBB
theColor: Draw_Color

Returns
-------
None
") Draw_Box;
		 Draw_Box(const Bnd_OBB & theOBB, const Draw_Color & theColor);

		/****************** DrawOn ******************/
		/**** md5 signature: 6c15b6c679dcf3c686771c75615c5aac ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "Draws myobb.

Parameters
----------
theDis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & theDis);

};


%make_alias(Draw_Box)

%extend Draw_Box {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Draw_Chronometer *
*************************/
class Draw_Chronometer : public Draw_Drawable3D {
	public:
		/****************** Draw_Chronometer ******************/
		/**** md5 signature: 368af448504995e235dec051fe820b27 ****/
		%feature("compactdefaultargs") Draw_Chronometer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Draw_Chronometer;
		 Draw_Chronometer();

		/****************** Copy ******************/
		/**** md5 signature: 845c339d55dd4c23a0de27412f7fb6fe ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "For variable copy.

Returns
-------
opencascade::handle<Draw_Drawable3D>
") Copy;
		virtual opencascade::handle<Draw_Drawable3D> Copy();

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "Does nothing,.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Timer ******************/
		/**** md5 signature: 1597ecae08ae462fdb52bc89577017e6 ****/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return timer.

Returns
-------
OSD_Timer
") Timer;
		OSD_Timer & Timer();

		/****************** Whatis ******************/
		/**** md5 signature: 6abfcab5855ef14ef5deccbfc8fe52d8 ****/
		%feature("compactdefaultargs") Whatis;
		%feature("autodoc", "For variable whatis command.

Parameters
----------
I: Draw_Interpretor

Returns
-------
None
") Whatis;
		virtual void Whatis(Draw_Interpretor & I);

};


%make_alias(Draw_Chronometer)

%extend Draw_Chronometer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Draw_Circle3D *
**********************/
class Draw_Circle3D : public Draw_Drawable3D {
	public:
		/****************** Draw_Circle3D ******************/
		/**** md5 signature: 4aa1584984b8a7485009624147b9b54e ****/
		%feature("compactdefaultargs") Draw_Circle3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
A1: float
A2: float
col: Draw_Color

Returns
-------
None
") Draw_Circle3D;
		 Draw_Circle3D(const gp_Circ & C, const Standard_Real A1, const Standard_Real A2, const Draw_Color & col);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

};


%make_alias(Draw_Circle3D)

%extend Draw_Circle3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Draw_Drawable2D *
************************/
class Draw_Drawable2D : public Draw_Drawable3D {
	public:
		/****************** Is3D ******************/
		/**** md5 signature: 4d7f1a3e8d6c3d0f46219f8d95931867 ****/
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") Is3D;
		virtual Standard_Boolean Is3D();

};


%make_alias(Draw_Drawable2D)

%extend Draw_Drawable2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Draw_Grid *
******************/
class Draw_Grid : public Draw_Drawable3D {
	public:
		/****************** Draw_Grid ******************/
		/**** md5 signature: c5ae73f597694ecab9adeafb58c1d731 ****/
		%feature("compactdefaultargs") Draw_Grid;
		%feature("autodoc", "Creates a grid.

Returns
-------
None
") Draw_Grid;
		 Draw_Grid();

		/****************** DrawOn ******************/
		/**** md5 signature: 478b6a6020bac054b3ba72174783e41b ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "Displays the grid.

Parameters
----------
Out: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & Out);

		/****************** IsActive ******************/
		/**** md5 signature: 476abafc82a8bb87ac904f5a77e179a3 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Returns if the grid is active or not.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** StepX ******************/
		/**** md5 signature: e037d051b02b93bfed83b533e7a4ae01 ****/
		%feature("compactdefaultargs") StepX;
		%feature("autodoc", "Returns the step along the x axis.

Returns
-------
float
") StepX;
		Standard_Real StepX();

		/****************** StepY ******************/
		/**** md5 signature: 51e9d9ad3d83951f11800a5f6b7c0c16 ****/
		%feature("compactdefaultargs") StepY;
		%feature("autodoc", "Returns the step along the y axis.

Returns
-------
float
") StepY;
		Standard_Real StepY();

		/****************** StepZ ******************/
		/**** md5 signature: a00671da0943155dafe64067142c0cc3 ****/
		%feature("compactdefaultargs") StepZ;
		%feature("autodoc", "Returns the step along the z axis.

Returns
-------
float
") StepZ;
		Standard_Real StepZ();

		/****************** Steps ******************/
		/**** md5 signature: 809e2b12397651db146ff42e0f558310 ****/
		%feature("compactdefaultargs") Steps;
		%feature("autodoc", "Sets the steps along the x, y & z axis.

Parameters
----------
StepX: float
StepY: float
StepZ: float

Returns
-------
None
") Steps;
		void Steps(const Standard_Real StepX, const Standard_Real StepY, const Standard_Real StepZ);

};


%make_alias(Draw_Grid)

%extend Draw_Grid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Draw_Marker3D *
**********************/
class Draw_Marker3D : public Draw_Drawable3D {
	public:
		/****************** Draw_Marker3D ******************/
		/**** md5 signature: ed819f43f2ff1a233e53688442fca737 ****/
		%feature("compactdefaultargs") Draw_Marker3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: Draw_MarkerShape
C: Draw_Color
ISize: int,optional
	default value is 5

Returns
-------
None
") Draw_Marker3D;
		 Draw_Marker3D(const gp_Pnt & P, const Draw_MarkerShape T, const Draw_Color & C, const Standard_Integer ISize = 5);

		/****************** Draw_Marker3D ******************/
		/**** md5 signature: f51c07b3c7c2552f3a0d67c65147b39e ****/
		%feature("compactdefaultargs") Draw_Marker3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: Draw_MarkerShape
C: Draw_Color
RSize: float

Returns
-------
None
") Draw_Marker3D;
		 Draw_Marker3D(const gp_Pnt & P, const Draw_MarkerShape T, const Draw_Color & C, const Standard_Real RSize);

		/****************** ChangePos ******************/
		/**** md5 signature: 9c76088247c67d118f35c9f01a072fee ****/
		%feature("compactdefaultargs") ChangePos;
		%feature("autodoc", "Mypos field.

Returns
-------
gp_Pnt
") ChangePos;
		gp_Pnt ChangePos();

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

		/****************** PickReject ******************/
		/**** md5 signature: 6508e4f52373aba12d22bbb04a0e3fad ****/
		%feature("compactdefaultargs") PickReject;
		%feature("autodoc", "Returns always false.

Parameters
----------
X: float
Y: float
Prec: float

Returns
-------
bool
") PickReject;
		virtual Standard_Boolean PickReject(const Standard_Real X, const Standard_Real Y, const Standard_Real Prec);

};


%make_alias(Draw_Marker3D)

%extend Draw_Marker3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Number *
********************/
class Draw_Number : public Draw_Drawable3D {
	public:
		/****************** Draw_Number ******************/
		/**** md5 signature: 7a3bf0306c87052f893fe7da8f7ac2a1 ****/
		%feature("compactdefaultargs") Draw_Number;
		%feature("autodoc", "No available documentation.

Parameters
----------
theV: float

Returns
-------
None
") Draw_Number;
		 Draw_Number(const Standard_Real theV);

		/****************** Copy ******************/
		/**** md5 signature: 845c339d55dd4c23a0de27412f7fb6fe ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "For variable copy.

Returns
-------
opencascade::handle<Draw_Drawable3D>
") Copy;
		virtual opencascade::handle<Draw_Drawable3D> Copy();

		/****************** DrawOn ******************/
		/**** md5 signature: 896cfb35b2fe236572fdf21226dcc92f ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "Does nothing,.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		virtual void DrawOn(Draw_Display & dis);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDisplayable ******************/
		/**** md5 signature: 8511a0f20456a31b316b09c7be5026e3 ****/
		%feature("compactdefaultargs") IsDisplayable;
		%feature("autodoc", "Returns true if object can be displayed.

Returns
-------
bool
") IsDisplayable;
		virtual bool IsDisplayable();


        %feature("autodoc", "1");
        %extend{
            std::string SaveToString() {
            std::stringstream s;
            self->Save(s);
            return s.str();}
        };
		/****************** Value ******************/
		/**** md5 signature: 246826be964a300c707aadb5d0b62468 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Value;
		Standard_Real Value();

		/****************** Value ******************/
		/**** md5 signature: 2fb7dbb7fba23283d09a20212b94dad1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
theV: float

Returns
-------
None
") Value;
		void Value(const Standard_Real theV);

		/****************** Whatis ******************/
		/**** md5 signature: 6abfcab5855ef14ef5deccbfc8fe52d8 ****/
		%feature("compactdefaultargs") Whatis;
		%feature("autodoc", "For variable whatis command. set as a result the type of the variable.

Parameters
----------
I: Draw_Interpretor

Returns
-------
None
") Whatis;
		virtual void Whatis(Draw_Interpretor & I);

};


%make_alias(Draw_Number)

%extend Draw_Number {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Draw_Segment3D *
***********************/
class Draw_Segment3D : public Draw_Drawable3D {
	public:
		/****************** Draw_Segment3D ******************/
		/**** md5 signature: 526cbf051d4a5b9e0cbfc92ad731f363 ****/
		%feature("compactdefaultargs") Draw_Segment3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p1: gp_Pnt
p2: gp_Pnt
col: Draw_Color

Returns
-------
None
") Draw_Segment3D;
		 Draw_Segment3D(const gp_Pnt & p1, const gp_Pnt & p2, const Draw_Color & col);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

		/****************** First ******************/
		/**** md5 signature: f73e7eab1be750a4cfeaca41f1840a81 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") First;
		const gp_Pnt First();

		/****************** First ******************/
		/**** md5 signature: 7706f5624693daef46076cf75ef0c70d ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") First;
		void First(const gp_Pnt & P);

		/****************** Last ******************/
		/**** md5 signature: f080ae030d9f0695b0f449bebbd54708 ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Last;
		const gp_Pnt Last();

		/****************** Last ******************/
		/**** md5 signature: 06ec6f3318f3e80886c9d9d61844e356 ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Last;
		void Last(const gp_Pnt & P);

};


%make_alias(Draw_Segment3D)

%extend Draw_Segment3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Text3D *
********************/
class Draw_Text3D : public Draw_Drawable3D {
	public:
		/****************** Draw_Text3D ******************/
		/**** md5 signature: 28898072d781f82aab811a42926bd35d ****/
		%feature("compactdefaultargs") Draw_Text3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt
T: str
col: Draw_Color

Returns
-------
None
") Draw_Text3D;
		 Draw_Text3D(const gp_Pnt & p, Standard_CString T, const Draw_Color & col);

		/****************** Draw_Text3D ******************/
		/**** md5 signature: 8d64a95fd62c649b8747e7184c10875f ****/
		%feature("compactdefaultargs") Draw_Text3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt
T: str
col: Draw_Color
moveX: float
moveY: float

Returns
-------
None
") Draw_Text3D;
		 Draw_Text3D(const gp_Pnt & p, Standard_CString T, const Draw_Color & col, const Standard_Real moveX, const Standard_Real moveY);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

		/****************** SetPnt ******************/
		/**** md5 signature: bb1b3b80f2d6031f72db1ef2885b3648 ****/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt

Returns
-------
None
") SetPnt;
		void SetPnt(const gp_Pnt & p);

};


%make_alias(Draw_Text3D)

%extend Draw_Text3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Draw_View *
******************/
class Draw_View : public Draw_Window {
	public:
		/****************** Draw_View ******************/
		/**** md5 signature: 600bc60e8c9c5148b1a5220f8135e7e4 ****/
		%feature("compactdefaultargs") Draw_View;
		%feature("autodoc", "Constructor.

Parameters
----------
theId: int
theViewer: Draw_Viewer *
theX: int
theY: int
theWidth: int
theHeight: int
theWindow: Aspect_Drawable,optional
	default value is 0

Returns
-------
None
") Draw_View;
		 Draw_View(Standard_Integer theId, Draw_Viewer * theViewer, Standard_Integer theX, Standard_Integer theY, Standard_Integer theWidth, Standard_Integer theHeight, Aspect_Drawable theWindow = 0);

		/****************** Draw_View ******************/
		/**** md5 signature: 3ab4607e62b9954fe70003cb1c9a7a98 ****/
		%feature("compactdefaultargs") Draw_View;
		%feature("autodoc", "Constructor.

Parameters
----------
theId: int
theViewer: Draw_Viewer *
theTitle: char *

Returns
-------
None
") Draw_View;
		 Draw_View(Standard_Integer theId, Draw_Viewer * theViewer, const char * theTitle);

		/****************** GetDx ******************/
		/**** md5 signature: 4d88961789e7de8fee542ce4956a445f ****/
		%feature("compactdefaultargs") GetDx;
		%feature("autodoc", "Gets horizontal offset.

Returns
-------
int
") GetDx;
		Standard_Integer GetDx();

		/****************** GetDy ******************/
		/**** md5 signature: 319846f63534f7e64a233bf879a31f32 ****/
		%feature("compactdefaultargs") GetDy;
		%feature("autodoc", "Gets vertical offset.

Returns
-------
int
") GetDy;
		Standard_Integer GetDy();

		/****************** GetFocalDistance ******************/
		/**** md5 signature: 760b74a7b8dd0a8d8762801a4941c30c ****/
		%feature("compactdefaultargs") GetFocalDistance;
		%feature("autodoc", "Gets focal distance.

Returns
-------
float
") GetFocalDistance;
		Standard_Real GetFocalDistance();

		/****************** GetFrame ******************/
		/**** md5 signature: 15a5044b5c4ce5261e24566b2992045f ****/
		%feature("compactdefaultargs") GetFrame;
		%feature("autodoc", "Returns parameters of frame corners.

Parameters
----------

Returns
-------
theX0: int
theY0: int
theX1: int
theY1: int
") GetFrame;
		void GetFrame(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetMatrix ******************/
		/**** md5 signature: 7013ecf48aa109096891c2e953f52007 ****/
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "Gets matrix of view.

Returns
-------
gp_Trsf
") GetMatrix;
		const gp_Trsf GetMatrix();

		/****************** GetZoom ******************/
		/**** md5 signature: fdbb2e7bc48431c2fd6c17be66046615 ****/
		%feature("compactdefaultargs") GetZoom;
		%feature("autodoc", "Gets parameter of zoom.

Returns
-------
float
") GetZoom;
		Standard_Real GetZoom();

		/****************** Init ******************/
		/**** md5 signature: 4ada530bb76589b41b8b2e0df9c2db28 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "@name view api initialize view by the type.

Parameters
----------
theType: char *

Returns
-------
bool
") Init;
		Standard_Boolean Init(const char * theType);

		/****************** Is2D ******************/
		/**** md5 signature: 82927d59c9a014e8e2648c06cd37ddf4 ****/
		%feature("compactdefaultargs") Is2D;
		%feature("autodoc", "Returns true value if current view in 2d mode.

Returns
-------
bool
") Is2D;
		Standard_Boolean Is2D();

		/****************** IsPerspective ******************/
		/**** md5 signature: 492dc8851de2e900abe099bf42f905b1 ****/
		%feature("compactdefaultargs") IsPerspective;
		%feature("autodoc", "Returns true value if current view in perspective mode.

Returns
-------
float
") IsPerspective;
		Standard_Real IsPerspective();

		/****************** ResetFrame ******************/
		/**** md5 signature: 52704a4edf2b218cb9d8de6707cc45f3 ****/
		%feature("compactdefaultargs") ResetFrame;
		%feature("autodoc", "Resets frame of current view.

Returns
-------
None
") ResetFrame;
		void ResetFrame();

		/****************** SetDx ******************/
		/**** md5 signature: 8a49ed85c80cb1beadef7c531cae33a0 ****/
		%feature("compactdefaultargs") SetDx;
		%feature("autodoc", "Sets horizontal offset.

Parameters
----------
theDx: int

Returns
-------
None
") SetDx;
		void SetDx(const Standard_Integer theDx);

		/****************** SetDy ******************/
		/**** md5 signature: 45f8a5558308b6b831326580dde2f03f ****/
		%feature("compactdefaultargs") SetDy;
		%feature("autodoc", "Sets vertical offset.

Parameters
----------
theDy: int

Returns
-------
None
") SetDy;
		void SetDy(const Standard_Integer theDy);

		/****************** SetFocalDistance ******************/
		/**** md5 signature: d547b39a4b6b476282e541f32c55798f ****/
		%feature("compactdefaultargs") SetFocalDistance;
		%feature("autodoc", "Sets focal distance.

Parameters
----------
theDistance: float

Returns
-------
None
") SetFocalDistance;
		void SetFocalDistance(const Standard_Real theDistance);

		/****************** SetMatrix ******************/
		/**** md5 signature: 71c804618e1babde23a8adf2772b4c65 ****/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "Sets view matrix.

Parameters
----------
theMatrix: gp_Trsf

Returns
-------
None
") SetMatrix;
		void SetMatrix(const gp_Trsf & theMatrix);

		/****************** SetZoom ******************/
		/**** md5 signature: ac7b293ca8694090d6a20adf22ce6f39 ****/
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "Sets parameter of zoom.

Parameters
----------
theZoom: float

Returns
-------
None
") SetZoom;
		void SetZoom(const Standard_Real theZoom);

		/****************** Transform ******************/
		/**** md5 signature: 1c1ca20958eb84c832a3b4e050c3d4fa ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transform view matrix.

Parameters
----------
theTransformation: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & theTransformation);

		/****************** Type ******************/
		/**** md5 signature: 0af07fdb839b68c8e172eed1826f06de ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns type of view.

Returns
-------
char *
") Type;
		const char * Type();

		/****************** WExpose ******************/
		/**** md5 signature: d0cb2bec9ebbb51024d768d25959e928 ****/
		%feature("compactdefaultargs") WExpose;
		%feature("autodoc", "Perform window exposing.

Returns
-------
None
") WExpose;
		virtual void WExpose();

};


%extend Draw_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Axis2D *
********************/
class Draw_Axis2D : public Draw_Drawable2D {
	public:
		/****************** Draw_Axis2D ******************/
		/**** md5 signature: c281ab83a973a21affdf921ba077003b ****/
		%feature("compactdefaultargs") Draw_Axis2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
col: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Axis2D;
		 Draw_Axis2D(const Draw_Color & col, const Standard_Integer Size = 5);

		/****************** Draw_Axis2D ******************/
		/**** md5 signature: e41d39e48c72a553bf33b57205caa00c ****/
		%feature("compactdefaultargs") Draw_Axis2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt2d
col: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Axis2D;
		 Draw_Axis2D(const gp_Pnt2d & p, const Draw_Color & col, const Standard_Integer Size = 5);

		/****************** Draw_Axis2D ******************/
		/**** md5 signature: 7d22ed13722a8afac383cc70f2e0d126 ****/
		%feature("compactdefaultargs") Draw_Axis2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: gp_Ax22d
col: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Axis2D;
		 Draw_Axis2D(const gp_Ax22d & A, const Draw_Color & col, const Standard_Integer Size = 5);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

};


%make_alias(Draw_Axis2D)

%extend Draw_Axis2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Draw_Circle2D *
**********************/
class Draw_Circle2D : public Draw_Drawable2D {
	public:
		/****************** Draw_Circle2D ******************/
		/**** md5 signature: 99f2f22ed50c813c4759806b63b63bd4 ****/
		%feature("compactdefaultargs") Draw_Circle2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ2d
A1: float
A2: float
col: Draw_Color

Returns
-------
None
") Draw_Circle2D;
		 Draw_Circle2D(const gp_Circ2d & C, const Standard_Real A1, const Standard_Real A2, const Draw_Color & col);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

};


%make_alias(Draw_Circle2D)

%extend Draw_Circle2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Draw_Marker2D *
**********************/
class Draw_Marker2D : public Draw_Drawable2D {
	public:
		/****************** Draw_Marker2D ******************/
		/**** md5 signature: 8f1e30c46da6ee868094429c81305e67 ****/
		%feature("compactdefaultargs") Draw_Marker2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
T: Draw_MarkerShape
C: Draw_Color
Size: int,optional
	default value is 5

Returns
-------
None
") Draw_Marker2D;
		 Draw_Marker2D(const gp_Pnt2d & P, const Draw_MarkerShape T, const Draw_Color & C, const Standard_Integer Size = 5);

		/****************** Draw_Marker2D ******************/
		/**** md5 signature: 0c938f040782b4646680f85f074ec1b9 ****/
		%feature("compactdefaultargs") Draw_Marker2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
T: Draw_MarkerShape
C: Draw_Color
RSize: float

Returns
-------
None
") Draw_Marker2D;
		 Draw_Marker2D(const gp_Pnt2d & P, const Draw_MarkerShape T, const Draw_Color & C, const Standard_Real RSize);

		/****************** ChangePos ******************/
		/**** md5 signature: 1d72cbbc2f369b43780e8ae772f52ea7 ****/
		%feature("compactdefaultargs") ChangePos;
		%feature("autodoc", "Mypos field.

Returns
-------
gp_Pnt2d
") ChangePos;
		gp_Pnt2d ChangePos();

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

		/****************** PickReject ******************/
		/**** md5 signature: 6508e4f52373aba12d22bbb04a0e3fad ****/
		%feature("compactdefaultargs") PickReject;
		%feature("autodoc", "Returns always false.

Parameters
----------
X: float
Y: float
Prec: float

Returns
-------
bool
") PickReject;
		virtual Standard_Boolean PickReject(const Standard_Real X, const Standard_Real Y, const Standard_Real Prec);

};


%make_alias(Draw_Marker2D)

%extend Draw_Marker2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Draw_Segment2D *
***********************/
class Draw_Segment2D : public Draw_Drawable2D {
	public:
		/****************** Draw_Segment2D ******************/
		/**** md5 signature: 941cceb717fef6c9ed5b74fc40c9b241 ****/
		%feature("compactdefaultargs") Draw_Segment2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p1: gp_Pnt2d
p2: gp_Pnt2d
col: Draw_Color

Returns
-------
None
") Draw_Segment2D;
		 Draw_Segment2D(const gp_Pnt2d & p1, const gp_Pnt2d & p2, const Draw_Color & col);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** First ******************/
		/**** md5 signature: 55b28b989b8fcedd991544112315ea2f ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") First;
		const gp_Pnt2d First();

		/****************** First ******************/
		/**** md5 signature: 364bde747f74a83a6c1e5957b50ebe28 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") First;
		void First(const gp_Pnt2d & P);

		/****************** Last ******************/
		/**** md5 signature: c3cb1c757dfe389fa2618ff466f2500e ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Last;
		const gp_Pnt2d Last();

		/****************** Last ******************/
		/**** md5 signature: d92d445f3737bf8044d5334766645af5 ****/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Last;
		void Last(const gp_Pnt2d & P);

		/****************** Whatis ******************/
		/**** md5 signature: 6abfcab5855ef14ef5deccbfc8fe52d8 ****/
		%feature("compactdefaultargs") Whatis;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: Draw_Interpretor

Returns
-------
None
") Whatis;
		virtual void Whatis(Draw_Interpretor & I);

};


%make_alias(Draw_Segment2D)

%extend Draw_Segment2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Draw_Text2D *
********************/
class Draw_Text2D : public Draw_Drawable2D {
	public:
		/****************** Draw_Text2D ******************/
		/**** md5 signature: 85bf2320037c0e2fbc838e2d905e5681 ****/
		%feature("compactdefaultargs") Draw_Text2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt2d
T: str
col: Draw_Color

Returns
-------
None
") Draw_Text2D;
		 Draw_Text2D(const gp_Pnt2d & p, Standard_CString T, const Draw_Color & col);

		/****************** Draw_Text2D ******************/
		/**** md5 signature: 62a9aab4b63c15ae10831777b3191cec ****/
		%feature("compactdefaultargs") Draw_Text2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt2d
T: str
col: Draw_Color
moveX: int
moveY: int

Returns
-------
None
") Draw_Text2D;
		 Draw_Text2D(const gp_Pnt2d & p, Standard_CString T, const Draw_Color & col, const Standard_Integer moveX, const Standard_Integer moveY);

		/****************** DrawOn ******************/
		/**** md5 signature: 0a352a228da61dc7f2b6408a254601e7 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & dis);

		/****************** SetPnt2d ******************/
		/**** md5 signature: 4019e9fc83ac7e024f5664cfdb6467fa ****/
		%feature("compactdefaultargs") SetPnt2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
p: gp_Pnt2d

Returns
-------
None
") SetPnt2d;
		void SetPnt2d(const gp_Pnt2d & p);

};


%make_alias(Draw_Text2D)

%extend Draw_Text2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Draw_Window:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
