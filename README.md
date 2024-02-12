iOS Engineer Task
=====================

Here at Plum, we work in "[squads](https://labs.spotify.com/2014/03/27/spotify-engineering-culture-part-1/)" – a more startup-appropriate name for saying small, cross-functional teams that are focused on a mission and KPIs.

The fundamental basis of any squad, is a team of kick-ass superheroes. Hence this task,
**The Superhero Squad Maker.** Your mission is to build the ultimate superhero squad using
the [Marvel API](https://developer.marvel.com) for data.

The app is simple. When opened, it shows your current squad at the top (if any) and a list of all characters from the Marvel API. Keep in mind the API does not return all characters in a single batch.

Tapping on a character shows details and gives you option to recruit to or fire from a squad.

We've included a design spec describing the user experience and interactions [here](https://www.figma.com/file/GnDHa9S9NB351kpZTvN4MK/Plum-Test-Task%3A-iOS-Engineer?node-id=1%3A10).

To use the Marvel API you need to sign up for a developer account. Once you sign up you will find your API keys in the Account section. If you don't want to sign up, you can use our keys listed below:

* Public key: `71e742407ca8b4ac76c4917a1c199a09`
* Private key: `67a407d72945a9b1ee019145174ae42a02b7117d`

We value your time, that's why provide you with UI components. Feel free to use and modify them however you see fit. 
> You're not required to use them, feel free to build it on your own if you wish to.

Deliverable
-----------

You should write your solution in Swift using UIKit or SwiftUI and deliver it as a series of commits to the repo on the main branch.

You're expected to use some sort of in-app data persistence mechanism so the squad persists between app restarts.

Make sure your code is well covered with unit tests.

Document your design choices and anything else you think we need to know in a `README.md` you can add to the code.

During the interview, you will have the opportunity to talk through your choices in the code you submit.

What we look for
----------------

In a nutshell, we are looking for a functioning app and correct, tidy, production-quality
code. Imagine that your code will be read by other developers in your team – keep them happy :-)

Take initiative if needed to cover any “black” spots on the UX flow of the test app, and be as creative as you want!

We don't want you to reinvent the wheel, so feel free to use whatever libraries you deem appropriate, but please explain your decisions in the PR.

Resources
---------

* [Plum iOS Task Design](https://www.figma.com/file/GnDHa9S9NB351kpZTvN4MK/Plum-Test-Task%3A-iOS-Engineer?node-id=1%3A10)
    * Please use a Figma account (one can be created for free) in order to inspect the designs and have access to colours, dimensions etc.
* [Marvel API Reference](https://developer.marvel.com/docs)
* [Marvel API Auth Guide](https://developer.marvel.com/documentation/authorization)

![Plum task overview](https://i.imgur.com/lDBAHuv.png)

Disclaimer
----------

We will not use any of this code for any of Plum's applications.

