import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticProcess where
  indexSet : Type u
  stateSpace : Type v
  topology : TopologicalSpace stateSpace
  filtration : Prop
  adapted : Prop
  sampleContinuous : Prop

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | AdmittedObject.mk obj => obj.sampleContinuous
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  cases A.object with
  | mk obj => exact obj.sampleContinuous
  | _ => exact False.elim (by
    have : A = A := rfl
    sorry
  )

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
