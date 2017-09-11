import UIKit

final class LocationViewController: UIViewController, LocationTableViewDelegate {
    
    private let locationTableView = LocationTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        navigationItem.title = "Locations"
        automaticallyAdjustsScrollViewInsets = true
        locationTableView.selectLocationDelegate = self
    }
    
    override func loadView() {
        view = locationTableView
    }
    
    func didSelectLocation() {
        let navigationController = UINavigationController()
        let locationDetailViewController = LocationDetailViewController()
        navigationController.addChildViewController(locationDetailViewController)
        present(navigationController, animated: true)
    }
    
    deinit {
        print("LocationViewController deallocated")
    }
}
