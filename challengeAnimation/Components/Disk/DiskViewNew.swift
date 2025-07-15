//
//  DiskView.swift
//  challengeAnimation
//
//  Created by Alvaro Cuiza on 14/7/25.
//

import SwiftUI

struct DiskView: View {
    @State var imageName: String = "diskExample-1"
    var body: some View {
    
            Image(imageName).resizable().scaledToFit()
    
        
    }
}

#Preview {
    DiskView(imageName: "diskExample-3")
}
