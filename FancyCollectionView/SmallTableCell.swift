//
//  SmallTableCell.swift
//  FancyCollectionView
//
//  Created by 최동호 on 2021/07/02.
//

import UIKit

class SmallTableCell: UICollectionViewCell, SelfConfiguringCell {
    static let identifier: String = "SmallTableCell"
    
    let name = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        name.font = UIFont.preferredFont(forTextStyle: .title2)
        name.textColor = .label
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView, name])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 20
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
    
    func configure(with app: App) {
        name.text = app.name
        imageView.image = UIImage(named: app.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("How mant times do I have to tell you? This isn't supported")
    }
    
}
