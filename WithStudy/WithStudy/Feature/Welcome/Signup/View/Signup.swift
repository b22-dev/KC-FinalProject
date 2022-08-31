
import SwiftUI

struct Signup: View {
    @StateObject private var vm = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    @State var password = ""
    @State private var showingAlert = false
    @State var isExpanded = false
    @State var pass = false
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
                        Text("البريد الالكتروني")
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

                        TextField("", text: $vm.newUser.email)
                            .keyboardType(.emailAddress)
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

                        SecureField("", text: $vm.newUser.password)
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

                        SecureField("", text: $password)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal)
                            } // <- Gmail
     Spacer()

                    NavigationLink(destination: pass == true ? SignUp2() : SignupError()) {
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

                } // Main VStack
        } // <- Background
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
            .preferredColorScheme(.dark)
            
    }
}
