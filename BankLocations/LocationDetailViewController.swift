import UIKit

class LocationDetailViewController: UIViewController {
    
    private let locationDetailTableView = LocationDetailTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = locationDetailTableView
    }
    
}
