import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure ConvergenceModesPackage where
  strongConvergence : Prop
  weakConvergence : Prop
  uniformOnCompacts : Prop
  strongImpliesWeak : strongConvergence → weakConvergence
  weakImpliesUniformOnCompacts : weakConvergence → uniformOnCompacts

structure ConvergenceModesEvidence (C : ConvergenceModesPackage) where
  strongConvergenceClosed : C.strongConvergence
  weakConvergenceClosed : C.weakConvergence
  uniformOnCompactsClosed : C.uniformOnCompacts

def ConvergenceModesClosed (C : ConvergenceModesPackage) : Prop :=
  C.strongConvergence ∧ C.weakConvergence ∧ C.uniformOnCompacts

theorem convergence_modes_closed_from_evidence (C : ConvergenceModesPackage)
    (E : ConvergenceModesEvidence C) : ConvergenceModesClosed C := by
  exact And.intro E.strongConvergenceClosed (And.intro E.weakConvergenceClosed E.uniformOnCompactsClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
