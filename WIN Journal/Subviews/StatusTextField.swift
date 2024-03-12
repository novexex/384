
import SwiftUI

struct StatusTextField: View {
    @Binding var status: Status?
    @State private var text = "Status"
    
    private var isStatusSet: Bool {
        status != nil
    }
    
    var body: some View {
        Menu {
            ForEach(Status.allCases, id: \.rawValue) { status in
                Button(status.rawValue.capitalized) {
                    self.status = status
                    text = status.rawValue.capitalized
                }
            }
        } label: {
            GeometryReader { geo in
                HStack {
                    Text(text)
                        .font(.system(size: 17))
                        .foregroundColor(isStatusSet ? .white : .primaryDisabled)
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(isStatusSet ? .white : .primaryDisabled)
                }
                .frame(maxWidth: geo.size.width / 1,
                       alignment: .leading)
                .padding(20)
                .padding(.trailing, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 0.5)
                        .stroke(isStatusSet ? .primaryBlue : .primaryDisabled, lineWidth: 1)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .center)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    StatusTextField(status: .constant(.archive))
}
