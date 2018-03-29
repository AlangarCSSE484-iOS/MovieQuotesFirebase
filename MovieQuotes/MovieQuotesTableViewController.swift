//
//  MovieQuotesTableViewController.swift
//  MovieQuotes
//
//  Created by CSSE Department on 3/29/18.
//  Copyright © 2018 alangavr. All rights reserved.
//

import UIKit

class MovieQuotesTableViewController: UITableViewController {
    
    let movieQuotesCellIdentifier = "MovieQuotesCell"
    var movieQuotes = [MovieQuote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddDialog))
        movieQuotes.append(MovieQuote(quote: "I'll be back!", movie: "Terminator"))
        movieQuotes.append(MovieQuote(quote: "I have a big head and little arms...I don't know how well this plan was thought through....", movie: "Meet the Robinsons"))
        
    }
    
    @objc func showAddDialog () {
        let alertController = UIAlertController(title: "Create a new movie quote", message: "HEYOOOO", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Quote"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Movie Title"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:nil)
        
        let createQuoteAction = UIAlertAction(title: "Create Quote", style: UIAlertActionStyle.default) { (action) in
            let quoteTextField = alertController.textFields![0]
            let movieTextField = alertController.textFields![1]
            print(quoteTextField.text!)
            print(movieTextField.text!)
            
            let movieQuote = MovieQuote(quote: quoteTextField.text!, movie: movieTextField.text!)
            self.movieQuotes.insert(movieQuote, at: 0)
            
            //we want animations!
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.top)
            
            //no animations here
           // self.tableView.reloadData()
        
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(createQuoteAction)
        
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //(defaults to 1)
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieQuotes.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieQuotesCellIdentifier, for: indexPath)
     
     // Configure the cell...
        cell.textLabel?.text = movieQuotes[indexPath.row].quote
        cell.detailTextLabel?.text = movieQuotes[indexPath.row].movie
        return cell
     }
    
    
    
     // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     }
     }
     */
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
