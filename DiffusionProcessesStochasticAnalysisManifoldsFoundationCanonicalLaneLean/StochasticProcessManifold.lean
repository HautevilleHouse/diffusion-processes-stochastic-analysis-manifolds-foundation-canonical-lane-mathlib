import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticProcessManifold where
  stateSpace : Type u
  timeDomain : Type v
  sigmaAlgebra : Set (Set stateSpace)
  transitionProbability : stateSpace → Set stateSpace → ℝ
  markovProperty : Prop
  sampleContinuity : Prop
  adaptedToFiltration : Prop

structure StochasticProcessManifoldEvidence (M : StochasticProcessManifold) where
  markovPropertyClosed : M.markovProperty
  sampleContinuityClosed : M.sampleContinuity
  adaptedToFiltrationClosed : M.adaptedToFiltration

def StochasticProcessManifoldClosed (M : StochasticProcessManifold) : Prop :=
  M.markovProperty ∧ M.sampleContinuity ∧ M.adaptedToFiltration

theorem stochastic_process_manifold_closed_from_evidence
    (M : StochasticProcessManifold) (E : StochasticProcessManifoldEvidence M) :
    StochasticProcessManifoldClosed M := by
  exact And.intro E.markovPropertyClosed (And.intro E.sampleContinuityClosed E.adaptedToFiltrationClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse