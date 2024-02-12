import UIKit

extension UIImageView {
    static var chevronImageView: UIImageView {
        .init(image: .init(systemName: "chevron.right"))
    }

    func rounded() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
        layer.setNeedsLayout()
        layer.layoutIfNeeded()
    }
}
