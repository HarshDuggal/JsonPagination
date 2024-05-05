//
//  CachedImageView.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import SwiftUI

struct CachedImageView: View {
    let imageURL: URL
    @State private var imageData: Data?
    
    var body: some View {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            // Display the cached image
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView() // Show loading indicator while image is being fetched
                .onAppear {
                    // Fetch image data asynchronously when view appears
                    fetchImageData(from: imageURL)
                }
        }
    }
    // Fetch image from server or if stored from the cache
    private func fetchImageData(from url: URL) {
        print("fetchImageData")
        // Check if image data is already cached
            if let cachedData = getCachedImageData(forKey: url.absoluteString) {
                print("fetchImageData already cached")
                self.imageData = cachedData
                return
            }
        DispatchQueue.global().async { // fetch image from server
            do {
                let data = try Data(contentsOf: url) //data loaded from the url
                print("fetchImageData from url")

                DispatchQueue.main.async {// update view on main thread
                    self.imageData = data
                    // Save the image data to cache
                    saveImageDataToCache(data, forKey: url.absoluteString)
                }
            } catch {
                print("Failed to fetch image data: \(error)")
            }
        }
    }
    
    // Save Image to Cache
    private func saveImageDataToCache(_ data: Data, forKey key: String) {
        // Generate a hash from the key (URL)
        let hashedKey = key.hashValue.description
        // Get the URL for the cache directory
        guard let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            print("Failed to find cache directory")
            return
        }
        // Append the key to the cache directory URL to create a unique file URL
        let fileURL = cacheDirectory.appendingPathComponent(hashedKey)
        
        // Create cache directory if it doesn't exist
        do {
            try FileManager.default.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Failed to create cache directory: \(error)")
            print("Error Failed to create cache directory:", error.localizedDescription)
            return
        }
        // Write the image data to the file URL
        do {//success
            try data.write(to: fileURL)
            print("Image data saved to cache successfully")
        } catch {//fail
            print("Failed to write image data to cache: \(error)")
            print("Error saving image data to cache:", error.localizedDescription)
        }
    }
    
    // Get Image from cache if already loaded
    private func getCachedImageData(forKey key: String) -> Data? {
           // Generate a hash from the key (URL)
           let hashedKey = key.hashValue.description
           // Get the URL for the cache directory
           guard let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
               print("Failed to find cache directory")
               return nil
           }
           // Get the file URL for the cached image
           let fileURL = cacheDirectory.appendingPathComponent(hashedKey)
           // Check if the image data exists in the cache
           if FileManager.default.fileExists(atPath: fileURL.path) {
               do {
                   // Retrieve the image data from cache
                   let imageData = try Data(contentsOf: fileURL)
                   return imageData
               } catch {
                   print("Failed to retrieve cached image data: \(error)")
               }
           }
           return nil
       }
}



struct CachedImageView_Previews: PreviewProvider {
    static var previews: some View {
        CachedImageView(imageURL: URL(string: "https://via.placeholder.com/600/92c952")!)
    }
}
