//
//  ViewController.swift
//  TicTacToe
//
//  Created by Michael Maczynski on 2/5/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    let letters = "XOXOXOXOX"

    var counter = 0
    var currentLetter:Character!
    
    var labelArray = [UILabel]()
    
    
    
    
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
    
    getCurrentLetter()
        
    labelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
 
    }

    @IBAction func whenTapped(sender: UITapGestureRecognizer)
    {
        
        let selectedPoint = sender.locationInView(self.view)
        print(selectedPoint)
        
        for label in labelArray
        {
            if CGRectContainsPoint(label.frame, selectedPoint)
                
            {
                label.text = String(currentLetter)
            }
        }
    
        
        
        
        counter++
        
        if counter == 9
        {
            reset()
            
        }
        getCurrentLetter()
    
    }
    func getCurrentLetter()
    {
        let myRange = Range<String.Index>(start: letters.startIndex.advancedBy(counter), end: letters.startIndex.advancedBy(counter+1))
        currentLetterLabel.text = letters.substringWithRange(myRange)
        currentLetter = Character(letters.substringWithRange(myRange))
        
        
    }
    
    
    func reset()
    {
        counter = 0
        
        //let alert = UIAlertController(title: "Resetting Counter", message: "Press OK To Reset", preferredStyle: UIAlertControllerStyle.Alert)
        
        //let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: clearLabels)
        //alert.addAction(okAction)
        
        //let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: nil)
        //alert.addAction(cancelAction)
        
       // presentViewController(alert, animated:  true, completion: nil)
    }
        
    



}

