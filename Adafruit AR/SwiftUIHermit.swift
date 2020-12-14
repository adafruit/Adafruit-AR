


import SwiftUI


@available(iOS 13.0, *)
struct SwiftUIHermit: View {

    @State var displayText = ""

    var text = ["Ah! Looks like you have a tarot card!","The card of the Hermit!"," This represents honing in on your inner power and living authentically.", "Filtering out noise is the start, not the end.","That was fun! Do you have another?"]
    
    @State private var introTextOpacity = 0.0
        
   
 
    
    
    func dialoge() {
      
        let group = DispatchGroup()
            group.enter()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           
            self.displayText = self.text[0]
           
            group.leave()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               
                self.displayText = self.text[1]
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                   
                    self.displayText = self.text[2]
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       
                        self.displayText = self.text[3]
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                           
                            self.displayText = self.text[4]
                        

                              
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
                            dialoge()
                           }
                        )


                }
                
            }

    }
        
}

    
    
struct SwiftUIARCardView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUIHermit()
    }


    }

}


