import UIKit

class LocationDetailTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "\(LocationDetailTableViewCell.self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            textLabel?.text = model.name
            detailTextLabel?.text = model.address
        }
    }
}

extension LocationDetailTableViewCell {
    struct Model {
        let name: String?
        let address: String?
        
        init(data: [String: String]) {
            self.name = data.keys.first
            self.address = data.values.first
        }
    }
}
