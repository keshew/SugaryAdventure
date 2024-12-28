import SwiftUI

class QuizzesGameViewModel: ObservableObject {
    let contact = QuizzesGameModel()
    @Published var isMenuAvailible = false
    @Published var isWin = false
    @Published var isQuiz = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToQuiz() {
        isQuiz = true
    }
    
    func goToWin() {
        isWin = true 
    }
}
