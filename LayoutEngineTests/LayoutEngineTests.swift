import UIKit
import Nimble
import Quick
import LayoutEngine

class LayoutEngineTests: QuickSpec {

  override func spec() {

    describe("LayoutEngine") {

      describe("stacking views") {

        var firstView: UIView!
        var secondView: UIView!
        var thirdView: UIView!

        beforeEach {
          firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
          secondView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
          thirdView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        }

        it("stack views on top of each-other") {
          let firstLayout = ViewLayout(view: firstView)
          let secondLayout = ViewLayout(view: secondView)
          let thirdLayout = ViewLayout(view: thirdView)
          let height = LayoutEngine.stackViews([firstLayout, secondLayout, thirdLayout], width: 320)
          expect(firstView.frame.origin.y).to(equal(0))
          expect(secondView.frame.origin.y).to(equal(10))
          expect(thirdView.frame.origin.y).to(equal(30))
          expect(height).to(equal(60))
        }

        it("float views to the left") {
          let firstMetric = ViewDefaultMetric(direction: .Left)
          let firstLayout = ViewLayout(view: firstView, metric: firstMetric)
          LayoutEngine.stackViews([firstLayout], width: 320)
          expect(firstView.frame.origin.x).to(equal(0))
        }

        it("float views to the right") {
          let firstMetric = ViewDefaultMetric(direction: .Right)
          let firstLayout = ViewLayout(view: firstView, metric: firstMetric)
          LayoutEngine.stackViews([firstLayout], width: 320)
          expect(firstView.frame.origin.x).to(equal(220))
        }

        it("adds global insets to views") {
          let firstLayout = ViewLayout(view: firstView)
          let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
          let height = LayoutEngine.stackViews([firstLayout],
            metric: ViewDefaultMetric(insets: insets),
            width: 320
          )
          expect(firstView.frame.origin.x).to(equal(50))
          expect(firstView.frame.origin.y).to(equal(50))
          expect(height).to(equal(110))
        }

        it("adds insets to views") {
          let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
          let firstMetric = ViewDefaultMetric(insets: insets)
          let firstLayout = ViewLayout(view: firstView, metric: firstMetric)
          let secondLayout = ViewLayout(view: secondView)
          let height = LayoutEngine.stackViews([firstLayout, secondLayout], width: 320)
          expect(firstView.frame.origin.x).to(equal(50))
          expect(firstView.frame.origin.y).to(equal(50))
          expect(secondView.frame.origin.x).to(equal(0))
          expect(secondView.frame.origin.y).to(equal(110))
          expect(height).to(equal(130))
        }

        it("accounts for hidden views") {
          let firstMetric = ViewDefaultMetric(hidden: true)
          let firstLayout = ViewLayout(view: firstView, metric: firstMetric)
          let secondLayout = ViewLayout(view: secondView)
          let height = LayoutEngine.stackViews([firstLayout, secondLayout], width: 320)
          expect(firstView.hidden).to(beTrue())
          expect(secondView.frame.origin.y).to(equal(0))
          expect(height).to(equal(20))
        }

        it("ignores insets on hidden views") {
          let firstMetric = ViewDefaultMetric(
            insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
            hidden: true)

          let firstLayout = ViewLayout(view: firstView, metric: firstMetric)
          let secondLayout = ViewLayout(view: secondView)
          let height = LayoutEngine.stackViews([firstLayout, secondLayout], width: 320)
          expect(firstView.hidden).to(beTrue())
          expect(secondView.frame.origin.y).to(equal(0))
          expect(height).to(equal(20))
        }
      }

    }

  }

}
