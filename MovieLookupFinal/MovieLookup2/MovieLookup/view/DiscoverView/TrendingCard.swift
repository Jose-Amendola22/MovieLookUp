

import Foundation
import SwiftUI

struct TrendingCard: View {

    let trendingItem: Movie // Elemento de película que se muestra en la tarjeta de tendencias

    var body: some View {
        ZStack(alignment: .bottom) {
            // Imagen asincrónica que carga la imagen de fondo de la película
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 240)
            } placeholder: {
                // En caso de que la imagen no esté disponible, se muestra un rectángulo de color como marcador de posición
                Rectangle().fill(Color(red:61/255,green:61/255,blue:88/255))
                        .frame(width: 340, height: 240)
            }

            VStack {
                HStack {
                    Text(trendingItem.title)  // Título de la película
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill") //Aparece con icono de corazón
                        .foregroundColor(.red)
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red:61/255,green:61/255,blue:88/255))
             // Fondo de la vista de información de la película
        }
        .cornerRadius(10)//Se aplica un borde redondeado a la tarjeta de tendencias
    }
}


