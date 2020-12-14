


import SwiftUI
import AVFoundation

@available(iOS 13.0, *)
struct SwiftUIWOF: View {

    @State var displayText = ""

    var adabotText = ["Ah! Looks like you have a tarot card!","This is card of Wheel Of Fortune!","Seeker of knowledge.", "Now is the time for inner reflection.","That was fun! Do you have another?", ""]
    
    @State private var introTextOpacity = 0.0
        
   
    // For Audio
    @State private var audioPlayer : AVAudioPlayer?
    
    
     func playIntro() {
      let path = Bundle.main.path(forResource: "art.scnassets/wav/you are what you amplify.wav", ofType:nil)!
      let url = URL(fileURLWithPath: path)
      
      do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.isMeteringEnabled = true
        guard let audioPlayer = audioPlayer else { return }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
      } catch let error as NSError {
        print(error.description)
      }
    }
    
 
    
    
     func hermitDialouge() {
      
        let group = DispatchGroup()
            group.enter()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           
            self.displayText = self.adabotText[0]
           
            group.leave()
            playIntro()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               
                self.displayText = self.adabotText[1]
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                   
                    self.displayText = self.adabotText[2]
                    
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       
                        self.displayText = self.adabotText[3]
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                           
                            self.displayText = self.adabotText[4]
                        
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                               
                                self.displayText = self.adabotText[5]
                            
                            
                        }
                              
                    }
                    
                }
                
            }
            
        }
           
        
        }
        group.notify(queue: .main) {
                print("passed 1")
           // fadeIn.toggle()
            }
    }
    
    @State private var fadeIn = false
    
    
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
                       
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 6.0).repeatForever(autoreverses: true)) {
                                // fadeIn.toggle()
                               
                                print("Completed")
                        }
                        
                        }
                        //.opacity(fadeIn ? 0 : 1)
                        .onAppear(perform: {
                            hermitDialouge()
                           }
                        )


                }
                
            }

    }
        
}

    
    
struct SwiftUIARCardView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUIWOF()
    }


    }

}


