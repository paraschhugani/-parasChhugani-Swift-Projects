//
//  SwiftUIView.swift
//  PARAS-SWIFTUIs
//
//  Created by Paras Chhugani on 18/12/20.
//

import SwiftUI




struct SwiftUIView: View {
    
    @State var resetStrokes: Bool = true
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat = 0
    
    @State var imageNume: Int = 1
    @State var RunningSpeed: Float = 20.0
    
    @State private var isAnimating = false
    @State var heartbeat:Int = 72
    var animationspeed : Double {
        return Double(120 / self.heartbeat)
    }
    var foreverAnimation: Animation {
        Animation.linear(duration: animationspeed)
            .repeatForever()
        }
    
    func changeHbeat() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            self.heartbeat = Int.random(in: 60..<85)
            
        }
        
    }
    
    func changeImageNum() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if (self.imageNume == 12){
                imageNume = 1
            }
            else{
                self.imageNume = imageNume + 1
            }
            
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            RunningSpeed = Float.random(in: 20..<24)
            
        }
        
    }
    
    var body: some View {
        
        ZStack{
            Artery()
                .stroke(Color .red.opacity(0.35) , style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.black)
                .frame(width: 300, height: 300)
            Artery()
                .trim(from: strokeStart, to: strokeEnd)
                .stroke(Color .red , style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.black)
                .frame(width: 300, height: 300)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
                        if (self.strokeEnd >= 1) {
                            if (self.resetStrokes) {
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                                    self.strokeEnd = 0
                                    self.strokeStart = 0
                                    self.resetStrokes.toggle()
                                }
                                self.resetStrokes = false
                            }
                        }
                        withAnimation(Animation.easeOut(duration: 2)) {
                            self.strokeEnd += 0.1
                            self.strokeStart = self.strokeEnd - 0.3
                        }
                    }
                }
            
            runImage(imagenum: String(imageNume), runningSpeed: String(format: "%.1f",RunningSpeed) )
                .onAppear {
                    changeImageNum()
                }
            // working on conneting watch with apple devices with
//            Image("stats")
//                .resizable()
//                .frame(width: 370, height: 500)
//                .offset(x: 10.0, y: 80.0)
            VStack{
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 150, height: 150, alignment: .center)
                    .scaleEffect(isAnimating ? 0.9 : 0.8)
                    .animation(foreverAnimation)
                    .onAppear {
                        self.isAnimating = true
                        changeHbeat()
                    }
                
                    .overlay(
                        HeartbeatText(best: "\(heartbeat)")
                    )
                    .offset(x: 175, y: 390)
                }
        }
        }
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

struct HeartbeatText: View {
    
    var best:String
    
    var body: some View {
        Text(best)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.system(size: 50))
    }
}


