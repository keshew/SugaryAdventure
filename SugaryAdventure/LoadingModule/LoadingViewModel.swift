import SwiftUI

class LoadingViewModel: ObservableObject {
    let contact = LoadingModel()
    @Published var isWelcomeAvailible = false
    @Published var currentIndex = 0
    @Published var timer: Timer?
    @Published var currentText = "LOADING..."
    @Published var index = 2
    
    func goToWelcome() {
        isWelcomeAvailible = true
    }
    
    func loadScreen() -> String {
        return contact.arrayOfImages[currentIndex]
    }
    
    func startTimer() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
             self.changeText()
         }
     }
    
    func changeText() {
        index -= 1
        if index == -1 {
            index = 2
        }
        currentText = contact.arrayOfText[index]
     }
}
