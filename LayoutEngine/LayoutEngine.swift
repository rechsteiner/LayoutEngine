import UIKit

public struct LayoutEngine {

  public static func stackViews(views: [ViewLayout], metric: ViewMetric = ViewDefaultMetric(), width: CGFloat) -> CGFloat {

    let insets = metric.insets
    var frame = CGRect(x: 0, y: 0, width: width, height: 0)
    frame = UIEdgeInsetsInsetRect(frame, insets)
    frame.size.height = 0

    let insetWidth = frame.width

    for layout in views {

      if let view = layout.view {
        layout.setHidden(layout.metric.hidden, view)
      }

      frame.size = layout.size(insetWidth)
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
      if layout.metric.hidden == false {
        frame.origin.y += layout.insets.bottom
        frame.origin.y += frame.size.height
      }
    }

    return frame.origin.y + insets.bottom

  }
  
}