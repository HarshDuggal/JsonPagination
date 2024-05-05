//
//  DetailView.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import SwiftUI

// MARK: - Detail View
struct DetailView: View, Equatable {
    // Implement the == operator to compare two DetailView instances considering post id as unique to reuse the view
    static func == (lhs: DetailView, rhs: DetailView) -> Bool {
        lhs.viewModel.post.id == rhs.viewModel.post.id
    }
//    var post: Post
    @ObservedObject var viewModel: PostDetailViewModel // Use observed object to track changes
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title \(viewModel.post.id): \(viewModel.post.title)").font(.headline)
            Text("Body: \(viewModel.post.body)").font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            HeavyComputationView()
            Spacer()
            CachedImageView(imageURL: URL(string: "https://via.placeholder.com/600/92c952")!)
        }
        .padding()
        .multilineTextAlignment(TextAlignment.leading)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
