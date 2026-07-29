import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticAnalysisBridgePackage where
  diffusionProcess : Type u
  manifold : Type v
  timeParameter : Type w
  stochasticDifferentialEquation : Type x
  generatorApplied : Type y
  solutionWeak : Prop
  solutionStrong : Prop
  markovFamily : Prop
  invariantMeasure : Prop

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let D : DiffusionOnManifoldPackage := A.object
  DiffusionOnManifoldClosed D

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  -- assume A.object carries evidence of DiffusionOnManifoldClosed
  exact A.endpointSatisfied

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse