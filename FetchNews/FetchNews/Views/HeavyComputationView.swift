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
