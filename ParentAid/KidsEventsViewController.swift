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

        // Do any additional setup after loading the view.
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
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewParent.dequeueReusableCell(withIdentifier: "KidsEventCell") as! KidsEventCell
        let event = events[indexPath.row]
        let user = event["provider"] as! PFUser
        cell.usernameProviderLabel.text = user.username
        
        cell.descritionLabel.text = event["description"] as! String
        
        let imageFile = event["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoView.af_setImage(withURL: url)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
