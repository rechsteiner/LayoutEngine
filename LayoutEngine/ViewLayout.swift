import UIKit

public struct ViewLayout {

  let view: UIView?
  let size: (CGSize) -> CGSize
  var metric: ViewMetric

  var direction: ViewDirection {
    return self.metric.direction
  }

  var insets: UIEdgeInsets {
    return self.metric.insets
  }

  public init(view: UIView, metric: ViewMetric = ViewDefaultMetric()) {
    self.metric = metric
    self.view = view
    self.size = { (_) in
      return view.bounds.size
    }
  }

  public init(view: UIView?, size: (CGSize) -> CGSize, metric: ViewMetric = ViewDefaultMetric()) {

    self.view = view
    self.size = size
    self.metric = metric
  }

  public init(view: UIView?, size: CGSize, metric: ViewMetric = ViewDefaultMetric()) {
    self.view = view
    self.metric = metric
    self.size = { (_) in
      return size
    }
  }
  
}
