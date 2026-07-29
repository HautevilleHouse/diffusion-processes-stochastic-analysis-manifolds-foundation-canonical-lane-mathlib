import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure ItoCalculusManifoldPackage where
  stochasticIntegral : Type u
  itoFormula : Prop
  manifoldAdapted : Prop
  martingaleRepresentation : Prop

structure ItoCalculusManifoldEvidence (I : ItoCalculusManifoldPackage) where
  itoFormulaClosed : I.itoFormula
  manifoldAdaptedClosed : I.manifoldAdapted
  martingaleRepresentationClosed : I.martingaleRepresentation

def ItoCalculusManifoldClosed (I : ItoCalculusManifoldPackage) : Prop :=
  I.itoFormula ∧ I.manifoldAdapted ∧ I.martingaleRepresentation

theorem ito_calculus_manifold_closed_from_evidence (I : ItoCalculusManifoldPackage)
    (E : ItoCalculusManifoldEvidence I) : ItoCalculusManifoldClosed I := by
  exact And.intro E.itoFormulaClosed (And.intro E.manifoldAdaptedClosed E.martingaleRepresentationClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
