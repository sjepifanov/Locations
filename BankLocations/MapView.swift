import UIKit
import MapKit

final class MapView: MKMapView {
    private let initialLocation = CLLocation(latitude: 59.4370, longitude: 24.7536)
    private let regionRadius: CLLocationDistance = 500
    private let locationManager = CLLocationManager()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        locationManager.requestWhenInUseAuthorization()
        mapType = .standard
        isScrollEnabled = false
        isZoomEnabled = false
        showsCompass = true
        showsScale = true
        showsUserLocation = false
        isPitchEnabled = false
        isRotateEnabled = false
        showsPointsOfInterest = false
        showsBuildings = false
        centerMap(on: initialLocation)
    }
    
    private func centerMap(on location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
    deinit {
        print("MapView deallocated")
    }
}
