
import SwiftUI

struct DatePickerTextField: View {
    @Binding var date: Date
    let isLarge: Bool

    var body: some View {
        ZStack {
            GeometryReader { geo in
                HStack {
                    DatePicker("", selection: $date, displayedComponents: .date)
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
                        .stroke(.primaryBlue,
                                lineWidth: 1)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .center)
            }
        }
    }
}

#Preview {
    DatePickerTextField(date: .constant(Date()), isLarge: false)
}
