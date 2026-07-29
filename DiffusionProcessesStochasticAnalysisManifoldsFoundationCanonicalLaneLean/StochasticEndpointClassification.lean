import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.StochasticFlowPackage

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticEndpointClassificationPackage {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} (F : StochasticFlowPackage P) where
  targetManifold : Type u
  targetTopology : TopologicalSpace targetManifold
  invariantMeasureEndpoint : Prop
  ergodicDecomposition : Prop
  endpointMatchesManifoldConjecture : Prop

structure StochasticEndpointClassificationEvidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} {F : StochasticFlowPackage P} (E : StochasticEndpointClassificationPackage F) where
  invariantMeasureEndpointClosed : E.invariantMeasureEndpoint
  ergodicDecompositionClosed : E.ergodicDecomposition
  endpointMatchesManifoldConjectureClosed : E.endpointMatchesManifoldConjecture

def StochasticEndpointClassificationClosed {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} {F : StochasticFlowPackage P} (E : StochasticEndpointClassificationPackage F) : Prop :=
  E.invariantMeasureEndpoint ∧ E.ergodicDecomposition ∧ E.endpointMatchesManifoldConjecture

theorem stochastic_endpoint_classification_closed_from_evidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} {D : SDEPackage I} {P : DiffusionProcessPackage D} {F : StochasticFlowPackage P} (E : StochasticEndpointClassificationPackage F) (Ev : StochasticEndpointClassificationEvidence E) : StochasticEndpointClassificationClosed E := by
  exact And.intro Ev.invariantMeasureEndpointClosed (And.intro Ev.ergodicDecompositionClosed Ev.endpointMatchesManifoldConjectureClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse