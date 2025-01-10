import SwiftUI

class FavoriteReceptViewModel: ObservableObject {
    let contact = FavoriteReceptModel()
    @Published var isMenuAvailible = false
    @Published var isAllRecipesAvailible = false
    @Published var columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 7)
    @Published var isRandomAvailible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToAllRecipes() {
        isAllRecipesAvailible = true
    }
    
    func goToRandom() {
        isRandomAvailible = true
    }
    
    func returnRandom() -> DishAndQiuzz {
        let array = [contact.africa1,
                     contact.africa2,
                     contact.africa3,
                     contact.asia1,
                     contact.asia2,
                     contact.asia3,
                     contact.austria,
                     contact.america1,
                     contact.america2,
                     contact.america3,
                     contact.europe1,
                     contact.europe2,
                     contact.europe3]
        return array.randomElement() ?? DishAndQiuzz(imageNameContry: "",
                                                     imageCandy: "",
                                                     imageDish: "", nameOfDish: "",
                                                     historyOfDish: "",
                                                     receptOfDish: "",
                                                     ingredients: "",
                                                     height: 0,
                                                     quizz: Quizzes(questions: [""],
                                                                    answers: [[""]],
                                                                    rightAnswers: [""]))
    }
}
