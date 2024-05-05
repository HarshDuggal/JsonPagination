//
//  ContentView.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import SwiftUI

// MARK: - VIEW
struct ContentView: View {
    @StateObject private var viewModel = PostListViewModel()
    @State private var selectedPost: Post? = nil
    
    // MARK: Body
    var body: some View {
        NavigationView {
            VStack {
                //header view
                HeaderView()
                //lsit of posts fetched
                PostListView(viewModel: viewModel, selectedPost: $selectedPost)
                //progress view if server call is still loading
                if viewModel.isLoading {
                    ProgressView().foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
        }
        // data can be used to the child view and visaversa
        .environmentObject(viewModel)
        // open detail page on selection
        .sheet(item: $selectedPost) { post in
            NavigationView {
                DetailView(viewModel: PostDetailViewModel(post: post))
                    .navigationBarTitle("Detail View ID: \(post.id)", displayMode: .inline)
                }
        }
    }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
