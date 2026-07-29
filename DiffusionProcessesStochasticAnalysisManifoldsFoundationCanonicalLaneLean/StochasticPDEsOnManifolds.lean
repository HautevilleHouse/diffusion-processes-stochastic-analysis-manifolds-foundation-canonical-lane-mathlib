import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticPDEsOnManifoldsPackage {M : Type u} [RiemannianManifold M] where
  manifold : M
  noiseTerm : Type v
  driftNonlinearity : Type w
  localStrongSolution : Prop
  uniquenessInLaw : Prop
  ergodicityProperties : Prop
  invariantMeasureExistence : Prop
  spectralGapEstimate : Prop

structure StochasticPDEsOnManifoldsEvidence {M : Type u} [RiemannianManifold M]
  (P : StochasticPDEsOnManifoldsPackage M) where
  localStrongSolutionClosed : P.localStrongSolution
  uniquenessInLawClosed : P.uniquenessInLaw
  ergodicityPropertiesClosed : P.ergodicityProperties
  invariantMeasureExistenceClosed : P.invariantMeasureExistence
  spectralGapEstimateClosed : P.spectralGapEstimate

def StochasticPDEsOnManifoldsClosed {M : Type u} [RiemannianManifold M]
  (P : StochasticPDEsOnManifoldsPackage M) : Prop :=
  P.localStrongSolution ∧ P.uniquenessInLaw ∧
  P.ergodicityProperties ∧ P.invariantMeasureExistence ∧ P.spectralGapEstimate

theorem stochastic_pdes_on_manifolds_closed_from_evidence
  {M : Type u} [RiemannianManifold M]
  (P : StochasticPDEsOnManifoldsPackage M) (E : StochasticPDEsOnManifoldsEvidence P) :
  StochasticPDEsOnManifoldsClosed P := by
  exact And.intro E.localStrongSolutionClosed
    (And.intro E.uniquenessInLawClosed
      (And.intro E.ergodicityPropertiesClosed
        (And.intro E.invariantMeasureExistenceClosed E.spectralGapEstimateClosed)))

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse