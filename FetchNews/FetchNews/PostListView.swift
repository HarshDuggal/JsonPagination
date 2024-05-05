//
//  PostListView.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import SwiftUI

// MARK: - PostListView
struct PostListView: View {
    @ObservedObject var viewModel: PostListViewModel
    @Binding var selectedPost: Post?
    @State private var displayTimes: [Double] = [] // Array to store display times

    var body: some View {
        List(viewModel.items) { post in
            VStack(alignment: .leading) {
                Text("ID: \(post.id). \(post.title)")
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HeavyComputationView()
            }
            .onAppear {
                // Record the timestamp when the row appears
                let displayTime = Date().timeIntervalSinceReferenceDate
                displayTimes.append(displayTime)
                
                //if last row is visible fetch next batch
                if isLastRow(post: post) && !viewModel.isLoading {
                    viewModel.loadNextPage()
                }
                // Calculate time difference and log it
                logDisplayTime(for: post)
            }
            .onTapGesture {
                selectedPost = post
            }
        }
        .navigationTitle("World Affairs")
        .onAppear {// load initial page
            // Start tracking display times when the view appears
            displayTimes = [Date().timeIntervalSinceReferenceDate]
            print("loaded items\(displayTimes)")
            viewModel.loadNextPage()
        }
    }
    // Check if the given post is the last post in the list
    private func isLastRow(post: Post) -> Bool {
        if let lastPost = viewModel.items.last, lastPost.id == post.id {
            print("isLastPost \(lastPost.id)")
            return true
        } else {
            return false
        }
    }
    // Function to calculate and log the time difference for the current row
    private func logDisplayTime(for post: Post) {
        guard displayTimes.count >= 2 else {
            return // Not enough data to calculate time difference
        }
        
        let currentIndex = displayTimes.count - 1
        let previousIndex = currentIndex - 1
        
        let currentTime = displayTimes[currentIndex]
        let previousTime = displayTimes[previousIndex]
        
        let timeDifference = currentTime - previousTime
        print("Row \(post.id) displayed in \(timeDifference) seconds")
    }

}
//
//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}
