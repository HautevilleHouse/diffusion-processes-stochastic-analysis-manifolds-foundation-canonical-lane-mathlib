import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.StochasticDifferentialEquations

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure DiffusionProcessPackage {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} (D : SDEPackage I) where
  initialCondition : Type u
  invariantMeasure : Type v
  ergodicity : Prop
  mixingProperties : Prop

structure DiffusionProcessEvidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} (P : DiffusionProcessPackage D) where
  ergodicityClosed : P.ergodicity
  mixingPropertiesClosed : P.mixingProperties

def DiffusionProcessClosed {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} (P : DiffusionProcessPackage D) : Prop :=
  P.ergodicity ∧ P.mixingProperties

theorem diffusion_process_closed_from_evidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} (P : DiffusionProcessPackage D) (E : DiffusionProcessEvidence P) : DiffusionProcessClosed P := by
  exact And.intro E.ergodicityClosed E.mixingPropertiesClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse