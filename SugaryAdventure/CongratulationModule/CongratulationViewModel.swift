import SwiftUI

class CongratulationViewModel: ObservableObject {
    let contact = CongratulationModel()
    @Published var isMenuAvailible = false
    @Published var isMapAvailible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToMap() {
        isMapAvailible = true
    }
}
