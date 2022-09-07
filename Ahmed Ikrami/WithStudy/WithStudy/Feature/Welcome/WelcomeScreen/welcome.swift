
import SwiftUI

struct welcome: View {
    @ObservedObject var dm = DataManager()
    var body: some View {
        if dm.isConnected == true {
            NavigationView{
            ZStack{
                Color("white").ignoresSafeArea()
                
                VStack{
    Spacer()
                    Image(systemName: "face.smiling")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("teal"))
                        .frame(width: 250)
                        .shadow(color: Color("teal"), radius: 45, x: 0, y: 10)
                        .padding(30)
                    
                    Text("مرحبا بك في WithStudy!")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color("teal"))
                        .padding(.bottom, 3)
                    
                    Text("التطبيق اللي يجمع طلبة الكويت المتميزين في مكان واحد.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(width: 300)
                    
                    NavigationLink(destination:  Login()) {
                        Text("تسجيل الدخول")
                            .frame(width: 150, height: 50)
                            .background(Color("teal"))
                            .cornerRadius(10)
                            .foregroundColor(Color("white"))
                            .shadow(color: Color("teal"), radius: 10, x: 0, y: 2)
                            .padding(.top)
                        } // <- Login Button
                    
                    NavigationLink(destination:  Signup()) {
                        Text("انشاء حساب")
                            .font(.system(size: 15))
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color("teal"))
                        } // <- Signup Button
    Spacer()
                    } // <- VStack
                } // <- ZStack
            } // <- View
        } else {

            NoInternet()
                .foregroundColor(.white)
        }
        
    }
}

struct welcome_Previews: PreviewProvider {
    static var previews: some View {
        welcome()
            .preferredColorScheme(.light)
            
    }
}
