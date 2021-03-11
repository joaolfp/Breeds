import UIKit

extension UIView {
    
    @discardableResult
    func topAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0,
                   priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult
    func topAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0,
                   priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func topAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0,
                   priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0,
                      priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0,
                      priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0,
                      priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                       priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func leadingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                       priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func leadingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                       priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                        priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func trailingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                        priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func trailingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0,
                        priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(equalToConstant height: CGFloat,
                      priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(greaterThanOrEqualToConstant height: CGFloat,
                      priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(lessThanOrEqualToConstant height: CGFloat,
                      priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(equalTo layoutDimension: NSLayoutDimension,
                      priority: UILayoutPriority = UILayoutPriority.required,
                      multiplier: CGFloat = 1.0) -> Self {
        let constraint = heightAnchor.constraint(equalTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(lessThanOrEqualTo layoutDimension: NSLayoutDimension,
                      priority: UILayoutPriority = UILayoutPriority.required,
                      multiplier: CGFloat = 1.0) -> Self {
        let constraint = heightAnchor.constraint(lessThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(greaterThanOrEqualTo layoutDimension: NSLayoutDimension,
                      priority: UILayoutPriority = UILayoutPriority.required,
                      multiplier: CGFloat = 1.0) -> Self {
        let constraint = heightAnchor.constraint(greaterThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(equalToConstant width: CGFloat,
                     priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(greaterThanOrEqualToConstant width: CGFloat,
                     priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(lessThanOrEqualToConstant width: CGFloat,
                     priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(equalTo layoutDimension: NSLayoutDimension,
                     priority: UILayoutPriority = UILayoutPriority.required,
                     multiplier: CGFloat = 1.0) -> Self {
        let constraint = widthAnchor.constraint(equalTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(lessThanOrEqualTo layoutDimension: NSLayoutDimension,
                     priority: UILayoutPriority = UILayoutPriority.required,
                     multiplier: CGFloat = 1.0) -> Self {
        let constraint = widthAnchor.constraint(lessThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(greaterThanOrEqualTo layoutDimension: NSLayoutDimension,
                     priority: UILayoutPriority = UILayoutPriority.required,
                     multiplier: CGFloat = 1.0) -> Self {
        let constraint = widthAnchor.constraint(greaterThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func centerXAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                       constant: CGFloat = 0,
                       priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func centerYAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                       constant: CGFloat = 0,
                       priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
}
