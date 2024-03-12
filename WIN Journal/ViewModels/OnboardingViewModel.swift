
import SwiftUI

extension OnboardingView {
    final class ViewModel: ObservableObject {
        @Published var currentPage: Int
        let totalPages = 2
        
        @Published private(set) var imageNamed: String
        @Published private(set) var title: String
        @Published private(set) var subtitle: String
        
        @Published var isOnboardingEnded = false
        
        init(currentPage: Int = 1) {
            self.currentPage = currentPage
            imageNamed = ""
            title = ""
            subtitle = ""
            changeResources()
        }
        
        func nextButtonPressed() {
            guard currentPage != totalPages else {
                isOnboardingEnded = true
                resetState()
                return
            }
            currentPage += 1
            changeResources()
        }
        
        private func resetState() {
            currentPage = 1
        }
        
        private func changeResources() {
            imageNamed = "onboarding_\(currentPage)"
            title = Constants.onboardingTitles[currentPage-1]
            subtitle = Constants.onboardingSubtitles[currentPage-1]
        }
    }
}
