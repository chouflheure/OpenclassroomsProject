//
//  ViewController.swift
//  P4_01_Xcode
//
//  Created by charles Calvignac on 21/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vueCarreGauche: UIView!
    @IBOutlet weak var swipe: UILabel!
    @IBOutlet weak var Instagrid: UILabel!
    
    @IBAction func BoutonAjoutDePhoto() {
        
        /* for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)") }
        */

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontPolice()
    }
    
    private func fontPolice(){
        
        //let ThirstySoftW01 = UIFont(name: "ThirstySoftW01-Regular", size: UIFont.labelFontSize)
        let delm = UIFont(name: "Delm-Regular", size: UIFont.labelFontSize)
        //Instagrid.font = UIFontMetrics.default.scaledFont(for: ThirstySoftW01!)
        Instagrid.font = UIFont(name: "ThirstySoftW01-Regular", size: 30)
        swipe.font = UIFontMetrics.default.scaledFont(for: delm!)
        swipe.adjustsFontForContentSizeCategory = true
    }
    
    
    
}

