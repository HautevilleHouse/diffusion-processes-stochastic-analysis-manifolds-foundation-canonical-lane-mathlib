import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure ItoDiffusionOnManifoldsPackage {M : Type u} [SmoothManifold M] where
  manifold : M
  sdeData : Type v
  diffusionCoefficient : sdeData → (M → TM)
  driftTerm : sdeData → (M → TM)
  localExistenceStrongSolution : Prop
  uniquenessInLaw : Prop
  markovProperty : Prop
  samplePathContinuity : Prop
  fellerProperty : Prop

structure ItoDiffusionOnManifoldsEvidence {M : Type u} [SmoothManifold M]
  (P : ItoDiffusionOnManifoldsPackage M) where
  localExistenceStrongSolutionClosed : P.localExistenceStrongSolution
  uniquenessInLawClosed : P.uniquenessInLaw
  markovPropertyClosed : P.markovProperty
  samplePathContinuityClosed : P.samplePathContinuity
  fellerPropertyClosed : P.fellerProperty

def ItoDiffusionOnManifoldsClosed {M : Type u} [SmoothManifold M]
  (P : ItoDiffusionOnManifoldsPackage M) : Prop :=
  P.localExistenceStrongSolution ∧ P.uniquenessInLaw ∧
  P.markovProperty ∧ P.samplePathContinuity ∧ P.fellerProperty

theorem ito_diffusion_on_manifolds_closed_from_evidence
  {M : Type u} [SmoothManifold M]
  (P : ItoDiffusionOnManifoldsPackage M) (E : ItoDiffusionOnManifoldsEvidence P) :
  ItoDiffusionOnManifoldsClosed P := by
  exact And.intro E.localExistenceStrongSolutionClosed
    (And.intro E.uniquenessInLawClosed
      (And.intro E.markovPropertyClosed
        (And.intro E.samplePathContinuityClosed E.fellerPropertyClosed)))

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse