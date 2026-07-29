import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

def ConstrainedStochasticAnalysisClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_stochastic_analysis_endgame (A : AdmissibleClass) :
    ConstrainedStochasticAnalysisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse