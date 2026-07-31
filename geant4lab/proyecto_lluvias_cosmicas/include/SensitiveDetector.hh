#ifndef SENSITIVE_DETECTOR_HH
#define SENSITIVE_DETECTOR_HH

#include "G4VSensitiveDetector.hh"

class SensitiveDetector : public G4VSensitiveDetector
{
public:
    SensitiveDetector(G4String name);
    ~SensitiveDetector();

    virtual G4bool ProcessHits(G4Step* aStep, G4TouchableHistory* RHgss);
};

#endif
