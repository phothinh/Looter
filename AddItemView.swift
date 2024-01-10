//
//  AddItemView.swift
//  Looter
//
//  Created by PHOTHINANTHA Henri on 10/01/2024.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
}

struct AddItemView: View {
    @State var name: String = ""
    @EnvironmentObject var inventory: Inventory
    @Environment(\.presentationMode) var presentationMode
    @State var rarity: Rarity = .common
    
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Button(action: {
                    inventory.addLoot(item: name)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Ajouter")
                })
            }
        }
    }
}

#Preview {
    AddItemView()
}
