import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure DiffusionGenerator where
  stateManifold : Type u
  smoothStructure : TopologicalSpace stateManifold
  secondOrderPart : TensorBundle stateManifold
  firstOrderPart : VectorField stateManifold
  ellipiticityCondition : Prop
  smoothCoefficients : Prop

structure DiffusionGeneratorEvidence (G : DiffusionGenerator) where
  ellipiticityConditionClosed : G.ellipiticityCondition
  smoothCoefficientsClosed : G.smoothCoefficients

def DiffusionGeneratorClosed (G : DiffusionGenerator) : Prop :=
  G.ellipiticityCondition ∧ G.smoothCoefficients

theorem diffusion_generator_closed_from_evidence
    (G : DiffusionGenerator) (E : DiffusionGeneratorEvidence G) :
    DiffusionGeneratorClosed G := by
  exact And.intro E.ellipiticityConditionClosed E.smoothCoefficientsClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse