//
//  HapticManager.swift
//  Twaddle
//
//  Created by Maraj Hossain on 19/3/24.
//

import Foundation
import UIKit

private final class HapticManager {
    static let shared = HapticManager()

    private let feedback = UINotificationFeedbackGenerator()

    private init() {}

    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
    HapticManager.shared.trigger(notification)
}
