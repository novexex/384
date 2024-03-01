
import SwiftUI
import RealmSwift

struct NewEventView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea()
            
            VStack {
                DragIndicator()
                
                Text("New event")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                VStack(spacing: 20) {
                    HStack {
                        CustomTextField(placeholder: "Team 01",
                                        text: $viewModel.firstTeamName,
                                        isLarge: false)
                        
                        CustomTextField(placeholder: "Team score",
                                        text: $viewModel.firstTeamScore,
                                        isLarge: false)
                        .keyboardType(.numberPad)
                    }
                    .frame(height: 62)
                    
                    HStack {
                        CustomTextField(placeholder: "Team 02",
                                        text: $viewModel.secondTeamName,
                                        isLarge: false)
                        
                        CustomTextField(placeholder: "Team score",
                                        text: $viewModel.secondTeamScore,
                                        isLarge: false)
                        .keyboardType(.numberPad)
                    }
                    .frame(height: 62)
                    
                    SportsScroll(sportType: $viewModel.sportType)
                        .padding(.trailing, -10)
                    
                    CustomTextField(placeholder: "Subtitle",
                                    text: $viewModel.subtitle)
                        .frame(height: 62)
                    
                    DatePickerTextField(date: $viewModel.date, isLarge: true)
                        .frame(height: 62)
                    
                    Spacer()
                    
                    CustomButton(text: "Add",
                                 disabled: !viewModel.isAddButtonActive) {
                        viewModel.saveModel()
                        presentationMode.wrappedValue.dismiss()
                    }
                                 .frame(height: 62)
                                 .padding(.horizontal, -15)
                                 .opacity(viewModel.isAddButtonActive ? 1 : 0.5)
                                 .animation(.default)
                }
            }
            .padding()
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    NewEventView()
}
