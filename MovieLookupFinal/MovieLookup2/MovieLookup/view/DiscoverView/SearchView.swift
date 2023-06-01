//
//  SearchView.swift
//  MovieLookup
//
//  Created by Computo 3 on 23/05/23.
//

import SwiftUI


struct SearchView: View {

    let searchItem: Movie

    var body: some View {
        HStack {
            HStack{
                //Carga el poster de la película
                AsyncImage(url: searchItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 120)
            }
            .cornerRadius(10)}
            Spacer()
            HStack() {
                //Elementos de la película
                Text(searchItem.title)
                    .foregroundColor(.white)
                    .font(.headline)

                HStack {
                    //Calificación
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", searchItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            Spacer()
    }
        .padding()
        .background(Color(red:61/255,green:61/255,blue:88/255))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
