
# Rotator
Rotator is a level-based bullet hell with a unique mechanic: the player controls the bullets. You can play it on [luketrenaman.com](https://luketrenaman.com/rotator) or [itch.io](https://luketrenaman.itch.io/rotator).

# Development process

## Prototype

The original concept for this game involved a player that could move around and rotate the bullets within a circular arena to dodge the bullets. I eventually settled on the concept of a player fixed in the middle of the arena. I used [Godot](https://godotengine.org/) to make this game, and the initial prototype had bullets that could be rotated by Q and E. Soon, I introduced a second bullet type that rotated the opposite direction. Whenever you were hit by a bullet, you would be taken to this lovely game over screen, and you would be provided with a nonfunctional retry button.

![A gameover screen with red "You died!" text and a white "retry" button, written in poor handwriting.](https://res.cloudinary.com/dgdv2m32g/image/upload/v1631653818/Untitled_wpnvdj.png)

## Engine

Once the prototype was created, I created a more extendable form of the base game. There was:

-   A `game` class that handles the
    -   Player controls
    -   Game over menu
    -   Victory menu
    -   Level selection button
    -   Next level button
-   A `bullets` class that
    -   Moves bullets every frame, after checking their type
    -   Rotates bullets, whenever signaled by the `game class`, according to what type of bullet it is
-   A `global` class that
    -   Contains what level the player is on, and what level the player has completed
-   A `titlescreen` class that
    -   Allows the player to use Q and E to interact with the title screen animation
    -   Controls the title screen animation
-   A `levelselect` class that
    -   Grays out levels that haven't been unlocked
    -   Ties level select buttons to the scene they reference

Every level was then a custom node that would contain a script for spawning the bullets, allowing custom behavior for levels.

## Level Design

An interesting aspect of creating a game with rotating bullets is the copious amount of trigonometry that you have to put into the level design. Eventually I discovered how to create margins small enough for the player to rotate through, and offset the rotation of bullets to force the player to react to one bullet, and then be endangered by the next. Because I never put the time into building a reusable framework for bullet spawning, I had to do a lot of math trying to get the bullets in the right spot, but eventually I could get a working level.

An exploit was quickly revealed that players could win levels simply by holding down Q and accumulating rings of bullets, and then releasing Q once all bullets had spawned. To counteract this, I added bounders, which move horizontally with rotations to the left and right. Bounders force the player to not rotate too far in one direction, and are not necessary in levels where this rotation is impossible

## Textures

Because the game only had rectangles as textures, I had to learn how to use [Inkscape](https://inkscape.org/) to create the game's bullet textures.

## Audio

When I finished the base game, I decided to add some music. However, when I put my audio into the game, it would very noticeably cut before jumping back to the beginning. Soon, I was waist-deep in crossfading, reverb tails, and eventually, [Godot Mixing Desk](https://github.com/kyzfrintin/Godot-Mixing-Desk). Although it did most of the heavy lifting in seamless looping, it also would crash without warning and the meager documentation was not helping. Eventually, I was able to make a few edits, and audio was working like a charm... except the audio crackles now because of a regression in [Google Chrome](https://bugs.chromium.org/p/chromium/issues/detail?id=1188901).

## Polish

In addition to 12 levels, I added the following features:

-   Incomplete but playable levels are yellow
-   Saving
-   Mute button
-   Bullets are shown with a transparent overlay after losing
-   Clicking on the background after losing will remove the transparent overlay
-   An extremely brief tutorial graphic in the first stage
-   Press M to mute
-   Press R to retry
-   Press Escape to exit to level select

# Conclusion

Rotator took around 3 months to develop, and I had a blast designing the levels. My favorite thing about this game was learning how the rotation mechanics worked, and starting to get a feel for how the bullets moved around the player.

## License
The source code to Rotator is under the MIT license, but this does not apply to game assets (music, images) by Luke Trenaman.
