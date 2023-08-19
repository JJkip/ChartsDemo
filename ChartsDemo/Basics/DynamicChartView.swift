//
//  DynamicChartView.swift
//  ChartsDemo
//
//  Created by Joseph Langat on 18/08/2023.
//

import SwiftUI
import Charts

struct ChartData: Identifiable, Equatable{
    let type: String
    let count: Int
    var id: String {return type}
}

struct DynamicChartView: View {
    let data = [
        ChartData(type: "dog", count: 5),
        ChartData(type: "cat", count: 10),
        ChartData(type: "bird", count: 15)
    ]
    var maxChartData: ChartData? {
        data.max{$0.count < $1.count}
    }
    var average: Double {
            let sumOfCounts = data.reduce(0) { $0 + $1.count }
            return Double(sumOfCounts) / Double(data.count)
        }
    var body: some View {
        Chart {
            ForEach(data) { dataPoint in
                BarMark(x: .value("Type", dataPoint.type),
                        y: .value("Poplulation", dataPoint.count))
                .opacity(maxChartData == dataPoint ? 1: 0.5)
            }
            RuleMark(y: .value("Avarage", average))
                .foregroundStyle(.gray)
                .annotation(position: .bottom, alignment: .bottomLeading) {
                    Text("Average: \(average)")
                }
        }
        .aspectRatio(1,contentMode: .fit)
    }
}

struct DynamicChartView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicChartView()
    }
}
