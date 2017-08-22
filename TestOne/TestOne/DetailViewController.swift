//
//  DetailViewController.swift
//  TestOne
//
//  Created by ya Liu on 2017/8/17.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var phoneButton: UIButton!
  
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var shoppingcartBrutton: UIButton!
    
    
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var enterTextField: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    var todo: ToDoItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            self.title = "Edit Todo"
            if todo.image == "child-selected" {
                childButton.isSelected = true
            }else if todo.image == "phone-selected" {
                phoneButton.isSelected = true
            }else if todo.image == "shopping-cart-selected" {
                shoppingcartBrutton.isSelected = true
            }else if todo.image == "travel-selected" {
                travelButton.isSelected = true
            }
            enterTextField.text = todo.title
            datepicker.setDate(todo.date, animated: true)
        }else {
            title = "New Todo"
            childButton.isSelected = true
        }
        
    }
    
    
    @IBAction func phoneAction() {
        resetButtons()
        phoneButton.isSelected = true
    }
    
    @IBAction func childAction() {
        resetButtons()
        childButton.isSelected = true
    }
    
    @IBAction func shopAction() {
        resetButtons()
        shoppingcartBrutton.isSelected = true
    }
    
    @IBAction func travelAction() {
        resetButtons()
        travelButton.isSelected = true
    }
    
    func resetButtons()  {
        childButton.isSelected = false
        phoneButton.isSelected = false
        shoppingcartBrutton.isSelected = false
        travelButton.isSelected = false
    }
    @IBAction func sureButtonClicked(_ sender: Any) {
        var image = ""
        if childButton.isSelected {
            image = "child-selected"
        }else if phoneButton.isSelected {
            image = "photo-selected"
        }else if  shoppingcartBrutton.isSelected {
            image = "shopping-cart-selected"
        }else if travelButton.isSelected  {
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = enterTextField.text!
            todo.date = datepicker.date
        }else {
            let uuid = UUID().uuidString
            todo = ToDoItem.init(id: uuid, image: image, title: enterTextField.text!, date: datepicker.date)
            todos.append(todo!)
        }
        let _ = navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

}
