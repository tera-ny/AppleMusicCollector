//
//  ViewController.swift
//  AppleMusicCollector
//
//  Created by iniad on 2019/10/27.
//  Copyright © 2019 g4zeru. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationFetcher.shared.currentLocation
            .subscribe(onNext: { location in
                print(location)
            })
            .disposed(by: disposeBag)
        LocationFetcher.shared.startRequest()
    }
}

