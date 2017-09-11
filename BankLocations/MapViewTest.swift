import UIKit
import MapKit

final class MapViewTest: UIView {
    
    private let mapView = MKMapView()
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
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        locationManager.requestWhenInUseAuthorization()
        mapView.mapType = .standard
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsUserLocation = false
        mapView.isPitchEnabled = false
        mapView.isRotateEnabled = false
        mapView.showsPointsOfInterest = false
        mapView.showsBuildings = false
        centerMap(on: initialLocation)
    }
    
    private func centerMap(on location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    deinit {
        print("MapViewTest deallocated")
    }
}
