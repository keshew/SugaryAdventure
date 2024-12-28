import SwiftUI

struct WelcomeView: View {
    @StateObject var welcomeModel =  WelcomeViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(welcomeModel.contact.imageBackgroundArray[welcomeModel.currentIndex])
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        Image(welcomeModel.contact.imageArray[welcomeModel.currentIndex])
                            .resizable()
                            .frame(width: geometry.size.width * welcomeModel.contact.sizeWWelcomeLabel[welcomeModel.currentIndex],
                                    height: geometry.size.height * welcomeModel.contact.sizeHWelcomeLabel[welcomeModel.currentIndex])
                        
                        ZStack {
                            Image(.backForWelcomeLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.59,
                                       height: geometry.size.height * 0.43)
                            
                            Text(welcomeModel.contact.textArray[welcomeModel.currentIndex])
                                .Bubble(size: welcomeModel.contact.sizeText[welcomeModel.currentIndex])
                                .frame(width: geometry.size.width * 0.5,
                                       height: geometry.size.height * 0.3)
                                .multilineTextAlignment(.center)
                                .lineSpacing(2)
                                .minimumScaleFactor(0.8)
                                .offset(y: -5)
                            
                            Button(action: {
                                welcomeModel.increaseIndex()
                            }) {
                                ZStack {
                                    Image(.backForButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.09,
                                           height: geometry.size.width * 0.09)
                                    
                                    Image(.nextArrow)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.04,
                                           height: geometry.size.width * 0.04)
                                        .offset(y: -1)
                                }
                            }
                            .offset(y: geometry.size.height / 4.3)
                        }
                        
                        
                        VStack {
                            Spacer()
                            HStack {
                                Image(welcomeModel.currentIndex == 0 ? .currentWelcomeScreenPin : .nextWelcomeScreenPin)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.06,
                                       height: (geometry.size.width * 0.06))
                                
                                Image(welcomeModel.currentIndex == 1 ? .currentWelcomeScreenPin : .nextWelcomeScreenPin)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.06,
                                       height: (geometry.size.width * 0.06))
                                
                                Image(welcomeModel.currentIndex == 2 ? .currentWelcomeScreenPin : .nextWelcomeScreenPin)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.06,
                                       height: (geometry.size.width * 0.06))
                                
                                Image(welcomeModel.currentIndex == 3 ? .currentWelcomeScreenPin : .nextWelcomeScreenPin)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.06,
                                       height: (geometry.size.width * 0.06))
                                
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(isPresented: $welcomeModel.isMapAvailible) {
            MapView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeView()
}

