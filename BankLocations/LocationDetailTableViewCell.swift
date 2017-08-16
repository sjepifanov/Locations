import UIKit

class LocationDetailTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: "\(LocationDetailTableViewCell.self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            textLabel?.text = model.item
            detailTextLabel?.text = model.data
            selectionStyle = model.selectionStyle
        }
    }
}

extension LocationDetailTableViewCell {
    struct Model {
        let item: String
        let data: String?
        let selectionStyle: UITableViewCellSelectionStyle
        
        init(item: String, data: String?) {
            self.item = item
            self.data = data
            self.selectionStyle = .none
        }
    }
}
