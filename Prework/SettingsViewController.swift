//
//  SettingsViewController.swift
//  Prework
//
//  Created by Yifei on 7/16/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    @IBOutlet weak var isDarkMode: UISwitch!
//    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let isDark = UserDefault.getIsDark()
        isDarkMode.isOn = isDark
        if isDark {
            overrideUserInterfaceStyle = .dark
        }
        else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func changeDarkMode(_ sender: Any) {
        if isDarkMode.isOn {
            UserDefault.setIsDark(isDark: true)
            overrideUserInterfaceStyle = .dark
        }
        else {
            UserDefault.setIsDark(isDark: false)
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func tip1Change(_ sender: Any) {
        var tipPcts = UserDefault.getTipPcts()
        let NewValue = tip1Field.text!.isEmpty ? "0" : tip1Field.text!
        let Pct = Double(Int(NewValue)!) / 100
        tipPcts[0] = Pct
        UserDefault.setTipPtcs(options: tipPcts)
    }
    @IBAction func tip2Change(_ sender: Any) {
        var tipPcts = UserDefault.getTipPcts()
        let NewValue = tip2Field.text!.isEmpty ? "0" : tip2Field.text!
        let Pct = Double(Int(NewValue)!) / 100
        tipPcts[1] = Pct
        UserDefault.setTipPtcs(options: tipPcts)
    }
    @IBAction func tip3Change(_ sender: Any) {
        var tipPcts = UserDefault.getTipPcts()
        let NewValue = tip3Field.text!.isEmpty ? "0" : tip3Field.text!
        let Pct = Double(Int(NewValue)!) / 100
        tipPcts[2] = Pct
        UserDefault.setTipPtcs(options: tipPcts)
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
