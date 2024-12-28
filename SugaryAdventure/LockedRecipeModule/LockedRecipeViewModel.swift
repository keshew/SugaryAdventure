import SwiftUI

class LockedRecipeViewModel: ObservableObject {
    let contact = LockedRecipeModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
