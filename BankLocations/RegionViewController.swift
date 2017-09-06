import UIKit

final class RegionViewController: UIViewController, RegionTableViewDelegate {
    
    private let regionTableView = RegionTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Regions"
    }
    
    private func setupView() {
        automaticallyAdjustsScrollViewInsets = true
        regionTableView.selectRegionDelegate = self
    }
    
    override func loadView() {
        view = regionTableView
    }
    
    func didSelectRegion() {
        navigationItem.title = "" // FIXME: Insert region name here. May require smaller font.
        let locationViewController = LocationViewController()
        show(locationViewController, sender: self)
    }
}
