//: ## Configuration operators

//: Here we define a *configuration operator*.
//: I use `∙ BULLET OPERATOR` (Unicode: `U+2219`) as a symbol.
infix operator +=+ {}

infix operator ∙ {}

func ∙<T>(object: T, @noescape configurator: (inout T) -> ()) -> T {
    var copy = object
    configurator(&copy)
    return copy
}

func +=+<T>(object: T, @noescape configurator: (inout T) -> ()) -> T {
    return object ∙ configurator
}

//: This operator can be applied to newly initialized instances.

import UIKit

let label = UILabel() ∙ {
    $0.text = "dskfjh"
    $0.textColor = UIColor.redColor()
}

//: But it can be applied to immutable objects as well.
let point = CGPoint() ∙ {
    $0.x = 10
    $0.y = 20
}

//: And the best use case is applying configuration when passing an object from another function.
//: Inside the closure we have access to instance names thanks to Swift magic.

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(tableView         : UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func objectAtIndex(index:Int) -> Int {
        return index
    }
    
    func defaultColor() -> UIColor {
        return UIColor.yellowColor()
    }
    
    func tableView(tableView           : UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {

        return tableView.dequeueReusableCellWithIdentifier("cell")! ∙ {
            $0.textLabel?.text = objectAtIndex(indexPath.row).description
            $0.backgroundColor = defaultColor()
        }
    }
}

