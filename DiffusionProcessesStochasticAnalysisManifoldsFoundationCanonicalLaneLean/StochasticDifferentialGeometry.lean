import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure StochasticRiemannianStructure where
  manifold : Type u
  metric : Type v
  connection : Type w
  brownianMotion : Type x
  metricSmooth : Prop
  connectionTorsionFree : Prop
  connectionMetricCompatible : Prop
  brownianGeneratedByLaplacian : Prop

structure StochasticRiemannianEvidence (S : StochasticRiemannianStructure) where
  metricSmoothClosed : S.metricSmooth
  connectionTorsionFreeClosed : S.connectionTorsionFree
  connectionMetricCompatibleClosed : S.connectionMetricCompatible
  brownianGeneratedByLaplacianClosed : S.brownianGeneratedByLaplacian

def StochasticRiemannianClosed (S : StochasticRiemannianStructure) : Prop :=
  S.metricSmooth ∧ S.connectionTorsionFree ∧ S.connectionMetricCompatible ∧ S.brownianGeneratedByLaplacian

theorem stochastic_riemannian_closed_from_evidence (S : StochasticRiemannianStructure) (E : StochasticRiemannianEvidence S) : StochasticRiemannianClosed S := by
  exact And.intro E.metricSmoothClosed (And.intro E.connectionTorsionFreeClosed (And.intro E.connectionMetricCompatibleClosed E.brownianGeneratedByLaplacianClosed))

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse