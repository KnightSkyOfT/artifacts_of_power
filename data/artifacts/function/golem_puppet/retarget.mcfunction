# Runs AS and AT one Puppet Golem.

scoreboard players set @s aop_golem_ai 0

# Clear temporary target markers left by any previous scan.
tag @e[tag=aop_golem_candidate] remove aop_golem_candidate

# Find every nearby living entity.
#
# Health is used as the discriminator:
# living mobs/players have a Health field;
# arrows, items, particles, minecarts, etc. do not.
#
# Excluded:
# - other Puppet Golems
# - current Golem Puppet bearer
# - Creative/Spectator players

execute as @e[distance=..48,tag=!aop_golem_puppet,tag=!aop_golem_friend,tag=!aop_golem_ignore] if data entity @s Health run tag @s add aop_golem_candidate

# Attack the nearest eligible living thing.
execute if entity @e[tag=aop_golem_candidate,distance=..48,sort=nearest,limit=1] run data modify entity @s AngryAt set from entity @e[tag=aop_golem_candidate,distance=..48,sort=nearest,limit=1] UUID
execute if entity @e[tag=aop_golem_candidate,distance=..48,sort=nearest,limit=1] run data modify entity @s AngerTime set value 200

# No valid target: clear forced anger and fall back to normal AI.
execute unless entity @e[tag=aop_golem_candidate,distance=..48,sort=nearest,limit=1] run data remove entity @s AngryAt
execute unless entity @e[tag=aop_golem_candidate,distance=..48,sort=nearest,limit=1] run data modify entity @s AngerTime set value 0

# Never leave temporary candidate tags behind.
tag @e[tag=aop_golem_candidate] remove aop_golem_candidate