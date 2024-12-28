import SwiftUI

class FavoriteReceptViewModel: ObservableObject {
    let contact = FavoriteReceptModel()
    @Published var isMenuAvailible = false
    @Published var columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 7)
    func goToMenu() {
        isMenuAvailible = true
    }
}
