//
//  AddItemView.swift
//  Looter
//
//  Created by PHOTHINANTHA Henri on 10/01/2024.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
    
    var color: Color {
        switch self {
        case .common: return Color.blue
        case .uncommon: return Color.green
        case .rare: return Color.yellow
        case .epic: return Color.purple
        case .legendary: return Color.orange
        case .unique: return Color.red
        }
    }
}

struct AddItemView: View {
    @State var name: String = ""
    @EnvironmentObject var inventory: Inventory
    @Environment(\.presentationMode) var presentationMode
    
    @State var rarity: Rarity = .common
    @State var game:Game = availableGames[0]
    @State var quantity:Int = 1
    @State var type: ItemType = .unknown
    @State var isAttackItem:Bool = false
    @State var attackStrength = 1
    
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            
            Section {
                Picker("Jeu", selection:$game) {
                    ForEach(availableGames) { game in
                        Text(game.name).tag(game)
                    }
                }
                Stepper(value : $quantity, in: 1...Int.max) {
                    Text("Combien : \(quantity)")
                }
            }
            
            Section {
                HStack(){
                    Text("Type")
                    Spacer()
                    Text(type.rawValue)
                }
                
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) {
                        type in Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                HStack {
                    Text("Item d'attaque ?")
                    Spacer()
                    Toggle("", isOn: $isAttackItem)
                }
                if isAttackItem {
                    Stepper(value: $attackStrength, in: 1...Int.max) {
                        Text("Force d'attaque : \(attackStrength)")
                    }
                }
            }
            
            Section {
                Button(action: {
                    let newItem = LootItem(quantity: quantity, name: name, type: type, rarity: rarity,attackStrength: attackStrength, game: game)
                    inventory.addLoot(item: newItem)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Ajouter l'objet")
                })
            }
        }
    }
}

#Preview {
    AddItemView()
}
