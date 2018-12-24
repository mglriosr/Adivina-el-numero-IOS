//
//  ViewController.swift
//  First App IOS
//
//  Created by Miguel Rios R on 12/24/18.
//  Copyright © 2018 Miguel Rios R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numtxt: UITextField!
    @IBOutlet weak var intentoslbl: UILabel!
    @IBOutlet weak var smslbl: UILabel!
    var random = ""
    var intentos = 0
    @IBAction func validarbtn(_ sender: Any) {
        if numtxt.text == random{
            smslbl.text = "Felicidades, Ganaste!"
            self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            showAlert()
        } else {
            smslbl.text = "Game over"
            if intentos == 1{
                self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                showAlert()
            } else {
                intentos = intentos - 1
                intentoslbl.text = String(intentos)
                smslbl.text = "Intenta de nuevo"
                numtxt.text = ""
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func showAlert(){
        let alert = UIAlertController(title: nil, message: "Intenta de nuevo", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Juega de nuevo", style: .default){
            (UIAlertAction) in self.setValues()
        }
        
        alert.addAction(playAgain)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setValues(){
        random = String(arc4random_uniform(10))
        print (random)
        intentos = 5
        intentoslbl.text = String(intentos)
        numtxt.text = ""
        smslbl.text = "Ingrese un número del 0 - 9"
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
}

