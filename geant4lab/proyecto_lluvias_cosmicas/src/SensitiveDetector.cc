#include "SensitiveDetector.hh"
#include "G4Step.hh"
#include "G4Track.hh"
#include "G4SystemOfUnits.hh"
#include "G4ios.hh"

SensitiveDetector::SensitiveDetector(G4String name) : G4VSensitiveDetector(name) {}
SensitiveDetector::~SensitiveDetector() {}

G4bool SensitiveDetector::ProcessHits(G4Step* aStep, G4TouchableHistory* RHgss)
{
    G4Track* track = aStep->GetTrack();
    G4double edep = aStep->GetTotalEnergyDeposit();
    G4String particleName = track->GetDefinition()->GetParticleName();

    G4cout << "[DETECTOR] Particula detectada: " << particleName 
           << " | Energia depositada: " << edep / MeV << " MeV" << G4endl;

    return true;
}
