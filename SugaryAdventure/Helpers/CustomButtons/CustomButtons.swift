import SwiftUI

struct MapButton: View {
    var action: () -> Void
    var image: String
    var text: String
    var geometry: GeometryProxy
    var sizeWImage: CGFloat = 20
    var sizeHImage: CGFloat = 17
    var frameWidth: CGFloat = 40
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForMapButtons)
                    .resizable()
                    .frame(width: geometry.size.width * 0.135,
                           height: geometry.size.height * 0.16)
                
                Image(image)
                    .resizable()
                    .frame(width: sizeWImage, height: sizeHImage)
                    .offset(x: -2, y: -geometry.size.width * 0.014)
                
                Text(text)
                    .font(.custom("SuperBubble", size: 7))
                    .foregroundStyle(.white)
                    .frame(width: frameWidth)
                    .offset(x: -2, y: geometry.size.width * 0.014)
            }
        }
    }
}

struct SimpleButtons: View {
    var action: () -> Void
    var image: String
    var geometry: GeometryProxy
    var imageSize: CGFloat = 0.09
    var imageForegroundSize: CGFloat = 0.04
    var imageForegroundHSize: CGFloat = 0.04
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForButton)
                    .resizable()
                    .frame(width: geometry.size.width * imageSize,
                       height: geometry.size.width * imageSize)
                
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * imageForegroundSize,
                       height: geometry.size.width * imageForegroundHSize)
                    .offset(x: -1, y: -2)
            }
        }
    }
}

struct CustomItem: View {
    var text: String
    var image: String
    var body: some View {
        Button(action: {
            
        }) {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: 75, height: 80)
                
                    Image(.pinkHeart)
                    .resizable()
                    .frame(width: 12, height: 10)
                    .offset(x: 27, y: -30)
                
                Image(.candyBackground)
                    .resizable()
                    .frame(width: 75, height: 33)
                    .offset(y: 30)
                
                Text(text)
                    .Bubble(size: 6)
                    .frame(width: 70)
                    .lineLimit(2)
                    .lineSpacing(5)
                    .minimumScaleFactor(0.8)
                    .offset(y: 28)
            }
        }
    }
}

struct QuizzButton: View {
    var text: String
    var image: String
    var imageBack: String = ImageName.quizzBack.rawValue
    var action: () -> Void
    var sizeHImage: CGFloat = 39
    var sizeWImage: CGFloat = 31
    var textSize: CGFloat = 20
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(imageBack)
                    .resizable()
                    .frame(width: 155, height: 80)
                
                Image(image)
                    .resizable()
                    .frame(width: sizeWImage, height: sizeHImage)
                    .offset(y: -13)
                
                Text(text)
                    .font(.custom("SuperBubble", size: textSize))
                    .foregroundStyle(.white)
                    .offset(y: 20)
            }
        }
    }
}


struct PinContry: View {
    var action: () -> Void
    var x: CGFloat
    var y: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(ImageName.mapPin.rawValue)
                .resizable()
                .frame(width: 12, height: 12)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 0.6))
                .shadow(radius: 0, y: 4)
        }
        .position(x: x, y: y)
    }
}
