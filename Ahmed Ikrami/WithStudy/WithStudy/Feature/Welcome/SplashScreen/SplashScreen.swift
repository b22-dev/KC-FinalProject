
import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            withAnimation {
                HomeView()
            }

        } else {
            VStack{
                VStack{
                    appLoading()
                    
                    Text("withStudy")
                        .foregroundColor(Color("teal"))
                        .fontWeight(.bold)
                        .font(.system(size: 26))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
                    withAnimation {
                        self.isActive = true
                    }

                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
