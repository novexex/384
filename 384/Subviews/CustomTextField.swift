
import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    let isLarge: Bool
    let isExpandable: Bool
    
    init(placeholder: String,
         text: Binding<String>,
         isLarge: Bool = true,
         isExpandable: Bool = false) {
        self.placeholder = placeholder
        self._text = text
        self.isLarge = isLarge
        self.isExpandable = isExpandable
    }
    
    private let font = Font.system(size: 15)
    private let tintColor = Color.white
    private let disabledColor = Color.primaryDisabled
    
    private var isFilled: Bool {
        !text.isEmpty
    }
    
    var body: some View {
        GeometryReader { geo in
            textField
                .frame(width: isLarge ? geo.size.width / 1.1 : geo.size.width / 1.25)
                .padding(.horizontal)
                .padding(.vertical, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 0.5)
                        .stroke(isFilled ? .primaryBlue : .primaryDisabled, lineWidth: 1)
                )
//                .frame(maxWidth: geo.size.width,
//                       maxHeight: .infinity,
//                       alignment: isExpandable ? .top : .center)
        }
    }
    
    var textField: some View {
        ZStack {
            if #available(iOS 16.0, *) {
                TextField(text: $text, axis: isExpandable ? .vertical : .horizontal) {
                    Text(placeholder)
                        .font(font)
                        .foregroundColor(disabledColor)
                }
            } else if #available(iOS 15.0, *) {
                TextField(text: $text) {
                    Text(placeholder)
                        .font(font)
                        .foregroundColor(disabledColor)
                }
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .accentColor(.white)
        .font(font)
        .foregroundColor(tintColor)
        .multilineTextAlignment(.leading)
        .autocorrectionDisabled(true)
    }
}

#Preview {
    CustomTextField(placeholder: "Headline", text: .constant(""), isLarge: false, isExpandable: true)
}
