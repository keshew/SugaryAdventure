import SwiftUI

struct AllRecipesView: View {
    @StateObject var allRecipesModel =  AllRecipesViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State var showLocked = false
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
    func goToLocked() {
        showLocked.toggle()
    }
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.allRecipeBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    if showLocked {
                        LockedRecipeView(showLocked: $showLocked)
                            .frame(maxWidth: geometry.size.width,
                                   maxHeight: geometry.size.height * 1.2)
                            .zIndex(1)
                    }
                    
                    VStack {
                        HStack {
                            Image(.allRecipesLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.36,
                                       height: geometry.size.height * 0.17)
                                .padding(.leading, 230)
                            
                            Spacer()
                            SimpleButtons(action: allRecipesModel.goToMenu,
                                          image: ImageName.gear.rawValue,
                                          geometry: geometry)
                            .offset(y: -8)
                        }
                        .padding(.top)
                        
                        VStack {
                            HStack(spacing: 40) {
                                VStack {
                                    Image(.australiaLabel)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.143,
                                               height: geometry.size.height * 0.095)
                                    
                                    
                                        VStack(spacing: 15) {
                                            CustomItem(text: "AUSSIE DELIGH",
                                                       image: ImageName.aussieDelight.rawValue)
                                            
                                            Button(action: {
                                                showLocked = true
                                            }) {
                                                Image(.lockedItem)
                                                    .resizable()
                                                    .frame(width: 78, height: 90)
                                            }
                                        }
                                    Spacer()
                                }
                                
                                VStack {
                                    Image(.europeLabel)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.143,
                                               height: geometry.size.height * 0.095)
                                    
                                        VStack(spacing: 15) {
                                            CustomItem(text: "Tropical Sunrise Cake",
                                                       image: ImageName.tropicalCake.rawValue)
                                            
                                            CustomItem(text: "Union Jack Cupcake",
                                                       image: ImageName.unionJake.rawValue)
                                            
                                            CustomItem(text: "Golden Wattle Delight",
                                                       image: ImageName.wattleDelight.rawValue)
                                        }
                                }
                                
                                VStack {
                                    Image(.africaLabel)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.143,
                                               height: geometry.size.height * 0.095)
                                    
                                        VStack(spacing: 15) {
                                            CustomItem(text: "African Sunset Fruit Tart",
                                                       image: ImageName.africa1.rawValue)
                                            
                                            CustomItem(text: "Safari Delight Mango Pudding",
                                                       image: ImageName.africa2.rawValue)
                                            
                                            CustomItem(text: "Savannah Sunrise Fruit Salad",
                                                       image: ImageName.africa3.rawValue)
                                        }
                                }
                                
                                VStack {
                                    Image(.asiaLabel)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.093,
                                                height: geometry.size.height * 0.09)
                                    
                                        VStack(spacing: 15) {
                                            CustomItem(text: "Jade Dragon Fruit Cake",
                                                       image: ImageName.asia1.rawValue)
                                            
                                            CustomItem(text: "Lucky Red Bean Mooncake",
                                                       image: ImageName.asia2.rawValue)
                                            
                                            CustomItem(text: "Dragon's Breath Chocolate Lava Cake",
                                                       image: ImageName.asia3.rawValue)
                                        }
                                }
                                
                                VStack {
                                    Image(.americaLabel)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.143,
                                               height: geometry.size.height * 0.095)
                                    
                                        VStack(spacing: 15) {
                                            CustomItem(text: "Stars and Stripes Cupcakes",
                                                       image: ImageName.america1.rawValue)
                                            
                                            CustomItem(text: "Red Velvet Patriot Cupcakes",
                                                       image: ImageName.america2.rawValue)
                                            
                                            CustomItem(text: "Chocolate Freedom Cupcakes",
                                                       image: ImageName.america3.rawValue)
                                        }
                                }
                            }
                        }
                        .offset(y: -20)
                        Spacer()
                    }
                    
                    HStack(spacing: 20) {
                        MapButton(action: allRecipesModel.goToMenu,
                                  image: ImageName.allReceptSymbol.rawValue,
                                  text: "All recipes",
                                  geometry: geometry)
                        .opacity(0.5)
                        .disabled(true)
                        
                        MapButton(action: allRecipesModel.goToRandom,
                                  image: ImageName.questionSymbol.rawValue,
                                  text: "Random recipe quizzes",
                                  geometry: geometry,
                                  sizeWImage: 12,
                                  frameWidth: 70)
                        
                        MapButton(action: allRecipesModel.goToAll,
                                  image: ImageName.heart.rawValue,
                                  text: "Your favorite",
                                  geometry: geometry)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.04)
                }
            }
        }
        .onAppear {
            quiz = allRecipesModel.returnRandom()
        }
        
        .navigationDestination(isPresented: $allRecipesModel.isAllAvailible) {
            FavoriteReceptView()
        }
        
        .navigationDestination(isPresented: $allRecipesModel.isRandomAvailible) {
            QuizzesView(quiz: $quiz)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AllRecipesView()
}

