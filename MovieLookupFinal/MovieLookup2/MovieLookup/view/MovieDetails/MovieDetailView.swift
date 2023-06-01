

import Foundation
import SwiftUI

 

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss // Variable de entorno para descartar la vista
    @StateObject var model = MovieDetailsViewModel() // Objeto de estado para el ViewModel de detalles de la película
    let movie: Movie // Película para mostrar los detalles
    let headerHeight: CGFloat = 400 // Altura del encabezado de la película

 

    var body: some View {
        ZStack {
            Color(red: 39/255, green: 40/255, blue: 59/255).ignoresSafeArea() // Fondo de la vista con un color personalizado

 

            GeometryReader { geo in
                VStack {
                    AsyncImage(url: movie.backdropURL) { image in // Imagen asincrónica de fondo de la película
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } placeholder: {
                        ProgressView() // Vista de progreso mientras se carga la imagen
                    }
                    Spacer() // Espacio flexible para empujar los elementos hacia la parte superior de la vista
                }
            }

 

            ScrollView {
                Color(red: 39/255, green: 40/255, blue: 59/255).ignoresSafeArea() // Fondo de la vista de desplazamiento con un color personalizado

 

                VStack(spacing: 12) {
                    Spacer()
                        .frame(height: headerHeight)

 

                    HStack {
                        Text(movie.title) // Título de la película
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        Spacer()
                    }

 

                    HStack {
                        // Contenido adicional
                    }

 

                    HStack {
                        Text("Acerca de la película") // Título "Acerca de la película"
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }

 

                    Text(movie.overview) // Descripción de la película
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .opacity(0.4)

 

                    HStack {
                        Text("Reparto") // Título "Reparto"
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }

    

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(model.castProfiles) { cast in // Lista de perfiles de actores
                                NavigationLink {
                                    CastLinkView(cast: cast) // Vista de enlace al perfil del actor
                                } label: {
                                    CastView(cast: cast) // Vista del actor
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .overlay(alignment: .topLeading) {
                Button {
                    dismiss() // Botón para descartar la vista
                } label: {
                    Image(systemName: "chevron.left") // Icono de flecha hacia la izquierda
                        .imageScale(.large)
                        .fontWeight(.bold)
                }
                .padding(.leading)
            }
            .toolbar(.hidden, for: .navigationBar) // Oculta la barra de navegación
            .task {
                await model.movieCredits(for: movie.id) // Obtiene los créditos de la película
                await model.loadCastProfiles() // Carga los perfiles del reparto
            }
        }
    }
}

 

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview) // Vista previa de MovieDetailView
    }
}
