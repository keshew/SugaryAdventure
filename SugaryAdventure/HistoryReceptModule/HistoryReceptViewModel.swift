import SwiftUI

class HistoryReceptViewModel: ObservableObject {
    let contact = HistoryReceptModel()
    @Published var isMenuAvailible = false
    @Published var isQuizAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToQuiz() {
        isQuizAvailible = true
    }
}
