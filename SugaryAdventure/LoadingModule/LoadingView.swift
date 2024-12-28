import SwiftUI

struct LoadingView: View {
    @StateObject var loadingModel =  LoadingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                if verticalSizeClass == .compact {
                    ZStack {
                        Image(.loadingBackground)
                            .resizable()
                            .ignoresSafeArea()
                        
                        VStack(spacing: 15) {
                            Spacer()
                            
                            Text(loadingModel.currentText)
                            .font(.custom("SuperBubble", size: 40))
                            .foregroundStyle(.white)
                            
                            Image(loadingModel.loadScreen())
                                .resizable()
                                .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.1)
                        }
                        .padding(.bottom)
                    }
                    .onAppear {
                        loadingModel.startTimer()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            loadingModel.currentIndex = 0
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            loadingModel.currentIndex = 1
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            loadingModel.currentIndex = 2
                            loadingModel.isWelcomeAvailible = true
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $loadingModel.isWelcomeAvailible) {
                WelcomeView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoadingView()
}

