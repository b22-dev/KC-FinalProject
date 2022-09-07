
import SwiftUI

struct profile: View {
    
    @EnvironmentObject var SessionService: SessionServiceImpl
    
    @State var alert = false
    
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 150))
                    .foregroundColor(Color("teal"))
                    .padding(25)
                
                Text("\(SessionService.userDetails?.name ?? "احمد اكرامي محمود")")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding(.bottom, 7)
                
                Text("الصف: \(SessionService.userDetails?.grade ?? 10)")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                Text("نسخة تجريبية")
                
                Divider()
                    .padding()
                

                ZStack{
                    Color("clicked")
                    VStack{
                Text("\(SessionService.userDetails?.email ?? "ahmed_ikrami@admin.com")")
                    .fontWeight(.semibold)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                
                Text("طالب")
                    .foregroundColor(Color("white"))
                    .padding(5)
                    }
                }
                .frame(width: 250, height: 100, alignment: .center)
                .cornerRadius(10)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button{
                    alert = true

                } label: {
                    
                    Text("تسجيل الخروج")
                        .foregroundColor(Color("red"))
                    
                    
//                    ZStack{
//                        Color("red")
//                            .frame(width: .infinity, height: 50)
//                            .cornerRadius(10)
//
//                        Text("تسجيل الخروج")
//                            .foregroundColor(Color("white"))
//                    }
                    
                    
                    .shadow(color: Color("red"), radius: 10, x: 0, y: 2)
                    .padding(30)
                }
                .alert(isPresented: $alert) {
                    Alert(
                        title: Text("متاكد انك تبي تروح؟"),
                        message: Text("انت على وشك تسجيل خروجك!"),
                        primaryButton: .default(
                            Text("الغاء"),
                            
                            action: {}
                        ),
                        secondaryButton: .destructive(
                            Text("تسجيل الخروج"),
                            action: SessionService.logout
                        )
                    )
                }

            }
        }
        .navigationBarHidden(true)
    }
}


struct profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        profile()
                .environmentObject(SessionServiceImpl())
        }
        .preferredColorScheme(.dark)
    }
}
