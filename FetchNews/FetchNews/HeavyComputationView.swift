//
//  HeavyComputation.swift
//  FetchNews
//
//  Created by Harsh Duggal on 05/05/24.
//

import SwiftUI

// MARK: - HeavyComputationView
struct HeavyComputationView: View {
    @State private var result: Int = 0

    var body: some View {
        Text("Result: \(result)")
            .font(.subheadline)
            .foregroundColor(.blue)
            .onAppear {
                // Perform heavy computation on a background thread
                DispatchQueue.global(qos: .background).async {
                    // Simulate heavy computation
                    var sum = 0
                    for i in 0..<1000000 {
                        sum += i
                    }

                    // Update result on the main thread
                    DispatchQueue.main.async {
                        self.result = sum
                    }
                }
            }
    }
}

struct HeavyComputation_Previews: PreviewProvider {
    static var previews: some View {
        HeavyComputationView()
    }
}

//// Heavy Computation Image View
//struct HeavyComputationImageView: View {
//    @State private var image: UIImage?
//
//    var body: some View {
//        VStack {
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding()
//            } else {
//                Text("Generating image...")
//                    .padding()
//            }
//
//            Button("Generate Image") {
//                generateImage()
//            }
//            .padding()
//        }
//    }
//
//    // Generate a heavy computation image
//    private func generateImage() {
//        DispatchQueue.global(qos: .background).async {
//            // Perform heavy computation to generate the image
//            // For demonstration, let's generate a random image
//            let size = CGSize(width: 200, height: 200)
//            let randomColor = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
////            let randomImage = Image(uiImage: UIGraphicsImageRenderer(size: size).image { context in
////                randomColor.setFill()
////                context.fill(CGRect(origin: .zero, size: size))
////            })
//            let randomImage = randomColor.overlay(Color.clear)
//                .frame(width: size.width, height: size.height)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                .shadow(radius: 10)
//
//            // Update UI on the main thread
//            DispatchQueue.main.async {
//                self.image = randomImage.asImage()
//            }
//        }
//    }
//}
//// Helper extension to convert SwiftUI View to UIImage
//extension View {
//    func asImage() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        let view = controller.view
//
//        let renderer = UIGraphicsImageRenderer(size: view!.bounds.size)
//        let image = renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//        return image
//    }
//}
