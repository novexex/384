
import Foundation

func formattedDate(_ date: Date, 
                   dateFormat: String = "dd.MM.yyyy") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    return dateFormatter.string(from: date)
}
