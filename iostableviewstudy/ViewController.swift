//
//  ViewController.swift
//  iostableviewstudy
//
//  Created by kenan on 24.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewCountries: UITableView!
    
    
    @IBOutlet weak var tableViewCities: UITableView!
    
    
    var countries:[String] = [String]()
    var cities:[String] = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries = ["Türkiye","Japonya","Almanya","Rusya","İtalya","Güney Kore","Mısır"]
        cities = ["Ankara","Paris","Berlin","Tokyo","Bakü"]
        
        tableViewCountries.delegate = self
        tableViewCountries.dataSource = self
        
        
        tableViewCities.delegate = self
        tableViewCities.dataSource = self
    }
    

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var dataCount:Int?
        if tableView == tableViewCountries{
            dataCount = countries.count
        }
        
        if tableView == tableViewCities{
            dataCount = cities.count
        }
        
        return dataCount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      var cell: UITableViewCell?

                  if tableView == tableViewCountries {

                          if #available(iOS 14.0, *) {

                              cell = tableView.dequeueReusableCell(withIdentifier: "cellCountry", for: indexPath)

                               var content = cell?.defaultContentConfiguration()

                            content?.text = countries[indexPath.row]

                            cell?.contentConfiguration = content

                       }else {

                          cell?.textLabel?.text = countries[indexPath.row]

                              }

                      }

            if tableView == tableViewCities {

                           if #available(iOS 14.0, *) {

                              cell = tableView.dequeueReusableCell(withIdentifier: "cellCity", for: indexPath)

                                var content = cell?.defaultContentConfiguration()

                              content?.text = cities[indexPath.row]

                             cell?.contentConfiguration = content

                           }else {

                             cell?.textLabel?.text = cities[indexPath.row]

                                  }

                         }

                      return cell!

              }
    /*
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action:UITableViewRowAction,indexPath:IndexPath)-> Void in
            print("\(self.countries[indexPath.row]) deleted")
        })
        
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: {(action:UITableViewRowAction,indexPath:IndexPath)-> Void in
            print("\(self.countries[indexPath.row]) edited")
        })
        
        return [deleteAction,editAction]
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewCountries{
            print("Selected country: \(countries[indexPath.row])")
        }
        
        if tableView == tableViewCities{
            print("Selected city: \(cities[indexPath.row])")
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var deleteAction:UIContextualAction
        var editAction:UIContextualAction
        
        deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(contextualAction,view,boolValue) in
           print("\(self.cities[indexPath.row]) deleted")
       }
       
       
       editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
                guard let self = self else { return }
                print("\(self.cities[indexPath.row]) edited")
                completionHandler(true) // İşlemin tamamlandığını belirtir
       }
        
        if tableView == tableViewCountries{
             deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(contextualAction,view,boolValue) in
                print("\(self.countries[indexPath.row]) deleted")
            }
            
             editAction = UIContextualAction(style: .normal, title: "Edit"){(contextualAction,view,boolValue) in
                print("\(self.countries[indexPath.row]) edited")
            }
         
        }
        
    
        
            /*
             editAction = UIContextualAction(style: .normal, title: "Edit"){(contextualAction,view,boolValue) in
                print("\(self.cities[indexPath.row]) edited")
            }
             */
         
        
        
       
        let swipeactions = UISwipeActionsConfiguration(actions: [deleteAction,editAction])
     return swipeactions
    }

}
