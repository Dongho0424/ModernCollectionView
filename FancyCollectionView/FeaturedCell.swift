//
//  FeaturedCell.swift
//  FancyCollectionView
//
//  Created by 최동호 on 2021/07/02.
//

import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
    static let identifier: String = "FeaturedCell"
    
    let tagline = UILabel()
    let name = UILabel()
    let subtitle = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel
        
        tagline.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        tagline.textColor = .systemBlue
        
        name.font = UIFont.preferredFont(forTextStyle: .title2)
        name.textColor = .label
        
        subtitle.font = UIFont.preferredFont(forTextStyle: .title2)
        subtitle.textColor = .secondaryLabel
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true // to make corner radius
        imageView.contentMode = .scaleAspectFit
        
        let stackView = UIStackView(arrangedSubviews: [separator, tagline, name, subtitle, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        stackView.setCustomSpacing(10, after: separator)
        stackView.setCustomSpacing(10, after: subtitle)
        
    }
    
    // from storyboard!
    required init?(coder: NSCoder) {
        fatalError("Not happening")
    }
    
    func configure(with app: App) {
        tagline.text = app.tagline.uppercased()
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
    
}
