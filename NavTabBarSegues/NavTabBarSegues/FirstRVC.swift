//
//  FirstRVC.swift
//  NavTabBarSegues
//
//  Created by user on 20.10.2022.
//

import UIKit

class FirstRVC: UIViewController {

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

    @IBAction func unwindToFirstR(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source as? SecondRVC
        printLog()
        // Use data from the view controller which initiated the unwind segue
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
