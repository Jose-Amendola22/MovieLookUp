

import Foundation
import SwiftUI

struct CastView: View {

    let cast: CastProfile

    var body: some View {
        VStack {
            //Muestra el actor, una foto con su nombre, esto aparece en la lista de actores de cada película
            AsyncImage(url: cast.photoUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 120)
            }
            Text(cast.name)
                .lineLimit(1)
                .frame(width: 100)
                .foregroundColor(.white)
        }
    }

}
