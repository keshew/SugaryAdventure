import SwiftUI

class WelcomeViewModel: ObservableObject {
    let contact = WelcomeModel()
    @Published var isMapAvailible = false
    @Published var currentIndex = 0
    @Published var tapped = 0
    
    func goToMap() {
        isMapAvailible = true
    }
    
    func increaseIndex() {
        tapped += 1
        if currentIndex < 3 {
            currentIndex += 1
        }
        
        if tapped == 4 {
            isMapAvailible = true
        }
    }
}
