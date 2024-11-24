//
//  MoviesListView.swift
//  myAppTest
//
//  Created by Ana Carolina on 23/11/24.
//

import SwiftUI

struct MoviesListView: View {
    
    // set the pageData by default to empty data
    @State private var pageData = PageData(search: [], totalResults: "0", response: "")
    
    // current page index 1 when starting
    @State private var currentPage: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.white, .black.opacity(0.3)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
                    ScrollViewReader { scrollView in
                        ScrollView {
                            
                            Text("current page: " + String(currentPage))
                            Text("\(pageData.totalResults) \(String(localized: "totalResults"))")
                            
                            ForEach(pageData.search, id: \.id) { movie in
                                MovieListViewItem(movie: movie)
                            }
                            
                            HStack(spacing: 50) {
                                
                                if currentPage > 1 {
                                    Button(action: {
                                        if currentPage >= 2 {
                                            currentPage -= 1
                                        }
                                    }) {
                                        Image(systemName: "chevron.left")
                                    }
                                }
                                
                                Button(action: {
                                    if currentPage <= 2 {
                                        currentPage += 1
                                    }
                                }) {
                                    Image(systemName: "chevron.right")
                                }
                            }.foregroundStyle(.black.opacity(0.5))
                                .font(.system(size: 29, weight: .bold)).padding(.vertical)
                        }
                        
                        .onAppear {
                            Service().getDataForPage(page: currentPage) { pageData in
                                self.pageData = pageData
                            }
                        }
                        
                        .onChange(of: currentPage) { _, newPage in
                            Service().getDataForPage(page: newPage) { pageData in
                                self.pageData = pageData
                                // scroll to the top of the screen
                                withAnimation {
                                    scrollView.scrollTo("top", anchor: .top)
                                }
                            }
                        }
                    }
                }
            }.navigationTitle(String(localized: "App Title"))
        }
    }
}

#Preview {
    MoviesListView()
}
