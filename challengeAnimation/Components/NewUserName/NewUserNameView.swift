//
//  NewUserNameView.swift
//  challengeAnimation
//
//  Created by Alvaro Cuiza on 16/7/25.
//

import SwiftUI

struct NewUserNameView: View {
    @State var isSelected: Int?
    @State var username: String
    @Namespace var diskAnimation
    var body: some View {
        VStack {
            PlayedDiskView(isSelecteDisk: $isSelected, diskAnimation: diskAnimation, userName: $username,isUserNameEdit: true)
            
            VStack{
                Text("Choose a username").font(.title2).bold()
                Text("You can change this any time").foregroundStyle(.gray).font(.callout)
            }.padding(20)
            VStack{
                Button(action: {}) {
                    Text("Next").foregroundColor(.white).frame(maxWidth: .infinity,minHeight: 40).background(username == "" ? Color.gray : Color.black).cornerRadius(20)
                }
            }.padding(10)
        }
        Spacer()
        
    }
}

#Preview {
    @State var isSelected = 1
    @State var username = "alvaro"
    NewUserNameView(isSelected: isSelected, username: username)
}
