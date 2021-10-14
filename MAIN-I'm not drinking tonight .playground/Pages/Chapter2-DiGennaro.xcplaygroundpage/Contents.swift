//: [Previous](@previous)
//: A UIKit based Playground for presenting user interface
import UIKit
import PlaygroundSupport
import AVFoundation



class MyViewController : UIViewController{
    let sceltaButt1 = UIButton()
    let sceltaButt2 = UIButton()
    let sceltaButt3 = UIButton()
    var label = UILabel()
    var imageView = UIImageView()
    var occhioFerito = false
    var sviluppoStoria = [("CHAPTER 2: First hard choice",0,0,1),
    ("",1,1,2),
    (" Prima Scelta difficile ",3,4,2),

    ]
    var curr = 0

    override func loadView(){ //grandezza sfondo***
        imageView.frame = CGRect(x:0, y:0, width: 900 , height: 450)
        let view = UIView()
        view.backgroundColor = .white
        let bgImg = UIImage(named: "2.jpeg")
                view.backgroundColor = UIColor(patternImage: bgImg!)
    
        view.frame.size = CGSize(width: 900, height: 450)
        
        sceltaButt1.setTitle("A", for: .normal)
        sceltaButt1.setTitleColor(.white, for:.normal)
        sceltaButt1.backgroundColor = .black
        sceltaButt1.frame = CGRect(x:0, y:100, width: 400 , height: 100)
        sceltaButt1.isUserInteractionEnabled = true
        
        view.addSubview(sceltaButt1)

        sceltaButt2.setTitle("B", for: .normal)
        sceltaButt2.setTitleColor(.white, for:.normal)
        sceltaButt2.backgroundColor = .black
        sceltaButt2.frame = CGRect(x:57, y:100, width: 100 , height: 30)
        sceltaButt2.isUserInteractionEnabled = true
        
        view.addSubview(sceltaButt2)
        
        sceltaButt3.setTitle("Choice 3", for: .normal)
        sceltaButt3.setTitleColor(.white, for:.normal)
        sceltaButt3.backgroundColor = .black
        sceltaButt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)
        sceltaButt3.isUserInteractionEnabled = true
        view.addSubview(sceltaButt3)

        label = UILabel()
        label.frame = CGRect(x: 200 , y:-75, width: 500, height: 300)
        label.text = sviluppoStoria[0].0
        label.textColor = .white
        label.font = UIFont( name:"Helvetica", size: 35.0)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        
        view.addSubview(label)
        let tap = UITapGestureRecognizer(target: self, action: #selector(scelta1Tapped))
               sceltaButt1.addGestureRecognizer(tap)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(scelta2Tapped))
                      sceltaButt2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(scelta3Tapped))
                             sceltaButt3.addGestureRecognizer(tap3)
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
        { sceltaButt1.frame = CGRect(x:(view.frame.midX)-220, y:355, width: 100 , height:30)
             sceltaButt2.frame = CGRect(x:0, y:0, width: 0 , height: 0)
             sceltaButt3.frame = CGRect(x:550, y:355, width: 100 , height: 30)
            sceltaButt3.setTitle("B", for: .normal)
        }
        else if(sviluppoStoria[curr].3==curr) //scelte possibili 2
        { sceltaButt1.frame = CGRect(x:57, y:650, width: 100 , height: 30)
             sceltaButt2.frame = CGRect(x:220, y:650, width: 100 , height: 30)
             sceltaButt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 0 , height: 0)
                   

        }
        else //scelte possibili 3
        { sceltaButt1.frame = CGRect(x:57, y:550, width: 100 , height: 30)
             sceltaButt2.frame = CGRect(x:214, y:550, width: 100 , height: 30)
             sceltaButt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)
            sceltaButt3.setTitle("Choice 3", for: .normal)

        }
        
    }
    
   func sceltaArray(scelta:Int)
    {
        if(curr == 25){
            //occhioFerito = true
            //print(occhioFerito)
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
        
        //if ( curr == 20 && occhioFerito == true){
            //curr = 26
        //}
        
        numSceltePossibili() //centrare l'immagine*****
        label.text = sviluppoStoria[curr].0
        if let myImg = UIImage.gif(name: "\(curr)") {
            imageView = UIImageView(image: myImg)
            imageView.frame = CGRect(x:0, y:0, width:850, height: 450)
            view.addSubview(imageView)
        } else{
        }
    }
    
  
}
var player:AVAudioPlayer = AVAudioPlayer()
do {
   let audioPath = Bundle.main.path(forResource: "switch-me-on", ofType: "mp3")
    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
} catch {
    print("Couldn't find background music file.")
}

player.numberOfLoops = -1
player.prepareToPlay()
player.play()



// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


//: [Next](@next)
