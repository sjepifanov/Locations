import UIKit

class LocationTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "\(LocationTableViewCell.self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            self.textLabel?.text = model.title
            self.detailTextLabel?.text = model.details
            self.accessoryType = model.accessoryType
        }
    }
}

extension LocationTableViewCell {
    
    struct Model {
        let title: String?
        let details: String?
        let accessoryType: UITableViewCellAccessoryType
        
        init(data: [String: String]) {
            self.title = data.keys.first
            self.details = data.values.first
            self.accessoryType = .disclosureIndicator
        }
    }
}
