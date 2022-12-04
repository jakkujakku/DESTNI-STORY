//
//  ViewController.swift
//  DESTINI STORY
//
//  Created by (^ㅗ^)7 iMac on 2022/12/04.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
    
        storyBrain.nextStory(sender.currentTitle!)
        
        playSound(soundName: "CorrectRing")
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    @objc func updateUI() {
        storyLabel.text = storyBrain.getStoryText()
        choice1Button.setTitle(storyBrain.getChoice1Title(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2Title(), for: .normal)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

