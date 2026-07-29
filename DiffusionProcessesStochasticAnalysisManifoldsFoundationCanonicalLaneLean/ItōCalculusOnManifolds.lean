import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure ItōCalculusOnManifolds where
  baseManifold : Type u
  smoothStructure : TopologicalSpace baseManifold
  semimartingaleProcess : Set (StochasticProcess baseManifold)
  itōFormulaHolds : Prop
  quadraticVariationDefined : Prop
  stochasticIntegralDefined : Prop

structure ItōCalculusOnManifoldsEvidence (I : ItōCalculusOnManifolds) where
  itōFormulaHoldsClosed : I.itōFormulaHolds
  quadraticVariationDefinedClosed : I.quadraticVariationDefined
  stochasticIntegralDefinedClosed : I.stochasticIntegralDefined

def ItōCalculusOnManifoldsClosed (I : ItōCalculusOnManifolds) : Prop :=
  I.itōFormulaHolds ∧ I.quadraticVariationDefined ∧ I.stochasticIntegralDefined

theorem itō_calculus_on_manifolds_closed_from_evidence
    (I : ItōCalculusOnManifolds) (E : ItōCalculusOnManifoldsEvidence I) :
    ItōCalculusOnManifoldsClosed I := by
  exact And.intro E.itōFormulaHoldsClosed (And.intro E.quadraticVariationDefinedClosed E.stochasticIntegralDefinedClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse