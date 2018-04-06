//
//  ViewController.swift
//  quizApp_G4
//
//  Created by Boi on 4/4/18.
//  Copyright © 2018 Boi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["Thu cung yeu thich?","Mau sac yeu thich","Noi sinh o dau"]
    let answers = [["Chuot","Meo","Chim"],["Den","Trang","Do"],["Vung Tau","Ho Chi Minh","Ha Noi"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0

    @IBOutlet weak var lbl: UILabel!
    
    
    @IBAction func action(_ sender: AnyObject)
    {
        if(sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!!!!")
        }
        else
        {
            print ("WRONG!!!")
        }
        if(currentQuestion != questions.count)
        {
            newQuestion()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            button = view.viewWithTag(i) as! UIButton
            if(i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x=2
            }
        }
        currentQuestion += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

