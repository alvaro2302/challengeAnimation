//
//  HomeView.swift
//  challengeAnimation
//
//  Created by Alvaro Cuiza on 15/7/25.
//

import SwiftUI
struct DiskNew: Identifiable {
    let id: Int
    let imageName: String
}


struct HomeNewView: View {
    @State var isSelectedDisk: Int? = nil
    @State private var isAnimating: Bool = false
    @State private var goToUserNameScreen: Bool = false
    @State  var userName: String = ""
    @Namespace var diskAnimation
    private let disks = (1..<7).map { DiskNew(id: $0, imageName: "diskExample-\($0)") }
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 10) {
                    Text("Welcome to [untitled]").font(.title2).bold()
                    Text("Choose a disc")
                }
                PlayedDiskView(isSelecteDisk: $isSelectedDisk, diskAnimation: diskAnimation, userName: $userName)
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3),spacing: 20)
                {
                    ForEach(disks) { disk in
                        DiskView(imageName: disk.imageName)
                            .matchedGeometryEffect(id: disk.id, in: diskAnimation)
                            .onTapGesture {
                                withAnimation(.spring(response:0.5, dampingFraction: 0.9)){
                                    // Si el disco ya está seleccionado, deseleccionar
                                    if isSelectedDisk == disk.id {
                                        isSelectedDisk = nil
                                    } else {
                                        // Seleccionar el nuevo disco
                                        isSelectedDisk = disk.id
                                    }
                                    
                                }
                            }
                    }
                }
                Spacer()
                VStack{
                    Text("Already have an account?").font(.body).bold().fontWeight(.ultraLight)
                    
                    VStack{
                        Button(action: {
                            goToUserNameScreen = true
                        }, label:{
                            Text("Next").foregroundColor(.white).frame(maxWidth: .infinity,minHeight: 40).background(Color.black).cornerRadius(20)
                        })
                        .navigationDestination(isPresented: $goToUserNameScreen) {
                            NewUserNameView(isSelected: isSelectedDisk, username: userName, diskAnimation: _diskAnimation)
                        }
                        
                    }.padding(10)
                    
                }
                
            }
        }.navigationBarTitle("")
    }
}

#Preview {
    HomeNewView()
}
