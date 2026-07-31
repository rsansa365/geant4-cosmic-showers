#ifndef PHYSICS_LIST_HH
#define PHYSICS_LIST_HH

#include "G4VModularPhysicsList.hh"
#include "FTFP_BERT.hh"

class PhysicsList : public FTFP_BERT
{
public:
    PhysicsList();
    ~PhysicsList();
};

#endif

