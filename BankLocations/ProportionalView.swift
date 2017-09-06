import UIKit

final class ProportionalView: UIView {
    private var height: CGFloat = 1
    private var width: CGFloat = 1
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: height)
    }
    
    func setHorizontalProportion(multiplier: CGFloat) {
        height = 1
        width = multiplier
    }
    
    func setVerticalProportion(multiplier: CGFloat) {
        height = multiplier
        width = 1
    }
}
