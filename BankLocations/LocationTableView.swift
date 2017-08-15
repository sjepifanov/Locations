import UIKit

protocol LocationTableViewDelegate: class {
    func didSelectLocation()
}

class LocationTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    weak var selectLocationDelegate: LocationTableViewDelegate?
    
    private let data = [["Test": "Test Field"], ["Test 2": "Test Field 2"]]
    
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
        rowHeight = 64
        separatorStyle = .none
        register(LocationTableViewCell.self, forCellReuseIdentifier: "\(LocationTableViewCell.self)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "\(LocationTableViewCell.self)", for: indexPath)
        configure(cell, forRowAt: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectLocationDelegate?.didSelectLocation()
    }
    
    private func configure(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? LocationTableViewCell else {
            return
        }
        cell.model = LocationTableViewCell.Model(data: data[indexPath.row])
    }
}
