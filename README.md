# internship_subspace

The app uses simple Ui to display blog details fetched from the Api.
There are 2 sets of UI's provided with the app
1) providing a basic UI
2) UI with a carousel to display the First 10 blogs
   a) The second UI takes more time to load and with the carousel it becomes a little laggy
   b) Need to improve the performance and also UI/UX experience

Things Done:
  <ul>
    Used Riverpod to manage the state of the app(mainly focuses on reading the api data)
  </ul>
  <ul>
    Added a second page to show blog details. As no info was given an empty listview was created with amber color to fill the space
  </ul>
  <ul>
    Added hero widget to add a bit of animation to the app
  </ul>
  <ul>
    Used animated text in blogdetails page to display the title in a more fun way
  </ul>
  <ul>
    Added Methods to like a blog
  </ul>

Problems Faced:
  <ul>The sqlite database had late initialization error</ul>
  <ul>The second homepage is laggy</ul>

Things that could be done differently:
  <ul> Could have used isar for local storage</ul>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
