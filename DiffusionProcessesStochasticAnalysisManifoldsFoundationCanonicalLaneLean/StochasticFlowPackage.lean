import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.DiffusionBridge

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticFlowPackage {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} (P : DiffusionProcessPackage D) where
  flowMap : Type u
  flowProperty : Prop
  stochasticDiffeomorphism : Prop

structure StochasticFlowEvidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} (F : StochasticFlowPackage P) where
  flowPropertyClosed : F.flowProperty
  stochasticDiffeomorphismClosed : F.stochasticDiffeomorphism

def StochasticFlowClosed {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} (F : StochasticFlowPackage P) : Prop :=
  F.flowProperty ∧ F.stochasticDiffeomorphism

theorem stochastic_flow_closed_from_evidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} (F : StochasticFlowPackage P) (E : StochasticFlowEvidence F) : StochasticFlowClosed F := by
  exact And.intro E.flowPropertyClosed E.stochasticDiffeomorphismClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse