

import CoreLocation
import RxSwift
import RxRelay

class LocationFetcher: NSObject, CLLocationManagerDelegate {
    static let shared = LocationFetcher()
    private var managerInstance: CLLocationManager {
        let manager = CLLocationManager()
        manager.distanceFilter = 100
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.pausesLocationUpdatesAutomatically = false
        manager.allowsBackgroundLocationUpdates = true
        manager.activityType = CLActivityType.fitness
        return manager
    }
    
    var currentLocation: Observable<CLLocation?> {
        return currentLocationRelay.asObservable()
    }
    private let currentLocationRelay = BehaviorRelay<CLLocation?>(value: nil)
    
    private var manager: CLLocationManager!
    
    func startRequest() {
        let status = CLLocationManager.authorizationStatus()
        guard case .authorizedAlways = status else {
            return
        }
        manager = managerInstance
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocationRelay.accept(locations.first)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard case .authorizedAlways = status else {
            return
        }
        manager.startMonitoringSignificantLocationChanges()
    }
    
}
