import SwiftUI

struct MapView: View {
    @StateObject var mapModel =  MapViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State var quiz = DishAndQiuzz(imageNameContry: "", imageForFav: "",
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
    @State var isTapped = false
    
    func settings() {
        isTapped.toggle()
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.mapBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    HStack {
                        Spacer()
                        VStack {
                            Image(.sweetMapLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.21)
                                .padding(.top)
                            
                            Spacer()
                            
                            HStack(spacing: 30) {
                                MapButton(action: mapModel.goToRecipes,
                                          image: ImageName.allReceptSymbol.rawValue,
                                          text: "All recipes",
                                          geometry: geometry)
                                
                                MapButton(action: mapModel.goToRandom,
                                          image: ImageName.questionSymbol.rawValue,
                                          text: "Random recipe quizzes",
                                          geometry: geometry,
                                          sizeWImage: 12,
                                          frameWidth: 70)
                                
                                MapButton(action: mapModel.goToFavorite,
                                          image: ImageName.heart.rawValue,
                                          text: "Your favorite",
                                          geometry: geometry)
                            }
                        }
                        
                        Spacer()
                        if isTapped {
                            Settings(action: {
                                isTapped.toggle()
                            }, emptyAction: mapModel.goTo,
                                     geometry: geometry)
//                         .transition(.asymmetric(
//                        insertion: .scale(scale: 0.5).animation(.spring()),
//                        removal: .scale(scale: 0.0).animation(.spring())
//                    ))
                        } else {
                            ClosedSettingsMap(action: {
                                isTapped.toggle()
                            }, emptyAction: mapModel.goTo,
                                           geometry: geometry)
//                            .transition(.asymmetric(
//                                insertion: .scale(scale: 0.5).animation(.easeInOut),
//                                removal: .scale(scale: 0).animation(.spring())
//                            ))
                        }
                        
                    }
                    
                    // austria
                    PinContry(action: mapModel.goToAustralia,
                              x: geometry.size.width / 1.16,
                              y: geometry.size.height / 1.14)
                    
                    //asia
                    PinContry(action: mapModel.goToAsia1,
                              x: geometry.size.width / 1.15,
                              y: geometry.size.height / 2.9)
                    
                    PinContry(action: mapModel.goToAsia2,
                              x: geometry.size.width / 1.21,
                              y: geometry.size.height / 2.1)
                    
                    PinContry(action: mapModel.goToAsia3,
                              x: geometry.size.width / 1.19,
                              y: geometry.size.height / 2.5)
                    
                    // africa
                    PinContry(action: mapModel.goToAfrica1,
                              x: geometry.size.width / 2.13,
                              y: geometry.size.height / 1.8)
                    
                    PinContry(action: mapModel.goToAfrica2,
                              x: geometry.size.width / 1.97,
                              y: geometry.size.height / 1.9)
                    
                    PinContry(action: mapModel.goToAfrica3,
                              x: geometry.size.width / 2.01,
                              y: geometry.size.height / 1.63)
                    
                    //europe
                    PinContry(action: mapModel.goToEurope1,
                              x: geometry.size.width / 1.95,
                              y: geometry.size.height / 2.9)
                    
                    PinContry(action: mapModel.goToEurope2,
                              x: geometry.size.width / 2.1,
                              y: geometry.size.height / 2.8)
                    
                    PinContry(action: mapModel.goToEurope3,
                              x: geometry.size.width / 1.85,
                              y: geometry.size.height / 2.7)
                    
                    //america
                    PinContry(action: mapModel.goToAmerica1,
                              x: geometry.size.width / 15,
                              y: geometry.size.height / 3.6)
                    
                    PinContry(action: mapModel.goToAmerica2,
                              x: geometry.size.width / 10,
                              y: geometry.size.height / 4.2)
                    
                    PinContry(action: mapModel.goToAmerica3,
                              x: geometry.size.width / 30,
                              y: geometry.size.height / 4.6)
                }
            }
        }
        .onAppear() {
            quiz = mapModel.returnRandom()
        }
        
        .navigationDestination(isPresented: $mapModel.isRandomAvailible) {
            QuizzesView(quiz: $quiz)
        }
        
        .navigationDestination(isPresented: $mapModel.isAllRecipesAvailible) {
            AllRecipesView()
        }
        
        .navigationDestination(isPresented: $mapModel.isYourFavoriteAvailible) {
            FavoriteReceptView()
        }
        
        .navigationDestination(isPresented: $mapModel.isAustralia) {
            QuizzesView(quiz: $mapModel.contact.austria)
        }
        
        .navigationDestination(isPresented: $mapModel.isEurope1) {
            QuizzesView(quiz: $mapModel.contact.europe1)
        }
        
        .navigationDestination(isPresented: $mapModel.isEurope2) {
            QuizzesView(quiz: $mapModel.contact.europe2)
        }
        
        .navigationDestination(isPresented: $mapModel.isEurope3) {
            QuizzesView(quiz: $mapModel.contact.europe3)
        }
        
        .navigationDestination(isPresented: $mapModel.isAfrica1) {
            QuizzesView(quiz: $mapModel.contact.africa1)
        }
        
        .navigationDestination(isPresented: $mapModel.isAfrica2) {
            QuizzesView(quiz: $mapModel.contact.africa2)
        }
        
        .navigationDestination(isPresented: $mapModel.isAfrica3) {
            QuizzesView(quiz: $mapModel.contact.africa3)
        }
        
        .navigationDestination(isPresented: $mapModel.isAsia1) {
            QuizzesView(quiz: $mapModel.contact.asia1)
        }
        
        .navigationDestination(isPresented: $mapModel.isAsia2) {
            QuizzesView(quiz: $mapModel.contact.asia2)
        }
        
        .navigationDestination(isPresented: $mapModel.isAsia3) {
            QuizzesView(quiz: $mapModel.contact.asia3)
        }
        
        .navigationDestination(isPresented: $mapModel.isAmerica1) {
            QuizzesView(quiz: $mapModel.contact.america1)
        }
        
        .navigationDestination(isPresented: $mapModel.isAmerica2) {
            QuizzesView(quiz: $mapModel.contact.america2)
        }
        
        .navigationDestination(isPresented: $mapModel.isAmerica3) {
            QuizzesView(quiz: $mapModel.contact.america3)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MapView()
}

