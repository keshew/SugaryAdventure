import SwiftUI

extension Text {
    func Bubble(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.5, colorOutline: Color = .black) -> some View {
        self.font(.custom("SuperBubble", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}

