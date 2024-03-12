
import SwiftUI

struct NotificationsView: View {
    let title = "Your bet on the future"
    
    @State private var isMenuPresented = false
    
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            
            VStack {
                GeometryReader { geo in
                    Image(.notifications)
                        .resizable()
                        .frame(width: geo.size.width,
                               height: geo.size.height / 1.05)
                }
                
                Text(title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                CustomButton(text: "Allow notifications") {
                    requestNotifications()
                }
                .frame(height: 62)
                .padding(.vertical)
            }
            .ignoresSafeArea(edges: .top)
            
            closeButton
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .topTrailing)
        }
        .onAppear {
            StorageService.shared.isFirstLaunch = false
        }
        .navigate(to: TabBarView(),
                  when: $isMenuPresented)
    }
    
    var closeButton: some View {
        Button {
            isMenuPresented.toggle()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12)
                .foregroundColor(.white)
                .padding(10)
        }
        .background(Circle()
            .foregroundColor(.primaryClose))
        .padding(.trailing)
        .padding(.top, 5)
    }
    
    private func requestNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
            if let error {
                print(error.localizedDescription)
            }
            
            isMenuPresented.toggle()
        }
    }
}

#Preview {
    NotificationsView()
}
