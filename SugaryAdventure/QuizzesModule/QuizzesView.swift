import SwiftUI

struct QuizzesView: View {
    @StateObject var quizzesModel =  QuizzesViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var quiz: DishAndQiuzz
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.quizzesBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            SimpleButtons(action: quizzesModel.goToMap,
                                          image: ImageName.backArrow.rawValue,
                                          geometry: geometry)
                            
                            Spacer()
                            SimpleButtons(action: quizzesModel.goToMenu,
                                          image: ImageName.gear.rawValue,
                                          geometry: geometry)
                            .offset(y: -8)
                        }
                        .padding(.top)
                        
                        ZStack {
                            Image(quiz.imageDish)
                                .resizable()
                                .frame(width: geometry.size.width * 0.305,
                                       height: geometry.size.height * 0.385)
                            
                            Image(.quizzesCandy)
                                .resizable()
                                .frame(width: geometry.size.width * 0.305,
                                       height: geometry.size.height * 0.163)
                                .offset(y: geometry.size.height * 0.13)
                            
                            Text(quiz.nameOfDish)
                                .Bubble(size: 17)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .offset(y: geometry.size.height * 0.13)
                                .frame(width: geometry.size.width * 0.27,
                                       height: geometry.size.height * 0.14)
                            
                            Image(quiz.imageCandy)
                                .resizable()
                                .frame(width: geometry.size.width * 0.12,
                                       height: geometry.size.width * 0.12)
                                .offset(x: -geometry.size.width * 0.188,
                                        y: geometry.size.height * 0.188)
                            
                            Image(quiz.imageCandy)
                                .resizable()
                                .frame(width: geometry.size.width * 0.12,
                                       height: geometry.size.width * 0.12)
                                .offset(x: geometry.size.width * 0.178,
                                        y: -geometry.size.height * 0.188)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            QuizzButton(text: "QUIZ",
                                        image: ImageName.lock.rawValue,
                                        action: quizzesModel.goToQuiz)
                            
                            QuizzButton(text: "HISTRORY",
                                        image: ImageName.allReceptSymbol.rawValue,
                                        action: quizzesModel.goToHistory,
                                        sizeHImage: 29,
                                        sizeWImage: 33,
                                        textSize: 18)
                            
                            QuizzButton(text: "RECIPE",
                                        image: ImageName.close.rawValue,
                                        imageBack: ImageName.lockedQuizzBack.rawValue,
                                        action: quizzesModel.goToMenu,
                                        sizeWImage: 40,
                                        textSize: 18)
                        }
                    }
                    
                    Image(quiz.imageNameContry)
                        .resizable()
                        .frame(width: geometry.size.width * quiz.height,
                               height: geometry.size.height * 0.234)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 8.5)
                }
            }
        }
        
        .navigationDestination(isPresented: $quizzesModel.isHistoryAvailible) {
            HistoryReceptView(quiz: $quiz)
        }
        
        .navigationDestination(isPresented: $quizzesModel.isQuizzAvailible) {
            QuizzesGameView(quiz: $quiz)
        }
        
        .navigationDestination(isPresented: $quizzesModel.isMapAvailible) {
            MapView()
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
    return QuizzesView(quiz: $dishAndQuiz)
}

