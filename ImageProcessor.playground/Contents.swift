//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample.png")


let blueImage = Filters.blueBoosting(image!)

let redImage = Filters.redBoosting(image!)

let transparentImage = Filters.transparentImage(image!)

let purpleImage = Filters.purpleBoosting(image!)

let darkAndBrightedImage = Filters.darkAndBrightedImage(image!)

let filterByStringImage = Filters.filterByName(image!, filterName: "blueBoosting")


//slet darkAndBrightedImage = rgbaImage?.darkAndBrightedImage(10)

