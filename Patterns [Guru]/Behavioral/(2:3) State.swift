
protocol TrackingState {
    func startTracking()
    func stopTracking()
    
    func checkIn()
}

class DisabledTrackerState: TrackingState{
    weak var tracker: LocationTracker?
    init(tracker: LocationTracker?){
        self.tracker = tracker
    }
    
    func startTracking(){
        print("Start tracking")
        tracker!.update(state: EnabledTrackerState(tracker: tracker))
    }
    func stopTracking(){
        print("Tracker already has stopped")
    }
    
    func checkIn(){
        startTracking()
        tracker!.checkIn()
    }
}

class EnabledTrackerState: TrackingState{
    weak var tracker: LocationTracker?
    init(tracker: LocationTracker?){
        self.tracker = tracker
    }
    
    
    func startTracking(){
        print("Tracker already has stopped")
    }
    func stopTracking(){
        print("Stop tracking")
        tracker!.update(state: DisabledTrackerState(tracker: tracker))
    }
    
    func checkIn(){
        print("Performing CHECK-IN")
    }
}

class LocationTracker{
    lazy var state: TrackingState = DisabledTrackerState(tracker: self)
    
    func startTracking(){
        state.startTracking()
    }
    func stopTracking(){
        state.stopTracking()
    }
    
    func checkIn(){
        state.checkIn()
    }
    
    func update(state: TrackingState){
        if state is DisabledTrackerState {
            print("OFF")
        } else {
            print("ON")
        }
        
        self.state = state
    }
}

let tracker = LocationTracker()
tracker.stopTracking()
tracker.startTracking()
tracker.stopTracking()
tracker.checkIn()

