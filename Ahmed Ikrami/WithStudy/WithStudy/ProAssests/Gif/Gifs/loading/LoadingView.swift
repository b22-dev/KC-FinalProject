//
//  LoadingView.swift
//  WithStudy
//
//  Created by HEBA AHMED on 06/09/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color("teal")
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(10)
                .shadow(color: Color.black, radius: 45, x: 0, y: 0)
            
            LottieView(filename: "loading")
                .frame(width: 150, height: 150, alignment: .center)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
