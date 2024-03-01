
import SwiftUI

struct SettingsTabView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = ViewModel()
    
    @State private var showAlert = false
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                NavigationBar(title: "Settings", withButton: false) {}
                
                shareButton
                
                SettingsButton(text: "Rate app",  systemImage: "star.fill") {
                    viewModel.requestReview()
                }
                .frame(height: 111)
                
                SettingsButton(text: "Usage profile", systemImage: "doc.text.fill") {
                    
                }
                .frame(height: 111)
                
                SettingsButton(text: "Reset progress", systemImage: "arrow.triangle.2.circlepath", isRed: true) {
                    showAlert.toggle()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Reset Confirmation"),
                          message: Text("Your progress will be permanently reset. Do you really want to delete all data?"),
                          primaryButton: .destructive(Text("Reset")) {
                        viewModel.reset(presentationMode: presentationMode)
                    },
                          secondaryButton: .cancel(Text("Cancel"))
                    )
                }
                
                Spacer()
            }
        }
    }
    
    var shareButton: some View {
        ZStack {
            if let url = viewModel.url {
                if #available(iOS 16.0, *) {
                    ShareLink(item: url) {
                        disabledShareButton
                    }
                } else {
                    SettingsButton(text: "Share app", systemImage: "square.and.arrow.up.fill") {
                        showSheet.toggle()
                    }
                    .sheet(isPresented: $showSheet) {
                        ActivityView(activityItems: [url])
                    }
                }
            } else {
                disabledShareButton
            }
        }
        .frame(height: 111)
    }
    
    var disabledShareButton: some View {
        SettingsButton(text: "Share app",
                       systemImage: "square.and.arrow.up.fill") {}
            .disabled(true)
    }
}

fileprivate struct SettingsButton: View {
    let text: String
    let systemImage: String
    let isRed: Bool
    let action: () -> ()
    
    init(text: String,
         systemImage: String,
         isRed: Bool = false,
         action: @escaping () -> Void) {
        self.text = text
        self.systemImage = systemImage
        self.isRed = isRed
        self.action = action
    }
    
    var body: some View {
        GeometryReader { geo in
            Button(action: action) {
                VStack(alignment: .leading, spacing: 15) {
                    Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundColor(.white)
                        .padding(.leading, 1)
                    
                    Text(text)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: geo.size.width / 1.23, alignment: .leading)
                .padding(20)
                .padding(.leading, 5)
                .background(isRed ? Color.primaryRed : Color.settingsButton)
                .cornerRadius(30)
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    SettingsTabView()
}
