import UIKit

final class RegionViewController: UIViewController, RegionTableViewDelegate {
    
    private let regionTableView = RegionTableView()
    
    let data = [
        ["r": "Region1", "n": "Location1", "a": "Address1", "t": 1, "lat": 39.04, "lon": 37.05, "av": "Available", "i": "Info", "ncash": true, "cs": false],
        ["r": "Region1", "n": "Location2", "a": "Address2", "t": 2, "lat": 39.04, "lon": 37.05, "av": "NotAvailable", "i": "Info", "ncash": true, "cs": false],
        ["r": "Region1", "n": "Location3", "a": "Address3", "t": 1, "lat": 39.04, "lon": 37.05, "av": "Available", "i": "Info", "ncash": false, "cs": true],
        ["r": "Region2", "n": "Location3", "a": "Address3", "t": 1, "lat": 39.04, "lon": 37.05, "av": "Available", "i": "Info", "ncash": false, "cs": true],
        ["r": "Region2", "n": "Location3", "a": "Address3", "t": 0, "lat": 39.04, "lon": 37.05, "av": "Available", "i": "Info", "ncash": false, "cs": true],
        ["r": "Region3", "n": "Location3", "a": "Address3", "t": 0, "lat": 39.04, "lon": 37.05, "av": "Available", "i": "Info", "ncash": false, "cs": true]
    ]
    
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
        
        var country = Country("Country")
        let _ = data.map({ data in
            country.addLocation(Location(data)!, to: data["r"]! as! String)
        })
        for (region, locations) in country.regions {
            print(region)
            locations.forEach({ print("\($0.name), \($0.address), \($0.type), \($0.isCoinStationAvailable)") })
        }
    }
    
    override func loadView() {
        view = regionTableView
    }
    
    func didSelectRegion() {
        navigationItem.title = "" // FIXME: Insert region name here. May require smaller font.
        let locationViewController = LocationViewController()
        show(locationViewController, sender: self)
    }
    
    deinit {
        print("RegionViewController deallocated")
    }
}
