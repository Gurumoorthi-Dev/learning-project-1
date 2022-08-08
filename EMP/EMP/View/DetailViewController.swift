//
//  DetailViewController.swift
//  EMP
//
//  Created by gurumoorthi on 08/08/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailText: UILabel!
    
    var employeeViewModel : EmployeeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.downloaded(from: employeeViewModel!.profileImage)
        detailText.text = "Name: \(employeeViewModel?.name ?? "-") \n User Name: \(employeeViewModel?.username ?? "-") \n Email: \(employeeViewModel?.email ?? "-") \n Address: \(employeeViewModel!.street), \(employeeViewModel!.city), \(employeeViewModel!.suite), \(employeeViewModel!.zipcode) \n Phone: \(employeeViewModel?.phone ?? "-") \n Website: \(employeeViewModel?.website ?? "-") \n Company Details: \(employeeViewModel!.companyName) - \(employeeViewModel!.bs), \(employeeViewModel!.catchPhrase)"
        // Do any additional setup after loading the view.
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
