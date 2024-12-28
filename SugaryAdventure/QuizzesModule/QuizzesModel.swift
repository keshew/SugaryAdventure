import SwiftUI

struct DishAndQiuzz {
    var imageNameContry: String
    var imageCandy: String
    var imageDish: String
    var nameOfDish: String
    var historyOfDish: String
    var receptOfDish: String
    var ingredients: String
    var height: CGFloat
    var quizz: Quizzes
}

struct Quizzes {
    var questions: [String]
    var answers: [[String]]
    var rightAnswers: [String]
}

struct QuizzesModel {
   
}


