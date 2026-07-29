import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  StochasticProcessManifoldClosed A.object.process ∧
  DiffusionGeneratorClosed A.object.generator ∧
  StochasticDifferentialEquationClosed A.object.sde

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact And.intro (And.intro A.object.processClosed A.object.generatorClosed) A.object.sdeClosed

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse