import UIKit

class LocationDetailViewController: UIViewController {
    
    private let locationDetailTableView = LocationDetailTableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = locationDetailTableView
    }
    
    private func setupView() {
        let doneButtonTapped = #selector(LocationDetailViewController.doneButtonTapped)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: doneButtonTapped)
        navigationItem.setRightBarButton(doneButton, animated: true)
        navigationItem.title = "Location Details"
    }
    
    func doneButtonTapped() {
        dismiss(animated: true)
    }
}
