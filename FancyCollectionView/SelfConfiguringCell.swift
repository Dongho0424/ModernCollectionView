//
//  SelfConfiguringCell.swift
//  FancyCollectionView
//
//  Created by 최동호 on 2021/07/02.
//

import Foundation

protocol SelfConfiguringCell {
    static var identifier: String { get }
    func configure(with app: App)
}
