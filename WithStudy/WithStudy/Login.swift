
import SwiftUI

struct Login: View {
    @State var gmail : String
    @State var password : String
    var body: some View {
            ZStack{
                Color("white").ignoresSafeArea()
            VStack{
                HStack{
Spacer() // <- Text (Right)
                    Text("مرحبا من جديد!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                } // <- Title HStack
Spacer()
                HStack{
Spacer() // <- Gmail Text (Right)
                    Text("الحساب")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("teal"))
                    
                    Image(systemName: "mail.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color("teal"))
                } // <- Gmail HStack
                .padding(.trailing, 30)
                HStack{
                    Spacer()
                ZStack{
                    Color("teal")
                        .frame(width: .infinity, height: 50)
                        .cornerRadius(10)
                        .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)
                TextField("", text: $gmail)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: .infinity, height: 50)
                        .padding(.leading)
                    } // <- Gmail ZStack
                .padding([.bottom, .trailing, .leading], 25)
                } // <- TextGmail (right)
                HStack{
Spacer() // <- Gmail Text (Right)
                    Text("كلمة المرور")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("teal"))
                    
                    Image(systemName: "lock.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color("teal"))
                } // <- Password HStack
                .padding(.trailing, 30)
                HStack{
                    Spacer()
                ZStack{
                    Color("teal")
                        .frame(width: .infinity, height: 50)
                        .cornerRadius(10)
                        .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)

                    SecureField("", text: $password)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: .infinity, height: 50)
                        .padding(.leading)
                        } // <- Password ZStack
                .padding([.bottom, .trailing, .leading], 25)
                    } // <- TextPass (right)
                HStack{
                    NavigationLink(destination: ForgetPass(gmail: "")) {
                        Text("اعادة التعيين")
                            .underline()
                            .foregroundColor(Color("teal"))
                        
                            .font(.system(size: 15))
                        } // Password link
Spacer()
                    Text("نسيت كلمة المرور؟")
                        .font(.system(size: 13))
                    } // <- Forgot password HStack
                .padding(.horizontal, 50)
                NavigationLink(destination: ForgetPass(gmail: "")) {
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                        
                        Text("تسجيل الدخول")
                            .foregroundColor(Color("white"))
                    }
                    .shadow(color: Color("teal"), radius: 10, x: 0, y: 2)
                    .padding(30)
                }
Spacer()
                } // <- VStack
            } // <- Background ZStack
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(gmail: "", password: "")
            .preferredColorScheme(.light)
    }
}
