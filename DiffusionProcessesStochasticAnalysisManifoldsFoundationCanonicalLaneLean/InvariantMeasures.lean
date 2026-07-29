import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure InvariantMeasuresPackage where
  transitionSemigroup : Type u
  stationaryMeasure : Prop
  ergodicity : Prop
  uniqueness : Prop

structure InvariantMeasuresEvidence (I : InvariantMeasuresPackage) where
  stationaryMeasureClosed : I.stationaryMeasure
  ergodicityClosed : I.ergodicity
  uniquenessClosed : I.uniqueness

def InvariantMeasuresClosed (I : InvariantMeasuresPackage) : Prop :=
  I.stationaryMeasure ∧ I.ergodicity ∧ I.uniqueness

theorem invariant_measures_closed_from_evidence (I : InvariantMeasuresPackage)
    (E : InvariantMeasuresEvidence I) : InvariantMeasuresClosed I := by
  exact And.intro E.stationaryMeasureClosed (And.intro E.ergodicityClosed E.uniquenessClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
