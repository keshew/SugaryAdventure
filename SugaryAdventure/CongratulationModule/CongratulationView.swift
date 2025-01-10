import SwiftUI

struct CongratulationView: View {
    @StateObject var congratulationModel =  CongratulationViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var quiz: DishAndQiuzz
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    
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
                            
                            Text("RECIPE:")
                                .Bubble(size: 25)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                                .frame(width: geometry.size.width * 0.51,
                                       height: geometry.size.height * 0.66)
                                .offset(y: geometry.size.height * -0.08)
                                .shadow(radius: 0, y: 4)
                            
                            Text(quiz.nameOfDish)
                                .Bubble(size: 20)
                                .offset(y: -geometry.size.height * 0.22)
                            
                            Text("INGREDIENTS")
                                .Bubble(size: 12)
                                .offset(x: geometry.size.width * -0.16,
                                        y: -geometry.size.height / -25)
                                .shadow(radius: 0, y: 4)
                            
                            Text("INSTRUCTION")
                                .Bubble(size: 12)
                                .offset(x: geometry.size.width * 0.16,
                                        y: -geometry.size.height / -25)
                                .shadow(radius: 0, y: 4)
                            
                            Text(quiz.ingredients)
                                .Bubble(size: 7)
                                .lineSpacing(5)
                                .minimumScaleFactor(0.8)
                                .frame(width: geometry.size.width * 0.3,
                                       height: geometry.size.height * 0.4)
                                .offset(x: geometry.size.width * -0.12,
                                        y: -geometry.size.height / -3.5)
                                .shadow(radius: 0, y: 3)
                            
                            Text(quiz.receptOfDish)
                                .Bubble(size: 7)
                                .lineSpacing(5)
                                .minimumScaleFactor(0.8)
                                .frame(width: geometry.size.width * 0.28,
                                       height: geometry.size.height * 0.4)
                                .offset(x: geometry.size.width * 0.14,
                                        y: -geometry.size.height / -3.5)
                                .shadow(radius: 0, y: 3)
                        }
                    }
                    Image(.congratulationLabel)
                        .resizable()
                        .frame(width: 447,
                               height: 87)
                        .offset(y: -geometry.size.height * 0.38)
                }
                .onTapGesture {
                    congratulationModel.goToMap()
                }
            }
        }
        .navigationDestination(isPresented: $congratulationModel.isMapAvailible) {
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
    return CongratulationView(quiz: $dishAndQuiz)
}

