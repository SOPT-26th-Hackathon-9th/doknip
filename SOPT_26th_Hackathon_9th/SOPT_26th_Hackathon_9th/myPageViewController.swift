//
//  myPageViewController.swift
//  SOPT_26th_Hackathon_9th
//
//  Created by 송지훈 on 2020/06/07.
//  Copyright © 2020 노한솔. All rights reserved.
//

import UIKit

class myPageViewController: UIViewController {

    @IBOutlet weak var backbutton: UIButton!
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
    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
