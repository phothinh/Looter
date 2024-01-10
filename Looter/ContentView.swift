//
//  ContentView.swift
//  Looter
//
//  Created by PHOTHINANTHA Henri on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var loot = ["Epée", "Bouclier", "Armure"]
    @State var showAddItemView: Bool = false

    func addLoot() {
        loot.append("Magie de feu")
    }
    
    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    addLoot()
                }, label: {
                    Text("Ajouter")
                })

                ForEach(loot, id: \.self) { item in
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
                AddItemView()
            })
        }
    }
}


#Preview {
    ContentView()
}
