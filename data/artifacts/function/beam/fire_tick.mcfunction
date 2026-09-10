# One tick of active Electron Beam fire.

# Only one shooter is marked while a raycast is being resolved.
tag @a[tag=aop_beam_shooter] remove aop_beam_shooter
tag @s add aop_beam_shooter

# Clear old per-ray hit markers near this shooter.
tag @e[tag=aop_beam_hit,distance=..12] remove aop_beam_hit

# 18 half-block raycast steps = 9 blocks.
scoreboard players set @s aop_beam_ray 18

# Begin half a block in front of the player's eyes.
execute anchored eyes positioned ^ ^ ^0.5 run function artifacts:beam/raycast

# Clean temporary tags.
tag @e[tag=aop_beam_hit,distance=..12] remove aop_beam_hit
tag @s remove aop_beam_shooter