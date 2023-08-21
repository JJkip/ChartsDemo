//
//  RectangleChartView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 21/08/2023.
//

import SwiftUI
import Charts

struct RectangleChartView: View {
    let catData = PetData.catExample
    let dogData = PetData.dogExamples
    
    var body: some View {
        Chart {
            ForEach(catData) { dataPoint in
                RectangleMark(x: .value("Year", dataPoint.year),
                              y: .value("Population", dataPoint.population),
                              width: .fixed(30),
                              height: .fixed(10))
                .foregroundStyle(.purple)
            }
        }
        .chartXScale(domain: 1998...2025)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct RectangleChartView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleChartView()
    }
}
