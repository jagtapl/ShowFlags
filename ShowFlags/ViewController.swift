//
//  ViewController.swift
//  ShowFlags
//
//  Created by LALIT JAGTAP on 7/11/18.
//  Copyright © 2018 LALIT JAGTAP. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [String]()
    var countryFlagMap = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load flag images using Bundle
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix(".png") {
                if let index = item.index(of: "@") {
                    if item.contains("3") {
                        let countryName = item[..<index]
                        countries.append(String(countryName))
                        countryFlagMap[String(countryName)] = item
                    }
                }
            }
        }
        print(countryFlagMap)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].capitalized
        
        let country = countries[indexPath.row]
        if let flagFileName = countryFlagMap[country] {
            cell.imageView?.image = UIImage(named: flagFileName)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // user clicked the row, now load detailView and set the property to store image file and transition to it
        let country = countries[indexPath.row]
        
        if let flagFileName = countryFlagMap[country] {
            print ("clicked on country with flag file name \(flagFileName)")
            if let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController
            {
                vc.selectedPath = flagFileName
                vc.country = country
                navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

