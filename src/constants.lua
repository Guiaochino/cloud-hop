VIRTUAL_WIDTH = 240
VIRTUAL_HEIGHT = 320

WINDOW_HEIGHT = 640
WINDOW_WIDTH = 480

backgroundScroll = 0
BACKGROUND_SCROLL_SPEED = 10

-- change when the bg changed
BACKGROUND_LOOPING_POINT = 497

-- global standard tile size
TILE_SIZE = 16

-- width and height of screen in tiles
SCREEN_TILE_WIDTH = VIRTUAL_WIDTH / TILE_SIZE
SCREEN_TILE_HEIGHT = VIRTUAL_HEIGHT / TILE_SIZE

-- number of tiles in each tile set
TILE_SET_WIDTH = 5
TILE_SET_HEIGHT = 4

-- number of tile sets in sheet
TILE_SETS_WIDE = 6
TILE_SETS_TALL = 10

-- number of topper sets in sheet
TOPPER_SETS_WIDE = 6
TOPPER_SETS_TALL = 18

-- total number of topper and tile sets
TOPPER_SETS = TOPPER_SETS_WIDE * TOPPER_SETS_TALL
TILE_SETS = TILE_SETS_WIDE * TILE_SETS_TALL

-- player walking speed
PLAYER_WALK_SPEED = 60

-- player jumping velocity
PLAYER_JUMP_VELOCITY = -50

TILE_ID_EMPTY = 5
TILE_ID_GROUND = 3

player = { 
    1, 2, 3, 4, 5
}

-- table of tiles that should trigger a collision
COLLIDABLE_TILES = {
    TILE_ID_GROUND
}
