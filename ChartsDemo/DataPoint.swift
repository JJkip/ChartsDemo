
import Foundation

struct SleepDataPoint: Identifiable {
    
    var id = UUID().uuidString
    var day: String
    var hours: Int
    var type: String = "Night"
}

