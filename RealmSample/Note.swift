//
//  Note.swift
//  RealmSample
//
//  Created by shinobu okano on 2015/08/09.
//  Copyright (c) 2015年 shinobu okano. All rights reserved.
//

import RealmSwift

class Note: Object {
    dynamic var id = 0
    dynamic var text = ""
    
    override static func primaryKey() -> String {
        return "id"
    }
}