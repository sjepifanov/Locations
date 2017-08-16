import UIKit

fileprivate enum SectionTitle: String {
    case locationDetails = "DETAILS"
    case additionalInfo = "AVAILABILITY"
    
    var description: String {
        return self.rawValue
    }
}

fileprivate enum SectionItem: String {
    case locationType = "TYPE"
    case name = "NAME"
    case address = "ADDRESS"
    case region = "REGION"
    case availabilty = "AVAILABILITY"
    case info = "INFO"
    
    var description: String {
        return self.rawValue
    }
}

fileprivate struct Section {
    var section: SectionTitle
    var items: [SectionItem]
}

class LocationDetailTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let data = ["Test 1", "Test 2", "Test 3", "Test 4", "Test 5", "Test 6", "Test 7", "Test 8"]
    private var sections = [Section]()
    
    init() {
        super.init(frame: .zero, style: .grouped)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        delegate = self
        dataSource = self
        separatorStyle = .none
        register(LocationDetailTableViewCell.self, forCellReuseIdentifier: "\(LocationDetailTableViewCell.self)")
        sections.append(Section(section: .locationDetails, items: [.locationType, .name, .address, .region]))
        sections.append(Section(section: .additionalInfo, items: [.availabilty, .info]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "\(LocationDetailTableViewCell.self)", for: indexPath)
        configure(cell, forRowAt: indexPath)
        return cell
    }
    
    private func configure(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? LocationDetailTableViewCell else {
            return
        }
        let sectionItem = sections[indexPath.section].items[indexPath.row]
        cell.model = LocationDetailTableViewCell.Model(item: sectionItem.description, data: data[indexPath.row])
    }
}
