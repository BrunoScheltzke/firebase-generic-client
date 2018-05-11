# firebase-generic-client

[![License](https://img.shields.io/cocoapods/l/FirebaseGenericClient.svg?style=flat)](https://cocoapods.org/pods/FirebaseGenericClient)

This project demonstrates how to use metaprogramming and swift generics to create a client-side iOS app avoiding all the boilerplate of a usual client-side aplication. It is a simple app that manages your pets with all CRUD operations.
It is just a matter of creating a type, conforming it to my FirebaseFetchable protocol, building it and start CRUDing objects.

![Alt Text](https://github.com/BrunoScheltzke/firebase-generic-client/blob/master/FirebaseGenericClientGif.gif)

## Installation

To run this example project, clone the repo, and run `pod install`

## Requirements

You will need to setup Firebase. Go to the [Firebase Website](https://console.firebase.google.com/u/0/) and get your plist file (GoogleService-Info.plist) as well as the dashboard setup. Very easy and quick. After that, download the plist file and attach it to the project. If you need help, check out their tutorial https://firebase.google.com/docs/ios/setup?authuser=0.

## Author

BrunoScheltzke, brunofonten@gmail.com

Check out the [Medium post](https://medium.com/@brunofonten/swift-generics-and-metaprogramming-for-the-easiest-to-use-client-side-app-8f5ba98771b0) on how everything works


## License

firebase-generic-api-client is available under the MIT license. See the LICENSE file for more info.
