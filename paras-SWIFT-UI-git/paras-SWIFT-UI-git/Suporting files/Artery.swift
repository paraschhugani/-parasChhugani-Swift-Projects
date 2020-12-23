//
//  File.swift
//  PARAS-SWIFTUIs
//
//  Created by Paras Chhugani on 20/12/20.
//

import Foundation
import SwiftUI

struct Artery: Shape {
    func  path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 358, y: 480))
        path.addLine(to: CGPoint(x: 358 , y: -250 ))
        path.addArc(center: CGPoint(x: 301, y: -255), radius: 56, startAngle: Angle.degrees(0.00), endAngle: Angle.degrees(270.00), clockwise: true)
        path.addLine(to: CGPoint(x: -10, y: -307))
        path.addArc(center: CGPoint(x: -13, y: -260), radius: 46, startAngle: Angle.degrees(270.00), endAngle: Angle.degrees(180.00), clockwise: true)
        path.addLine(to: CGPoint(x: -57 , y: 530))
        path.addArc(center: CGPoint(x: 0, y: 543), radius: 56, startAngle: Angle.degrees(180.00), endAngle: Angle.degrees(90.00), clockwise: true)
        path.addLine(to: CGPoint(x: 310, y: 600))
        return path
    }
}

