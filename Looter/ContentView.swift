//
//  ContentView.swift
//  Looter
//
//  Created by PHOTHINANTHA Henri on 10/01/2024.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = [LootItem]()
    
    init(loot: [LootItem]) {
        self.loot = loot
    }
    
    func addLoot(item: LootItem) {
        loot.append(item)
    }
}

let testInventory: [LootItem] = [
    LootItem(quantity : 1, name: "Excalibur", type: .dagger, rarity:.legendary, attackStrength: 50, game: availableGames[1]),
    LootItem(quantity : 2,  name: "Dragon Shield", type: .shield, rarity:.epic, attackStrength: 0, game: availableGames[0]),
    LootItem(quantity : 13, name: "Fireball Staff", type: .magic, rarity:.rare, attackStrength: 35, game: availableGames[4]),
    LootItem(quantity : 9, name: "Poison Dagger", type: .dagger, rarity:.rare, attackStrength: 30, game: availableGames[3]),
]

struct ContentView: View {
    @StateObject var inventory = Inventory(loot: testInventory)
    
    @State var showAddItemView: Bool = false

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    VStack(alignment: .leading) {
                        HStack(){
                            Circle().frame(width: 15, height:15)
                                .foregroundColor(item.rarity.color)
                            Text(item.name)
                            Spacer()
                            Text(item.type.rawValue)
                        }
                        Text("Quantity : \(item.quantity)")
                        
                        
                    }
                }
            }.navigationBarTitle("Inventory") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
        }
    }
}


#Preview {
    ContentView()
}
