


import SwiftUI
import UIKit
import AVFoundation

@available(iOS 13.0, *)
struct SwiftUITarotCardView: View {

    
    let minervaDialogue : [String]
    
    @State var displayText = ""
    
    @State private var introTextOpacity = 0.0
        
    func minervaSpeech() {
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           
            self.displayText = self.minervaDialogue[0]
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               
                self.displayText = self.minervaDialogue[1]
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                   
                    self.displayText = self.minervaDialogue[2]
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       
                        self.displayText = self.minervaDialogue[3]
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                           
                            self.displayText = self.minervaDialogue[4]
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                               
                                self.displayText = self.minervaDialogue[5]
                            
                        }
                            
                            
                    }
                    
                }
                
            }
            
        }
        
        }
        
    }
    
  var body: some View {
        ZStack {

            ZStack {
                if #available(iOS 14.0, *) {
                    
                    Text(displayText)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .transition(.opacity)
                        .rotationEffect(.degrees(-180))
                        .offset(x: 0, y: -200)
                        .onAppear(perform: {
                            minervaSpeech()
                           })
                    
                }
            
            }
            
        }
        
    }

    
    
struct SwiftUITarotCardView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUITarotCardView(minervaDialogue: [""])
    }


    }

}


