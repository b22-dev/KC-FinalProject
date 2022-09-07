import SwiftUI

struct chat: View {
    
    
    @StateObject var chatData = ChatModel()
    
    @AppStorage("current_user") var user = ""
    
    @State var scrolled = false
    
    var body: some View {
        ZStack{
            
            Color("white").ignoresSafeArea()
            
        VStack(spacing: 0){
            
            
            ScrollViewReader{reader in
                
                ScrollView{
                    
                    VStack(spacing: 15) {
                        
                        ForEach(chatData.msgs) { msg in
                            
                            ChatRow(chatData: msg)
                                .onAppear{
                                    
                                    if msg.id == self.chatData.msgs.last!.id && !scrolled {
                                        
                                        reader.scrollTo(chatData.msgs.last!.id, anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        .onChange(of: chatData.msgs, perform: { value in
                            
                            reader.scrollTo(chatData.msgs.last!.id, anchor: .bottom)
                        })
                    }
                    .padding(.vertical)
                }
                //.frame(width: 450)
            }

            HStack(spacing: 15) {
                
                TextField("اكتب رسالتك...", text: $chatData.txt)
                    .multilineTextAlignment(.trailing)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.primary.opacity(0.3))
                    .clipShape(Capsule())
                
                if chatData.txt != "" {
                    
                    Button(action: chatData.writeMsg, label: {
                        
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color("teal"))
                            .clipShape(Circle())
                    })
                }
            }
            .animation(.default)
            .padding()
        }
        .ignoresSafeArea(.all, edges: .top)
        .onAppear(perform: {
            
            chatData.onAppear()
            
        })
        .navigationBarHidden(true)
        } // <- Background
        .overlay(
            NavBar(title: "الدردشة")
        )

    }
}
