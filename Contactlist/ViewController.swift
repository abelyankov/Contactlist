//
//  ViewController.swift
//  Contactlist
//
//  Created by Arthur Belyankov on 15.06.2018.
//  Copyright © 2018 Arthur Belyankov. All rights reserved.
//

import UIKit
import SnapKit
import Contacts

class ViewController: UIViewController {
    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    var TableView : UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .red
        tableview.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.scrollsToTop = true
//        tableview.separatorColor = .white
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        View_1()
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("Authorization Successfull")
            }
        }
        
        fetchContacts()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func View_1(){
        view.addSubview(TableView)
        TableView.delegate = self
        TableView.dataSource = self
        
        TableView.snp.makeConstraints{(make) in
            make.top.equalTo(10)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }

    
    func fetchContacts() {
        
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
            let First_Name = contact.givenName
            let Last_Name = contact.familyName
            let Phone_Number = contact.phoneNumbers.first?.value.stringValue
            
            
            let contactToAppend = ContactStruct(First_Name: First_Name, Last_Name: Last_Name, Phone_number: Phone_Number!)
            
            self.contacts.append(contactToAppend)
        }
        TableView.reloadData()
    }

}

//MARK: TableViewDataSource & Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.backgroundColor = .blue
        let contactToDisplay = contacts[indexPath.row]
        cell.First_Name.text = contactToDisplay.First_Name + " " + contactToDisplay.Last_Name
        cell.Phone_Number.text = contactToDisplay.Phone_number
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
