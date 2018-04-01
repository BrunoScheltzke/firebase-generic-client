# firebase-generic-api-client

An app to control your pets

This project demonstrates how to use metaprogramming and swift generics to create a client-side iOS app avoiding all the boilerplate of a usual client-side aplication.

Make sure you have the following in your pod file
```
target 'Your_Project_Name' do
  use_frameworks!
# Pods for Your_Project_Name
    pod 'Sourcery'
    pod 'Firebase/Database'
end
```

You will need to setup Firebase. Go to the firebase website and get your plist file as well as the dashboard setup. Very easy and quick. After that, download the plist file and attach it to the project. If you need help, check out their tutorial https://firebase.google.com/docs/ios/setup?authuser=0.
