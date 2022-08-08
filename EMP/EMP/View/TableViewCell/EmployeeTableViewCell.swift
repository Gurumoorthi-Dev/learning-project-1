//
//  EmployeeTableViewCell.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var companyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with model:EmployeeViewModel) {
        print("Name = \(model.name) Company = \(model.companyName)")
        employeeImage.downloaded(from: model.profileImage)
        name.text = model.name
        companyName.text = model.companyName
    }
    
    override func prepareForReuse() {
        employeeImage.image = nil
        name.text = ""
        companyName.text = ""
    }

}
