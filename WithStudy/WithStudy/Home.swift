
import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
        VStack{
            bottomBar()
            } // <- Main Stack
        } // <- Background
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
