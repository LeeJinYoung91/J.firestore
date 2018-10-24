//
//  ViewController.swift
//  J.Firestore
//
//  Created by JinYoung Lee on 24/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addFirebaseDefaultData()
        getFirebaseChildRef()
    }

    private func getFirebaseChildRef() {
        let firebaseDatabase = Firestore.firestore()
        firebaseDatabase.collection("people").whereField("onoff", isEqualTo: true).whereField("age", isEqualTo: 28).addSnapshotListener { (snapShot, error) in
            if let documents = snapShot?.documents {
                for doc in documents {
                    let data = doc.data()
                    print(data)
                }
            }
        }
        
    }
    
    
    private func addFirebaseDefaultData() {
        let firebaseDatabase = Firestore.firestore().collection("people")
        
        firebaseDatabase.document("lee") .setData([
            "name" : "JinYoung",
            "age" : 28,
            "onoff" : true
            ])
        firebaseDatabase.document("kim") .setData([
            "name" : "YoungHoon",
            "age" : 28,
            "onoff" : true
            ])
        firebaseDatabase.document("jung") .setData([
            "name" : "SuHong",
            "age" : 24,
            "onoff" : true
            ])
        firebaseDatabase.document("nam") .setData([
            "name" : "DooHyun",
            "age" : 29,
            "onoff" : true
            ])
    }
    

}

