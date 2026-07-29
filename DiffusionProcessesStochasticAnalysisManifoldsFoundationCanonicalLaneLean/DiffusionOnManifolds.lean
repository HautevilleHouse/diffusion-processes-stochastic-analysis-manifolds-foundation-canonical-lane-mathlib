import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure DiffusionOnManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothAtlas : Type v
  metric : Type w
  connection : Type x
  ricciTensor : Type y
  laplaceBeltrami : Type z
  diffusionGenerator : Type z
  manifoldDimension : Prop
  metricSmooth : Prop
  connectionMetricCompatible : Prop
  diffusionGeneratorSecondOrder : Prop
  underlyingRiemannianStructure : Prop

structure DiffusionOnManifoldEvidence (D : DiffusionOnManifoldPackage) where
  manifoldDimensionClosed : D.manifoldDimension
  metricSmoothClosed : D.metricSmooth
  connectionMetricCompatibleClosed : D.connectionMetricCompatible
  diffusionGeneratorSecondOrderClosed : D.diffusionGeneratorSecondOrder
  underlyingRiemannianStructureClosed : D.underlyingRiemannianStructure

def DiffusionOnManifoldClosed (D : DiffusionOnManifoldPackage) : Prop :=
  D.manifoldDimension ∧ D.metricSmooth ∧ D.connectionMetricCompatible ∧
  D.diffusionGeneratorSecondOrder ∧ D.underlyingRiemannianStructure

theorem diffusion_on_manifold_closed_from_evidence
    (D : DiffusionOnManifoldPackage) (E : DiffusionOnManifoldEvidence D) :
    DiffusionOnManifoldClosed D := by
  exact And.intro E.manifoldDimensionClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.connectionMetricCompatibleClosed
        (And.intro E.diffusionGeneratorSecondOrderClosed
          E.underlyingRiemannianStructureClosed)))

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse