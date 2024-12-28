import SwiftUI

struct WelcomeModel {
    let textArray = ["In this magnificent journey, you'll discover desserts from around the world, savor their unique flavors, and learn the fascinating stories behind each one. Each dessert is a small journey into the culture and traditions of its origin. Prepare for a culinary adventure that will leave you with unforgettable memories and sweet recollections!",
                     "In this enchanting voyage, you'll explore the diverse world of global desserts, delight in their exquisite tastes, and uncover the rich histories that make each one special. From the bustling streets of one vibrant city to the quaint cafes of another, every sweet treat offers a glimpse into the culinary heritage and customs of its homeland. Get ready for a gastronomic adventure that will fill your heart with joy and your taste buds with delight!",
                     "We are here to guide you through this gastronomic adventure, ensuring that every bite fills your heart with joy and your taste buds with delight!",
                     "YOU CAN SEE THIS PINK DOTS, YOU NEED TO CLICK ON IT AND READ HISTORY, AFTER THAT YOU SHOULD PASS THE QUIZ TO UNLOCK RECIPE. IF YOU ANSWER CORRECT THE ANSWER WILL BE GREEN. IF NOT IT WILL BE RED."]
    
    let sizeText: [CGFloat] = [11,11,16,14]
    let imageArray = [ImageName.welcomeLabel.rawValue, ImageName.welcomeLabel2.rawValue, ImageName.welcomeLabel3.rawValue, ImageName.welcomeLabel4.rawValue]
    let imageBackgroundArray = [ImageName.loadingBackground.rawValue, ImageName.loadingBackground.rawValue, ImageName.loadingBackground.rawValue, ImageName.mapBackground.rawValue]
    let sizeHWelcomeLabel: [CGFloat] = [0.3, 0.3, 0.3, 0.3]
    let sizeWWelcomeLabel: [CGFloat] = [0.64, 0.94, 0.64, 0.64]
}


