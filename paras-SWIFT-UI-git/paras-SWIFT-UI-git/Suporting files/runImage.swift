//
//  runImage.swift
//  PARAS-SWIFTUIs
//
//  Created by Paras Chhugani on 20/12/20.
//

import Foundation
import SwiftUI

struct runImage: View {
    
    var imagenum :String
    var runningSpeed : String
    
    var body: some View {
        
        HStack{
            Image("run\(imagenum)")
            Text("Speed :\n\(runningSpeed) km/h")
                .font(.system(size: 35))
        }.offset(x: -0.0, y: -300.0)
    }
}



