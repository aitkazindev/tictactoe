//
//  ViewController.swift
//  tictactoe
//
//  Created by Ibrahim Aitkazin on 07.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var state = [0,0,0,0,0,0,0,0,0]
    var count = 0
    var player = 1
    let winState = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func game(_ sender: UIButton) {
        if state[sender.tag-1] != 0 {
            return
        }
        
        
        
        if player == 1{
            state[sender.tag-1] = 1
            player = 2
            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
        }
        else{
            state[sender.tag-1] = 2
            player = 1
            sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
        }
        
        for wins in winState {
            if ( state[wins[0]] == state[wins[1]] && state[wins[1]] ==
                 state[wins[2]] && state[wins[0]] == 1){
                let alert = UIAlertController(title: "X Wins!", message: nil, preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
                    
                    self.clear()
                }))
                present(alert,animated: true, completion: nil)
            }
            
            if ( state[wins[0]] == state[wins[1]] && state[wins[1]] ==
                 state[wins[2]] && state[wins[0]] == 2){
                let alert = UIAlertController(title: "O Wins!", message: nil, preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
                    
                    self.clear()
                }))
                present(alert,animated: true, completion: nil)
            }
            
            
            
        }
        count += 1
        if count == 9 {
            let alert = UIAlertController(title: "Nobody Wins!", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
                
                self.clear()
            }))
            present(alert,animated: true, completion: nil)
            
            player = 1
            count = 0
        }
        
        
        
    }
    
    func clear() {
        for i in 0...8 {
            state[i] = 0
            let btn = view.viewWithTag(i+1) as! UIButton
            btn.setBackgroundImage(nil, for: .normal)
        }
        player = 1
        count = 0
    }
    
}

