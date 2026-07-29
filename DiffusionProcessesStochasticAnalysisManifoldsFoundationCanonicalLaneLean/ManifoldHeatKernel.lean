import canonicalLaneMathlib.AdmissibleClass
import DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.ItoDiffusion

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

open scoped Manifold

structure HeatKernel (M : Type u) [TopologicalSpace M] [RiemannianManifold M] where
  kernel : M → M → ℝ
  heatEquation : Prop
  shortTimeAsymptotic : Prop
  heatEquationTerm : heatEquation
  shortTimeAsymptoticTerm : shortTimeAsymptotic

structure HeatKernelEvidence (H : HeatKernel M) where
  heatEquationClosed : H.heatEquation
  shortTimeAsymptoticClosed : H.shortTimeAsymptotic

def HeatKernelClosed (H : HeatKernel M) : Prop :=
  H.heatEquation ∧ H.shortTimeAsymptotic

theorem heat_kernel_closed_from_evidence (H : HeatKernel M) (E : HeatKernelEvidence H) : HeatKernelClosed H := by
  exact And.intro E.heatEquationClosed E.shortTimeAsymptoticClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
