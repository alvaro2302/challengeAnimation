//
//  PlayedDiskView.swift
//  challengeAnimation
//
//  Created by Alvaro Cuiza on 14/7/25.
//

import SwiftUI
var colorSpaceGray: Color = Color(red: 232/255, green: 230/255, blue: 233/255, opacity: 1)
var colorDisk: Color = Color(red: 178/255, green: 175/255, blue: 178/255, opacity: 1)
var colorDiskCenter: Color = Color(red: 170/255, green: 177/255, blue: 170/255, opacity: 1)
struct PlayedDiskView: View {
    @Binding var isSelecteDisk: Int?
    var diskAnimation: Namespace.ID
    @Binding var userName: String
    var isUserNameEdit: Bool = false
    var body: some View {
        VStack{
            ZStack{
                Circle().fill(colorDisk).padding(10)
                Circle().fill(colorDiskCenter).frame(width: 20, height: 20).padding(10)
                
                ForEach(1..<7, id: \.self) { diskId in
                                  if isSelecteDisk == diskId {
                                      DiskView(imageName: diskImageName(for: diskId))
                                          .matchedGeometryEffect(id: diskId, in: diskAnimation)
                                  }
                              }
             
            }
            if (isUserNameEdit) {
                TextField("Enter username", text: $userName).padding(.horizontal,60)
            }
           
          
            
        }.frame(width: 250, height: isUserNameEdit ? 350 : 250).background(colorSpaceGray).cornerRadius(50).shadow(radius: 10).opacity(0.9)
    }
    private func diskImageName(for id: Int) -> String {
        print("chnage disk \(id)")
        return "diskExample-\(id)"
    }
}
//232 230 233
#Preview {
    @State var isSelecteDisk: Int? = 4
    @State var userName: String = ""
    @Namespace var diskAnimation
    PlayedDiskView(isSelecteDisk: $isSelecteDisk, diskAnimation: diskAnimation, userName: $userName, isUserNameEdit: true)
}
