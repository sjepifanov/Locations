import UIKit

class LocationDetailTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
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
        register(LocationDetailTableViewCell.self, forCellReuseIdentifier: "\(LocationDetailTableViewCell.self)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
        cell.model = LocationDetailTableViewCell.Model(data: data[indexPath.row])
    }
}
