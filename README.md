# Chargtions
This sample project makes use of MVVM-R to show the usage of openchargemap api to display charging points for vehicles on a map.

It currently uses hardcoded lat-long to fetch the charging points for a given radius of 5KM.

In order to run the project and see the pins on the map. Create an api key from https://openchargemap.org/. Clone the project and open `Request.swift` and update 
```
  var apiKey: [String: String] {
    ["key" : "you-api-key-here"]
  }
```
