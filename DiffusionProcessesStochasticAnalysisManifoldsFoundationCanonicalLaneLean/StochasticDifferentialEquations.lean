import HautevilleHouse.DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean.ItoStochasticCalculus

namespace HautevilleHouse
namespace DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean

structure SDEPackage {S : StochasticRiemannianStructure} (I : ItoIntegralPackage S) where
  driftField : Type u
  diffusionField : Type v
  solutionProcess : Type w
  localExistence : Prop
  uniquenessInLaw : Prop
  markovProperty : Prop

structure SDEEvidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} (D : SDEPackage I) where
  localExistenceClosed : D.localExistence
  uniquenessInLawClosed : D.uniquenessInLaw
  markovPropertyClosed : D.markovProperty

def SDEClosed {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} (D : SDEPackage I) : Prop :=
  D.localExistence ∧ D.uniquenessInLaw ∧ D.markovProperty

theorem sde_closed_from_evidence {S : StochasticRiemannianStructure} {I : ItoIntegralPackage S} (D : SDEPackage I) (E : SDEEvidence D) : SDEClosed D := by
  exact And.intro E.localExistenceClosed (And.intro E.uniquenessInLawClosed E.markovPropertyClosed)

end DiffusionProcessesStochasticAnalysisManifoldsFoundationCanonicalLaneLean
end HautevilleHouse