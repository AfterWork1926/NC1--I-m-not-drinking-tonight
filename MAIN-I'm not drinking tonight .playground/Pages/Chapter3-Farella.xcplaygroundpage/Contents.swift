//: [Previous](@previous)

import UIKit
import PlaygroundSupport
import AVFoundation
import CoreText


class MyViewController : UIViewController{
    let sceltaButt1 = UIButton()
    let sceltaButt2 = UIButton()
    let sceltaButt3 = UIButton()
    let label = UILabel()
    var imageView = UIImageView()
    
    
    var sviluppoStoria = [("I'm not drinking tonight (maybe)",0,0,1),
    ("",1,1,2),
    (" second hard choice ",3,3,2),
                          ("",3,3,3)
   
    ]
    var curr = 0

    override func loadView(){ //grandezza sfondo***
        imageView.frame = CGRect(x:57, y:0, width: 450 , height: 900)
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 450, height: 900)
        view
        
        sceltaButt1.setTitle("Choice 1", for: .normal)
        sceltaButt1.setTitleColor(.red, for:.normal)
        sceltaButt1.backgroundColor = .black
        sceltaButt1.frame = CGRect(x:57, y:600, width: 100 , height: 30)
        sceltaButt1.isUserInteractionEnabled = true
        
        view.addSubview(sceltaButt1)

        sceltaButt2.setTitle("Choice 2", for: .normal)
        sceltaButt2.setTitleColor(.red, for:.normal)
        sceltaButt2.backgroundColor = .black
        sceltaButt2.frame = CGRect(x:214, y:600, width: 100 , height: 30)
        sceltaButt2.isUserInteractionEnabled = true
        
        view.addSubview(sceltaButt2)
        
        sceltaButt3.setTitle("Choice 3", for: .normal)
        sceltaButt3.setTitleColor(.red, for:.normal)
        sceltaButt3.backgroundColor = .black
        sceltaButt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)
        sceltaButt3.isUserInteractionEnabled = true
        
        view.addSubview(sceltaButt3)

        label.frame = CGRect(x: 75 , y: 300, width: 300, height: 300)
        label.text = sviluppoStoria[0].0
        label.textColor = .black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 15
        
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
        { sceltaButt1.frame = CGRect(x:57, y:600, width: 0 , height: 0)
             sceltaButt2.frame = CGRect(x:214, y:600, width: 0 , height: 0)
             sceltaButt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 100 , height: 30)
            sceltaButt3.setTitle("Continue", for: .normal)
        }
        else if(sviluppoStoria[curr].3==curr) //scelte possibili 2
        { sceltaButt1.frame = CGRect(x:57, y:600, width: 100 , height: 30)
             sceltaButt2.frame = CGRect(x:280, y:600, width: 100 , height: 30)
             sceltaButt3.frame = CGRect(x:(view.frame.midX)-50, y:600, width: 0 , height: 0)
                   

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
        
        
        numSceltePossibili() //centrare l'immagine*****
        label.text = sviluppoStoria[curr].0
        label.font = UIFont(name: "SnellRoundhand-Black", size: 30)
        if let myImg = UIImage.gif(name: "\(curr)") {
            imageView = UIImageView(image: myImg)
            imageView.frame = CGRect(x:25, y:125, width: 400, height: 250)
            view.addSubview(imageView)
        }else{
        }
    }
    
  
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

//: [Next](@next)
