import UIKit

final class RegionTableViewCell: UITableViewCell {
    
    private let regionNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            self.regionNameLabel.text = model.regionName
            self.accessoryType = model.accessoryType
            self.selectionStyle = model.selectionStyle
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "\(RegionTableViewCell.self)")
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(regionNameLabel)
        regionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regionNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            regionNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            regionNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            regionNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    deinit {
        print("RegionTableViewCell deallocated")
    }
}

extension RegionTableViewCell {
    struct Model {
        let regionName: String?
        let accessoryType: UITableViewCellAccessoryType
        let selectionStyle: UITableViewCellSelectionStyle
        
        init(data: [String: String]) {
            self.regionName = data.keys.first
            self.accessoryType = .disclosureIndicator
            self.selectionStyle = .none
        }
    }
}
