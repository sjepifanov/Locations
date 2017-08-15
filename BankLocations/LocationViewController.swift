import UIKit

class LocationViewController: UIViewController, LocationTableViewDelegate {
    
    private let locationTableView = LocationTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        show(LocationDetailViewController(), sender: self)
    }
}
