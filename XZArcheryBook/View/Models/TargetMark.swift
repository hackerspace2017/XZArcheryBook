//
//  TargetMark.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/15/17.
//  Copyright © 2017 祥子. All rights reserved.
//

class TargetMark {
    var score: Int?
    var position: TargetMarkPosition?
    
    init(position: TargetMarkPosition) {
        self.position = position
    }
}
