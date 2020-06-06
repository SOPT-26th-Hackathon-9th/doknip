//
//  ActorCollectionViewCell.swift
//  SOPT_26th_Hackathon_9th
//
//  Created by 김태훈 on 2020/06/07.
//  Copyright © 2020 노한솔. All rights reserved.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {
    static var identifier="actorCell"
    @IBOutlet weak var actorImg: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorRoll: UILabel!
    
}
