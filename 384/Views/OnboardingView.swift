
import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.primaryBlackBlue
                .ignoresSafeArea()
            
            VStack {
                Image(viewModel.imageNamed)
                    
                PageIndicator(currentPage: $viewModel.currentPage,
                              totalPages: viewModel.totalPages)
                    .padding()
                
                VStack(spacing: 10) {
                    Text(viewModel.title)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(viewModel.subtitle)
                        .font(.system(size: 17))
                        .foregroundColor(.primaryDisabled)
                }
                
                CustomButton(text: "Next") {
                    withAnimation {
                        viewModel.nextButtonPressed()
                    }
                }
            }
            .ignoresSafeArea(edges: [.top])
        }
        .navigate(to: TabBarView(),
                  when: $viewModel.isOnboardingEnded)
    }
}

#Preview {
    OnboardingView()
}
