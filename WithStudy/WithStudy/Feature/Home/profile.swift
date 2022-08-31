
import SwiftUI

struct profile: View {
    @Binding var name1: String
    @Binding var grade1: Int
    @Binding var email: String
    @EnvironmentObject var SessionService: SessionServiceImpl
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 150))
                    .foregroundColor(Color("teal"))
                    .padding(25)
                
                Text("\(SessionService.userDetails?.name ?? "أحمد اكرامي محمود")")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding(.bottom, 7)
                
                Text("الصف: \(SessionService.userDetails?.grade ?? 10)")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                Text("\(SessionService.userDetails?.gender ?? "نسخة تجريبية")")
                
                Divider()
                    .padding()
                

                
                Text("طالب")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button{
                    SessionService.logout()
                } label: {
                    ZStack{
                        Color("red")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                        
                        Text("تسجيل الخروج")
                            .foregroundColor(Color("white"))
                    }
                    .shadow(color: Color("red"), radius: 10, x: 0, y: 2)
                    .padding(30)
                }

            }
        }
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        profile(name1: .constant("أحمد اكرامي محمود"), grade1: .constant(10), email: .constant("student@gmail.com"))
                .environmentObject(SessionServiceImpl())
            .preferredColorScheme(.light)
        }
    }
}
