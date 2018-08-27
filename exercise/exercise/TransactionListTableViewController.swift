//
//  TransactionListTableViewController.swift
//  exercise
//
//  Created by SPASOV DIMITROV Vladimir on 27/8/18.
//  Copyright © 2018 SPASOV DIMITROV Vladimir. All rights reserved.
//

import UIKit

class TransactionListTableViewController: UITableViewController {
    
    var data: [Datum]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.shared.getData { data in
            guard data != nil else{
                print("Error while fetching data")
                return
            }
//            print(data)
            self.data = data
            self.tableView.reloadData()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransasctionTableViewCell

        cell.setupCell(data: data![indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: indexPath)
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            let destinationVC = segue.destination as! DetailViewController
            let  indexPath = sender as! IndexPath
            destinationVC.data = data?[indexPath.row]
        }
    }
 

}
