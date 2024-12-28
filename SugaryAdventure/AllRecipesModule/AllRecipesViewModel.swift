import SwiftUI

class AllRecipesViewModel: ObservableObject {
    let contact = AllRecipesModel()
    @Published var isMenuAvailible = false
    @Published var isAllAvailible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToAll() {
        isAllAvailible = true
    }
}
