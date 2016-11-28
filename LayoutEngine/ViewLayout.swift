import UIKit

public typealias SetHidden = (Bool, UIView) -> Void

func DefaultSetHidden(_ hidden: Bool, view: UIView) {
  view.isHidden = hidden
}

public struct ViewLayout {

  let view: UIView?
  let size: (CGFloat) -> CGSize
  let setHidden: SetHidden
  var metric: ViewMetric

  var direction: ViewDirection {
    return self.metric.direction
  }

  var insets: UIEdgeInsets {
    return self.metric.insets
  }

  public init(view: UIView, metric: ViewMetric = ViewDefaultMetric(), setHidden: @escaping SetHidden = DefaultSetHidden) {
    self.metric = metric
    self.view = view
    self.setHidden = setHidden
    self.size = { (_) in
      return view.bounds.size
    }
  }

  public init(view: UIView?, size: @escaping (CGFloat) -> CGSize, metric: ViewMetric = ViewDefaultMetric(), setHidden: @escaping SetHidden = DefaultSetHidden) {
    self.view = view
    self.size = size
    self.metric = metric
    self.setHidden = setHidden
  }

  public init(view: UIView?, size: CGSize, metric: ViewMetric = ViewDefaultMetric(), setHidden: @escaping SetHidden = DefaultSetHidden) {
    self.view = view
    self.metric = metric
    self.setHidden = setHidden
    self.size = { (_) in
      return size
    }
  }



}
