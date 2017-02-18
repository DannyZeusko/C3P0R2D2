--This file contains no logic, it enumerates which components to put in an entity based on what it's supposed to be
-- read by an entity factory function in game.main

self ={
    player = {"first thing in player", "second thing in player"}, --populate this list with functions that return lists, which are actually components we want in the player
    enemy = {},
    enemy2 = {},
    ball = {},
    pickup = {}
}

return self