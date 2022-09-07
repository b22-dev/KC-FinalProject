
import SwiftUI

struct files: View {
    var body: some View {
        //NavigationView{
        ZStack{
            Color("white").ignoresSafeArea(.all, edges: .all)
            
            VStack{
                //Spacer()
            HStack{


                NavigationLink(destination: PDFUIView()) {
                    ZStack{
                        Color("teal")
                            .frame(width: 130, height: 130, alignment: .center)
                            .cornerRadius(10)
                        
                        VStack{

                            Image("english")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .shadow(color: .blue, radius: 3, x: 0, y: 0)
                            
                            Text("انجليزي")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    .shadow(color: Color("teal"), radius: 5, x: 0, y: 3)
                    .padding()
                }
            
            
                
                
                
                
                ZStack{
                    Color("teal")
                        .frame(width: 130, height: 130, alignment: .center)
                        .cornerRadius(10)
                    
                    VStack{

                        Image("history")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .shadow(color: .blue, radius: 3, x: 0, y: 0)
                        
                        Text("اجتماعيات")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .shadow(color: Color("teal"), radius: 5, x: 0, y: 3)
                .padding()
            }
                
                HStack{
                ZStack{
                    Color("teal")
                        .frame(width: 130, height: 130, alignment: .center)
                        .cornerRadius(10)
                    
                    VStack{

                        Image("arabic")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .shadow(color: .blue, radius: 3, x: 0, y: 0)
                        
                        Text("عربي")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .shadow(color: Color("teal"), radius: 5, x: 0, y: 3)
                .padding()
                    ZStack{
                        Color("teal")
                            .frame(width: 130, height: 130, alignment: .center)
                            .cornerRadius(10)
                        
                        VStack{

                            Image("islam")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                                .shadow(color: .blue, radius: 3, x: 0, y: 0)
                            
                            Text("اسلامية")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    .shadow(color: Color("teal"), radius: 5, x: 0, y: 3)
                    .padding()
                }
                
                HStack{
                ZStack{
                    Color("teal")
                        .frame(width: 130, height: 130, alignment: .center)
                        .cornerRadius(10)
                    
                    VStack{

                        Image("math")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .shadow(color: .blue, radius: 3, x: 0, y: 0)
                        
                        Text("رياضيات")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .shadow(color: Color("teal"), radius: 5, x: 0, y: 3)
                .padding()
                    ZStack{
                        Color("teal")
                            .frame(width: 130, height: 130, alignment: .center)
                            .cornerRadius(10)
                        
                        VStack{

                            Image("science")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .shadow(color: .blue, radius: 3, x: 0, y: 0)
                            
                            Text("علوم")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    .shadow(color: Color("teal"), radius: 5, x: 0, y: 3)
                    .padding()
                }
                Spacer()
            }
        }
      //}
    }
}

struct files_Previews: PreviewProvider {
    static var previews: some View {
        files()
            .preferredColorScheme(.light)
    }
}
