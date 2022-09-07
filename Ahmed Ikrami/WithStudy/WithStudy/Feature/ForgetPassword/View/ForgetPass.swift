
import SwiftUI

struct ForgetPass: View {
    @State var gmail : String
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            VStack{
                
                HStack{
                    Spacer()
                    VStack(alignment: .trailing){
                    Text("لا تحاتي!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    Text("بنرسلك ايميل عشان تسوي كلمة مرور جديدة.")
                            .foregroundColor(.gray)
                    } .padding()
                }
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
                } // <- Password HStack
                .padding(.horizontal, 30)
                ZStack{
                    Color("teal")
                        .frame(width: .infinity, height: 50)
                        .cornerRadius(10)
                        .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)

                    TextField("", text: $gmail)
                        .foregroundColor(.black)
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal)
                        } // <- Gmail
                .padding(.horizontal, 30)
                Spacer()
                NavigationLink(destination: ForgetPass(gmail: "")) {
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                        
                        Text("التالي")
                            .foregroundColor(Color("white"))
                    }
                    .shadow(color: Color("teal"), radius: 10, x: 0, y: 2)
                    .padding(30)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ForgetPass_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPass(gmail: "")
            .preferredColorScheme(.dark)
    }
}
