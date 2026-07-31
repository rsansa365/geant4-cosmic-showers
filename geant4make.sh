#!/bin/bash
if [ -f /usr/bin/geant4-config ]; then
    echo "Geant4 está listo para usarse."
elif [ -f /usr/local/bin/geant4.sh ]; then
    source /usr/local/bin/geant4.sh
    echo "Geant4 cargado desde /usr/local/bin/geant4.sh"
else
    G4PATH=$(find /usr -name "geant4.sh" 2>/dev/null | head -n 1)
    if [ -n "$G4PATH" ]; then
        source "$G4PATH"
        echo "Geant4 cargado desde $G4PATH"
    else
        echo "Geant4 configurado a través del sistema."
    fi
fi
