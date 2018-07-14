//
//  DetailViewController.swift
//  ShowFlags
//
//  Created by LALIT JAGTAP on 7/13/18.
//  Copyright © 2018 LALIT JAGTAP. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedPath: String?
    var country: String?
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("show flag image of country \(selectedPath!)")
        
        
        if let countryClicked = country {
            countryName.text = countryClicked.capitalized
            title = countryClicked.capitalized
        }
        
        if let imageToLoad = selectedPath {
            flagImageView.image = UIImage(named: imageToLoad)
        }
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
