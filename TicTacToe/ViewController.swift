//
//  ViewController.swift
//  TicTacToe
//
//  Created by Michael Maczynski on 2/5/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var currentLetterLabel: UILabel!
    /*****************************************/

    
    let letters = "XOXOXOXOX"

    var counter = 0
    var currentLetter:Character!
    
    var labelArray = [UILabel]()
    /*****************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
    
    getCurrentLetter()
        
    labelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
 
    }
    /*****************************************/
    /*****************************************/

    @IBAction func whenTapped(sender: UITapGestureRecognizer)
    {
        
        let selectedPoint = sender.locationInView(self.view)
        print(selectedPoint)
        
        for label in labelArray
        {
            if CGRectContainsPoint(label.frame, selectedPoint)
                
            {
                if label.text == ""
                {
                label.text = String(currentLetter)
                counter++
                }
                if label.text != ""
                {
                    
                }

            }
        }
    
        
        
        
       
            checkForWinner()

        getCurrentLetter()
    
    }
    /*****************************************/
    /*****************************************/

    func getCurrentLetter()
    {
        let myRange = Range<String.Index>(start: letters.startIndex.advancedBy(counter), end: letters.startIndex.advancedBy(counter+1))
        currentLetterLabel.text = letters.substringWithRange(myRange)
        currentLetter = Character(letters.substringWithRange(myRange))
        
        
    }
    /*****************************************/

    func checkForWinner()
        
    {
        
        if label1.text == label2.text && label2.text == label3.text && label3.text != ""
            
        {
            
            presentWinningAlert("\(label3.text!)")
            
        }
            
        else if label4.text == label5.text && label5.text == label6.text && label6.text != ""
            
        {
            
            presentWinningAlert("\(label6.text!)")
            
        }
            
        else if label7.text == label8.text && label8.text == label9.text && label9.text != ""
            
        {
            
            presentWinningAlert("\(label9.text!)")
            
        }
            
        else if label1.text == label4.text && label4.text == label7.text && label7.text != ""
            
        {
            
            presentWinningAlert("\(label7.text!)")
            
        }
            
        else if label2.text == label5.text && label5.text == label8.text && label8.text != ""
            
        {
            
            presentWinningAlert("\(label8.text!)")
            
        }
            
        else if label3.text == label6.text && label6.text == label9.text && label9.text != ""
            
        {
            
            presentWinningAlert("\(label9.text!)")
            
        }
            
        else if label1.text == label5.text && label5.text == label9.text && label9.text != ""
            
        {
            
            presentWinningAlert("\(label9.text!)")
            
        }
            
        else if label3.text == label5.text && label5.text == label7.text && label7.text != ""
            
        {
            
            presentWinningAlert("\(label7.text!)")
            
        }
        
        
        
        if counter == 9
            
        {
            
            presentWinningAlert("No One")
            
        }
        
    }
    /*****************************************/

    func clearLabels(action: UIAlertAction)
    {
        
        label1.text = ""
        label2.text = ""
        label3.text = ""
        label4.text = ""
        label5.text = ""
        label6.text = ""
        label7.text = ""
        label8.text = ""
        label9.text = ""

        
        
    }
    /*****************************************/

    func presentWinningAlert(winner: String)
    {
        counter = 0
        
        let alert = UIAlertController(title: "\(winner) Won!", message: "Press 'OK' To Play Again", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: clearLabels)
        alert.addAction(okAction)
        
        
        
        presentViewController(alert, animated:  true, completion: nil)
        
    }

    /*****************************************/




}

