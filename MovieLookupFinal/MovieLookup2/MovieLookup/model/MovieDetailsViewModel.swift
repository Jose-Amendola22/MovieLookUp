import Foundation

import SwiftUI




@MainActor

class MovieDetailsViewModel: ObservableObject {
    @Published var credits: MovieCredits? // Créditos de la película
    @Published var cast: [MovieCredits.Cast] = [] // Reparto de la película
    @Published var castProfiles: [CastProfile] = [] // Perfiles de los miembros del reparto

    // Obtiene los créditos de la película y actualiza las propiedades relacionadas

    func movieCredits(for movieID: Int) async {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDiscoverViewModel.apiKey)&language=en-US")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(MovieCredits.self, from: data)
            self.credits = credits
            self.cast = credits.cast.sorted(by: { $0.order < $1.order })
            
        } catch {
            print(error.localizedDescription)
            
        }
        
    }
    // Carga los perfiles de los miembros del reparto y los agrega a la propiedad castProfiles
    func loadCastProfiles() async {
        do {
            for member in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(member.id)?api_key=\(MovieDiscoverViewModel.apiKey)&language=en-US")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let profile = try JSONDecoder().decode(CastProfile.self, from: data)
                castProfiles.append(profile)
                
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
}




struct CastProfile: Decodable, Identifiable {
    let birthday: String //Fecha de nacimiento del miembro del reparto
    let id: Int //Identificador único del miembro del reparto
    let name: String // Nombre del miembro del reparto
    let profile_path: String? //Ruta de la foto de perfil del miembro del reparto
    let biography: String
    // URL completa para acceder a la foto de perfil del miembro del reparto
    var photoUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")
        return baseURL?.appending(path: profile_path ?? "")
    }
}




struct MovieCredits: Decodable {
    let id: Int //Identificador único de la película
    let cast: [Cast] //Reparto de la película
    struct Cast: Decodable, Identifiable {
        let name: String //Nombre del actor/actriz
        let id: Int //Identificador único del actor/actriz
        let character: String //Personaje interpretado por el actor/actriz
        let order: Int //Orden del actor/actriz en el reparto
        
    }
}
