//
//  TableViewCell.swift
//  Contactlist
//
//  Created by Arthur Belyankov on 15.06.2018.
//  Copyright © 2018 Arthur Belyankov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell{
    
    var First_Name: UILabel = {
        let label1 = UILabel()
        label1.textColor = .black
        label1.font = UIFont(name: "Helvetica", size: 19)
        return label1
    }()
    
    var Phone_Number: UILabel = {
        let label1 = UILabel()
        label1.textColor = UIColor.init(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        label1.font = UIFont.init(name: "Helvetica", size: 16)
        return label1
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        Lable()
    }
    
    func Lable() {
        self.addSubview(First_Name)
        First_Name.snp.makeConstraints{(make) in
            make.top.equalTo(0)
            make.height.equalTo(20)
            make.left.equalTo(10)
        }
        
        self.addSubview(Phone_Number)
        Phone_Number.snp.makeConstraints{(make) in
            make.top.equalTo(First_Name.snp.bottom)
            make.left.equalTo(First_Name)
            make.height.equalTo(20)
        }
    }
    
}
