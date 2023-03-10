//
//  ContentView.swift
//  photo_aleatoire
//
//  Created by laumond on 10/03/2023.
//
import SwiftUI

struct ContentView: View {
    
    // Déclaration des variables d'état
    @State private var image: Image? = nil
    @State private var backgroundColor: Color = .white
    
    // Fonction appelée lors du clic sur le bouton "Générer une photo aléatoire"
    func generateRandomPhoto() {
        
        // Génération d'une URL aléatoire d'une image sur internet
        let urlString = "https://picsum.photos/400/400?random=\(Int.random(in: 0..<1000))"
        guard let url = URL(string: urlString) else {
            return
        }
        
        do {
            // Récupération des données de l'image
            let data = try Data(contentsOf: url)
            // Création d'une Image SwiftUI à partir des données récupérées
            self.image = Image(uiImage: UIImage(data: data)!)
        } catch {
            print(error.localizedDescription)
        }
        
        // Changement aléatoire de la couleur d'arrière-plan
        self.backgroundColor = Color(red: Double.random(in: 0..<1),
                                     green: Double.random(in: 0..<1),
                                     blue: Double.random(in: 0..<1))
    }
    
    var body: some View {
        ZStack {
            // Affichage de la couleur d'arrière-plan
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                // Affichage de l'image générée avec un contour blanc
                if image != nil {
                    image!.resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 5)
                        )
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                Spacer() // Ajout d'un espaceur pour centrer le bouton verticalement
                // Bouton pour générer une nouvelle photo aléatoire
                Button("Générer une photo aléatoire") {
                    generateRandomPhoto()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(width: 250, height: 50, alignment: .center)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
            }
        }
    }
}
