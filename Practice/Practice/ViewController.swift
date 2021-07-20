//
//  ViewController.swift
//  Practice
//
//  Created by Lourdes T S Santiago on 20/07/2021.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    
    var arrayOfCakes: [Cakes] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(arrayOfCakes.count)
        return arrayOfCakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(arrayOfCakes.count)
        let cake = arrayOfCakes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cakes") as! CakeTableViewCell
        cell.title.text = cake.title
        cell.desc.text = cake.desc
        
        
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        
        
        NetworkManager().fetchData { cakes, error in
            print(cakes)
            if let cakesArray = cakes{
                self.arrayOfCakes = cakesArray
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
            }else{ return }
            print(error)
        }
    }


}

