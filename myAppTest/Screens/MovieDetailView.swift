//
//  MovieDetailView.swift
//  myAppTest
//
//  Created by Ana Carolina on 23/11/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.white, .black.opacity(0.3)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            ScrollView {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.bottom, 20)
                
                AsyncImage(
                    url: URL(string: movie.poster),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 250, maxHeight: 300)
                            .shadow(color: .black, radius: 10, x: 0, y: 0)
                            .padding(.bottom)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                VStack(spacing: 4) {
                    Text(movie.title)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                    
                    Text(movie.type)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.black.opacity(0.6))
                    
                    Text(movie.year)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(.black.opacity(0.3))
                }
                .frame(width: UIScreen.main.bounds.width * 0.8)
                
                Text(
                    """
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis bibendum, lectus ut viverra rhoncus, dolor nunc faucibus libero, eget facilisis enim ipsum id lacus. Nulla pulvinar eleifend sem. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et, dolor. In rutrum. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. Vestibulum fermentum tortor id mi. Aenean vel massa quis mauris vehicula lacinia. Integer pellentesque quam vel velit. Cras elementum.
                                         
                    Duis condimentum augue id magna semper rutrum. Phasellus faucibus molestie nisl. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent dapibus. Etiam quis quam. Aliquam in lorem sit amet leo accumsan lacinia. Ut tempus purus at lorem. Aenean vel massa quis mauris vehicula lacinia. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Suspendisse sagittis ultrices augue.
                    """
                )
                .padding()
                .foregroundStyle(.black.opacity(0.8))
                
                Spacer()
            }
            
            .ignoresSafeArea(edges: .bottom)
            .toolbar(.hidden)
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: "tt0372784", title: "Batman", year: "2005", type: "Action", poster: "https://m.media-amazon.com/images/M/MV5BODIyMDdhNTgtNDlmOC00MjUxLWE2NDItODA5MTdkNzY3ZTdhXkEyXkFqcGc@._V1_SX300.jpg"))
}
