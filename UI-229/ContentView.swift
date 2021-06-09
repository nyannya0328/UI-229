//
//  ContentView.swift
//  UI-229
//
//  Created by にゃんにゃん丸 on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
    @State var random = false
    
    var body: some View {
        VStack{
            
            TextSheimer(title: "KAVSOFT", random: $random)
            
            TextSheimer(title: "SWIFT UI", random: $random)
               
            
            
            Text("SWIFT UI MASTER")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(color: .green, radius: 5, x: 5, y: 5)
            
            Spacer(minLength: 0)
            
            
            Toggle(isOn: $random, label: {
                Text("PUSH")
                    .font(.title)
                    .fontWeight(.light)
            })
        }
        .padding()
        .preferredColorScheme(.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextSheimer : View {
    var title : String
    @State var show = false
    
    @Binding var random : Bool
    
    var body: some View{
        
        
        ZStack{
            
            
            Text(title)
                .font(.system(size: 70, weight: .heavy))
                .foregroundColor(.white.opacity(0.3))
            
            
            HStack(spacing:0){
                
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    Text(String(title[title.index(title.startIndex,offsetBy : index)]))
                        .font(.system(size: 70, weight: .heavy))
                        .foregroundColor(random ?  getColor() : Color.red)
                        
                    
                    
                    
                }
                
            }
            .mask(
            
            
            Rectangle()
                .fill(
              
                    Color.red
                
                )
            
              
                
                .rotationEffect(.init(degrees: 70))
                .padding(25)
                .offset(x: -250)
                .offset(x: show ? 500 : 0)
            
            )
            .onAppear(perform: {


                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)){


                    show.toggle()
                }

            })
            
            
            
            
            
        }
    }
    
    
    func getColor()->Color{
        
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
    

   
    
    
    
   
}
