# Geant4
 
## Simulation
Simulation
    |-- detector construction
	|-- geometry
	|-- materials
	|-- sensitive region and readout schemes
    |-- particles and physics processes
    |-- particle sources
    |-- other requirements

## Program
main()
    |
    |-- G4RunManager (G4MTRunManager)
	|
	|-- G4UIManager
	|
	|-- G4VisManager
	|
	|-- G4SDManager	    # sensitive detector manager
	|
	|-- G4ProcessManager
	|
	|-- G4EventManager
	|
	|-- G4StackManager
	    |-- urgent
	    |-- waiting
	    |-- postpone-to-next-event
	|
	|-- G4TrackingManager
	|
	|-- G4StateManager
    |
    |-- Action
	|
	|-- G4UserRunAction
	|
	|-- G4UserEventAction
	|
	|-- G4UserStackingAction
	|
	|-- G4UserTrackingAction
	|
	|-- G4UserSteppingAction

## Event loop
main():
    new G4RunManager():
	|-- SetVUserInitialization(G4VUserDetectorConstruction * detector)
	|-- SetVUserInitialization(G4VModularPhysicsList* physlist)
	|-- SetUserAction(G4UserRunAction* run_action)
	|-- SetUserAction(G4VUserPrimaryGeneratorAction* gen_action)
	|-- SetUserAction(G4UserEventAction* event_action)
	|-- SetUserAction(G4UserSteppingAction* stepping_action)
	|-- Initialize()
G4RunManager():
    BeginOfRunAction() --> Run --> EndOfRunAction()
Run:
    PrimaryGeneratorAction() 
	    : qsimEvent()
	    : qsimIO()
	|-- GeneratePrimaries()
    --> BeginOfEventAction() --> Event --> EndofEventAction()
Event:
    BeginOfTrackAction() --> Track --> EndOfTrackAction()
Track:
    BeginOfSteppingAction() --> Stepping --> EndOfSteppingAction()

Track is not a collection of steps. Instead, a track is being updated by steps. Step is a 'delta' info to a track.
## Detector
### Geometry
World: G4PVPlacement with a null mother pointer, in must be unrotated and sit on the origin of the global coordinate system.
    

* solid: shape of volume
* logical volume:	to describe volume's full properties: geometrical, materials, sensitive detector elements, magnetic field.
* physical volume:  a physical copy of logical volume, and specify a position inside a containing volume.

**Note** the G4Box constructor takes as arguments the halfs of the total box size. As for the G4Tubs (cylinder) the height parameter represents the half length in Z. 

