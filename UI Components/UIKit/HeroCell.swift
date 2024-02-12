import UIKit

class HeroCell: UITableViewCell {

    static let Identifier: String = "HeroCellIdentifier"

    lazy var superHeroName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .headlineFont
        label.numberOfLines = 1
        return label
    }()

    lazy var superHeroIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        superHeroIcon.rounded()
    }
}

extension HeroCell {
    private func setup() {
        selectionStyle = .none
        layer.borderWidth = .xSmall
        layer.cornerRadius = .small
        backgroundColor = .greyMedium
        tintColor = .greyLight
        accessoryView = UIImageView.chevronImageView

        contentView.addSubview(superHeroIcon)
        contentView.addSubview(superHeroName)

        NSLayoutConstraint.activate([
            superHeroIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            superHeroIcon.leftAnchor.constraint(
                equalTo: contentView.leftAnchor,
                constant: .medium
            ),
            superHeroIcon.widthAnchor.constraint(equalToConstant: .large),
            superHeroIcon.heightAnchor.constraint(equalToConstant: .large),

            superHeroName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            superHeroName.leftAnchor.constraint(
                equalTo: superHeroIcon.rightAnchor,
                constant: .medium
            )
        ])
        superHeroIcon.rounded()
    }
}
