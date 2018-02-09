//
//  DetailsViewController.swift
//  Instagram
//
//  Created by NICK on 2/9/18.
//  Copyright © 2018 NICK. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userLabel2: UILabel!
    @IBOutlet weak var userView: PFImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func InstagramBackButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeViewController", sender: nil)
        
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
