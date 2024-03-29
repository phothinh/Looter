//
//  LootItem.swift
//  Looter
//
//  Created by PHOTHINANTHA Henri on 10/01/2024.
//

import Foundation

struct LootItem: Identifiable {
    var id = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game?
}

enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

extension Rarity {
    var capitalized: String {
        switch self {
        case .common: return "Common"
        case .uncommon: return "Uncommon"
        case .rare: return "Rare"
        case .epic: return "Epic"
        case .legendary: return "Legendary"
        case .unique: return "Unique"
        }
    }
}
