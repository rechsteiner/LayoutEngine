import UIKit

public struct ViewDefaultMetric: ViewMetric {

  public let insets: UIEdgeInsets
  public let direction: ViewDirection
  public let hidden: Bool

  public init(insets: UIEdgeInsets = UIEdgeInsets(), direction: ViewDirection = .left, hidden: Bool = false) {
    self.insets = insets
    self.direction = direction
    self.hidden = hidden
  }
  
}
