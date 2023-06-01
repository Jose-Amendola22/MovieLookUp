import Foundation




struct TrendingResults: Decodable {
    let page: Int // Página actual de resultados
    let results: [Movie] // Resultados de películas populares
    let total_pages: Int // Total de páginas de resultados
    let total_results: Int // Total de resultados
// Este struct representa los resultados de la consulta a la API de The Movie Database para obtener películas populares.
// Contiene información como la página actual, los resultados de películas, el total de páginas y el total de resultados.

}
