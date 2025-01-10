import SwiftUI

struct HistoryReceptView: View {
    @StateObject var historyReceptModel =  HistoryReceptViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var quiz: DishAndQiuzz
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.quizzesBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    SimpleButtons(action: historyReceptModel.goToQuiz,
                                  image: ImageName.backArrow.rawValue,
                                  geometry: geometry)
                    .position(x: geometry.size.width / 12.6, y: geometry.size.height / 7.1)
                    
                    SimpleButtons(action: historyReceptModel.goToMenu,
                                  image: ImageName.gear.rawValue,
                                  geometry: geometry)
                    .position(x: geometry.size.width / 1.1, y: geometry.size.height / 7.1)
                    
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
                            
                            Text(quiz.historyOfDish)
                                .Bubble(size: 10)
                                .lineSpacing(16)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                                .frame(width: geometry.size.width * 0.51,
                                       height: geometry.size.height * 0.66)
                                .offset(y: geometry.size.height * 0.18)
                            
                            Text(quiz.nameOfDish)
                                .Bubble(size: 20)
                                .offset(y: -geometry.size.height * 0.22)
                        }
                    }
                    
                    Image(.historyLabel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.253,
                               height: geometry.size.height * 0.154)
                        .offset(y: -geometry.size.height * 0.41)
                }
            }
        }
        .navigationDestination(isPresented: $historyReceptModel.isQuizAvailible) {
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
    return HistoryReceptView(quiz: $dishAndQuiz)
}

