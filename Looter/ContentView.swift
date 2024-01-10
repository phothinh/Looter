//
//  ContentView.swift
//  Looter
//
//  Created by PHOTHINANTHA Henri on 10/01/2024.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addLoot(item: String) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView: Bool = false

    
    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    inventory.addLoot(item: "Magie de feu")
                }, label: {
                    Text("Ajouter")
                })

                ForEach(inventory.loot, id: \.self) { item in
                    Text(item)
                }
            }.navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
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
