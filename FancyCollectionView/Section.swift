//
//  Section.swift
//  FancyCollectionView
//
//  Created by 최동호 on 2021/07/02.
//

import Foundation

struct Section: Decodable, Hashable {
    let id: Int
    let type: String
    let title: String
    let subtitle: String
    let items: [App]
}
