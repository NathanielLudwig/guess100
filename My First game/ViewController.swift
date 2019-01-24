//
//  ViewController.swift
//  My First game
//
//  Created by 90303054 on 9/17/18.
//  Copyright © 2018 90303054. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    var random = Int(arc4random_uniform(100))
    var guesses = 0
    var nums = [Int]()
    var a = 0
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "\(nums[row])"
//    }
    func findnum(numbers: [Int], num: Int) -> Int {
        for i in 0..<numbers.count {
            if i == num {
                return i
            }
        }
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nums.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //status.text = "\(nums[row])"
        a = nums[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        //let titleData = nums[row]
        let myTitle = NSAttributedString(string: "\(nums[row])", attributes: [NSAttributedString.Key.font:UIFont(name: "Futura", size: 26.0)!,NSAttributedString.Key.foregroundColor:UIColor.white])
        pickerLabel.attributedText = myTitle
        //color  and center the label's background
        let hue = CGFloat(row)/CGFloat(nums.count)
        pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        
        return NSAttributedString(string: "\(nums[row])", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    override func viewDidLoad() {
     // textbox.becomeFirstResponder()
        createNums()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func createNums(){
        var newnums = [Int]()
        for index in 0...100 {
            newnums.append(index)
        }
        nums = newnums
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkButton(_ sender: Any) {
//        let a:Int? = Int(textbox.text!)
//
//        if a != nil{
            if random == a{
                let alert = UIAlertController(title: "YOU WON!!!!!!", message: "You won in \(guesses) guesses", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: { action in
                    self.random = Int(arc4random_uniform(100))
                    self.createNums()
                    self.status.text  = ""
                    self.guesses = 0
                    self.guessBox.text = "Guesses: \(self.guesses)"
                    self.pickerView.reloadAllComponents()
                }))
//                alert.addAction(UIAlertAction(title: "Quit", style: .default, handler: { action in
//                    exit(0)
//                }))
                self.present(alert, animated: true)
                
                status.text = ""


            } else if random < a {
                status.text = "👇 Lower 👇"
                var newnums = [Int]()
                for index in nums[0]..<a{
                    newnums.append(index)
                }
                nums = newnums
                guesses = guesses + 1
            } else if random > a {
                status.text = "👆 Higher 👆"
                var newnums = [Int]()

                for index in a+1..<(nums[nums.count-1])+1{
                    newnums.append(index)
                }
                nums = newnums

                guesses = guesses + 1
            } else {
                status.text = "Please enter a number"
                
              
            }
          guessBox.text = "Guesses: \(guesses)"
//        } else {
//            status.text = "Please enter a number"
//            textbox.text = ""
//        }
//
//
        pickerView.reloadAllComponents()
   }
    
    
    
    @IBOutlet weak var guessBox: UILabel!
    @IBOutlet weak var status: UILabel!
   // @IBOutlet weak var textbox: UITextField!
    //Hello
    // this is my app
}


