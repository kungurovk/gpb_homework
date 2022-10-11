//
//  ViewController.swift
//  AppAnatomy
//
//  Created by user on 10.10.2022.
//

import UIKit

let SECONDS_IN_MINUTE: UInt = 60

class ViewController: UIViewController {
    private var timer: Timer = Timer()
    private var seconds: UInt = 0

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopButton.isEnabled = false
    }
    
    func startTimer() {
        if !startButton.isEnabled {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeout), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    func stopTimer() {
        timer.invalidate()
    }

    private func reverseButtonsState() {
        startButton.isEnabled = !startButton.isEnabled
        stopButton.isEnabled = !startButton.isEnabled
    }
    
    @IBAction private func onStarted() {
        reverseButtonsState()
        startTimer()
    }
    
    @IBAction private func onStopped() {
        reverseButtonsState()
        stopTimer()
    }
    
    @objc private func timeout() {
        seconds += 1
        timeLabel.text = formatSecondsToString(from: seconds)
    }
    
    private func formatSecondsToString(from allSeconds: UInt) -> String {
        let minutes = (allSeconds / SECONDS_IN_MINUTE)
        let seconds = allSeconds > (SECONDS_IN_MINUTE - 1) ? allSeconds  - (minutes * SECONDS_IN_MINUTE) : allSeconds
        print(String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds))
        return String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
}
