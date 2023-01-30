//
//  ViewController.swift
//  CardGame
//
//  Created by Bk on 14/01/23.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var dealButton: UIButton!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func dealTapped(_ sender: Any) {
        
      //  createLayer()
      //  createLabel()
    
        // generating random number
        let leftNumber = Int.random(in: 2...14)
        
        let rightNumber = Int.random(in: 2...14)
        
        // updating the imageview
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber {
            
            //left side win
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            if leftScore==20{
                createLabel(msg:"Congratulations \n You Win")
                createLayer()
                dealButton.isEnabled = false
            }
            
        }else if leftNumber < rightNumber {
            
            //right side win
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
            if rightScore==20{
                createLabel(msg:"You lose")
                //createLayer()
                dealButton.isEnabled = false
            }
        }else{
            
            //tie
        }
    }
    
    private func createLabel(msg:String){
        let label = UILabel(frame: CGRect(x:100, y: 200, width: 200, height: 50))
        view.addSubview(label)
        //label.center = view.center
        label.text = msg
        label.font = UIFont(name: label.font.fontName, size: 40)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.red
        label.numberOfLines = 3
        label.textAlignment = .center
        label.backgroundColor = UIColor.yellow
        
        
    }
    
    private func createLayer(){
        
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(
            x: view.center.x,
            y: -100
            )
        let colors: [UIColor] = [
            .systemRed,
            .systemBlue,
            .systemOrange,
            .systemGreen,
            .systemYellow,
            .systemPink,
            .systemPurple
        ]
        
        let cells: [CAEmitterCell] = colors.compactMap{
            let cell = CAEmitterCell()
            cell.scale = 0.05
            cell.emissionRange = .pi * 2
            cell.lifetime = 10
            cell.birthRate = 50
            cell.velocity = 150
            cell.color = $0.cgColor
            cell.contents = UIImage(named: "image")!.cgImage
            return cell
        }
        
        layer.emitterCells = cells
        view.layer.addSublayer(layer)
    }
    
    
}

