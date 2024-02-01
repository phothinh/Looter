//
//  LootDetailView.swift
//  Looter
//
//  Created by Henri Phothinantha on 01/02/2024.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem

    var body: some View {
        VStack {
            // Partie haute de l'écran
            VStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 100)
                    .foregroundColor(item.rarity.color)
                    .overlay(
                        Text(item.type.rawValue)
                            .font(.system(size: 48))
                    )
                    .shadow(color: item.rarity.color, radius: 30) 
                
                Text(item.name)
                        .foregroundColor(item.rarity.color)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 28))
                
                Spacer()
                
                if item.rarity == .unique {
                    Text("Item Unique 🏆")
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 16)
                        .background(item.rarity.color)
                        .cornerRadius(16)
                }
            }
            .padding()
            
            
            // Partie basse de l'écran
            List {
                Section(header: Text("Informations")) {
                    // Image du jeu + Nom du jeu
                    HStack {
                        GameCoverView(game: item.game)
                            .frame(width: 50, height: 50)
                            .cornerRadius(4)
                        Text(item.game?.name ?? "Unknown Game")
                    }
                    
                    // Nom de l'item
                    Text("In-game: \(item.name)")
                    
                    // Puissance d'attaque
                    if let attackStrength = item.attackStrength {
                        Text("Puissance (ATQ): \(attackStrength)")
                    }
                    
                    // Nombre d'items
                    Text("Possédé(s) : \(item.quantity)")
                    
                    // Rareté
                    Text("Rareté : \(item.rarity.capitalized)")
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
    }
}




struct GameCoverView: View {
    var game: Game?

    var body: some View {
        ZStack {
            if let game = game {
                if let coverName = game.coverName {
                    AsyncImage(url: URL(string: coverName)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(4)
                    } placeholder: {
                        LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.4), Color.black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                        Image(systemName: "rectangle.slash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .padding(5)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(4)
                    }
                } else {
                    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.4), Color.black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                    Image(systemName: "rectangle.slash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(5)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(4)
                }
            } else {
                // Gérer le cas où game est nil
            }
        }
    }
}

