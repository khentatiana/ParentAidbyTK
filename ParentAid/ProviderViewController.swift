//
//  ProviderViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import Parse
import AlamofireImage

class ProviderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var events = [PFObject]()

  
    @IBOutlet weak var tableViewProvider: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProvider.delegate = self
        tableViewProvider.dataSource = self

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
                self.tableViewProvider.reloadData()
            }
        }
     
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return events.count
               
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProvider.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        let event = events.reversed()[indexPath.row]
               let user = event["provider"] as! PFUser
               cell.providerLabel.text = user.username
               cell.providerLabel.sizeToFit()
       
               cell.synopsisLabel.text = event["synopsis"] as! String
               cell.synopsisLabel.sizeToFit()
       
               let imageFile = event["image"] as! PFFileObject
               let urlString = imageFile.url!
               let url = URL(string: urlString)!
               cell.photoViewProvider.af_setImage(withURL: url)
       
        
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "This is Provider"
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
