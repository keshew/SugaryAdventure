import SwiftUI

struct QuizzesGameView: View {
    @StateObject var quizzesGameModel = QuizzesGameViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var quiz: DishAndQiuzz
    @State var currentIndex = 0
    @State private var selectedAnswer: String? = nil
    @State var isWin = false
    
    func goToWin() {
        isWin.toggle()
    }
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.quizzesBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    SimpleButtons(action: quizzesGameModel.goToQuiz,
                                  image: ImageName.backArrow.rawValue,
                                  geometry: geometry)
                    .position(x: geometry.size.width / 12.6, y: geometry.size.height / 7.1)
                    
                    SimpleButtons(action: quizzesGameModel.goToMenu,
                                  image: ImageName.gear.rawValue,
                                  geometry: geometry)
                    .position(x: geometry.size.width / 1.1, y: geometry.size.height / 7.1)
                    
                    if isWin {
                        CongratulationView(quiz: $quiz)
                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                            .zIndex(1)
                    }
                    
                    VStack {
                        ZStack {
                            Image(quiz.imageDish)
                                .resizable()
                                .frame(width: geometry.size.width * 0.56,
                                       height: geometry.size.height * 0.46)
                                .offset(y: -geometry.size.height * 0.256)
                            
                            Image(.historyCandyBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.56,
                                       height: geometry.size.height * 0.695)
                                .offset(y: geometry.size.height * 0.19)
                            
                            Text(quiz.quizz.questions[currentIndex])
                                .Bubble(size: 15)
                                .lineSpacing(5)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                                .frame(width: geometry.size.width * 0.51,
                                       height: geometry.size.height * 0.66)
                                .offset(y: geometry.size.height * -0.08)
                                .shadow(radius: 0, y: 4)
                            
                            Text(quiz.nameOfDish)
                                .Bubble(size: 20)
                                .offset(y: -geometry.size.height * 0.22)
                            
                            ForEach(quiz.quizz.answers[currentIndex].indices, id: \.self) { item in
                                Button(action: {
                                    selectedAnswer = quiz.quizz.answers[currentIndex][item]
                                    if quiz.quizz.answers[currentIndex][item] == quiz.quizz.rightAnswers[currentIndex] {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            currentIndex = 1
                                        }
                                    } else if currentIndex > 0, quiz.quizz.answers[currentIndex][item] != quiz.quizz.rightAnswers[currentIndex] {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            currentIndex = 0
                                        }
                                    }
                                    
                                    if currentIndex == 1, quiz.quizz.answers[currentIndex][item] == quiz.quizz.rightAnswers[currentIndex] {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            goToWin()
                                        }
                                    }
                                }) {
                                    Text("\u{2022} \(quiz.quizz.answers[currentIndex][item])")
                                        .Bubble(size: 17,
                                                color: selectedAnswer == quiz.quizz.answers[currentIndex][item] ?
                                                    (quiz.quizz.answers[currentIndex][item] == quiz.quizz.rightAnswers[currentIndex] ? Color.green : Color.red) : Color.white)
                                        .lineSpacing(5)
                                        .minimumScaleFactor(0.8)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: geometry.size.width * 0.56,
                                       height: geometry.size.height * 0.16)
                                .offset(y: -geometry.size.height * -0.04 + (CGFloat(item) * 50))
                                .shadow(radius: 0, y: 4)
                            }
                        }
                    }
                    
                    Image(.quizLabel)
                        .resizable()
                        .frame(width: 150,
                               height: 67)
                        .offset(y: -geometry.size.height * 0.41)
                }
            }
        }
        .navigationDestination(isPresented: $quizzesGameModel.isQuiz) {
            QuizzesView(quiz: $quiz)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var dishAndQuiz = DishAndQiuzz(imageNameContry: "", imageForFav: "",
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
    return QuizzesGameView(quiz: $dishAndQuiz)
}
