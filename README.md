## MKMapView Legal Notice and Compass Placement

This sample project shows how to (re)position the ‘Legal’ link and the compass in a MKMapView map.

### The Problem ###

With iOS 7 Apple introduced translucent navigation bars and translucent toolbars. Because the bars are translucent the view underneath needs to be sized so that the bars are ‘on top of’ the view. The map in Apple’s Maps app for example, is full screen while the bars are drawn on top of it. When the underlying view is a `MKMapView` instance this means that the compass (top right) may end up under the navigation bar. If the app also has a bottom toolbar then the legal notice, which appears in the bottom left corner, is covered by the toolbar.

A solution is to make the map view smaller, so that it is not covered by the bars. There are folks that color the bars off-while so they look like a translucent bars while they are actually not. That is obviously poor craftsmanship. Just not making the bars opaque is also not ideal: Apple’s [iOS Human Interface Guidelines](https://itunes.apple.com/us/book/ios-human-interface-guidelines/id877942287?mt=11) state that navigation bars and toolbars (and tab bars) should be translucent. Apple’s [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) state that developers are bound by the Human Interface Guidelines.

So how do we move that legal notice and the compass?

### The Solution ###

When you show a map using a standard `UINavigationController` instance, with or without a toolbar controlled by the `UINavigationController` instance, the legal notice and the compass are repositioned automatically. In that case you don’t have to do anything. The demo app shows you this scenario.

The demo app also shows you how to move the the legal notice and the compass ‘manually’. This is done by leveraging the view controller’s layout guides: `topLayoutGuide` and `bottomLayoutGuide`. The documentation may seem a little cryptic but what it comes down to is that `topLayoutGuide` somehow provides a value with the height of the navigation bar and `bottomLayoutGuide` provides the height of the toolbar. This is what `MKMapView` instance uses to position the  the legal link and the compass. Internally `MKMapView` uses auto layout constraints to position the legal link and the compass using the top layout guide and the bottom layout guide.

The view controller needs to provide custom objects for `topLayoutGuide` and `bottomLayoutGuide`:

    override var bottomLayoutGuide: UILayoutSupport {
        return LayoutGuide(length: 44.0)
    }

    override var topLayoutGuide: UILayoutSupport {
        return LayoutGuide(length: 64.0)
    }

The objects returned can be any objects as long as they conform to the `UILayoutSupport` protocol. In iOS 8 that just meant having a property named `length` which specifies, in this case, the height of the bar. In iOS 9 and up three other properties need to be implemented.

### Run the code ###

The code serves as an example, it runs with Xcode 7.3. Just get the project and run it.
