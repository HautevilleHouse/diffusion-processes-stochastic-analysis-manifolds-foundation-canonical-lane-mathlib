import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticFlowsPackage where
  flowMap : Type u
  solutionFlow : Prop
  continuityInInitialCondition : Prop
  stochasticDiffeomorphismProperty : Prop

structure StochasticFlowsEvidence (F : StochasticFlowsPackage) where
  solutionFlowClosed : F.solutionFlow
  continuityInInitialConditionClosed : F.continuityInInitialCondition
  stochasticDiffeomorphismPropertyClosed : F.stochasticDiffeomorphismProperty

def StochasticFlowsClosed (F : StochasticFlowsPackage) : Prop :=
  F.solutionFlow ∧ F.continuityInInitialCondition ∧ F.stochasticDiffeomorphismProperty

theorem stochastic_flows_closed_from_evidence (F : StochasticFlowsPackage)
    (E : StochasticFlowsEvidence F) : StochasticFlowsClosed F := by
  exact And.intro E.solutionFlowClosed (And.intro E.continuityInInitialConditionClosed E.stochasticDiffeomorphismPropertyClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse
