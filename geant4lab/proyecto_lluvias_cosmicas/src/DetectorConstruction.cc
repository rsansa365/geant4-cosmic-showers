#include "DetectorConstruction.hh"
#include "SensitiveDetector.hh"
#include "G4SDManager.hh"

DetectorConstruction::DetectorConstruction() {}
DetectorConstruction::~DetectorConstruction() {}

G4VPhysicalVolume* DetectorConstruction::Construct()
{
    G4NistManager* nist = G4NistManager::Instance();
    G4Material* airMat = nist->FindOrBuildMaterial("G4_AIR");

    // Volumen Mundo
    G4Box* solidWorld = new G4Box("World", 10*m, 10*m, 20*m);
    G4LogicalVolume* logicWorld = new G4LogicalVolume(solidWorld, airMat, "World");
    G4VPhysicalVolume* physWorld = new G4PVPlacement(0, G4ThreeVector(0,0,0), logicWorld, "World", 0, false, 0);

    // Capa de la Atmosfera (Simulacion Simplificada de Lluvia)
    G4Box* solidAtmosphere = new G4Box("Atmosphere", 9*m, 9*m, 15*m);
    G4LogicalVolume* logicAtmosphere = new G4LogicalVolume(solidAtmosphere, airMat, "Atmosphere");
    new G4PVPlacement(0, G4ThreeVector(0,0,2*m), logicAtmosphere, "Atmosphere", logicWorld, false, 0);

    // Detector Terrestre a nivel del suelo
    G4Box* solidDetector = new G4Box("Detector", 8*m, 8*m, 0.5*m);
    logicDetector = new G4LogicalVolume(solidDetector, airMat, "logicDetector");
    new G4PVPlacement(0, G4ThreeVector(0,0,-15*m), logicDetector, "PhysDetector", logicWorld, false, 0);

    return physWorld;
}

void DetectorConstruction::ConstructSDandField()
{
    SensitiveDetector* sensDet = new SensitiveDetector("SensitiveDetector");
    G4SDManager::GetSDMpointer()->AddNewDetector(sensDet);
    logicDetector->SetSensitiveDetector(sensDet);
}
