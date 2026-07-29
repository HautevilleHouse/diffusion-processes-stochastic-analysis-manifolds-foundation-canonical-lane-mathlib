import canonicalLaneMathlib.AdmissibleClass
import DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.StochasticDifferentialEquation

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure ItoDiffusion (M : Type u) [TopologicalSpace M] where
  sde : StochasticDifferentialEquation M
  itoIntegralWellDefined : Prop
  itoFormula : Prop
  itoIntegralWellDefinedTerm : itoIntegralWellDefined
  itoFormulaTerm : itoFormula

structure ItoDiffusionEvidence (I : ItoDiffusion M) where
  itoIntegralWellDefinedClosed : I.itoIntegralWellDefined
  itoFormulaClosed : I.itoFormula

def ItoDiffusionClosed (I : ItoDiffusion M) : Prop :=
  I.itoIntegralWellDefined ∧ I.itoFormula

theorem ito_diffusion_closed_from_evidence (I : ItoDiffusion M) (E : ItoDiffusionEvidence I) : ItoDiffusionClosed I := by
  exact And.intro E.itoIntegralWellDefinedClosed E.itoFormulaClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
