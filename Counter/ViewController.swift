//
//  ViewController.swift
//  Counter
//
//  Created by Денис on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var historyText = "История изменений:\n"
    
    @IBOutlet weak var clicLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            updateClicLabel()
            historyTextView.text = historyText
            historyTextView.isEditable = false
        }
        
        func updateClicLabel() {
            clicLabel.text = "\(count)"
        }
        
        func addToHistory(_ event: String) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: Date())
            historyText += "[\(dateString)]: \(event)\n"
            historyTextView.text = historyText
        }
        
        @IBAction func redPlusOneButton(_ sender: UIButton) {
            if count < Int.max {
                count += 1
                updateClicLabel()
                addToHistory("Значение изменено на +1")
            }
        }
        
        @IBAction func blueMinisOneButton(_ sender: UIButton) {
            if count > 0 {
                count -= 1
                updateClicLabel()
                addToHistory("Значение изменено на -1")
            } else {
                addToHistory("Внимание! Попытка уменьшить значение счётчика ниже 0!")
            }
        }
        
        @IBAction func reternButton(_ sender: UIButton) {
            count = 0
            updateClicLabel()
            addToHistory("Значение сброшено")
        }
    
    }

