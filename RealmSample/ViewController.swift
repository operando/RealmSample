//
//  ViewController.swift
//  RealmSample
//
//  Created by shinobu okano on 2015/08/09.
//  Copyright (c) 2015年 shinobu okano. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func add(sender: AnyObject) {
        let realm = Realm()
        let note = Note()
        
        let lastNote = realm.objects(Note).last
        note.id = lastNote!.id + 1
        note.text = text.text
        realm.write {
            realm.add(note)
        }
    }
    
    @IBAction func deleteNote(sender: AnyObject) {
        let realm = Realm()
        
        realm.write {
            realm.deleteAll()
        }
    }
    
    @IBAction func selectAllNote(sender: AnyObject) {
        let realm = Realm()
        let notes = realm.objects(Note)
        for note in notes {
            NSLog(note.text)
        }
    }

    @IBAction func search(sender: AnyObject) {
        let realm = Realm()
        
        let notes = realm.objects(Note).filter("text = '" + text.text + "'")
        if notes.count == 0 {
            NSLog("No data.")
        } else {
            for note in notes {
                NSLog(note.text)
            }
        }
    }
}

