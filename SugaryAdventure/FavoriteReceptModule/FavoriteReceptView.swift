import SwiftUI

struct FavoriteReceptView: View {
    @StateObject var favoriteReceptModel =  FavoriteReceptViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State var quiz = DishAndQiuzz(imageNameContry: "",
                                   imageCandy: "",
                                   imageDish: "", nameOfDish: "",
                                   historyOfDish: "",
                                   receptOfDish: "",
                                   ingredients: "",
                                   height: 0,
                                   quizz: Quizzes(questions: [""],
                                                  answers: [[""]],
                                                  rightAnswers: [""]))
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.allRecipeBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image(.favoriteLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.645,
                                       height: geometry.size.height * 0.266)
                                .padding(.leading, 130)
                            
                            Spacer()
                            SimpleButtons(action: favoriteReceptModel.goToMenu,
                                          image: ImageName.gear.rawValue,
                                          geometry: geometry)
                            .offset(y: -8)
                        }
                        .padding(.top)
                        
                        VStack {
                            ScrollView {
                                LazyVGrid(columns: favoriteReceptModel.columns, spacing: 10) {
                                    ForEach(favoriteReceptModel.contact.arrayItem, id: \.name) { item in
                                        Button(action: {
                                            
                                        }) {
                                            ZStack {
                                                Image(item.image)
                                                    .resizable()
                                                    .frame(width: 90, height: 100)
                                                
                                                Image(.blueHeart)
                                                    .resizable()
                                                    .frame(width: 14, height: 12)
                                                    .offset(x: 30, y: -38)
                                                
                                                Image(.candyBackground)
                                                    .resizable()
                                                    .frame(width: 90, height: 33)
                                                    .offset(y: 33)
                                                
                                                Text(item.name)
                                                    .Bubble(size: 8)
                                                    .frame(width: 80)
                                                    .lineLimit(2)
                                                    .lineSpacing(5)
                                                    .minimumScaleFactor(0.8)
                                                    .offset(y: 33)
                                            }
                                        }
                                        .disabled(true)
                                    }
                                }
                                .padding()
                            }
                            .offset(y: -30)
                            .scrollIndicators(.hidden)
                            
                        }
                        
                    }
                    
                    HStack(spacing: 20) {
                        MapButton(action: favoriteReceptModel.goToAllRecipes,
                                  image: ImageName.allReceptSymbol.rawValue,
                                  text: "All recipes",
                                  geometry: geometry)
                        
                        MapButton(action: favoriteReceptModel.goToRandom,
                                  image: ImageName.questionSymbol.rawValue,
                                  text: "Random recipe quizzes",
                                  geometry: geometry,
                                  sizeWImage: 12,
                                  frameWidth: 70)
                        
                        MapButton(action: favoriteReceptModel.goToMenu,
                                  image: ImageName.heart.rawValue,
                                  text: "Your favorite",
                                  geometry: geometry)
                        .opacity(0.5)
                        .disabled(true)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.03)
                }
            }
        }
        
        .onAppear {
            quiz = favoriteReceptModel.returnRandom()
        }
        
        .navigationDestination(isPresented: $favoriteReceptModel.isAllRecipesAvailible) {
            AllRecipesView()
        }
        
        .navigationDestination(isPresented: $favoriteReceptModel.isRandomAvailible) {
            QuizzesView(quiz: $quiz)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FavoriteReceptView()
}

