import UIKit

final class ProportionalStackView: UIStackView {
    
    private var arrangmentAxis: UILayoutConstraintAxis {
        didSet {
            switch arrangmentAxis {
            case .vertical:
                axis = arrangmentAxis
                topView.setVerticalProportion(multiplier: 2)
                bottomView.setVerticalProportion(multiplier: 1.2)
            case .horizontal:
                axis = arrangmentAxis
                topView.setHorizontalProportion(multiplier: 2)
                bottomView.setHorizontalProportion(multiplier: 1.6)
            }
        }
    }
    
    private let viewDistribution: UIStackViewDistribution = .fillProportionally
    
    let topView = ProportionalView()
    let bottomView = ProportionalView()
 
    override init(frame: CGRect) {
        arrangmentAxis = .vertical
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setArrangement(_ axis: UILayoutConstraintAxis) {
        arrangmentAxis = axis
    }
    
    private func setupView() {
        distribution = viewDistribution
        
        addArrangedSubview(topView)
        addArrangedSubview(bottomView)
    }
}
