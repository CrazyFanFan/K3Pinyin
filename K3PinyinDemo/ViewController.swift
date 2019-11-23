//
//  ViewController.swift
//  K3PinyinDemo
//
//  Created by Crazy凡 on 2019/1/11.
//  Copyright © 2019 Crazy凡. All rights reserved.
//

import UIKit
import K3Pinyin

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = UIColor.white

        let china = "中国"
        print("“\(china)”的拼音是：\(china.k3.pinyin)")
        print("“\(china)“没有音的标拼音是：\(china.k3.pinyin([.stripCombiningMarks]))")
    }
}
