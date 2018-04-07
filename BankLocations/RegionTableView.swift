import UIKit

protocol RegionTableViewDelegate: class {
    func didSelectRegion()
}

final class RegionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let data = [["Test": "Test Field"], ["Test 2": "Test Field 2"]]
    weak var selectRegionDelegate: RegionTableViewDelegate?
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        delegate = self
        dataSource = self
        rowHeight = 48
        separatorStyle = .none
        register(RegionTableViewCell.self, forCellReuseIdentifier: "\(RegionTableViewCell.self)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Country"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "\(RegionTableViewCell.self)", for: indexPath)
        configure(cell, forRowAt: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRegionDelegate?.didSelectRegion()
    }
    
    private func configure(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? RegionTableViewCell else {
            return
        }
        cell.model = RegionTableViewCell.Model(data: data[indexPath.row])
    }
    
    deinit {
        print("RegionTableView deallocated")
    }
}
