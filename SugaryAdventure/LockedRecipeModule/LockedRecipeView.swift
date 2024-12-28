import SwiftUI

struct LockedRecipeView: View {
    @StateObject var lockedRecipeModel =  LockedRecipeViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var showLocked: Bool
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    
                    VStack {
                        Image(.lockedLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.812,
                                   height: geometry.size.height * 0.27)
                            .padding(.top)
                        
                        ZStack {
                            Image(.backForWelcomeLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.59,
                                       height: geometry.size.height * 0.43)
                            
                            Text("We are continuously working to improve our app. Currently, we have a limited number of recipes available, but we are excited to announce that we will be adding many new ones very soon. Stay tuned!")
                                .Bubble(size: 15)
                                .frame(width: geometry.size.width * 0.5,
                                       height: geometry.size.height * 0.3)
                                .multilineTextAlignment(.center)
                                .lineSpacing(2)
                                .minimumScaleFactor(0.8)
                                .offset(y: -5)
                            
                            Button(action: {
                                showLocked = false
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
                        .padding(.top)
                        Spacer()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var preBool = false
    return LockedRecipeView(showLocked: $preBool)
}

