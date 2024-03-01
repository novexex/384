
import SwiftUI

extension LoadingView {
    final class ViewModel: ObservableObject {
        @Published private(set) var progressValue: Double = 0
        @Published var isLoadingEnded = false
        let totalProgressValue: Double
        private let animationDuration: TimeInterval
        private(set) var timer = Timer.publish(every: 0.1,
                                               on: .main,
                                               in: .common).autoconnect()
        
        var nextView: some View {
            if StorageService.shared.isFirstLaunch {
                return AnyView(OnboardingView())
            } else {
                return AnyView(TabBarView())
            }
        }
        
        init(animationDuration: TimeInterval = 4,
             totalProgressValue: Double = 10) {
            self.animationDuration = animationDuration
            self.totalProgressValue = totalProgressValue
        }
        
        func increaseProgress(value: Double = 1) {
            guard progressValue < totalProgressValue else {
                timer.upstream.connect().cancel()
                isLoadingEnded = true
                return
            }
            
            progressValue += value
        }
    }
}
