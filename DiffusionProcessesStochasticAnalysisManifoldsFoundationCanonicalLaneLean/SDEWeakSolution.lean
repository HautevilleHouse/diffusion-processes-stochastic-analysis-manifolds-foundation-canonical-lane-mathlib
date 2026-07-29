import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure SDEWeakSolutionPackage where
  drift : Type u
  diffusion : Type v
  manifoldImage : StochasticManifoldPackage
  weakSolutionExists : Prop
  uniquenessInLaw : Prop

structure SDEWeakSolutionEvidence (S : SDEWeakSolutionPackage) where
  weakSolutionExistsClosed : S.weakSolutionExists
  uniquenessInLawClosed : S.uniquenessInLaw

def SDEWeakSolutionClosed (S : SDEWeakSolutionPackage) : Prop :=
  S.weakSolutionExists ∧ S.uniquenessInLaw

theorem sde_weak_solution_closed_from_evidence (S : SDEWeakSolutionPackage)
    (E : SDEWeakSolutionEvidence S) : SDEWeakSolutionClosed S := by
  exact And.intro E.weakSolutionExistsClosed E.uniquenessInLawClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
