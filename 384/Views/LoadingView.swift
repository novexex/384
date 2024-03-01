
import SwiftUI

struct LoadingView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            Image(.logo)
            
            GeometryReader { geo in
                ProgressView(value: viewModel.progressValue,
                             total: viewModel.totalProgressValue)
                    .accentColor(.primaryBlue)
                    .progressViewStyle(.linear)
                    .onReceive(viewModel.timer, perform: { _ in
                        withAnimation {
                            viewModel.increaseProgress()
                        }
                    })
                    .frame(width: geo.size.width / 1.3)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .bottom)
                    .padding(.bottom, 40)
            }
        }
        .navigate(to: viewModel.nextView,
                  when: $viewModel.isLoadingEnded)
    }
}

#Preview {
    LoadingView()
}
