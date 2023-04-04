//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func CKeyPressed(_ sender: UIButton) {
        playSound(soundname: sender.currentTitle!)
        sender.alpha = 0.5

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                sender.alpha = 1.0
            }
    }
    
    
    var player: AVAudioPlayer?

    func playSound(soundname: String) {
        guard let url = Bundle.main.url(forResource: soundname, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

