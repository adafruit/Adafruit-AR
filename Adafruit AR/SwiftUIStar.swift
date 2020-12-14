


import SwiftUI

@available(iOS 13.0, *)
struct SwiftUIStar: View {

    @State var displayText = ""

    var blinkaText = ["Ah! Looks like you have a tarot card!","Hmmm...This is the Star card!", "Today, why is more important than what.","That was fun! Do you have another?"]
    
    @State private var introTextOpacity = 0.0
        
   
 
    
    
    func blinkaDialouge() {
      
        let group = DispatchGroup()
            group.enter()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           
            self.displayText = self.blinkaText[0]
           
            group.leave()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               
                self.displayText = self.blinkaText[1]
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                   
                    self.displayText = self.blinkaText[2]
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       
                        self.displayText = self.blinkaText[3]
                        

                    
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
                            blinkaDialouge()
                           }
                        )


                }
                
            }

    }
        
}

    
    
struct SwiftUIARCardView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUIStar()
    }


    }

}


