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
%define DBREPDOCSTRING
"DBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_dbrep.html"
%enddef
%module (package="OCC.Core", docstring=DBREPDOCSTRING) DBRep


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
#include<DBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Draw_module.hxx>
#include<TopAbs_module.hxx>
#include<TopoDS_module.hxx>
#include<TCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Bnd_module.hxx>
#include<Extrema_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Draw.i
%import TopAbs.i
%import TopoDS.i
%import TCollection.i
%import GeomAbs.i
%import gp.i
%import Geom2dHatch.i

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
%wrap_handle(DBRep_DrawableShape)
%wrap_handle(DBRep_Edge)
%wrap_handle(DBRep_Face)
/* end handles declaration */

/* templates */
%template(DBRep_ListIteratorOfListOfEdge) NCollection_TListIterator<opencascade::handle<DBRep_Edge>>;
%template(DBRep_ListIteratorOfListOfFace) NCollection_TListIterator<opencascade::handle<DBRep_Face>>;
%template(DBRep_ListIteratorOfListOfHideData) NCollection_TListIterator<DBRep_HideData>;
%template(DBRep_ListOfEdge) NCollection_List<opencascade::handle<DBRep_Edge>>;

%extend NCollection_List<opencascade::handle<DBRep_Edge>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(DBRep_ListOfFace) NCollection_List<opencascade::handle<DBRep_Face>>;

%extend NCollection_List<opencascade::handle<DBRep_Face>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(DBRep_ListOfHideData) NCollection_List<DBRep_HideData>;

%extend NCollection_List<DBRep_HideData> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <DBRep_Edge>>::Iterator DBRep_ListIteratorOfListOfEdge;
typedef NCollection_List <opencascade::handle <DBRep_Face>>::Iterator DBRep_ListIteratorOfListOfFace;
typedef NCollection_List <DBRep_HideData>::Iterator DBRep_ListIteratorOfListOfHideData;
typedef NCollection_List <opencascade::handle <DBRep_Edge>> DBRep_ListOfEdge;
typedef NCollection_List <opencascade::handle <DBRep_Face>> DBRep_ListOfFace;
typedef NCollection_List <DBRep_HideData> DBRep_ListOfHideData;
/* end typedefs declaration */

/**************
* class DBRep *
**************/
%rename(dbrep) DBRep;
class DBRep {
	public:
		/****************** BasicCommands ******************/
		/**** md5 signature: 341b2f7d23f866933cb4e89551c5b03e ****/
		%feature("compactdefaultargs") BasicCommands;
		%feature("autodoc", "Defines the basic commands.

Parameters
----------
theCommands: Draw_Interpretor

Returns
-------
void
") BasicCommands;
		static void BasicCommands(Draw_Interpretor & theCommands);

		/****************** Discretisation ******************/
		/**** md5 signature: 6191501bd4fa7a8fb369cd2dba4f4bd6 ****/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "Discretization number of points for curves.

Returns
-------
int
") Discretisation;
		static Standard_Integer Discretisation();

		/****************** Get ******************/
		/**** md5 signature: a10a738ab46b27cd7554ba954b9aa7ac ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the shape in the variable. @param thename [in] [out] variable name, or '.' to pick up shape interactively (the picked name will be returned then) @param thetype [in] shape type filter; function will return null if shape has different type @param thetocomplain [in] when true, prints a message on cout if the variable is not set.

Parameters
----------
theName: str
theType: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE
theToComplain: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Shape
") Get;
		static TopoDS_Shape Get(Standard_CString theName, TopAbs_ShapeEnum theType = TopAbs_SHAPE, Standard_Boolean theToComplain = Standard_False);

		/****************** Get ******************/
		/**** md5 signature: fe205ade845c8ddafa40d615aa4c7704 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the shape in the variable. @param thename [in] [out] variable name, or '.' to pick up shape interactively (the picked name will be returned then) @param thetype [in] shape type filter; function will return null if shape has different type @param thetocomplain [in] when true, prints a message on cout if the variable is not set.

Parameters
----------
theName: str
theType: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE
theToComplain: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Shape
") Get;
		static TopoDS_Shape Get(TCollection_AsciiString & theName, TopAbs_ShapeEnum theType = TopAbs_SHAPE, Standard_Boolean theToComplain = Standard_False);

		/****************** GetExisting ******************/
		/**** md5 signature: 9688bb8805bbef935130928bd6ec5ce9 ****/
		%feature("compactdefaultargs") GetExisting;
		%feature("autodoc", "Returns the shape in the variable. @param thename [in] variable name @param thetype [in] shape type filter; function will return null if shape has different type @param thetocomplain [in] when true, prints a message on cout if the variable is not set.

Parameters
----------
theName: str
theType: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE
theToComplain: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Shape
") GetExisting;
		static TopoDS_Shape GetExisting(TCollection_AsciiString theName, TopAbs_ShapeEnum theType = TopAbs_SHAPE, Standard_Boolean theToComplain = Standard_False);

		/****************** HLRAngle ******************/
		/**** md5 signature: 3d3a32c52749890019f594204c45213f ****/
		%feature("compactdefaultargs") HLRAngle;
		%feature("autodoc", "Discretisation angle for edges.

Returns
-------
float
") HLRAngle;
		static Standard_Real HLRAngle();

		/****************** HLRMode ******************/
		/**** md5 signature: b2aba3cff59bfad1a78b44380635ed1f ****/
		%feature("compactdefaultargs") HLRMode;
		%feature("autodoc", "True if hlr, false if wireframe.

Returns
-------
bool
") HLRMode;
		static Standard_Boolean HLRMode();

		/****************** HidMode ******************/
		/**** md5 signature: a91a368fbb5b52f00aad17a4aa6e9991 ****/
		%feature("compactdefaultargs") HidMode;
		%feature("autodoc", "True if display hiddenlines.

Returns
-------
bool
") HidMode;
		static Standard_Boolean HidMode();

		/****************** NbIsos ******************/
		/**** md5 signature: 26b0c10a1b4776d8ca9566cd42064ff9 ****/
		%feature("compactdefaultargs") NbIsos;
		%feature("autodoc", "Number of iso in u and v.

Returns
-------
int
") NbIsos;
		static Standard_Integer NbIsos();

		/****************** Parameters ******************/
		/**** md5 signature: 9de1d2bc2dd77172b8d90518bd23940c ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return global parameters.

Returns
-------
DBRep_Params
") Parameters;
		static DBRep_Params & Parameters();

		/****************** Rg1Mode ******************/
		/**** md5 signature: 3c34232e066ab7da513a383e430dfb58 ****/
		%feature("compactdefaultargs") Rg1Mode;
		%feature("autodoc", "True if display rg1lines.

Returns
-------
bool
") Rg1Mode;
		static Standard_Boolean Rg1Mode();

		/****************** RgNMode ******************/
		/**** md5 signature: f33dcf467d243b0df49a1b51bb110e92 ****/
		%feature("compactdefaultargs") RgNMode;
		%feature("autodoc", "True if display rgnlines.

Returns
-------
bool
") RgNMode;
		static Standard_Boolean RgNMode();

		/****************** Set ******************/
		/**** md5 signature: 74fba6ffb91a1525dc088acad8ba6cd7 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creation of isoparametric curves. implements progressindicator for draw sets <s> in the variable <name>. overwrite the variable if already set.

Parameters
----------
Name: str
S: TopoDS_Shape

Returns
-------
void
") Set;
		static void Set(Standard_CString Name, const TopoDS_Shape & S);

};


%extend DBRep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class DBRep_DrawableShape *
****************************/
class DBRep_DrawableShape : public Draw_Drawable3D {
	public:
		/****************** DBRep_DrawableShape ******************/
		/**** md5 signature: 77ca418213b684dd048d90f1afa3911c ****/
		%feature("compactdefaultargs") DBRep_DrawableShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopoDS_Shape
FreeCol: Draw_Color
ConnCol: Draw_Color
EdgeCol: Draw_Color
IsosCol: Draw_Color
size: float
nbisos: int
discret: int

Returns
-------
None
") DBRep_DrawableShape;
		 DBRep_DrawableShape(const TopoDS_Shape & C, const Draw_Color & FreeCol, const Draw_Color & ConnCol, const Draw_Color & EdgeCol, const Draw_Color & IsosCol, const Standard_Real size, const Standard_Integer nbisos, const Standard_Integer discret);

		/****************** ChangeDiscret ******************/
		/**** md5 signature: 1b2a8e66f02e55a16bab8c95c247c9d0 ****/
		%feature("compactdefaultargs") ChangeDiscret;
		%feature("autodoc", "Changes the number of isoparametric curves in a shape.

Parameters
----------
Discret: int

Returns
-------
None
") ChangeDiscret;
		void ChangeDiscret(const Standard_Integer Discret);

		/****************** ChangeNbIsos ******************/
		/**** md5 signature: 95c7c239fd9c2a3d838faf9065336de0 ****/
		%feature("compactdefaultargs") ChangeNbIsos;
		%feature("autodoc", "Changes the number of isoparametric curves in a shape.

Parameters
----------
NbIsos: int

Returns
-------
None
") ChangeNbIsos;
		void ChangeNbIsos(const Standard_Integer NbIsos);

		/****************** Copy ******************/
		/**** md5 signature: 845c339d55dd4c23a0de27412f7fb6fe ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "For variable copy.

Returns
-------
opencascade::handle<Draw_Drawable3D>
") Copy;
		virtual opencascade::handle<Draw_Drawable3D> Copy();

		/****************** Discret ******************/
		/**** md5 signature: 596daa93c455dfb559ae0558be65af5d ****/
		%feature("compactdefaultargs") Discret;
		%feature("autodoc", "Returns the discretisation value of curve.

Returns
-------
int
") Discret;
		Standard_Integer Discret();

		/****************** DisplayHLR ******************/
		/**** md5 signature: c21780c02c35be47be70062d080706e3 ****/
		%feature("compactdefaultargs") DisplayHLR;
		%feature("autodoc", "Performs hidden lines.

Parameters
----------
withHLR: bool
withRg1: bool
withRgN: bool
withHid: bool
ang: float

Returns
-------
None
") DisplayHLR;
		void DisplayHLR(const Standard_Boolean withHLR, const Standard_Boolean withRg1, const Standard_Boolean withRgN, const Standard_Boolean withHid, const Standard_Real ang);

		/****************** DisplayHiddenLines ******************/
		/**** md5 signature: 06c0911c6f8a1ca096c126fcaaca4629 ****/
		%feature("compactdefaultargs") DisplayHiddenLines;
		%feature("autodoc", "No available documentation.

Parameters
----------
dis: Draw_Display

Returns
-------
None
") DisplayHiddenLines;
		void DisplayHiddenLines(Draw_Display & dis);

		/****************** DisplayOrientation ******************/
		/**** md5 signature: cf59731ea5778de2d8c5536ab3dbe55d ****/
		%feature("compactdefaultargs") DisplayOrientation;
		%feature("autodoc", "When true the orientations of the edges and free vertices are displayed.

Parameters
----------
D: bool

Returns
-------
None
") DisplayOrientation;
		void DisplayOrientation(const Standard_Boolean D);

		/****************** DisplayPolygons ******************/
		/**** md5 signature: 62d083d3df510ac994b956ca9b6c6392 ****/
		%feature("compactdefaultargs") DisplayPolygons;
		%feature("autodoc", "When true the polygons of the edges are displayed even if there is a geometric curve.

Parameters
----------
D: bool

Returns
-------
None
") DisplayPolygons;
		void DisplayPolygons(const Standard_Boolean D);

		/****************** DisplayPolygons ******************/
		/**** md5 signature: 8b3a9fdf041ab9e9985f1e84a1dc8375 ****/
		%feature("compactdefaultargs") DisplayPolygons;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DisplayPolygons;
		Standard_Boolean DisplayPolygons();

		/****************** DisplayTriangulation ******************/
		/**** md5 signature: 05cb4091f919161a28aefd0fcedeaf68 ****/
		%feature("compactdefaultargs") DisplayTriangulation;
		%feature("autodoc", "When true the triangulations of the faces are displayed even if there is a surface.

Parameters
----------
D: bool

Returns
-------
None
") DisplayTriangulation;
		void DisplayTriangulation(const Standard_Boolean D);

		/****************** DisplayTriangulation ******************/
		/**** md5 signature: 88e4c84479b31d6b1f9e28a64cae5b19 ****/
		%feature("compactdefaultargs") DisplayTriangulation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DisplayTriangulation;
		Standard_Boolean DisplayTriangulation();

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
		/****************** GetDisplayHLR ******************/
		/**** md5 signature: 22ce540714c0b9fa93c2498b8aca6949 ****/
		%feature("compactdefaultargs") GetDisplayHLR;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
withHLR: bool
withRg1: bool
withRgN: bool
withHid: bool
ang: float
") GetDisplayHLR;
		void GetDisplayHLR(Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Real &OutValue);

		/****************** LastPick ******************/
		/**** md5 signature: 4a0e5686830af105b163e43db520b0ba ****/
		%feature("compactdefaultargs") LastPick;
		%feature("autodoc", "Returns the subshape touched by the last pick. u,v are the parameters of the closest point.

Parameters
----------
S: TopoDS_Shape

Returns
-------
u: float
v: float
") LastPick;
		static void LastPick(TopoDS_Shape & S, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbIsos ******************/
		/**** md5 signature: 783adabb90fbfd3b6eab63a2ddf93eeb ****/
		%feature("compactdefaultargs") NbIsos;
		%feature("autodoc", "Returns the number of isoparametric curves in a shape.

Returns
-------
int
") NbIsos;
		Standard_Integer NbIsos();


        %feature("autodoc", "1");
        %extend{
            std::string SaveToString() {
            std::stringstream s;
            self->Save(s);
            return s.str();}
        };
		/****************** Shape ******************/
		/**** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return const &.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

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

		/****************** addMeshNormals ******************/
		/**** md5 signature: b9beb1daba5e801c0e02bb8363d0abf7 ****/
		%feature("compactdefaultargs") addMeshNormals;
		%feature("autodoc", "Auxiliary method computing nodal normals for presentation purposes. @param thenormals [out] vector of computed normals (pair of points [from, to]) @param theface [in] input face @param thelength [in] normal length returns false if normals can not be computed.

Parameters
----------
theNormals: NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> >
theFace: TopoDS_Face
theLength: float

Returns
-------
bool
") addMeshNormals;
		static Standard_Boolean addMeshNormals(NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> > & theNormals, const TopoDS_Face & theFace, const Standard_Real theLength);

		/****************** addMeshNormals ******************/
		/**** md5 signature: e4409cdbd8b9b5f7ee41b454298b6434 ****/
		%feature("compactdefaultargs") addMeshNormals;
		%feature("autodoc", "Auxiliary method computing nodal normals for presentation purposes. @param thenormals [out] map of computed normals (grouped per face) @param theshape [in] input shape which will be exploded into faces @param thelength [in] normal length.

Parameters
----------
theNormals: NCollection_DataMap<TopoDS_Face, NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> > >
theShape: TopoDS_Shape
theLength: float

Returns
-------
void
") addMeshNormals;
		static void addMeshNormals(NCollection_DataMap<TopoDS_Face, NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> > > & theNormals, const TopoDS_Shape & theShape, const Standard_Real theLength);

		/****************** addSurfaceNormals ******************/
		/**** md5 signature: dc7d0763d6c06176565ca32e98dcd5bf ****/
		%feature("compactdefaultargs") addSurfaceNormals;
		%feature("autodoc", "Auxiliary method computing surface normals distributed within the face for presentation purposes. @param thenormals [out] vector of computed normals (pair of points [from, to]) @param theface [in] input face @param thelength [in] normal length @param thenbalongu [in] number along u @param thenbalongv [in] number along v returns false if normals can not be computed.

Parameters
----------
theNormals: NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> >
theFace: TopoDS_Face
theLength: float
theNbAlongU: int
theNbAlongV: int

Returns
-------
bool
") addSurfaceNormals;
		static Standard_Boolean addSurfaceNormals(NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> > & theNormals, const TopoDS_Face & theFace, const Standard_Real theLength, const Standard_Integer theNbAlongU, const Standard_Integer theNbAlongV);

		/****************** addSurfaceNormals ******************/
		/**** md5 signature: eaf4158c6ac07f39bac7a686a139790a ****/
		%feature("compactdefaultargs") addSurfaceNormals;
		%feature("autodoc", "Auxiliary method computing surface normals distributed within the face for presentation purposes. @param thenormals [out] map of computed normals (grouped per face) @param theshape [in] input shape which will be exploded into faces @param thelength [in] normal length @param thenbalongu [in] number along u @param thenbalongv [in] number along v returns false if normals can not be computed.

Parameters
----------
theNormals: NCollection_DataMap<TopoDS_Face, NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> > >
theShape: TopoDS_Shape
theLength: float
theNbAlongU: int
theNbAlongV: int

Returns
-------
void
") addSurfaceNormals;
		static void addSurfaceNormals(NCollection_DataMap<TopoDS_Face, NCollection_Vector<std::pair<gp_Pnt, gp_Pnt> > > & theNormals, const TopoDS_Shape & theShape, const Standard_Real theLength, const Standard_Integer theNbAlongU, const Standard_Integer theNbAlongV);

};


%make_alias(DBRep_DrawableShape)

%extend DBRep_DrawableShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class DBRep_Edge *
*******************/
class DBRep_Edge : public Standard_Transient {
	public:
		/****************** DBRep_Edge ******************/
		/**** md5 signature: d8d55bd15237be134d7536495d7daa3e ****/
		%feature("compactdefaultargs") DBRep_Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
C: Draw_Color

Returns
-------
None
") DBRep_Edge;
		 DBRep_Edge(const TopoDS_Edge & E, const Draw_Color & C);

		/****************** Color ******************/
		/**** md5 signature: ca79cefcb762c1b38f6c231c3dcac765 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Draw_Color
") Color;
		const Draw_Color & Color();

		/****************** Color ******************/
		/**** md5 signature: 96429e192cf35094a98be0bd87233aef ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Draw_Color

Returns
-------
None
") Color;
		void Color(const Draw_Color & C);

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Edge ******************/
		/**** md5 signature: 05a9e7018534bb2901820c725d5b2b2b ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Edge;
		void Edge(const TopoDS_Edge & E);

};


%make_alias(DBRep_Edge)

%extend DBRep_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class DBRep_Face *
*******************/
class DBRep_Face : public Standard_Transient {
	public:
		/****************** DBRep_Face ******************/
		/**** md5 signature: 1e90701bef5ba5bbe92b43e782c95c31 ****/
		%feature("compactdefaultargs") DBRep_Face;
		%feature("autodoc", "N is the number of iso intervals.

Parameters
----------
F: TopoDS_Face
N: int
C: Draw_Color

Returns
-------
None
") DBRep_Face;
		 DBRep_Face(const TopoDS_Face & F, const Standard_Integer N, const Draw_Color & C);

		/****************** Color ******************/
		/**** md5 signature: ca79cefcb762c1b38f6c231c3dcac765 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Returns
-------
Draw_Color
") Color;
		const Draw_Color & Color();

		/****************** Color ******************/
		/**** md5 signature: 96429e192cf35094a98be0bd87233aef ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Draw_Color

Returns
-------
None
") Color;
		void Color(const Draw_Color & C);

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Face ******************/
		/**** md5 signature: 75db590d512cb81a1c358807ecd8261f ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Face;
		void Face(const TopoDS_Face & F);

		/****************** GetIso ******************/
		/**** md5 signature: 6322460ca9da67eb96df03cf2e212ec6 ****/
		%feature("compactdefaultargs") GetIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
T: GeomAbs_IsoType

Returns
-------
Par: float
T1: float
T2: float
") GetIso;
		void GetIso(const Standard_Integer I, GeomAbs_IsoType & T, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Iso ******************/
		/**** md5 signature: 95a376d9cddf5724575960d70d4a6dd9 ****/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
T: GeomAbs_IsoType
Par: float
T1: float
T2: float

Returns
-------
None
") Iso;
		void Iso(const Standard_Integer I, const GeomAbs_IsoType T, const Standard_Real Par, const Standard_Real T1, const Standard_Real T2);

		/****************** NbIsos ******************/
		/**** md5 signature: 783adabb90fbfd3b6eab63a2ddf93eeb ****/
		%feature("compactdefaultargs") NbIsos;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIsos;
		Standard_Integer NbIsos();

};


%make_alias(DBRep_Face)

%extend DBRep_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class DBRep_HideData *
***********************/
class DBRep_HideData {
	public:
		/****************** DBRep_HideData ******************/
		/**** md5 signature: 4826ec6777c22fbebe2aa5897ac75c38 ****/
		%feature("compactdefaultargs") DBRep_HideData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DBRep_HideData;
		 DBRep_HideData();

		/****************** Angle ******************/
		/**** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** DrawOn ******************/
		/**** md5 signature: c855efa0d6a0bf2bdddd7dfb990b7238 ****/
		%feature("compactdefaultargs") DrawOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
D: Draw_Display
withRg1: bool
withRgN: bool
withHid: bool
VisCol: Draw_Color
HidCol: Draw_Color

Returns
-------
None
") DrawOn;
		void DrawOn(Draw_Display & D, const Standard_Boolean withRg1, const Standard_Boolean withRgN, const Standard_Boolean withHid, const Draw_Color & VisCol, const Draw_Color & HidCol);

		/****************** IsSame ******************/
		/**** md5 signature: b555dcb1c9c9a90deb23b4b3cab580d5 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "Returns true if the projection is the same.

Parameters
----------
TProj: gp_Trsf
Focla: float

Returns
-------
bool
") IsSame;
		Standard_Boolean IsSame(const gp_Trsf & TProj, const Standard_Real Focla);

		/****************** LastPick ******************/
		/**** md5 signature: 7dfe71611f80e5417fa834b9fab3a415 ****/
		%feature("compactdefaultargs") LastPick;
		%feature("autodoc", "Returns the subshape touched by the last pick.

Returns
-------
TopoDS_Shape
") LastPick;
		const TopoDS_Shape LastPick();

		/****************** Set ******************/
		/**** md5 signature: 4f3a69d1d31176f8108c7505cf1b0256 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Viewid is the view number tproj the projection focal <= 0 means parallel projection alg : the hidden lines.

Parameters
----------
ViewId: int
TProj: gp_Trsf
Focal: float
S: TopoDS_Shape
ang: float

Returns
-------
None
") Set;
		void Set(const Standard_Integer ViewId, const gp_Trsf & TProj, const Standard_Real Focal, const TopoDS_Shape & S, const Standard_Real ang);

		/****************** ViewId ******************/
		/**** md5 signature: 7546717e5e64a7674ed7d7d2b827975b ****/
		%feature("compactdefaultargs") ViewId;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ViewId;
		Standard_Integer ViewId();

};


%extend DBRep_HideData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class DBRep_IsoBuilder *
*************************/
class DBRep_IsoBuilder : public Geom2dHatch_Hatcher {
	public:
		/****************** DBRep_IsoBuilder ******************/
		/**** md5 signature: ed54b88c4052b1cc53a7c4d4c58bae68 ****/
		%feature("compactdefaultargs") DBRep_IsoBuilder;
		%feature("autodoc", "Creates the builder.

Parameters
----------
TopologicalFace: TopoDS_Face
Infinite: float
NbIsos: int

Returns
-------
None
") DBRep_IsoBuilder;
		 DBRep_IsoBuilder(const TopoDS_Face & TopologicalFace, const Standard_Real Infinite, const Standard_Integer NbIsos);

		/****************** LoadIsos ******************/
		/**** md5 signature: f7394283e41647b8066522daa375ac5b ****/
		%feature("compactdefaultargs") LoadIsos;
		%feature("autodoc", "Loading of the isoparametric curves in the data structure of a drawable face.

Parameters
----------
Face: DBRep_Face

Returns
-------
None
") LoadIsos;
		void LoadIsos(const opencascade::handle<DBRep_Face> & Face);

		/****************** NbDomains ******************/
		/**** md5 signature: eec94c46cd2be217c3c4593b8d6b3fc2 ****/
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "Returns the total number of domains.

Returns
-------
int
") NbDomains;
		Standard_Integer NbDomains();

};


%extend DBRep_IsoBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class DBRep_Params *
*********************/
class DBRep_Params {
	public:
		int NbIsos;
		float Size;
		int Discretization;
		bool DispTriangles;
		bool DisplayPolygons;
		float HLRAngle;
		float HAngMin;
		float HAngMax;
		bool WithHLR;
		bool WithRg1;
		bool WithRgN;
		bool WithHid;
		/****************** DBRep_Params ******************/
		/**** md5 signature: 6a48bc2459b89af3cf9d9027fc3c95ab ****/
		%feature("compactdefaultargs") DBRep_Params;
		%feature("autodoc", "//!< true if display hiddenlines.

Returns
-------
None
") DBRep_Params;
		 DBRep_Params();

};


%extend DBRep_Params {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
