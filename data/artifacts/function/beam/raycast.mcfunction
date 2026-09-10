# Directed Electron Beam raycast.
# Current execution position is one sample point along the beam.

# Impact effect when terrain blocks the beam.
execute unless block ~ ~ ~ #artifacts:beam_passable run particle minecraft:electric_spark ~ ~ ~ 0.15 0.15 0.15 0.08 8 force

# Beam visual.
execute if block ~ ~ ~ #artifacts:beam_passable run particle minecraft:electric_spark ~ ~ ~ 0.04 0.04 0.04 0.01 2 force

# Damage entities whose hitboxes intersect the roughly 1-block-wide beam sample.
# Center a 1x1x1 selector cube on the current ray point.
execute if block ~ ~ ~ #artifacts:beam_passable positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,tag=!aop_beam_hit,tag=!aop_beam_shooter,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,type=!minecraft:marker,type=!minecraft:interaction,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:text_display] run function artifacts:beam/hit

# Consume one ray step.
execute if block ~ ~ ~ #artifacts:beam_passable run scoreboard players remove @a[tag=aop_beam_shooter,limit=1] aop_beam_ray 1

# Continue another half-block forward while range remains.
execute if block ~ ~ ~ #artifacts:beam_passable if score @a[tag=aop_beam_shooter,limit=1] aop_beam_ray matches 1.. positioned ^ ^ ^0.5 run function artifacts:beam/raycast