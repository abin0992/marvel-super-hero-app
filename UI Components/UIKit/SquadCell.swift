import UIKit

class SquadCell: UICollectionViewCell {

    static let Identifier: String = "SquadCellIdentifier"

    lazy var superHeroName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .footnoteFont
        label.numberOfLines = 2
        return label
    }()

    lazy var superHeroIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
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

extension SquadCell {
    private func setup() {
        backgroundColor = .clear

        contentView.addSubview(superHeroIcon)
        contentView.addSubview(superHeroName)

        NSLayoutConstraint.activate([
            superHeroIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            superHeroIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            superHeroIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            superHeroIcon.heightAnchor.constraint(
                equalTo: superHeroIcon.widthAnchor,
                multiplier: 1
            ),

            superHeroName.topAnchor.constraint(equalTo: superHeroIcon.bottomAnchor),
            superHeroName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            superHeroName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            superHeroName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        superHeroIcon.rounded()
    }
}
