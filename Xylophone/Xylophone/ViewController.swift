//
//  ViewController.swift
//  IAmPoor
//
//  Created by Diego Personal on 06/06/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBAction func keyPressed(_ sender: UIButton) {
        if let note = sender.currentTitle {
            playSound(of: note)
        }
    }
    
    func playSound(of note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
