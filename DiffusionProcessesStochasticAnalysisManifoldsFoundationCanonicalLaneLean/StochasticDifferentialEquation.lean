import canonicalLaneMathlib.AdmissibleClass
import DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.StochasticProcessBridge

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticDifferentialEquation (M : Type u) [TopologicalSpace M] where
  drift : M → M
  diffusion : M → M → M
  initialCondition : M
  solution : StochasticProcess
  driftSmooth : Prop
  diffusionSmooth : Prop
  solutionExists : Prop
  solutionUnique : Prop

structure SDEAdmissibleClass (M : Type u) [TopologicalSpace M] where
  sde : StochasticDifferentialEquation M
  driftSmoothClosed : sde.driftSmooth
  diffusionSmoothClosed : sde.diffusionSmooth
  solutionExistsClosed : sde.solutionExists
  solutionUniqueClosed : sde.solutionUnique

def SDEBridgeClosed (A : SDEAdmissibleClass M) : Prop :=
  A.driftSmoothClosed ∧ A.diffusionSmoothClosed ∧ A.solutionExistsClosed ∧ A.solutionUniqueClosed

theorem sde_bridge_closed (A : SDEAdmissibleClass M) : SDEBridgeClosed A := by
  exact And.intro A.driftSmoothClosed (And.intro A.diffusionSmoothClosed (And.intro A.solutionExistsClosed A.solutionUniqueClosed))

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
