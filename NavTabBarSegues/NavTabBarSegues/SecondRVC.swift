//
//  SecondRVC.swift
//  NavTabBarSegues
//
//  Created by user on 16.10.2022.
//

import UIKit

class SecondRVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        printLog()
    }
    
    @IBAction func goToHome(_ sender: Any) {
        self.performSegue(withIdentifier: "goHomeR", sender: self)
        printLog()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printLog()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        printLog()
    }
    
    override func viewWillLayoutSubviews() {
        printLog()
    }
    
    override func viewDidLayoutSubviews() {
        printLog()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printLog()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        printLog()
    }

    deinit {
        printLog()
    }
}
