import Mathlib

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure AdmittedObject where
  stochasticProcess : Type u
  manifold : Type v
  manifoldTopology : TopologicalSpace manifold
  diffusionExists : Prop
  diffusionUnique : Prop
  sampleContinuous : Prop
  conclusion : sampleContinuous

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.sampleContinuous ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
