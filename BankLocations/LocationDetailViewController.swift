import UIKit
import MapKit

final class LocationDetailViewController: UIViewController {
    
    private let proportionalStackView = ProportionalStackView()
    private let locationDetailTableView = LocationDetailTableView()
    private let mapView = MapView()
    private var isPortrait: Bool {
        return UIDevice.current.orientation.isPortrait
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let doneButtonTapped = #selector(LocationDetailViewController.doneButtonTapped)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: doneButtonTapped)
        navigationItem.setRightBarButton(doneButton, animated: true)
        navigationItem.title = "Location Details"
        view.backgroundColor = .white
        
        mapView.delegate = self
        
        proportionalStackView.topView.addSubview(locationDetailTableView)
        locationDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationDetailTableView.topAnchor.constraint(equalTo: proportionalStackView.topView.topAnchor),
            locationDetailTableView.leadingAnchor.constraint(equalTo: proportionalStackView.topView.leadingAnchor),
            locationDetailTableView.trailingAnchor.constraint(equalTo: proportionalStackView.topView.trailingAnchor),
            locationDetailTableView.bottomAnchor.constraint(equalTo: proportionalStackView.topView.bottomAnchor)
        ])
        
        proportionalStackView.bottomView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: proportionalStackView.bottomView.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: proportionalStackView.bottomView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: proportionalStackView.bottomView.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: proportionalStackView.bottomView.bottomAnchor)
        ])
        
        isPortrait ? proportionalStackView.setArrangement(.vertical) : proportionalStackView.setArrangement(.horizontal)
        view.addSubview(proportionalStackView)
        proportionalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            proportionalStackView.topAnchor.constraint(equalTo: view.topAnchor),
            proportionalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            proportionalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            proportionalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        isPortrait ? proportionalStackView.setArrangement(.vertical) : proportionalStackView.setArrangement(.horizontal)
    }
    
    @objc private func doneButtonTapped() {
        dismiss(animated: true)
    }
    
    deinit {
        mapView.delegate = nil
        print("LocationDetailViewController deallocated")
    }
}

extension LocationDetailViewController: MKMapViewDelegate {
    
}
