//
//  AddPartyViewController.swift
//  partyApp
//
//  Created by Yi on 16/12/3.
//  Copyright © 2016年 Yi. All rights reserved.
//

import UIKit

class AddPartyViewController: UIViewController, UITextFieldDelegate ,UINavigationControllerDelegate{

    //let persis = Persistence()
    var party: Party?
    
    @IBOutlet weak var datePick: UIDatePicker!    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameText.delegate = self
        addressText.delegate = self
        checkValidInput()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidInput()
        navigationItem.title = textField.text
    }
    
    func checkValidInput(){
        let inputName = nameText.text ?? ""
        let inputAdd = addressText.text ?? ""
        saveBarButton.isEnabled = !(inputName.isEmpty || inputAdd.isEmpty)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true,completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveBarButton == (sender as? UIBarButtonItem) {
            let name = nameText.text!
            let add = addressText.text!
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            let info = name + "-" + dateFormatter.string(from:datePick.date)
            party = Party(info:info,address:add)
        }
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
