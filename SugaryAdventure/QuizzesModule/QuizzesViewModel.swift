import SwiftUI

class QuizzesViewModel: ObservableObject {
    let contact = QuizzesModel()
    @Published var isMenuAvailible = false
    @Published var isHistoryAvailible = false
    @Published var isQuizzAvailible = false
    @Published var isMapAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToMap() {
        isMapAvailible = true
    }
    
    func goToHistory() {
        isHistoryAvailible = true
    }
    
    func goToQuiz() {
        isQuizzAvailible = true
    }
}
