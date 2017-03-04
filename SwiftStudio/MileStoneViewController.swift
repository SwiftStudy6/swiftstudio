//
//  MileStoneViewController.swift
//  SwiftStudio
//
//  Created by 홍대호 on 2017. 1. 12..
//  Copyright © 2017년 swift. All rights reserved.
//
import Foundation
import Firebase
import UIKit




class Mile: Equatable {
    var username = ""
    var userID = ""
    var uid = ""
    var mileTitle = ""
   // var mileAttend : Dictionary<String, Bool>
  //  var mileCount = 0
    var editTime = ""
    var bodyText = ""
    var ref:FIRDatabaseReference

    init(snapshot: FIRDataSnapshot)
    {
        let snapshotValue = snapshot.value as! NSDictionary
        username = snapshotValue["username"] as? String ?? ""
        userID = snapshotValue["userID"] as? String ?? ""
        mileTitle = snapshotValue["mileTitle"] as? String ?? ""
        uid = snapshotValue["uid"] as? String ?? ""
     //   mileAttend = snapshotValue["mileAttend"] as? [String : Bool] ?? [:]
     //   mileCount = snapshotValue["mileCount"] as? Int ?? 0
        editTime = snapshotValue["editTime"] as? String ?? ""
        bodyText = snapshotValue["bodyText"] as? String ?? ""
        ref = snapshot.ref
    }
}

func ==(lhs: Mile, rhs: Mile)->Bool {
    return lhs.uid == rhs.uid

}

class MILEATTEND
{
    //  var uid            : Int?
    var mileKey        : String?       //Board uique Key
    var userID        : String?       //Author Id(userId)
    var userName      : String?       //Author Name
    var profileImgUrl   : String?       //Author Profile Url by string
    var profileImg      : UIImage?      //Author Profile Image
    var mileTitle        : String?       //Board Body Text
    var attendCnt       : Int?         //MileStone attend count
    var bodyText        : String?       //Board Body Text
    var editTime        : String?       //Board Edited Time yyyy/MM/dd hh:mm
    var attendFlag       : String?
    
    //init each
    
      init()
    {
        self.mileKey = "1"
        self.userID = "2"
        self.userName = "hong"
        self.mileTitle = "title"
        self.bodyText = "text test"
        
    }
    
}

class USER {
    
    var userEmail : String
    var userName : String
    
  init()
  {
     self.userEmail = ""
     self.userName = ""
  }
   
}


class MileStoneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    @IBOutlet weak var main_title_label: UILabel!
   
    @IBOutlet weak var tableView: UITableView!
    var miles = [Mile]()
    //  @IBOutlet weak var InputFiled: UITextField!
    let user = USER()
    
    @IBOutlet weak var yesbt: UIButton!
    @IBOutlet weak var nobt: UIButton!
    
    
    var mileList : Array<Any>! = []
    
    
    let test_image = ["user", "user", "user"]
    let mile_list_title = ["스터디 1주차", "스터디 2주차", "스터디 3주차"]
    let mile_list_data = ["1월 11일 6시 ENI", "1월 17일 6시 ENI", "1월 23일 6시 ENI"]
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 1
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       // return (mile_list_title.count)
        //return self.mileList.count
        NSLog("miles.count : [%ld]", miles.count)
        
        return miles.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomMileStoneViewControllerTableViewCell
       
        
        /*
        cell.MileImage.image = UIImage(named: test_image[indexPath.row]+".png")
        cell.mainlabel.text = mile_list_title[indexPath.row]
        cell.detaillabel.text = mile_list_data[indexPath.row]
         */
        
        let mile = miles[indexPath.row]
        cell.mainlabel.text = mile.mileTitle
        cell.detaillabel.text = mile.editTime
        cell.userlabel.text = mile.userID
        cell.textlabel.text = mile.bodyText
        cell.MileImage.image = UIImage(named: test_image[1]+".png")
        
        
        cell.accceptbutton.tag = indexPath.row
        cell.rejectbutton.tag = indexPath.row
        
        
        NSLog("[%ld]", cell.accceptbutton.tag)
        
        cell.accceptbutton.setTitle("참석", for: .normal)
        cell.rejectbutton.setTitle("불참", for: .normal)
        
      
 
        return (cell)
        

        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomMileStoneViewControllerTableViewCell
      //  let mileObj = self.mileList[indexPath.row] as! MileObject
        
       // cell.dataObject = mileObj
       // cell.indexPath = indexPath
      //  cell.mainlabel.text =
       
        NSLog("[%s] !!!!!", self.mileList.count)
        
       
     //  cell.mainlabel.text = cell.dataObject[indexPath.row]
     //  cell.detaillabel.text = cell.dataObject[indexPath.row]
        
       // cell.delegate = self
        
        return cell
         */
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        
    {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let vc = UIStoryboard(name: "MileDetail", bundle: nil).instantiateInitialViewController() as! MileStoneDetailViewController
        
        
        
        let mile = miles[indexPath.row]
        vc.mile_detail_title = mile.mileTitle
        vc.title_key = mile.uid
        
        /*
        let vc = UIStoryboard(name: "MileDetail", bundle: nil).instantiateInitialViewController() as! MileStoneDetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
        */
        
        
        // 시작
        showViewController(vc, true, nil)
        
        // 끝
        

        
       //self.present(vc, animated: true, completion: nil)
        
        //  let row = indexPath.row
        
     //    let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MileStoneDetailViewController") as! MileStoneDetailViewController
        
       // self.navigationController?.pushViewController(MileStoneDetailViewController(), animated: false)

        
          NSLog("Click")
      //    let detailViewController =  MileStoneDetailViewController()
        //  self.navigationController?.pushViewController(detailViewController, animated: true)
      //  self.present(detailViewController, animated: true, completion: nil)
        
        
       // self.present(detailViewController, animated: false, completion: nil)
           // 네비게이션 컨트롤러 없이 view 띄우기
      //   let destination = MileStoneDetailViewController()
      //  self.present(destination, animated: true, completion: nil)
        
        
      //  navigationController?.pushViewController(destination, animated: true)
        //  tableView.deselectRow(at: <#T##IndexPath#> as IndexPath, animated: true)
        
        
    }
    
    
    func showViewController(_ viewController: UIViewController,_ animated : Bool,_ completion :(() -> Swift.Void)? = nil){
        var activateController = UIApplication.shared.keyWindow?.rootViewController
        
        if(activateController?.isKind(of: UINavigationController.self))!{
            activateController = (activateController as! UINavigationController).visibleViewController
        }else if((activateController?.presentedViewController) != nil){
            activateController = activateController?.presentedViewController
        }
        
        activateController?.present(viewController, animated: animated, completion: completion)
    }
  
    
    

    @IBAction func milenewbutton(_ sender: Any) {
        
        let vc = UIStoryboard(name: "MileCreate", bundle: nil).instantiateInitialViewController() as! MileStoneCreateViewController
        
        
        // 시작
        showViewController(vc, true, nil)

        
    }
    
    func celltab(cell: CustomMileStoneViewControllerTableViewCell)
    {
        print(tableView.indexPath(for: cell)?.row)
    }
    
    
    
    @IBAction func yesbutton(_ sender: UIButton) {
        
        NSLog("yes")
       
        NSLog("yes")
        
        
        NSLog("miles.row : %ld", sender.tag)
        
        
        let actionSheetController: UIAlertController = UIAlertController(title: "참석여부", message: "참석하시겠습니까?", preferredStyle: .alert)
    
       
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "참석", style: .default) { action -> Void in
            //Do some other stuff
             self.mileAttendInsert(rownum: sender.tag, attendflag: "Y")
            
        }
        actionSheetController.addAction(nextAction)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "취소", style: .default) { action -> Void in
            //Do some stuff
        }
        
         actionSheetController.addAction(cancelAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
        
        
        
        
    }

    @IBAction func nobutton(_ sender: UIButton) {

        
        NSLog("no")
        
        NSLog("miles.row : %ld", sender.tag)
        
        let actionSheetController: UIAlertController = UIAlertController(title: "참석여부", message: "불참하시겠습니까?", preferredStyle: .alert)
        
        
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "불참", style: .default) { action -> Void in
            //Do some other stuff
            
            self.mileAttendInsert(rownum: sender.tag, attendflag: "N")
            
        }
        actionSheetController.addAction(nextAction)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "취소", style: .default) { action -> Void in
            //Do some stuff
        }
        
        actionSheetController.addAction(cancelAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
        
    }
    
    func viewChange()
    {
        NSLog("체인지")
        self.navigationController?.pushViewController(MileStoneDetailViewController(), animated: false)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func createView(){
        
         self.main_title_label.text = "MileStoneList"
 
 
    }
    private let rangeOfPosts : UInt = 10
    let ref = FIRDatabase.database().reference()
    /*
    func loadTable()
    {
        let userID = FIRAuth.auth()?.currentUser?.uid
        ref.queryLimited(toFirst: rangeOfPosts * 1 ).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value

          //  let username = snapshot.value!["username"] as? AnyObject
          let value = snapshot.value as? NSDictionary
            
          let username = value?["hong"] as? String ?? ""
          
           NSLog("[%@]", username )
            
            
          //let user = User.init(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
 
        
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.main_title_label.text = "MileStone List"
        
        let  mile_data = MileObject.init()
        
        print(mile_data.userName!)
        
        miles = [Mile]()
        
        //loadTable()
        //tableView.reloadData()
        
       // loadOfPosts(1)
        
        DispatchQueue.main.async{
            self.loadTable()
            
        }
        self.tableView.reloadData()
    }
    
    func mileAttendInsert(rownum: Int, attendflag: String)
    {
        let someMileAttnendData = MILEATTEND()
        
        
        /*
         var mileKey        : String?       //Board uique Key
         var userID        : String?       //Author Id(userId)
         var userName      : String?       //Author Name
         var profileImgUrl   : String?       //Author Profile Url by string
         var profileImg      : UIImage?      //Author Profile Image
         var mileTitle        : String?       //Board Body Text
         var bodyText        : String?       //Board Body Text
         var editTime        : String?       //Board Edited Time yyyy/MM/dd hh:mm
         */
        
        someMileAttnendData.userID = miles[rownum].userID
        someMileAttnendData.userName = miles[rownum].username
        someMileAttnendData.mileTitle = miles[rownum].mileTitle
       // someMileAttnendData.editTime = miles[rownum].editTime
        
        
        //someMileAttnendData.attendFlag = attendflag
        var attendFlag : Bool
        if(attendflag == "Y")
        {
            attendFlag = true
        }
        else{
            attendFlag = false
        }
        
        
        //    NSLog("[%s]", someMileCreateData.mileTitle)
        //     NSLog("[%@]", someMileCreateData.editTime)
        //     NSLog("[%@]", someMileCreateData.bodyText)
        
        //print(someMileAttnendData.mileTitle!)
        //ref.child("milelist").queryOrdered(byChild: "mileTitle").queryEqual(toValue: mile_detail_title)
        //ref.child("milelist").queryOrdered(byChild: "mileTitle").queryEqual(toValue: miles[rownum].mileTitle )
        
        /*
        var uuid : String?
        
        let ref = FIRDatabase.database().reference()
        
        let milett = miles[rownum].mileTitle
        print("miletitle")
        print(milett)
        
        ref.child("milelist").queryOrdered(byChild: "mileTitle").queryEqual(toValue: milett).observe(.childAdded, with: {[weak self] snapshot in
           
            // mileat.userID = ref.child("mileattend").setValue(<#T##value: Any?##Any?#>, forKey: "userID")
            //    mileat.userID = ref.child("mileattend").value(forKey: "userID") as! String?
            let snapshotValue = snapshot.value as! NSDictionary
            let uid  = snapshotValue["uid"] as? String ?? ""
         
            uuid = uid
            print(uid)
            NSLog("uid")

            }
        )
        
        //print(mileattends)
        //print(query)
    

        
            print(uuid)
*/
        let ref = FIRDatabase.database().reference()
        
        let uid = FIRAuth.auth()?.currentUser?.uid
        
       // var userId : String
        
       
      
/*
        
        ref.child("milelist").child(miles[rownum].uid).runTransactionBlock({ (currentData: FIRMutableData) -> FIRTransactionResult in
            if var post = currentData.value as? [String : AnyObject], let uid = FIRAuth.auth()?.currentUser?.uid {
                var mileats : String
                 mileats = post["mileAttend"] as?  String??; ""
                var mileCount = post["mileCount"] as? Int ?? 0
                
                if(attendFlag == true) {  // 버튼 참석
                
                
                    
                    if let _ = mileats[uid] {
                        // Unstar the post and remove self from stars
                        mileCount -= 0
                       // mileats.removeValue(forKey: uid)
                   //     mileats[uid] = true
                  //      mileats[user] = user.userName
              
                    } else {
                        // Star the post and add self to stars
                        mileCount += 1
                        //mileats[uid] = true
                       
                    }
                    post["mileCount"] = mileCount as AnyObject?
                    post["mileAttend"] = mileats as AnyObject?
                    self.userinfo_ins(milelist_uid: self.miles[rownum].uid)
                }
                else {
                    if let _ = mileats[uid] {
                        // Unstar the post and remove self from stars
                        mileCount -= 1
                        //mileats.removeValue(forKey: uid)
                       // mileats[uid] = false
                    } else {
                        // Star the post and add self to stars
                        mileCount += 0
                      //  mileats[uid] = false
                    }
                    post["mileCount"] = mileCount as AnyObject?
                    post["mileAttend"] = mileats as AnyObject?
                     self.userinfo_ins(milelist_uid:  self.miles[rownum].uid)
                
                }
                
                
                
                // Set value and report transaction success
                currentData.value = post
                
                return FIRTransactionResult.success(withValue: currentData)
            }
            return FIRTransactionResult.success(withValue: currentData)
        })
        { (error, committed, snapshot) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        /*
        //let key = ref.child("mileattend").childByAutoId().key
        let mileattend = [
           // "uid": key ,
            "userId": someMileAttnendData.userID! ,
            "userName": someMileAttnendData.userName!,
            "mileTitle": someMileAttnendData.mileTitle!,
            "mileAttend": [someMileAttnendData.userID!:attendFlag ]
        ] as [String : Any]
            //"attendFlag": someMileAttnendData.attendFlag!]
        let mileUpdates = ["/milelist/\(someMileAttnendData.mileTitle!)": mileattend]
        //   "/milelist/\(someMileCreateData.id)/\(key)/": milelist]
        ref.updateChildValues(mileUpdates)
        
        
        */
 */
        if(attendFlag == true)
        {
            self.userinfo_ins(milelist_uid:  self.miles[rownum].uid, attendFlag:  1)
        }
        else
        {
            self.userinfo_ins(milelist_uid:  self.miles[rownum].uid, attendFlag: 0)
        }
        
    }

    func userinfo_ins(milelist_uid: String,  attendFlag: Int) {
        
        
        
          let uid = FIRAuth.auth()?.currentUser?.uid
         var ref = FIRDatabase.database().reference()
        ref.child("users").child(uid!).observe(.value, with: {[weak self] snapshot in
            
            print("user value")
            print(snapshot.value)
            
            let snapshotValue = snapshot.value as! NSDictionary
            self?.user.userEmail  = snapshotValue["email"] as? String ?? ""
            self?.user.userName  = snapshotValue["username"] as? String ?? ""
            
            
            print("user value3333")
            print(self?.user.userEmail)
            print(self?.user.userName)
        })
        
        ref = FIRDatabase.database().reference()
      
        // let user_id = FIRAuth.auth()?.currentUser?.value(forKey: "username")
        print(uid)
        print("print user uid!!!")
        
        var key : String
        
        key   = uid!
       
        let mileuser = [
         
            "username": user.userName,
            "userEmail": user.userEmail,
            "attendFlag": attendFlag ]as [String : Any]
        let mileUpdates = ["/milelist/\(milelist_uid)/mileAttend/\(key)": mileuser]
        //   "/milelist/\(someMileCreateData.id)/\(key)/": milelist]
        ref.updateChildValues(mileUpdates)
        print("print user update!!!")

        
    }
    
    
    func loadTable()
    {
        
        
      //  let  milelist = MileObject.init()
        var tempList : Array<Any>! = nil
    
        
        /*
        let ref = FIRDatabase.database().reference()
        _=ref.child("milelist").observe(.value, with: {snapshot in
            print(snapshot.value)
         })
        */
    
         
         let ref = FIRDatabase.database().reference()
        
        //let ref = FIRDatabase.database()
        
        ref.child("milelist").runTransactionBlock({ (currentData: FIRMutableData) -> FIRTransactionResult in
            if var post = currentData.value as? [String : AnyObject], let uid = FIRAuth.auth()?.currentUser?.uid {
                var mileats : Dictionary<String, Bool>
                mileats = post["mileattend"] as? [String : Bool] ?? [:]
                var mileCount = post["mileCount"] as? Int ?? 0
               
                
               print(post)
               print(uid)
               print(mileats)
               print(mileCount)
                
                
                // Set value and report transaction success
                currentData.value = post
                
                return FIRTransactionResult.success(withValue: currentData)
            }
            return FIRTransactionResult.success(withValue: currentData)
        })
        { (error, committed, snapshot) in
            if let error = error {
                print(error.localizedDescription)
            }
        }

        

        
        /*
          let query = ref.child("milelist")
            query.observeSingleEvent(of: .value, with: {[weak self] snapshot in
            //    guard let wself = self else {return}
                print(snapshot.value)
                for childSnapshot in snapshot.children {
                    if let childSnapshot = childSnapshot as? FIRDataSnapshot {
                        let mile = Mile(snapshot: childSnapshot)
                        self?.miles.append(mile)
                    }
                }

                DispatchQueue.main.async{
                    self?.tableView.reloadData()
                }
            })
        */
        
    
        
        
        _=ref.child("milelist").observe(.childAdded, with: {[weak self] snapshot in
            //    guard let wself = self else {return}
            print(snapshot.value)
            let mile = Mile(snapshot: snapshot)
            /*
            if let insertindex=self?.miles.endIndex {
                self?.tableView.beginUpdates()
                self?.miles[insertindex]=mile
                self?.tableView.insertRows(at: [IndexPath(row:insertindex, section: 0)], with:.left )            }
            */
           // self?.tableView.beginUpdates()
            self?.miles.append(mile)
            
            DispatchQueue.main.async{
               // self?.tableView.endUpdates()
                self?.tableView.reloadData()
            }
        })
        
        
         _=ref.child("milelist").observe(.childRemoved, with: {[weak self] snapshot in
         //    guard let wself = self else {return}
         print(snapshot.value)
         let mile = Mile(snapshot: snapshot)
         if let removetindex=self?.miles.index(of: mile){
         self?.tableView.beginUpdates()
         self?.miles.remove(at:removetindex)
         self?.tableView.deleteRows(at: [IndexPath(row:removetindex, section: 0)], with:.left )            }
         
         DispatchQueue.main.async{
         self?.tableView.endUpdates()
         }
            
         })
         
        
        
        
    }

}
