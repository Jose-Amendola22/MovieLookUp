
import SwiftUI

struct DiscoverView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""

    var body: some View {
        //Se carga los stacks que contienen el trending view junto con el search
        NavigationView {
            ScrollView {
                if searchText.isEmpty { //Sì el search esta vacío, se muestra las peliculas que esten trending
                    if viewModel.trending.isEmpty {
                        //Sí la api no envía nada se manda el texto siguiente.
                        Text("No Results")
                    } else {
                        //Carga el menu de las peliculas que esten trending
                        HStack {
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal
                        )
                        //Se crea un scrollView horizontal donde puedes  recorrer las peliculas que la API envie.
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                //El navigationLink permite el poder entrar en el detalle de cada pelicula.
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TrendingCard(trendingItem: trendingItem)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    //Este VStack carga sí se empieza a buscar algo
                    ScrollView(showsIndicators: false) {
                        LazyVStack() {
                            ForEach(viewModel.searchResults) { item in
                                    NavigationLink {
                                        MovieDetailView(movie: item)
                                    } label: {
                                        SearchView(searchItem: item)
                                    }
                            }
                        }
                    }
                }
            }
            .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
        }
        //Este bloque detecta cambios en la variable texto de searchText, cada 2
        //nuevos caracteres carga la función para buscar películas
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            if newValue.count > 2 {
                viewModel.search(term: newValue)
            }
        }
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
