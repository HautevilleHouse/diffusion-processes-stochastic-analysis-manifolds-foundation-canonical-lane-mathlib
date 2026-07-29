import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.StochasticDifferentialGeometry

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure ItoIntegralPackage (S : StochasticRiemannianStructure) where
  integrandSpace : Type u
  integralMap : Type v
  adaptedProcess : Prop
  itoIsometry : Prop
  martingaleProperty : Prop

structure ItoIntegralEvidence {S : StochasticRiemannianStructure} (I : ItoIntegralPackage S) where
  adaptedProcessClosed : I.adaptedProcess
  itoIsometryClosed : I.itoIsometry
  martingalePropertyClosed : I.martingaleProperty

def ItoIntegralClosed {S : StochasticRiemannianStructure} (I : ItoIntegralPackage S) : Prop :=
  I.adaptedProcess ∧ I.itoIsometry ∧ I.martingaleProperty

theorem ito_integral_closed_from_evidence {S : StochasticRiemannianStructure} (I : ItoIntegralPackage S) (E : ItoIntegralEvidence I) : ItoIntegralClosed I := by
  exact And.intro E.adaptedProcessClosed (And.intro E.itoIsometryClosed E.martingalePropertyClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse