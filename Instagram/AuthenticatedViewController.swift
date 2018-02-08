//
//  AuthenticatedViewController.swift
//  Instagram
//
//  Created by NICK on 2/4/18.
//  Copyright © 2018 NICK. All rights reserved.
//

import UIKit
import Parse

class AuthenticatedViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableViewPosts: UITableView!
    
    @IBAction func logOutPressed(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.logOut()
        print("Logout Pressed")
        /*
         PFUser.logOutInBackgroundWithBlock { (error:NSError?) in
         // PFUser.current() will now be nil
         } */
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        //cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let hidden = self.navigationController?.isNavigationBarHidden
        print(hidden)
        
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
