


import SwiftUI
import AVFoundation

@available(iOS 13.0, *)
struct SwiftUITemperance: View {

    @State var displayText = ""

    var minervaText = ["Ah! Looks like you have a tarot card!","Hoho! This is the card of Temperance.","A good gauge, can also be a bind.", "Seek balance in life.","That was fun! Do you have another?", ""]
    
    @State private var introTextOpacity = 0.0
        
    
 
    
    
    func minervaDialouge() {
      
        let group = DispatchGroup()
            group.enter()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           
            self.displayText = self.minervaText[0]
           
            group.leave()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               
                self.displayText = self.minervaText[1]
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                   
                    self.displayText = self.minervaText[2]
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       
                        self.displayText = self.minervaText[3]
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                           
                            self.displayText = self.minervaText[4]
                        
                              
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
                        
                       // .font(.custom(“Helvetica Neue”))
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 6.0).repeatForever(autoreverses: true)) {
                                // fadeIn.toggle()
                               
                                print("Completed")
                        }
                        
                        }
                        //.opacity(fadeIn ? 0 : 1)
                        .onAppear(perform: {
                            minervaDialouge()
                           }
                        )


                }
                
            }

    }
        
}

    
    
struct SwiftUIARCardView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUITemperance()
    }


    }

}


