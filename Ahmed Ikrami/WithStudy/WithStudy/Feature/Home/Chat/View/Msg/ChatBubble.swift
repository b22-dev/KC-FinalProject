
import SwiftUI

struct ChatBubble: Shape {
    
    var MyMsg : Bool
        
        func path(in rect: CGRect) -> Path {
            
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,MyMsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
            
            return Path(path.cgPath)
        }
}
