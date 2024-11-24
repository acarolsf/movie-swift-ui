//
//  MovieListViewItem.swift
//  myAppTest
//
//  Created by Ana Carolina on 24/11/24.
//

import SwiftUI

struct MovieListViewItem: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                HStack {
                    AsyncImage(
                        url: URL(string: movie.poster),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 80, maxHeight: 200)
                                .shadow(color: .black, radius: 5, x: 0, y: 0)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )

                    VStack(alignment: .leading, spacing: 4) {
                        Text(movie.title)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text(movie.type)
                            .font(.system(size: 16, weight: .bold))
                        
                        Text(formatYear(year: movie.year))
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .bold))
                    
                }
                .foregroundStyle(.black.opacity(0.8))
                .padding()
                .padding(.horizontal, 5)
            }
            
            Rectangle()
                 .fill(Color.gray)
                 .frame(width: UIScreen.main.bounds.width, height: 2)
        }
    }
    
    func formatYear(year: String) -> String {
        let currentYear = Calendar.current.component(.year, from: Date())
        
        if year.contains("-") {
            return String(currentYear - (Int(year.components(separatedBy: "-").first!) ?? 2022)) + " years back"
        } else {
            return String(currentYear - (Int(year) ?? 2022)) + " years back"
        }
    }
}

#Preview {
    MovieListViewItem(movie:  Movie(id: "1", title: "Batman", year: "2005", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"))
}
