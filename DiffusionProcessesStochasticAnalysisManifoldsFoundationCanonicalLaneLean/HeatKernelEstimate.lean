import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure HeatKernelEstimatePackage {M : Type u} [MetricSpace M] [RiemannianManifold M] where
  manifold : M
  metricTensor : RiemannianMetric M
  laplaceBeltramiOperator : (M → ℝ) → (M → ℝ)
  heatKernel : (t : ℝ≥0) → (x y : M) → ℝ
  gaussianUpperBound : Prop
  onDiagonalEstimates : Prop
  derivativeEstimates : Prop
  smallTimeAsymptotics : Prop
  heatKernelUpperBound : Prop

structure HeatKernelEstimateEvidence {M : Type u} [MetricSpace M] [RiemannianManifold M]
  (P : HeatKernelEstimatePackage M) where
  gaussianUpperBoundClosed : P.gaussianUpperBound
  onDiagonalEstimatesClosed : P.onDiagonalEstimates
  derivativeEstimatesClosed : P.derivativeEstimates
  smallTimeAsymptoticsClosed : P.smallTimeAsymptotics
  heatKernelUpperBoundClosed : P.heatKernelUpperBound

def HeatKernelEstimateClosed {M : Type u} [MetricSpace M] [RiemannianManifold M]
  (P : HeatKernelEstimatePackage M) : Prop :=
  P.gaussianUpperBound ∧ P.onDiagonalEstimates ∧ P.derivativeEstimates ∧
  P.smallTimeAsymptotics ∧ P.heatKernelUpperBound

theorem heat_kernel_estimate_closed_from_evidence
  {M : Type u} [MetricSpace M] [RiemannianManifold M]
  (P : HeatKernelEstimatePackage M) (E : HeatKernelEstimateEvidence P) :
  HeatKernelEstimateClosed P := by
  exact And.intro E.gaussianUpperBoundClosed
    (And.intro E.onDiagonalEstimatesClosed
      (And.intro E.derivativeEstimatesClosed
        (And.intro E.smallTimeAsymptoticsClosed E.heatKernelUpperBoundClosed)))

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse