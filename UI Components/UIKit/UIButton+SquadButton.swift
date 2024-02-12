import UIKit

extension UIButton {
    class SquadButton: UIButton {

        var isInSquad: Bool = false {
            didSet {
                updateButtonAttributes()
            }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            layer.cornerRadius = .small
            layer.borderWidth = .xSmall
            layer.shadowRadius = .medium
            layer.shadowColor = UIColor.redHighlight.cgColor
            titleLabel?.font = .headlineFont
            titleLabel?.textColor = .white
            updateButtonAttributes()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func updateButtonAttributes() {
            if isInSquad {
                setTitle(TextContent.squadButtonFireText, for: .normal)
                layer.borderColor = UIColor.redLight.cgColor
                backgroundColor = .clear
            } else {
                setTitle(TextContent.squadButtonRecruitText, for: .normal)
                layer.borderColor = UIColor.redDark.cgColor
                backgroundColor = .redLight
            }
        }
    }
}
