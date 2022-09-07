
import SwiftUI

struct appLoading: View {
    var body: some View {
        LottieView(filename: "appIcon")
            .frame(width: 150, height: 150, alignment: .center)
    }
}

struct appLoading_Previews: PreviewProvider {
    static var previews: some View {
        appLoading()
    }
}
