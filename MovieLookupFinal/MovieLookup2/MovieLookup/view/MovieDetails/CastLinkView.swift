
import Foundation
import SwiftUI

struct CastLinkView: View {

    let cast: CastProfile

    var body: some View {
        //En esta vista se carga una pantalla que muestra los detalles de un actor más específicos
        ZStack {
            Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea()
            VStack {
                AsyncImage(url: cast.photoUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                } placeholder: {
                    ProgressView()
                        .frame(width: 500, height: 400)
                }
                Text("Nombre: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(width: 250)
                Text(cast.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .opacity(0.4)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(width: 250)
                Text("Cumpleaños: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(width: 250)
                Text(cast.birthday)
                    .font(.title3)
                    .fontWeight(.bold)
                    .opacity(0.4)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(width: 250)
                Text("Biografía: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(width: 250)
                Text(cast.biography)
                    .opacity(0.4)
                    .foregroundColor(.white)
                    .lineLimit(4)
                    .frame(width: 390)
            }
        }
    }
}
