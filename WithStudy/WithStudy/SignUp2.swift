

import SwiftUI

struct SignUp2: View {
    @State var name = ""
    @State var grade = 0

    var body: some View {
        ZStack{
            Color("white").ignoresSafeArea()
            
            VStack{
                ProgressView(value: 1)
                    .accentColor(Color("teal"))
                    .padding()
                
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
                .padding()
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
                        .padding(.horizontal, 30)
                                        ZStack{
                                            Color("teal")
                                                .frame(width: .infinity, height: 50)
                                                .cornerRadius(10)
                                                .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)
                
                                            TextField("عطنا اسمك منجد لحد يبلغ عليك", text: $name)
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.trailing)
                                                .frame(width: .infinity, height: 50)
                                                .padding(.horizontal)
                                                } // <- Name
                                        .padding(.horizontal, 30)
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
                .padding(.horizontal, 30)
                                ZStack{
                                    Color("teal")
                                        .frame(width: .infinity, height: 250)
                                        .cornerRadius(10)
                                        .shadow(color: Color("teal"), radius: 5, x: 0, y: 1)
                                    
                                    ScrollView{
                                    VStack{
                                        Text("9")
                                            .fontWeight(.semibold)
                                            .frame(width: 265, height: 50)
                                        
                                            Color("white")
                                            .frame(width: .infinity, height: 1)
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                grade = 9
                                            }
                                        
                                        Text("10")
                                            .fontWeight(.semibold)
                                            .frame(width: 265, height: 50)
                                        
                                            Color("white")
                                            .frame(width: .infinity, height: 1)
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                grade = 10
                                            }
                                        
                                        Text("11")
                                            .fontWeight(.semibold)
                                            .frame(width: 265, height: 50)
                                        
                                            Color("white")
                                            .frame(width: .infinity, height: 0.5)
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                grade = 11
                                            }
                                        
                                        Text("12")
                                            .fontWeight(.semibold)
                                            .frame(width: 265, height: 50)
                                        
                                            .onTapGesture {
                                                grade = 12
                                            }
                                        } // <- Grade List
                                    } // <- Scroll view for Grade List
                                    .frame(width: .infinity, height: 250)
                                        } // <- Name
                                .padding(.horizontal, 30)
                                .padding(.bottom, 20)
                Spacer()
                NavigationLink(destination: profile(name1: $name, grade1: $grade)) {
                    ZStack{
                        Color("teal")
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(10)
                        
                        Text("التالي")
                            .foregroundColor(Color("white"))
                    }
                    .shadow(color: Color("teal"), radius: 10, x: 0, y: 2)
                } .padding()
            } // Main VStack
        } // Background
    }
}

struct SignUp2_Previews: PreviewProvider {
    static var previews: some View {
        SignUp2(name: "", grade: 0)
            .preferredColorScheme(.light)
    }
}
