
import SwiftUI

struct DatePickerTextField: View {
    @Binding var date: Date?
    @State private var newDate = Date()
    let isLarge: Bool
    
    init(date: Binding<Date?>, isLarge: Bool = true) {
        self._date = date
        self.isLarge = isLarge
    }
    
    var isDateSet: Bool {
        date != nil
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                HStack {
                    DatePicker("", selection: $newDate, displayedComponents: .date)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .colorScheme(.dark)
                }
                .frame(maxWidth: geo.size.width / 1)
                .padding(13)
                .padding(.trailing, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 0.5)
                        .stroke(isDateSet ? .primaryBlue : .primaryDisabled,
                                lineWidth: 1)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .center)
            }
        }
        .onChange(of: newDate, perform: { value in
            date = value
        })
    }
}

#Preview {
    DatePickerTextField(date: .constant(Date()), isLarge: false)
}
