
import SwiftUI

struct Signup: View {
    @StateObject private var vm = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    @EnvironmentObject var SessionService: SessionServiceImpl
    @State var password = ""
    @State private var showingAlert = false
    @State var isExpanded = false
    @State var pass = 0
    @State var isLoading = false
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            if pass == 0 {
                
            
            VStack{
                ProgressView(value: 1)
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
                    
                    Button{
                        if vm.newUser.email == ""
                            || vm.newUser.password != password {
                            
                            showingAlert = true
                            
                        } else {
                            pass = 1
                        }
                    } label: {
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
                .padding()

                } // Main VStack
            } // <- If
            
            
            else if pass == 1 {
                SignUp2(vm: vm)
            }

        } // <- Background
        .navigationBarHidden(true)
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
            .preferredColorScheme(.dark)
            
    }
}
