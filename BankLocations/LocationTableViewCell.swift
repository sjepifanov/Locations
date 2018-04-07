import UIKit

final class LocationTableViewCell: UITableViewCell {
    
    private let coloredView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let locationTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let locationNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 18)
        return label
    }()
    
    private let locationAddressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 8)
        return label
    }()
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            self.locationTypeLabel.text = model.locationType
            self.locationAddressLabel.text = model.locationAddress
            self.locationNameLabel.text = model.locationName
            self.accessoryType = model.accessoryType
            self.selectionStyle = model.selectionStyle
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "\(LocationTableViewCell.self)")
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        coloredView.addSubview(locationTypeLabel)
        locationTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTypeLabel.centerXAnchor.constraint(equalTo: coloredView.centerXAnchor),
            locationTypeLabel.centerYAnchor.constraint(equalTo: coloredView.centerYAnchor)
        ])
        
        contentView.addSubview(coloredView)
        coloredView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coloredView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            coloredView.heightAnchor.constraint(equalToConstant: 48),
            coloredView.widthAnchor.constraint(equalToConstant: 48),
            coloredView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.addSubview(locationNameLabel)
        contentView.addSubview(locationAddressLabel)
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        locationAddressLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .vertical)
        NSLayoutConstraint.activate([
            locationNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            locationNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            locationNameLabel.leadingAnchor.constraint(equalTo: coloredView.trailingAnchor, constant: 8),
            locationNameLabel.bottomAnchor.constraint(equalTo: locationAddressLabel.topAnchor, constant: 2),
            locationAddressLabel.leadingAnchor.constraint(equalTo: coloredView.trailingAnchor, constant: 8),
            locationAddressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            locationAddressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    deinit {
        print("LocationTableViewCell deallocated")
    }
}

extension LocationTableViewCell {
    struct Model {
        let locationType: String?
        let locationName: String?
        let locationAddress: String?
        let accessoryType: UITableViewCellAccessoryType
        let selectionStyle: UITableViewCellSelectionStyle
        
        init(data: [String: String], accessoryType: UITableViewCellAccessoryType = .disclosureIndicator, selectionStyle: UITableViewCellSelectionStyle = .none) {
            self.locationType = "ATM"
            self.locationName = data.keys.first
            self.locationAddress = data.values.first
            self.accessoryType = .disclosureIndicator
            self.selectionStyle = .none
        }
    }
}
