//
//  App.swift
//  FancyCollectionView
//
//  Created by 최동호 on 2021/07/02.
//

import Foundation

struct App: Decodable, Hashable {
    let id: Int
    let tagline: String
    let name: String
    let subheading: String
    let image: String
    let iap: Bool
}
