
import SwiftUI

extension LoadingView {
    final class ViewModel: ObservableObject {
        @Published private(set) var progressValue: Double = 0
        @Published var isLoadingEnded = false
        let totalProgressValue: Double
        private(set) var timer = Timer.publish(every: 0.1,
                                               on: .main,
                                               in: .common).autoconnect()
        
        @ViewBuilder
        var nextView: some View {
            if StorageService.shared.isOnboarding {
                OnboardingView()
            } else {
                TabBarView()
            }
        }
        
        init(totalProgressValue: Double = 10) {
            self.totalProgressValue = totalProgressValue
        }
        
        func increaseProgress(value: Double = 1) {
            guard progressValue < totalProgressValue else {
                timer.upstream.connect().cancel()
                isLoadingEnded = true
                progressValue = 0
                return
            }
            
            progressValue += value
        }
        
        func restart() {
            timer = Timer.publish(every: 0.1,
                                  on: .main,
                                  in: .common).autoconnect()
        }
    }
}
