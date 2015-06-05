import UIKit

public struct ViewDefaultMetric: ViewMetric {

  public let insets: UIEdgeInsets
  public let direction: ViewDirection
  public let hidden: Bool

  public init(insets: UIEdgeInsets = UIEdgeInsets(), direction: ViewDirection = .Left, hidden: Bool = false) {
    self.insets = insets
    self.direction = direction
    self.hidden = hidden
  }
  
}
