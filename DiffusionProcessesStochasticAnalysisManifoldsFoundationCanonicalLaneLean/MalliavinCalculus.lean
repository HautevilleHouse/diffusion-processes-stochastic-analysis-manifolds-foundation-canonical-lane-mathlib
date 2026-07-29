import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure MalliavinCalculus where
  wienerSpace : ProbabilitySpace
  malliavinDerivative : LinearOperator (WienerFunctionals) (SquareIntegrable)
  ornsteinUhlenbeckOperator : SelfAdjointOperator
  sobolevSpaces : Set (FunctionSpace)
  cltForMalliavin : Prop
  smoothDensityResult : Prop

structure MalliavinCalculusEvidence (M : MalliavinCalculus) where
  cltForMalliavinClosed : M.cltForMalliavin
  smoothDensityResultClosed : M.smoothDensityResult

def MalliavinCalculusClosed (M : MalliavinCalculus) : Prop :=
  M.cltForMalliavin ∧ M.smoothDensityResult

theorem malliavin_calculus_closed_from_evidence
    (M : MalliavinCalculus) (E : MalliavinCalculusEvidence M) :
    MalliavinCalculusClosed M := by
  exact And.intro E.cltForMalliavinClosed E.smoothDensityResultClosed

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse