# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).


## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthough GIF

<img src="http://g.recordit.co/CIoRBK0wbE.gif" width=250><br>

### Notes
The first challenge was setting up the tab view in the right order. I wanted to change it programmatically, but ended up just removing the superhero tab and then added it again to display the items in the right order.
The second challenge was getting the height correct. The trick that solved this was to set the estimate size dropdown to None, which lead to the flow layout being used.

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthough GIF

<img src="http://g.recordit.co/fm2QGCjfOg.gif" width=250><br>

### Notes
Challenges I encountered were that my app was stuck in the loading screen, because I forgot to specify the module. The error was fixed by said specifying the module.
Another challenge was that I had accidentally created an outlet for the synopsis label twice and none for the title label. Recreating the title label fixed the problem.
Auto layout also had its challenges, mostly due to not being completely sure what which constraint does, but the result was worth the challenge.
