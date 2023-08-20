//
//  BarChartView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 20/08/2023.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let data = [
        ChartData(type: "fish", count: 5),
        ChartData(type: "cat", count: 11),
        ChartData(type: "bird", count: 47),
        ChartData(type: "dog", count: 15),
        ChartData(type: "chicken", count: 65)
    ]
    
    var body: some View {
        Chart(data) { dataPoint in
            BarMark(x: .value("Population", dataPoint.count),
                    y: .value("Type", dataPoint.type))
            .foregroundStyle(by: .value("Type",dataPoint.type))
            .annotation(position: .trailing) {
                Text(String(dataPoint.count))
                    .foregroundColor(.gray)
            }
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                AxisValueLabel()
            }
        }
        .aspectRatio(1,contentMode: .fit)
        .padding()
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
