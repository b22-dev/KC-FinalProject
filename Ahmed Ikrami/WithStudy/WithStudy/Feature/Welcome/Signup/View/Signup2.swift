

import SwiftUI

struct SignUp2: View {
//    @StateObject private var vm = RegistrationViewModelImpl(
//        service: RegistrationServiceImpl()
//    )
    @ObservedObject public var vm: RegistrationViewModelImpl
    @EnvironmentObject var SessionService: SessionServiceImpl
    @State var isExpanded = false
    @State private var showingAlert = false
    @State var isLoading = false
    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Spacer()
                    VStack(alignment: .trailing){
                    Text("اثبت حضورك!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text("اعطينا اسمك وصفك عشان نعرفك على زملاءك.")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                }
                //.padding()
                Spacer()

                        HStack{
                        Spacer() // <- Gmail Text (Right)
                                            Text("اسمك الثلاثي")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("teal"))
                
                                            Image(systemName: "person.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color("teal"))
                                        } // <- Password HStack
                        //.padding(.horizontal, 30)
                                        ZStack{
                                            Color("teal")
                                                .frame(width: .infinity, height: 50)
                                                .cornerRadius(10)
                                                .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)
                
                                            TextField("", text: $vm.newUser.name)
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.trailing)
                                                .frame(width: .infinity, height: 50)
                                                .padding(.horizontal)
                                                } // <- Name
                                        //.padding(.horizontal, 30)
                                        .padding(.bottom, 20)
                HStack{
                Spacer() // <- Gmail Text (Right)
                                    Text("الصف")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("teal"))
        
                                    Image(systemName: "graduationcap.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color("teal"))
                                } // <- Password HStack
                //.padding(.horizontal, 30)
                DisclosureGroup("\(vm.newUser.grade)", isExpanded: $isExpanded) {
                    VStack(alignment: .center, spacing: 15){
                    ForEach(9...12, id: \.self) {
                        grade in
                        Text("\(grade)")
                            .font(.title3)
                            .padding(10)
                            .onTapGesture {
                                self.vm.newUser.grade = grade
                                withAnimation() {
                                    self.isExpanded.toggle()
                                }
                            }
                        }
                    }
                    
                }
                .accentColor(.white)
                .font(.title2)
                .foregroundColor(.white)
                .padding(10)
                .background(Color("teal"))
                .cornerRadius(10)
                //.padding(.horizontal, 30)
                Spacer()
                
                Button {
                    if vm.newUser.name == ""
                        || vm.newUser.grade == 0 {
                        
                        showingAlert = true
                        self.isLoading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.isLoading = false
                        }
                    } else {

                        self.isLoading = true
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isLoading = false
                        }
                        vm.create()
                    }

                } label: {
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                        
                        Text("انشاء الحساب")
                            .foregroundColor(Color("white"))
                    }
                    .shadow(color: Color("teal"), radius: 10, x: 0, y: 2)

                }



            } // Main VStack
            .padding(30)
            
            .alert(isPresented: $vm.hasError) {
                
                if case .failed(let error) = vm.state {
                    return Alert(
                        title: Text("Error!"),
                        message: Text(error.localizedDescription)
                        )
                        } else {
                            return Alert(
                                title: Text("Error!"),
                                message: Text("حدث خطأ ما تحقق من صحة معلوماتك.")
                                )
                        }
            }
            if isLoading {
                LoadingView()
            }
        } // Background
        .navigationBarHidden(true)
    }
}

struct SignUp2_Previews: PreviewProvider {
    static var previews: some View {
        SignUp2(vm: RegistrationViewModelImpl(service: RegistrationServiceImpl()))
            .preferredColorScheme(.light)
    }
}
