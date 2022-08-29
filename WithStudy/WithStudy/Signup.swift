
import SwiftUI

struct Signup: View {
    @State var name : String
    @State var gmail : String
    @State var pass : String
    @State var conPass : String
    @State var grade = 0
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            VStack{
                ProgressView(value: 0.5)
                    .accentColor(Color("teal"))
                    .padding()
                HStack{
                    Spacer()
                    VStack(alignment: .trailing){
                Text("منور!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                Text("خلنا نسوي حساب مع بعض في لحظات!")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    } // <- Title VStack
                    .padding()
                } // <- Text Right
Spacer()
                VStack{
                    HStack{
    Spacer() // <- Gmail Text (Right)
                        Text("الحساب")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("teal"))
                        
                        Image(systemName: "mail.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color("teal"))
                    } // <- Password HStack
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                            .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)

                        TextField("", text: $gmail)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal)
                            } // <- Gmail
                    .padding(.bottom, 20)
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
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                            .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)

                        SecureField("", text: $pass)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal)
                            } // <- Gmail
                    .padding(.bottom, 20)
                    
                    HStack{
    Spacer() // <- Gmail Text (Right)
                        Text("تأكيد كلمة المرور")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("teal"))
                        
                        Image(systemName: "lock.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color("teal"))
                    } // <- Password HStack
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                            .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)

                        SecureField("", text: $conPass)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal)
                            } // <- Gmail
                    Spacer()
                    NavigationLink(destination: SignUp2(name: name, grade: grade)) {
                        ZStack{
                            Color("teal")
                                .frame(width: .infinity, height: 50)
                                .cornerRadius(10)
                            
                            Text("التالي")
                                .foregroundColor(Color("white"))
                        }
                        .shadow(color: Color("teal"), radius: 10, x: 0, y: 2)
                    }
                    
                } //<- InPut area
                .padding(.horizontal, 30)
Spacer()
            } // Main VStack
        } // <- Background
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup(name: "", gmail: "", pass: "", conPass: "")
            .preferredColorScheme(.dark)
            
    }
}
