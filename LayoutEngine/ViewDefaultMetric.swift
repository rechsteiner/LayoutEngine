import UIKit

struct ViewDefaultMetric: ViewMetric {

  let insets: UIEdgeInsets
  let direction: ViewDirection
  let hidden: Bool

  init(insets: UIEdgeInsets = UIEdgeInsets(), direction: ViewDirection = .Left, hidden: Bool = false) {
    self.insets = insets
    self.direction = direction
    self.hidden = hidden
  }
  
}
