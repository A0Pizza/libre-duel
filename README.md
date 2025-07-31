# <img src="./images/icon_small.svg" alt="Libre Duel icon" width="30"/> Libre Duel

## Table of Contents

- [Purpose](#purpose)
- [Start Contributing](#start-contributing)
- [Development](#development)
- [Style](#style)
- [Credits](#credits)
- [License](#license)

## Purpose

Libre Duel was originally conceived because there were several features that Breter and I thought could really benefit Bridge Duel, but the owner refused to add. The earliest record I have of this is on 2025 June 27, though I think the actual conception date was probably around a month earlier.

I also realised it would be a good idea because I love [FOSS](<https://opensource.org/osd>).

At some point I realised it would be cool how Bridge Duel would have two editions: Proprietary and Libre, just like Minecraft has Java and Bedrock.

When Bridge Duel got taken down, a new reason emerged: Libre Duel would now be the *only* variant of Bridge Duel available. The hope is that this game will be different enough to not warrant a takedown.

Join our Revolt server [here](<https://rvlt.gg/p4azhCRE>)

## Start Contributing

Here is a guide to prepare everything to start contributing. It assumes you know NOTHING.

Similar to the scientific method, it is optimal to read through all the instructions before beginning.

Feel free to ask for help on the Revolt server!

1. Fork this repository on GitHub. In the fork options, unselect this option: Copy the `main` branch only
1. Install [Git](https://git-scm.com/).
3. Open up a terminal.
4. Using the `cd` command, change working directory into a folder in which you want to store the `libre-duel` repository. The repository will soon be a *child* of this folder.

Let us follow an example in which someone wants to store the repository in a directory called `projects`. The `projects` directory is in their home directory (`~`). Thus, they run `cd ~/projects`.

New term: USER = Your GitHub username.

5. Clone your fork. This can be done with `git clone https://github.com/USER/libre-duel.git`. Notice the use of "USER", which represents your GitHub username.
6. Let Git do its thing.

You now have a local copy of the `libre-duel` repository. It is all stored in a directory. In the example, this directory would be `~/projects/libre-duel`.

7. Run `git clone https://github.com/EliTheGingerCat/roblox-build-tools.git`.
8. Let Git do its thing.

You now have a local copy of the `roblox-build-tools` repository.

It is a *sibling* of `libre-duel. That is, they both share the same parent.

Consider this diagram:

```
> ~
--> projects
----> libre-duel
----> roblox-build-tools
```

9. Enter the `libre-duel` repository with `cd libre-duel`.
10. Install [Rokit](https://github.com/rojo-rbx/rokit).
11. Run `rokit install`.

You now have [Lune](https://lune-org.github.io/docs/) and [Rojo](https://rojo.space/).

Optional: Run `lune list` to see the available scripts. Only `build` and `syncback` will be of value. You can run:
- `lune run build`: Build the Roblox Place into `./libre-duel.rbxl`.
- `lune run syncback`: Sync ServerStorage and Workspace into the filesystem. ⚠️ This is buggy and may need to be run multiple times. I will try to fix it.

Question: How do I know I can trust all this?  
Answer: This is not something that really belongs in this README. If you want, we can talk about it in the Revolt server.

## Development

See: <https://github.com/EliTheGingerCat/roblox-build-tools?tab=readme-ov-file#only-for-me>  
This is covered in the guide above.

Though, I am going to have to come up with an actual solution for this since this project has a decent chance of receiving contributions from random people.

I want to follow this: <https://nvie.com/posts/a-successful-git-branching-model/>

## Style

- Add a trailing newline to text files.
- Use trailing commas in code.
- Use `snake_case`.
- Place all requires in the same spot.
- Order requires alphabetically.

## Credits

### Half Life 2 Grenade Tick

Author: [@the1oler](https://www.roblox.com/users/87456522/profile)  
Type: Sound effect  
Link: https://create.roblox.com/store/asset/2164165859



Used for: Block placed  
Relvant files: [`play_sound_local.luau`](./src/ReplicatedStorage/client/modules/play_sound_local.luau)

### cartoon_pop

Author: [@Schnogrind](https://www.roblox.com/users/52134822/profile)  
Type: Sound effect  
Link: https://create.roblox.com/store/asset/6586979979



Used for: Nothing yet, but will be used for player damaged.  
Relvant files: [`play_sound_local.luau`](./src/ReplicatedStorage/client/modules/play_sound_local.luau)

# License

Libre Duel is licensed under the MIT License. See [`LICENSE.txt`](./LICENSE.txt). This license does not even need a summary.

Yes, you are allowed to republish the game exactly and profit off of it!

However, as the license says, attribution is necessary, preferably in the game description. Could also be in an in-game menu, on a website, et cetera. As long as it is easily visible.
