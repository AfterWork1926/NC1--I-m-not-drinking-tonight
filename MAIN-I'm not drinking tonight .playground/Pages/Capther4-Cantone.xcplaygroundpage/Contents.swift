//: [Previous](@previous)

//: I'm not drinking tonight (maybe)
  
import UIKit
import PlaygroundSupport
import AVFoundation

var player:AVAudioPlayer = AVAudioPlayer()

do {
        let audioPath =                                          Bundle.main.path(forResource: "musica", ofType: "mp3")
    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
} catch {
    print("Couldn't find background music file.")
}

player.numberOfLoops = -1
player.prepareToPlay()
player.play()

    class MyViewController : UIViewController{
    let Butt1 = UIButton()
    let Butt2 = UIButton()
    let Butt3 = UIButton()
//  let Butt4 = UIButton()
    let label = UILabel()
    var player: AVAudioPlayer?
    var imageView = UIImageView()


var sviluppoStoria = [
    ("",0,0,1),
    ("You realize you're on your fourth beer, you are in full fun mode. The friend on duty tells you that the night is still young, and asks: Shall we go dancing?\n \n N°1) NO \n N°2) YES",2,3,1),
    ("You're in hangover, but you think, that after all you had a nice night, and even if you are not at the top, you have respected your commitments \n \n  GOOD SOLDIER. YOU DESERVE A MEDAL 🥇",2,2,0),
    ("You couldn't wake up, Ask your mom to call at work to say that you are not feeling well.\n \n YOU DON'T DESERVE A MEDAL ❌🥇",3,3,0)]
                      
var curr = 0
var backGroundMusic: AVAudioPlayer?
                          
//            opzioni sfondo
override func loadView(){
imageView.frame = CGRect(x:57, y:0, width: 450 , height: 900)
let view = UIView()
view.backgroundColor = .white
let bgImg = UIImage(named: "background.png")
view.backgroundColor = UIColor(patternImage: bgImg!)
view.frame.size = CGSize(width: 450, height: 900)
                          
                          
//        opzioni bottone choice 1
        Butt1.setTitle ("Choice 1", for: .normal)
        Butt1.setTitleColor(.black, for:.normal)
        Butt1.backgroundColor = .white
        Butt1.frame = CGRect(x:57, y:600, width: 100 , height: 30)
        Butt1.isUserInteractionEnabled = true
                          
        view.addSubview(Butt1)
                          
//        opzioni bottone choice 2
    Butt2.setTitle("Choice 2", for: .normal)
    Butt2.setTitleColor(.black, for:.normal)
    Butt2.backgroundColor = .white
    Butt2.frame = CGRect(x:214, y:600, width: 100 , height: 30)
    Butt2.isUserInteractionEnabled = true
                          
        view.addSubview(Butt2)
    
//        opzioni bottone choice 3
    Butt3.setTitle("Choice 3", for: .normal)
    Butt3.setTitleColor(.black, for:.normal)
    Butt3.backgroundColor = .white
    Butt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)
    Butt3.isUserInteractionEnabled = true
                          
        view.addSubview(Butt3)

label.frame = CGRect(x: 75 , y: 315, width: 300, height: 300)
label.text = sviluppoStoria[0].0
label.textColor = .black
label.lineBreakMode = NSLineBreakMode.byWordWrapping
label.numberOfLines = 15
label.font = UIFont(name: "AmaticSC-Bold", size: 30)
                         
//        sceltaButt4.setTitle("Back", for: .normal)
//        sceltaButt4.setTitleColor(.red, for:.normal)
//        sceltaButt4.backgroundColor = .black
//        sceltaButt4.frame = CGRect(x:10, y:10, width: 400 , height: 200)
                          
        view.addSubview(label)
    
let tap = UITapGestureRecognizer(target: self, action: #selector(scelta1Tapped))
    
Butt1.addGestureRecognizer(tap)
    
let tap2 = UITapGestureRecognizer(target: self, action: #selector(scelta2Tapped))
    
Butt2.addGestureRecognizer(tap2)
    
let tap3 = UITapGestureRecognizer(target: self, action: #selector(scelta3Tapped))
    
Butt3.addGestureRecognizer(tap3)
                          
    //playSound()
                         
    
self.view = view
numSceltePossibili()

}
                      
@objc func scelta1Tapped()
        
{
    
        sceltaArray(scelta:1)
    
            }
@objc func scelta2Tapped()
            {
                         
        sceltaArray(scelta:2)
                
            }
@objc func scelta3Tapped()
            {
                          
        sceltaArray(scelta:3)
                
            }
                      
func numSceltePossibili()
        
            {
                         
if(sviluppoStoria[curr].2==curr) //scelte possibili 1
                
                          {
    
    Butt1.frame = CGRect(x:57, y:600, width: 0 , height: 0)
    Butt2.frame = CGRect(x:214, y:600, width: 0 , height: 0)
    Butt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)
    Butt3.setTitle("Continue", for: .normal)
    
                          }
                
else if(sviluppoStoria[curr].3==curr) //scelte possibili 2
                          {
    
    Butt1.frame = CGRect(x:60, y:600, width: 100 , height: 30)
    Butt2.frame = CGRect(x:280, y:600, width: 100 , height: 30)
    Butt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 0 , height: 0)
                             
                           }
                
else //scelte possibili 3
    
                          {
                              
Butt1.frame = CGRect(x:57, y:550, width: 100 , height: 30)
Butt2.frame = CGRect(x:214, y:550, width: 100 , height: 30)
Butt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)

                          }
                          
                }
                      
    func sceltaArray(scelta:Int)
        
    {
        
    if(curr == 25)
    {
                             
    }
                          
    if(scelta==1)
        
    {
    curr = sviluppoStoria[curr].1
    }
    else if(scelta==2)
            
    {
    curr = sviluppoStoria[curr].2
    }
                          
    else
                          {
                             
    curr = sviluppoStoria[curr].3
                              
                          }
                          
                        
                          
        numSceltePossibili()
                          
    //centrare l'immagine*****
    label.text = sviluppoStoria[curr].0
    label.font.fontName
    label.font = UIFont(name: "AmericanTyperwriter", size: 30)
    if let myImg = UIImage.gif(name: "\(curr)")
                          {
    imageView = UIImageView(image: myImg)
    imageView.frame = CGRect(x:25, y:125, width: 400, height: 250)
    view.addSubview(imageView)
        
            }else{
        }
    }
}

PlaygroundPage.current.liveView = MyViewController()



//: [Next](@next)
