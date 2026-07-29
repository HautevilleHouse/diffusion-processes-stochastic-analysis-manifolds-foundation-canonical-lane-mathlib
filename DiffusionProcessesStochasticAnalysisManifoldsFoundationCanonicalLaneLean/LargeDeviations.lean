import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure LargeDeviationsPackage where
  rateFunction : Type u
  largeDeviationPrinciple : Prop
  laplaceApproximation : Prop
  samplePathLargeDeviations : Prop

structure LargeDeviationsEvidence (L : LargeDeviationsPackage) where
  largeDeviationPrincipleClosed : L.largeDeviationPrinciple
  laplaceApproximationClosed : L.laplaceApproximation
  samplePathLargeDeviationsClosed : L.samplePathLargeDeviations

def LargeDeviationsClosed (L : LargeDeviationsPackage) : Prop :=
  L.largeDeviationPrinciple ∧ L.laplaceApproximation ∧ L.samplePathLargeDeviations

theorem large_deviations_closed_from_evidence (L : LargeDeviationsPackage)
    (E : LargeDeviationsEvidence L) : LargeDeviationsClosed L := by
  exact And.intro E.largeDeviationPrincipleClosed (And.intro E.laplaceApproximationClosed E.samplePathLargeDeviationsClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
