import SwiftUI

class AllRecipesViewModel: ObservableObject {
    let contact = AllRecipesModel()
    @Published var isMenuAvailible = false
    @Published var isAllAvailible = false
    @Published var isRandomAvailible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToAll() {
        isAllAvailible = true
    }
    
    func goToRandom() {
        isRandomAvailible = true
    }
    
    func returnAllRecipes() -> [DishAndQiuzz] {
        return  [contact.asia2,
                 contact.america2,
                 contact.asia1,
                 contact.africa3,
                 contact.asia3,
                 contact.america3,
                 contact.austria,
                 contact.europe1,
                 contact.africa1,
                 contact.europe2,
                 contact.america1,
                 contact.europe3,
                 contact.africa2
        ]
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
        return array.randomElement() ?? DishAndQiuzz(imageNameContry: "", imageForFav: "",
                                                                                  imageCandy: "",
                                                                                  imageDish: "",
                                                                                  nameOfDish: "",
                                                                                  historyOfDish: "",
                                                                                  receptOfDish: "",
                                                                                  ingredients: "",
                                                                                  height: 0,
                                                                                  quizz: Quizzes(questions: [""],
                                                                                                 answers: [[""]],
                                                                                                 rightAnswers: [""]))
    }
}
