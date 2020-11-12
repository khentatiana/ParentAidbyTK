//
//  KidsEventsViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/8/20.
//

import UIKit
import Parse
import AlamofireImage

class KidsEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
      var events = [PFObject]()

    @IBOutlet weak var tableViewParent: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewParent.delegate = self
        tableViewParent.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "KidsEvents")
        query.includeKey("provider")
        query.limit = 20
        
        query.findObjectsInBackground{(events, error) in
            if (events != nil){
                self.events = events!
                self.tableViewParent.reloadData()
            }
        }
     
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return events.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableViewParent.dequeueReusableCell(withIdentifier: "KidsEventCell") as! KidsEventCell
//        let event = events[indexPath.row]
//        let user = event["provider"] as! PFUser
//        cell.usernameProviderLabel.text = user.username
        //cell.usernameProviderLabel.sizeToFit()
//
//        cell.descritionLabel.text = event["synopsis"] as! String
       // cell.descritionLabel.sizeToFit()
//
//        let imageFile = event["image"] as! PFFileObject
//        let urlString = imageFile.url!
//        let url = URL(string: urlString)!
//        cell.photoView.af_setImage(withURL: url)
//
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        return cell
    }
}
