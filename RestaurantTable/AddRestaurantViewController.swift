//
//  AddRestaurantViewController.swift
//  RestaurantTable
//
//  Created by Lin Li on 13/02/17.
//  Copyright © 2017 Lin. All rights reserved.
//

import UIKit
import os.log

class AddRestaurantViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    // MARK: Properties
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var restaurantCuisine: UITextField!
    @IBOutlet weak var restaurantDescription: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UILabel!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Draw borders for multi-line UITextField
        restaurantDescription.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        restaurantDescription.layer.borderWidth = 1.0;
        restaurantDescription.layer.cornerRadius = 5.0;
        
        // Handle the text field’s user input through delegate callbacks.
        restaurantName.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateSaveButtonState()
        navigationItem.title = textField.text
        
    }
    
    // MARK: Navigation

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = restaurantName.text ?? ""
        let cuisine = restaurantCuisine.text ?? ""
        let des = restaurantDescription.text ?? ""
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        
        restaurant = Restaurant(name: name, photo: UIImage(named:"french"), cuisine: cuisine, description: des)
        
    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        var name = restaurantName.text ?? ""
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        if name.rangeOfCharacter(from: characterset.inverted) != nil {
            name = ""
            nameLabel.textColor = UIColor.red
        }
        saveButton.isEnabled = !name.isEmpty
        if !name.isEmpty {
            nameLabel.textColor = UIColor.black
        }
    }
    
    
}
