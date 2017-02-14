//
//  ViewController.swift
//  RestaurantTable
//
//  Created by Lin Li on 13/02/17.
//  Copyright © 2017 Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurants = [Restaurant]()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: TableView DataScource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell")!
        
        // Configure cell
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.cuisine
        cell.imageView?.image = restaurant.photo
        return cell
    }

    // MARK: TableView Delegate methods
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restaurants.append(Restaurant(name: "Mcdonald's", photo: UIImage(named: "mcdonalds"), cuisine: "Fast Food", description:"Mcdonald's is the most popular fast food chain in the world. ")!)
        restaurants.append(Restaurant(name: "Le Meurice", photo: UIImage(named:"french"), cuisine: "French", description:"Le Meurice is a 3 starred Michelin restaurant in Paris.")!)
        restaurants.append(Restaurant(name: "Happy Home", photo: UIImage(named: "chinese"),cuisine: "Chinese", description:"Happy Home is a nice Chinese restaurant.")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewDetailsSegue"{
            if let destination = segue.destination as? DetailRestaurantViewController {
                
                let path = tableView.indexPathForSelectedRow
                let restaurant = restaurants[(path?.row)!]
                destination.name = restaurant.name
                destination.cuisine = restaurant.cuisine
                destination.des = restaurant.description
                destination.photo = restaurant.photo
                
            }
        }
    }
    
    // MARK: Actions
    @IBAction func unwindToRestaurantList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddRestaurantViewController, let restaurant = sourceViewController.restaurant {
            
            
            // Add a new restaurant.
            
            let newIndexPath = IndexPath(row: restaurants.count, section: 0)
            
            restaurants.append(restaurant)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
    }
    
}

