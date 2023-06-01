import Foundation




struct Movie: Identifiable, Decodable {
    let adult: Bool // Indica si la película es para adultos o no
    let id: Int // Identificador único de la película
    let poster_path: String? // Ruta del póster de la película
    let title: String // Título de la película
    let overview: String // Descripción general de la trama o contenido de la película
    let vote_average: Float // Calificación promedio de la película
    let backdrop_path: String? // Ruta del fondo de pantalla de la película
    // URL completa para acceder a la imagen de fondo de la película
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    // URL completa para acceder a una versión en miniatura del póster de la película
    var posterThumbnail: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "")
        
    }
    // URL completa para acceder al póster de la película en su tamaño original
    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "")
        
    }
    // URL completa para acceder al póster de la película en su tamaño original
    static var preview: Movie {
        return Movie(adult: false,
                     id: 23834,
                     poster_path: "https://image.tmdb.org/t/p/w300",
                     title: "Free Guy",
                     overview: "some demo text here",
                     vote_average: 5.5,
                     backdrop_path: "https://image.tmdb.org/t/p/w300")
    
    }
}
