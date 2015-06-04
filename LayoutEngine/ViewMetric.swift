import UIKit

protocol ViewMetric {
  var insets: UIEdgeInsets { get }
  var direction: ViewDirection { get }
  var hidden: Bool { get }
}
