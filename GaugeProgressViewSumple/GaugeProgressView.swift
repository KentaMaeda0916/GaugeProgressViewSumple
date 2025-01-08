//
//  GaugeProgressView.swift
//  HabitMission
//
//  Created by KentaMaeda on 2024/11/28.
//

import Foundation
import SwiftUI

struct GaugeProgressView<Content:View>: View {
    let progressValue: Double
    let height: CGFloat
    let lineWidth: CGFloat
    let color: Color
    let content: Content
    
    init(
        progressValue: Double,
        height: CGFloat,
        lineWidth: CGFloat,
        color: Color,
        @ViewBuilder content: () -> Content
    ) {
        self.progressValue = progressValue
        self.height = height
        self.lineWidth = lineWidth
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
            ProgressView(value: progressValue)
                .progressViewStyle(
                    GaugeProgressStyle(
                        color: color,
                        lineWidth: lineWidth
                    )
                )
                .frame(width: height, height: height)
            ProgressView(value: 1)
                .progressViewStyle(
                    GaugeProgressStyle(
                        color: .blue,
                        lineWidth: lineWidth,
                        opacity: 0.2
                    )
                )
                .frame(width: height, height: height)
        }
    }
}

struct GaugeProgressStyle: ProgressViewStyle {
    var color: Color
    var lineWidth: CGFloat
    var opacity: Double
    
    init(color: Color,
         lineWidth: CGFloat,
         opacity: Double = 1
    ) {
        self.color = color
        self.lineWidth = lineWidth
        self.opacity = opacity
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .opacity(opacity)
        }
    }
}
