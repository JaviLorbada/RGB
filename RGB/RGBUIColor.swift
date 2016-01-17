import ReactiveCocoa
import Curry

public func RGBUIColor(red red: Int, green: Int, blue: Int) -> UIColor {
    return curry(createColor)(red)(green)(blue)
}

public func RACRGBUIColor(red red: Int, green: Int, blue: Int) -> SignalProducer<UIColor, NoError> {
  return SignalProducer { observer, disposable in
      observer.sendNext(createColor(red, green: green, blue: blue))
  }
}

private func createColor(red: Int, green: Int, blue: Int) -> UIColor {
    return UIColor(
        red: CGFloat(red/255),
        green: CGFloat(green/255),
        blue: CGFloat(blue/155),
        alpha: 1
    )
}