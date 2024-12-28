import SwiftUI

class MapViewModel: ObservableObject {
    var contact = MapModel()
    @Published var isAllRecipesAvailible = false
    @Published var isYourFavoriteAvailible = false
    @Published var isAustralia = false
    @Published var isEurope1 = false
    @Published var isEurope2 = false
    @Published var isEurope3 = false
    @Published var isAfrica1 = false
    @Published var isAfrica2 = false
    @Published var isAfrica3 = false
    @Published var isAsia1 = false
    @Published var isAsia2 = false
    @Published var isAsia3 = false
    @Published var isAmerica1 = false
    @Published var isAmerica2 = false
    @Published var isAmerica3 = false
    
    func goToFavorite() {
        isYourFavoriteAvailible = true
    }
    
    func goToRecipes() {
        isAllRecipesAvailible = true
    }
    
    func goTo() {
        
    }
    
    func goToAustralia() {
        isAustralia = true
    }
    
    func goToEurope1() {
        isEurope1 = true
    }
    
    func goToEurope2() {
        isEurope2 = true
    }
    
    func goToEurope3() {
        isEurope3 = true
    }
    
    func goToAfrica1() {
        isAfrica1 = true
    }
    
    func goToAfrica2() {
        isAfrica2 = true
    }
    
    func goToAfrica3() {
        isAfrica3 = true
    }
    
    func goToAsia1() {
        isAsia1 = true
    }
    
    func goToAsia2() {
        isAsia2 = true
    }
    
    func goToAsia3() {
        isAsia3 = true
    }
    
    func goToAmerica1() {
        isAmerica1 = true
    }
    
    func goToAmerica2() {
        isAmerica2 = true
    }
    
    func goToAmerica3() {
        isAmerica3 = true
    }
}



