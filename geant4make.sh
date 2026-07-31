#!/bin/bash
if [ -f /usr/local/bin/geant4.sh ]; then
    source /usr/local/bin/geant4.sh
    echo "Entorno de Geant4 cargado desde /usr/local/bin/geant4.sh"
elif [ -n "$GEANT4_DIR" ] && [ -f "$GEANT4_DIR/geant4.sh" ]; then
    source "$GEANT4_DIR/geant4.sh"
    echo "Entorno de Geant4 cargado desde $GEANT4_DIR"
else
    echo "Buscando geant4.sh en el sistema..."
    GEANT_SCRIPT=$(find / -name "geant4.sh" 2>/dev/null | head -n 1)
    if [ -n "$GEANT_SCRIPT" ]; then
        source "$GEANT_SCRIPT"
        echo "Entorno de Geant4 cargado desde $GEANT_SCRIPT"
    else
        echo "Error: No se encontro el archivo geant4.sh"
    fi
fi
