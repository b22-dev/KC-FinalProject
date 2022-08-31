
import SwiftUI

struct bottomBar: View {
    @State var name = ""
    @State var grade = 0
    @Binding var email: String
    var body: some View {
        TabView() {
        files()
                .tabItem {
                    VStack{
                        Image(systemName: "book.closed")
                        Text("الملفات")
                    }
                }
                .tag(4)
            ///////////////////////////////////////////////////////////////////////
        toDoList()
                .tabItem {
                    VStack{
                        Image(systemName: "checklist")
                        Text("المهام")
                    }
                }
                .tag(3)
        
        /////////////////////////////////////////////////////////////////////////
        chat()
            .tabItem {
                VStack{
                    Image(systemName: "message")
                    Text("الشات")
                }
            }
            .tag(1)
            
        voicerooms()
                .tabItem {
                    VStack{
                        Image(systemName: "mic")
                        Text("الرومات")
                    }
                }
                .tag(2)
            
            profile(name1: $name, grade1: $grade, email: $email)
                    .tabItem {
                        VStack{
                            Image(systemName: "person.crop.circle")
                            Text("الحساب")
                        }
                    }
                    .tag(5)
    }
        
        .accentColor(Color("teal"))
        .ignoresSafeArea()
}
}


struct bottomBar_Previews: PreviewProvider {
    static var previews: some View {
        bottomBar(email: .constant("admin@gmail.com"))
            .preferredColorScheme(.dark)
    }
}
