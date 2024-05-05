//
//  LoadServerData.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import Foundation

// MARK: - Detail VIEW MODEL (only one post)
class PostDetailViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
}

// MARK: - Data Loading View Model (multiple posts)
class PostListViewModel: ObservableObject {
    @Published var items: [Post] = []
    @Published var isLoading = false //track server call is in progress
    @Published var currentPage = 1 // count the number of pages fetched
    private var perPageLimit = 10
    // Load data from the server based on the page number
    func loadNextPage() {
        guard !isLoading else { return }
        isLoading = true
        print("loading for page\(currentPage)")
        //create url of the page
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(currentPage)&_limit=\(perPageLimit)") else {
            print("Invalid URL")
            return
        }
        //fetch data from the given url
        print("Fetch data from url: \(url.description)")
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { // failed case error handling
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do { //successfully got the json response
                // Decode JSON data into an array of Post objects
                let decoder = JSONDecoder()
                let newPosts = try decoder.decode([Post].self, from: data)
                DispatchQueue.main.async { //update on the main thread
                    self.items.append(contentsOf: newPosts)
                    print("total loaded items\(self.items.count)")
                    self.isLoading = false // update server loading bool
                    self.currentPage += 1 // update page count
                }
            } catch {
                print("Error decoding JSON: \(error)")
                print("Error decription JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

