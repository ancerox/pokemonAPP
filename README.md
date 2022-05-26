# pokemon_app

This app is made to help you survive any Matrix situation, it just has the following screens ->

- Splash (Tells you about the app)![Simulator Screen Shot - iPhone 12 Pro Max - 2022-05-26 at 13 09 46](https://user-images.githubusercontent.com/58252544/170539448-4f495427-1a64-47d5-b720-eaea56976712.png)

- HomePage![Simulator Screen Shot - iPhone 12 Pro Max - 2022-05-26 at 13 09 27](https://user-images.githubusercontent.com/58252544/170539430-fdec4b0b-dbe1-4413-84f3-8f150777c5d9.png)

- Pokemon![Simulator Screen Shot - iPhone 12 Pro Max - 2022-05-26 at 13 09 19](https://user-images.githubusercontent.com/58252544/170539383-529eaa91-5e5b-416a-a993-102e144000d4.png)


To use this app just clone this repo, and if you want just to copy something, makesure you are using Flutter 2.16.2.

#Packages required ->

- flutter_svg: ^1.0.3
- get_it: ^7.2.0
- provider: ^6.0.3
- dartz: ^0.10.1
- dio: ^4.0.6
- equatable: ^2.0.3

## To run the project 

###### run this  in therminal
```

git clone git@github.com:ancerox/pokemonAPP.git

// And then

flutter run

```

## About the architecture used

Although this is a small app is using a clean architecture because if we ever want to make it bigger it will be a lot easier because the separations of concerns and of course for testing too. It is using the respository pattern in order of us to chose with data source we want.

In the injection file are all the dependencies required for the app, i am using this because that enables me to replace dependencies without changing the class that uses them, and all of this is made by a service locator wich in this case is get_it.

The domain class is just to set in a clean way the use cases that the app must implement(which in this case is only one).

I am using "provider" because it's simplicity but Bloc would fit great as well.

###### Why i'm using differents models for the same object?

it just to help with the sepation of layers, so they don't depende on the other, if we ever switch from JSON to XML it won't affect nothing.





