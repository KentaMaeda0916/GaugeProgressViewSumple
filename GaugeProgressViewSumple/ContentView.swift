//
//  ContentView.swift
//  GaugeProgressViewSumple
//
//  Created by KentaMaeda on 2025/01/08.
//

import SwiftUI

struct ContentView: View {
    @State var progressValue = 0.5
    var body: some View {
        VStack {
            GaugeProgressView(
                progressValue: progressValue,
                height: 280,
                lineWidth: 60,
                color: .blue
            ) {
                Text("\(String(format: "%.0f%%", progressValue * 100))") 
                    .font(.largeTitle)
            }
            Button {
                withAnimation {
                    progressValue = progressValue + 0.1
                }
            } label: {
                Text("add progress")
            }
            .padding(80)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
