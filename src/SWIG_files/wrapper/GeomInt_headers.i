/*
Copyright 2008-2016 Thomas Paviot (tpaviot@gmail.com)


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
%{
#include<GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomInt_IntSS.hxx>
#include<GeomInt_LineConstructor.hxx>
#include<GeomInt_LineTool.hxx>
#include<GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_MyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomInt_ParameterAndOrientation.hxx>
#include<GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation.hxx>
#include<GeomInt_SequenceOfParameterAndOrientation.hxx>
#include<GeomInt_TheComputeLineBezierOfWLApprox.hxx>
#include<GeomInt_TheComputeLineOfWLApprox.hxx>
#include<GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox.hxx>
#include<GeomInt_TheImpPrmSvSurfacesOfWLApprox.hxx>
#include<GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox.hxx>
#include<GeomInt_TheMultiLineOfWLApprox.hxx>
#include<GeomInt_TheMultiLineToolOfWLApprox.hxx>
#include<GeomInt_ThePrmPrmSvSurfacesOfWLApprox.hxx>
#include<GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox.hxx>
#include<GeomInt_WLApprox.hxx>
#include<GeomInt.hxx>
#include<Standard.hxx>
#include<Standard_AbortiveTransaction.hxx>
#include<Standard_Address.hxx>
#include<Standard_AncestorIterator.hxx>
#include<Standard_Assert.hxx>
#include<Standard_Atomic.hxx>
#include<Standard_Boolean.hxx>
#include<Standard_Byte.hxx>
#include<Standard_Character.hxx>
#include<Standard_ConstructionError.hxx>
#include<Standard_CString.hxx>
#include<Standard_DefineAlloc.hxx>
#include<Standard_DefineException.hxx>
#include<Standard_DefineHandle.hxx>
#include<Standard_DimensionError.hxx>
#include<Standard_DimensionMismatch.hxx>
#include<Standard_DivideByZero.hxx>
#include<Standard_DomainError.hxx>
#include<Standard_ErrorHandler.hxx>
#include<Standard_ErrorHandlerCallback.hxx>
#include<Standard_ExtCharacter.hxx>
#include<Standard_ExtString.hxx>
#include<Standard_Failure.hxx>
#include<Standard_GUID.hxx>
#include<Standard_HandlerStatus.hxx>
#include<Standard_ImmutableObject.hxx>
#include<Standard_Integer.hxx>
#include<Standard_InternalType.hxx>
#include<Standard_IStream.hxx>
#include<Standard_JmpBuf.hxx>
#include<Standard_KindOfType.hxx>
#include<Standard_LicenseError.hxx>
#include<Standard_LicenseNotFound.hxx>
#include<Standard_Macro.hxx>
#include<Standard_math.hxx>
#include<Standard_MMgrOpt.hxx>
#include<Standard_MMgrRaw.hxx>
#include<Standard_MMgrRoot.hxx>
#include<Standard_MMgrTBBalloc.hxx>
#include<Standard_MultiplyDefined.hxx>
#include<Standard_Mutex.hxx>
#include<Standard_NegativeValue.hxx>
#include<Standard_NoMoreObject.hxx>
#include<Standard_NoSuchObject.hxx>
#include<Standard_NotImplemented.hxx>
#include<Standard_NullObject.hxx>
#include<Standard_NullValue.hxx>
#include<Standard_NumericError.hxx>
#include<Standard_OStream.hxx>
#include<Standard_OutOfMemory.hxx>
#include<Standard_OutOfRange.hxx>
#include<Standard_Overflow.hxx>
#include<Standard_PByte.hxx>
#include<Standard_PCharacter.hxx>
#include<Standard_PErrorHandler.hxx>
#include<Standard_Persistent.hxx>
#include<Standard_Persistent_proto.hxx>
#include<Standard_PExtCharacter.hxx>
#include<Standard_PrimitiveTypes.hxx>
#include<Standard_ProgramError.hxx>
#include<Standard_RangeError.hxx>
#include<Standard_Real.hxx>
#include<Standard_ShortReal.hxx>
#include<Standard_Size.hxx>
#include<Standard_SStream.hxx>
#include<Standard_Storable.hxx>
#include<Standard_Stream.hxx>
#include<Standard_ThreadId.hxx>
#include<Standard_Time.hxx>
#include<Standard_TooManyUsers.hxx>
#include<Standard_Transient.hxx>
#include<Standard_Transient_proto.hxx>
#include<Standard_Type.hxx>
#include<Standard_TypeDef.hxx>
#include<Standard_TypeMismatch.hxx>
#include<Standard_Underflow.hxx>
#include<Standard_UUID.hxx>
#include<Standard_Version.hxx>
#include<Standard_WayOfLife.hxx>
#include<Standard_values.h>
#include<math.hxx>
#include<math_Array1OfValueAndWeight.hxx>
#include<math_BFGS.hxx>
#include<math_BissecNewton.hxx>
#include<math_BracketedRoot.hxx>
#include<math_BracketMinimum.hxx>
#include<math_BrentMinimum.hxx>
#include<math_BullardGenerator.hxx>
#include<math_CompareOfValueAndWeight.hxx>
#include<math_ComputeGaussPointsAndWeights.hxx>
#include<math_ComputeKronrodPointsAndWeights.hxx>
#include<math_Crout.hxx>
#include<math_DirectPolynomialRoots.hxx>
#include<math_DoubleTab.hxx>
#include<math_EigenValuesSearcher.hxx>
#include<math_FRPR.hxx>
#include<math_Function.hxx>
#include<math_FunctionAllRoots.hxx>
#include<math_FunctionRoot.hxx>
#include<math_FunctionRoots.hxx>
#include<math_FunctionSample.hxx>
#include<math_FunctionSet.hxx>
#include<math_FunctionSetRoot.hxx>
#include<math_FunctionSetWithDerivatives.hxx>
#include<math_FunctionWithDerivative.hxx>
#include<math_Gauss.hxx>
#include<math_GaussLeastSquare.hxx>
#include<math_GaussMultipleIntegration.hxx>
#include<math_GaussPoints.hxx>
#include<math_GaussSetIntegration.hxx>
#include<math_GaussSingleIntegration.hxx>
#include<math_GlobOptMin.hxx>
#include<math_Householder.hxx>
#include<math_IntegerRandom.hxx>
#include<math_IntegerVector.hxx>
#include<math_Jacobi.hxx>
#include<math_KronrodSingleIntegration.hxx>
#include<math_Matrix.hxx>
#include<math_Memory.hxx>
#include<math_MultipleVarFunction.hxx>
#include<math_MultipleVarFunctionWithGradient.hxx>
#include<math_MultipleVarFunctionWithHessian.hxx>
#include<math_NewtonFunctionRoot.hxx>
#include<math_NewtonFunctionSetRoot.hxx>
#include<math_NewtonMinimum.hxx>
#include<math_NotSquare.hxx>
#include<math_Powell.hxx>
#include<math_PSO.hxx>
#include<math_PSOParticlesPool.hxx>
#include<math_QuickSortOfValueAndWeight.hxx>
#include<math_RealRandom.hxx>
#include<math_Recipes.hxx>
#include<math_SingleTab.hxx>
#include<math_SingularMatrix.hxx>
#include<math_Status.hxx>
#include<math_SVD.hxx>
#include<math_TrigonometricFunctionRoots.hxx>
#include<math_Uzawa.hxx>
#include<math_ValueAndWeight.hxx>
#include<math_Vector.hxx>
#include<AppParCurves.hxx>
#include<AppParCurves_Array1OfConstraintCouple.hxx>
#include<AppParCurves_Array1OfMultiBSpCurve.hxx>
#include<AppParCurves_Array1OfMultiCurve.hxx>
#include<AppParCurves_Array1OfMultiPoint.hxx>
#include<AppParCurves_Constraint.hxx>
#include<AppParCurves_ConstraintCouple.hxx>
#include<AppParCurves_HArray1OfConstraintCouple.hxx>
#include<AppParCurves_HArray1OfMultiBSpCurve.hxx>
#include<AppParCurves_HArray1OfMultiCurve.hxx>
#include<AppParCurves_HArray1OfMultiPoint.hxx>
#include<AppParCurves_MultiBSpCurve.hxx>
#include<AppParCurves_MultiCurve.hxx>
#include<AppParCurves_MultiPoint.hxx>
#include<AppParCurves_SequenceNodeOfSequenceOfMultiBSpCurve.hxx>
#include<AppParCurves_SequenceNodeOfSequenceOfMultiCurve.hxx>
#include<AppParCurves_SequenceOfMultiBSpCurve.hxx>
#include<AppParCurves_SequenceOfMultiCurve.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_ListNodeOfListOfAsciiString.hxx>
#include<TColStd_ListNodeOfListOfInteger.hxx>
#include<TColStd_ListNodeOfListOfReal.hxx>
#include<TColStd_ListNodeOfListOfTransient.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include<TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include<TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include<TColStd_StdMapNodeOfMapOfInteger.hxx>
#include<TColStd_StdMapNodeOfMapOfReal.hxx>
#include<TColStd_StdMapNodeOfMapOfTransient.hxx>
#include<Geom_Axis1Placement.hxx>
#include<Geom_Axis2Placement.hxx>
#include<Geom_AxisPlacement.hxx>
#include<Geom_BezierCurve.hxx>
#include<Geom_BezierSurface.hxx>
#include<Geom_BoundedCurve.hxx>
#include<Geom_BoundedSurface.hxx>
#include<Geom_BSplineCurve.hxx>
#include<Geom_BSplineSurface.hxx>
#include<Geom_CartesianPoint.hxx>
#include<Geom_Circle.hxx>
#include<Geom_Conic.hxx>
#include<Geom_ConicalSurface.hxx>
#include<Geom_Curve.hxx>
#include<Geom_CylindricalSurface.hxx>
#include<Geom_Direction.hxx>
#include<Geom_ElementarySurface.hxx>
#include<Geom_Ellipse.hxx>
#include<Geom_Geometry.hxx>
#include<Geom_HSequenceOfBSplineSurface.hxx>
#include<Geom_Hyperbola.hxx>
#include<Geom_Line.hxx>
#include<Geom_OffsetCurve.hxx>
#include<Geom_OffsetSurface.hxx>
#include<Geom_OsculatingSurface.hxx>
#include<Geom_Parabola.hxx>
#include<Geom_Plane.hxx>
#include<Geom_Point.hxx>
#include<Geom_RectangularTrimmedSurface.hxx>
#include<Geom_SequenceNodeOfSequenceOfBSplineSurface.hxx>
#include<Geom_SequenceOfBSplineSurface.hxx>
#include<Geom_SphericalSurface.hxx>
#include<Geom_Surface.hxx>
#include<Geom_SurfaceOfLinearExtrusion.hxx>
#include<Geom_SurfaceOfRevolution.hxx>
#include<Geom_SweptSurface.hxx>
#include<Geom_ToroidalSurface.hxx>
#include<Geom_Transformation.hxx>
#include<Geom_TrimmedCurve.hxx>
#include<Geom_UndefinedDerivative.hxx>
#include<Geom_UndefinedValue.hxx>
#include<Geom_Vector.hxx>
#include<Geom_VectorWithMagnitude.hxx>
#include<GeomAdaptor.hxx>
#include<GeomAdaptor_Curve.hxx>
#include<GeomAdaptor_GHCurve.hxx>
#include<GeomAdaptor_GHSurface.hxx>
#include<GeomAdaptor_HCurve.hxx>
#include<GeomAdaptor_HSurface.hxx>
#include<GeomAdaptor_Surface.hxx>
#include<Geom2d_AxisPlacement.hxx>
#include<Geom2d_BezierCurve.hxx>
#include<Geom2d_BoundedCurve.hxx>
#include<Geom2d_BSplineCurve.hxx>
#include<Geom2d_CartesianPoint.hxx>
#include<Geom2d_Circle.hxx>
#include<Geom2d_Conic.hxx>
#include<Geom2d_Curve.hxx>
#include<Geom2d_Direction.hxx>
#include<Geom2d_Ellipse.hxx>
#include<Geom2d_Geometry.hxx>
#include<Geom2d_Hyperbola.hxx>
#include<Geom2d_Line.hxx>
#include<Geom2d_OffsetCurve.hxx>
#include<Geom2d_Parabola.hxx>
#include<Geom2d_Point.hxx>
#include<Geom2d_Transformation.hxx>
#include<Geom2d_TrimmedCurve.hxx>
#include<Geom2d_UndefinedDerivative.hxx>
#include<Geom2d_UndefinedValue.hxx>
#include<Geom2d_Vector.hxx>
#include<Geom2d_VectorWithMagnitude.hxx>
#include<gp.hxx>
#include<gp_Ax1.hxx>
#include<gp_Ax2.hxx>
#include<gp_Ax22d.hxx>
#include<gp_Ax2d.hxx>
#include<gp_Ax3.hxx>
#include<gp_Circ.hxx>
#include<gp_Circ2d.hxx>
#include<gp_Cone.hxx>
#include<gp_Cylinder.hxx>
#include<gp_Dir.hxx>
#include<gp_Dir2d.hxx>
#include<gp_Elips.hxx>
#include<gp_Elips2d.hxx>
#include<gp_EulerSequence.hxx>
#include<gp_GTrsf.hxx>
#include<gp_GTrsf2d.hxx>
#include<gp_Hypr.hxx>
#include<gp_Hypr2d.hxx>
#include<gp_Lin.hxx>
#include<gp_Lin2d.hxx>
#include<gp_Mat.hxx>
#include<gp_Mat2d.hxx>
#include<gp_Parab.hxx>
#include<gp_Parab2d.hxx>
#include<gp_Pln.hxx>
#include<gp_Pnt.hxx>
#include<gp_Pnt2d.hxx>
#include<gp_Quaternion.hxx>
#include<gp_QuaternionNLerp.hxx>
#include<gp_QuaternionSLerp.hxx>
#include<gp_Sphere.hxx>
#include<gp_Torus.hxx>
#include<gp_Trsf.hxx>
#include<gp_Trsf2d.hxx>
#include<gp_TrsfForm.hxx>
#include<gp_Vec.hxx>
#include<gp_Vec2d.hxx>
#include<gp_VectorWithNullMagnitude.hxx>
#include<gp_XY.hxx>
#include<gp_XYZ.hxx>
#include<Adaptor3d_Curve.hxx>
#include<Adaptor3d_CurveOnSurface.hxx>
#include<Adaptor3d_CurveOnSurfacePtr.hxx>
#include<Adaptor3d_CurvePtr.hxx>
#include<Adaptor3d_HCurve.hxx>
#include<Adaptor3d_HCurveOnSurface.hxx>
#include<Adaptor3d_HIsoCurve.hxx>
#include<Adaptor3d_HOffsetCurve.hxx>
#include<Adaptor3d_HSurface.hxx>
#include<Adaptor3d_HSurfaceOfLinearExtrusion.hxx>
#include<Adaptor3d_HSurfaceOfRevolution.hxx>
#include<Adaptor3d_HSurfaceTool.hxx>
#include<Adaptor3d_HVertex.hxx>
#include<Adaptor3d_InterFunc.hxx>
#include<Adaptor3d_IsoCurve.hxx>
#include<Adaptor3d_OffsetCurve.hxx>
#include<Adaptor3d_Surface.hxx>
#include<Adaptor3d_SurfaceOfLinearExtrusion.hxx>
#include<Adaptor3d_SurfaceOfRevolution.hxx>
#include<Adaptor3d_SurfacePtr.hxx>
#include<Adaptor3d_TopolTool.hxx>
#include<IntPatch_ALine.hxx>
#include<IntPatch_ALineToWLine.hxx>
#include<IntPatch_ArcFunction.hxx>
#include<IntPatch_CSFunction.hxx>
#include<IntPatch_CurvIntSurf.hxx>
#include<IntPatch_GLine.hxx>
#include<IntPatch_HCurve2dTool.hxx>
#include<IntPatch_HInterTool.hxx>
#include<IntPatch_ImpImpIntersection.hxx>
#include<IntPatch_ImpPrmIntersection.hxx>
#include<IntPatch_InterferencePolyhedron.hxx>
#include<IntPatch_Intersection.hxx>
#include<IntPatch_IType.hxx>
#include<IntPatch_Line.hxx>
#include<IntPatch_LineConstructor.hxx>
#include<IntPatch_Point.hxx>
#include<IntPatch_PolyArc.hxx>
#include<IntPatch_Polygo.hxx>
#include<IntPatch_Polyhedron.hxx>
#include<IntPatch_PolyLine.hxx>
#include<IntPatch_PrmPrmIntersection.hxx>
#include<IntPatch_PrmPrmIntersection_T3Bits.hxx>
#include<IntPatch_RLine.hxx>
#include<IntPatch_RstInt.hxx>
#include<IntPatch_SearchPnt.hxx>
#include<IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking.hxx>
#include<IntPatch_SequenceNodeOfSequenceOfLine.hxx>
#include<IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds.hxx>
#include<IntPatch_SequenceNodeOfSequenceOfPoint.hxx>
#include<IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds.hxx>
#include<IntPatch_SequenceOfIWLineOfTheIWalking.hxx>
#include<IntPatch_SequenceOfLine.hxx>
#include<IntPatch_SequenceOfPathPointOfTheSOnBounds.hxx>
#include<IntPatch_SequenceOfPoint.hxx>
#include<IntPatch_SequenceOfSegmentOfTheSOnBounds.hxx>
#include<IntPatch_TheIWalking.hxx>
#include<IntPatch_TheIWLineOfTheIWalking.hxx>
#include<IntPatch_ThePathPointOfTheSOnBounds.hxx>
#include<IntPatch_TheSearchInside.hxx>
#include<IntPatch_TheSegmentOfTheSOnBounds.hxx>
#include<IntPatch_TheSOnBounds.hxx>
#include<IntPatch_TheSurfFunction.hxx>
#include<IntPatch_WLine.hxx>
#include<TopAbs.hxx>
#include<TopAbs_Orientation.hxx>
#include<TopAbs_ShapeEnum.hxx>
#include<TopAbs_State.hxx>
#include<TCollection.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<Approx_Array1OfAdHSurface.hxx>
#include<Approx_Array1OfGTrsf2d.hxx>
#include<Approx_Curve2d.hxx>
#include<Approx_Curve3d.hxx>
#include<Approx_CurveOnSurface.hxx>
#include<Approx_CurvilinearParameter.hxx>
#include<Approx_CurvlinFunc.hxx>
#include<Approx_FitAndDivide.hxx>
#include<Approx_FitAndDivide2d.hxx>
#include<Approx_HArray1OfAdHSurface.hxx>
#include<Approx_HArray1OfGTrsf2d.hxx>
#include<Approx_MCurvesToBSpCurve.hxx>
#include<Approx_MyLeastSquareOfFitAndDivide.hxx>
#include<Approx_MyLeastSquareOfFitAndDivide2d.hxx>
#include<Approx_ParametrizationType.hxx>
#include<Approx_SameParameter.hxx>
#include<Approx_SequenceNodeOfSequenceOfHArray1OfReal.hxx>
#include<Approx_SequenceOfHArray1OfReal.hxx>
#include<Approx_Status.hxx>
#include<Approx_SweepApproximation.hxx>
#include<Approx_SweepFunction.hxx>
#include<IntImp_ComputeTangence.hxx>
#include<IntImp_ConstIsoparametric.hxx>
#include<ApproxInt_SvSurfaces.hxx>
#include<IntSurf.hxx>
#include<IntSurf_Allocator.hxx>
#include<IntSurf_Couple.hxx>
#include<IntSurf_InteriorPoint.hxx>
#include<IntSurf_InteriorPointTool.hxx>
#include<IntSurf_LineOn2S.hxx>
#include<IntSurf_ListIteratorOfListOfPntOn2S.hxx>
#include<IntSurf_ListNodeOfListOfPntOn2S.hxx>
#include<IntSurf_ListOfPntOn2S.hxx>
#include<IntSurf_PathPoint.hxx>
#include<IntSurf_PathPointTool.hxx>
#include<IntSurf_PntOn2S.hxx>
#include<IntSurf_Quadric.hxx>
#include<IntSurf_QuadricTool.hxx>
#include<IntSurf_SequenceNodeOfSequenceOfCouple.hxx>
#include<IntSurf_SequenceNodeOfSequenceOfInteriorPoint.hxx>
#include<IntSurf_SequenceNodeOfSequenceOfPathPoint.hxx>
#include<IntSurf_SequenceOfCouple.hxx>
#include<IntSurf_SequenceOfInteriorPoint.hxx>
#include<IntSurf_SequenceOfPathPoint.hxx>
#include<IntSurf_SequenceOfPntOn2S.hxx>
#include<IntSurf_Situation.hxx>
#include<IntSurf_Transition.hxx>
#include<IntSurf_TypeTrans.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXY.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<Bnd_Array1OfBox.hxx>
#include<Bnd_Array1OfBox2d.hxx>
#include<Bnd_Array1OfSphere.hxx>
#include<Bnd_B2d.hxx>
#include<Bnd_B2f.hxx>
#include<Bnd_B3d.hxx>
#include<Bnd_B3f.hxx>
#include<Bnd_BoundSortBox.hxx>
#include<Bnd_BoundSortBox2d.hxx>
#include<Bnd_Box.hxx>
#include<Bnd_Box2d.hxx>
#include<Bnd_HArray1OfBox.hxx>
#include<Bnd_HArray1OfBox2d.hxx>
#include<Bnd_HArray1OfSphere.hxx>
#include<Bnd_SeqOfBox.hxx>
#include<Bnd_SequenceNodeOfSeqOfBox.hxx>
#include<Bnd_Sphere.hxx>
#include<IntAna_Curve.hxx>
#include<IntAna_Int3Pln.hxx>
#include<IntAna_IntConicQuad.hxx>
#include<IntAna_IntLinTorus.hxx>
#include<IntAna_IntQuadQuad.hxx>
#include<IntAna_ListIteratorOfListOfCurve.hxx>
#include<IntAna_ListNodeOfListOfCurve.hxx>
#include<IntAna_ListOfCurve.hxx>
#include<IntAna_QuadQuadGeo.hxx>
#include<IntAna_Quadric.hxx>
#include<IntAna_ResultType.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXY.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_ListNodeOfListOfAsciiString.hxx>
#include<TColStd_ListNodeOfListOfInteger.hxx>
#include<TColStd_ListNodeOfListOfReal.hxx>
#include<TColStd_ListNodeOfListOfTransient.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include<TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include<TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include<TColStd_StdMapNodeOfMapOfInteger.hxx>
#include<TColStd_StdMapNodeOfMapOfReal.hxx>
#include<TColStd_StdMapNodeOfMapOfTransient.hxx>
#include<TCollection.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<Storage.hxx>
#include<Storage_ArrayOfCallBack.hxx>
#include<Storage_ArrayOfSchema.hxx>
#include<Storage_BaseDriver.hxx>
#include<Storage_BucketOfPersistent.hxx>
#include<Storage_CallBack.hxx>
#include<Storage_Container.hxx>
#include<Storage_Data.hxx>
#include<Storage_DataMapIteratorOfMapOfCallBack.hxx>
#include<Storage_DataMapIteratorOfMapOfPers.hxx>
#include<Storage_DataMapNodeOfMapOfCallBack.hxx>
#include<Storage_DataMapNodeOfMapOfPers.hxx>
#include<Storage_DefaultCallBack.hxx>
#include<Storage_Error.hxx>
#include<Storage_HArrayOfCallBack.hxx>
#include<Storage_HArrayOfSchema.hxx>
#include<Storage_HeaderData.hxx>
#include<Storage_HPArray.hxx>
#include<Storage_HSeqOfRoot.hxx>
#include<Storage_IndexedDataMapNodeOfPType.hxx>
#include<Storage_InternalData.hxx>
#include<Storage_Macros.hxx>
#include<Storage_MapOfCallBack.hxx>
#include<Storage_MapOfPers.hxx>
#include<Storage_OpenMode.hxx>
#include<Storage_PArray.hxx>
#include<Storage_Position.hxx>
#include<Storage_PType.hxx>
#include<Storage_Root.hxx>
#include<Storage_RootData.hxx>
#include<Storage_Schema.hxx>
#include<Storage_SeqOfRoot.hxx>
#include<Storage_SequenceNodeOfSeqOfRoot.hxx>
#include<Storage_SolveMode.hxx>
#include<Storage_stCONSTclCOM.hxx>
#include<Storage_StreamExtCharParityError.hxx>
#include<Storage_StreamFormatError.hxx>
#include<Storage_StreamModeError.hxx>
#include<Storage_StreamReadError.hxx>
#include<Storage_StreamTypeMismatchError.hxx>
#include<Storage_StreamWriteError.hxx>
#include<Storage_TypeData.hxx>
#include<Storage_TypedCallBack.hxx>
%};
%import Standard.i
%import math.i
%import AppParCurves.i
%import TColStd.i
%import Geom.i
%import GeomAdaptor.i
%import Geom2d.i
%import gp.i
%import Adaptor3d.i
%import IntPatch.i
%import TopAbs.i
%import TCollection.i
%import Approx.i
%import IntImp.i
%import ApproxInt.i
%import IntSurf.i
%import TColgp.i
