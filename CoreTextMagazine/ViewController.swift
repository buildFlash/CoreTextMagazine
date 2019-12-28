//
//  ViewController.swift
//  CoreTextMagazine
//
//  Created by Aryan Sharma on 27/12/19.
//  Copyright © 2019 Aryan Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let file = Bundle.main.path(forResource: "zombies", ofType: "txt") else { return }
        
        do {
            let text = try String(contentsOfFile: file, encoding: .utf8)
            let parser = MarkupParser()
            parser.parseMarkup(text)
            (view as? CTView)?.buildFrames(withAttrString: parser.attrString, andImages: parser.images)
        } catch _ {
        }
        

    }


}

