//
//  ViewController.swift
//  IMC
//
//  Created by Gustavo Nunes Lucena on 22/01/19.
//  Copyright © 2019 Gustavo Nunes Lucena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var imResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //Ativado quando toca em qualquer parte da tela que nao seja um textinput
        view.endEditing(true)
    }

    @IBAction func calculateImc(_ sender: Any) {
        if let weight = Double(tfWeight.text!) , let height = Double(tfHeight.text!) {
            imc = weight / (height * height)
            showResult()
        }
    }
    
    func showResult() {
        var result: String = ""
        var image: String = ""
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "magreza"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso ideal"
            image = "ideal"
        case 25..<30:
            result = "Acima do peso"
            image = "sobre"
        default:
            result = "Acima do peso"
            image = "sobre"
        }
        lbResult.text = "\(Int(imc)): \(result)" 
        imResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}

