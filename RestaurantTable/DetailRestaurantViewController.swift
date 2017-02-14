//
//  DetailRestaurantViewController.swift
//  RestaurantTable
//
//  Created by Lin Li on 13/02/17.
//  Copyright © 2017 Lin. All rights reserved.
//

import UIKit

class DetailRestaurantViewController: UIViewController {

    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantCuisine: UILabel!
    @IBOutlet weak var restaurantDescription: UILabel!
    @IBOutlet weak var restaurantPhoto: UIImageView!
    
    var name = ""
    var cuisine = ""
    // name description is existing
    var des = ""
    var photo = UIImage(named: "French")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantName.text = name
        restaurantCuisine.text = cuisine
        restaurantDescription.text = des
        restaurantPhoto.image = photo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
