
import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.primaryBlackBlue
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Image(viewModel.imageNamed)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geo.size.height / 2)
            }
            .padding(.bottom)
            
            VStack {
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
                .frame(height: 62)
                .padding(.vertical)
            }
            .frame(maxHeight: .infinity,
                   alignment: .bottom)
        }
        .navigate(to: TabBarView(),
                  when: $viewModel.isOnboardingEnded)
    }
}

#Preview {
    OnboardingView()
}
