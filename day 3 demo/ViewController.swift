//
//  ViewController.swift
//  day 3 demo
//
//  Created by fizmat_student on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Zero
        case Cross
    }

    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    
    @IBOutlet weak var a2: UIButton!
    
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    
    @IBOutlet weak var c2: UIButton!
    
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var board = [UIButton]()
    
    var ZERO = "O"
    var CROSS = "X"
    
    var zeroscore = 0
    var crossscore = 0
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
       // var randommove = blocks.randomElement()
        //print(randommove)
        // Do any additional setup after loading the view.
    }
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if checkForVictory(CROSS){
            crossscore += 1
            resultAlert(title: "Cross win!")
        }
        if checkForVictory(ZERO){
            zeroscore += 1
            resultAlert(title: "Zero win!")

        }
        
        
        if(fullboard()){
            resultAlert(title: "draw")
        }
        
    }
    
    func checkForVictory(_ s :String) -> Bool
    {
        //horizontal
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        //vertical
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        //diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
        // hello world
        return false
   
    }
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String){
        let message = "\nZeros: " + String(zeroscore) + "\nCrosses: " + String(crossscore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            
            self.resetBoard()
            
        }))
        self.present(ac, animated: true)
    }
    
    
    func fullboard() -> Bool{
        for button in board{
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if(firstTurn == Turn.Zero){
            firstTurn = Turn.Cross
            Label.text = CROSS
        }
        else if(firstTurn == Turn.Cross){
            firstTurn = Turn.Zero
            Label.text = ZERO
        }
        currentTurn = firstTurn
    }
    
    
    func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Zero){
                sender.setTitle(ZERO, for: .normal)
                currentTurn = Turn.Cross
                Label.text = CROSS
            }
            else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Zero
                Label.text = ZERO
            }
            sender.isEnabled = false
        }
    }
    
    
    
    
    
    
    
}

