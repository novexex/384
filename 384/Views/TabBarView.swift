
import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    init() {
        if let window = UIApplication.shared.windows.first {
            window.backgroundColor = .black
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ArticlesTabView()
                .tabItem {
                    Label("Articles", systemImage: "doc.fill")
                }
                .tag(0)
            
            EventsTabView()
                .tabItem {
                    Label("Events", systemImage: "trophy.fill")
                }
                .tag(1)
            
            BudgetTabView()
                .tabItem {
                    Label("Budget", systemImage: "dollarsign.circle.fill")
                }
                .tag(2)
            
            PostsTabView()
                .tabItem {
                    Label("Posts", systemImage: "doc.richtext.fill")
                }
                .tag(3)
            
            SettingsTabView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
        .accentColor(.primaryBlue)
        .onAppear {
            UITabBar.appearance().backgroundColor = .tabBarBackground
            UITabBar.appearance().unselectedItemTintColor = .primaryDisabled
        }
    }
}

#Preview {
    TabBarView()
}
