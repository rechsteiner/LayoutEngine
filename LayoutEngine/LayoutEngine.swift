import UIKit

struct LayoutEngine {

  static func stackViews(views: [ViewLayout], metric: ViewMetric = ViewDefaultMetric(), width: CGFloat) -> CGFloat {

    let insets = metric.insets
    var frame = CGRect(x: 0, y: 0, width: width, height: 0)
    frame = UIEdgeInsetsInsetRect(frame, insets)
    frame.size.height = 0

    for layout in views {

      if let view = layout.view {
        view.hidden = layout.metric.hidden
      }

      if layout.metric.hidden {
        continue
      }

      frame.size = layout.size(frame.size)
      frame.origin.y += layout.insets.top

      if let view = layout.view {
        switch layout.direction {
        case .Left:
          frame.origin.x = insets.left + layout.insets.left
        case .Right:
          frame.origin.x = width - frame.width - insets.right - layout.insets.right
        }
        view.frame = frame
      }

      frame.origin.y += layout.insets.bottom
      frame.origin.y += frame.size.height
    }

    return frame.origin.y + insets.bottom

  }
  
}