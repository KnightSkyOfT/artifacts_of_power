# --------------------------------------------------
# Heart of Aspiration
# --------------------------------------------------

scoreboard players remove @a[scores={aop_heart_cd=1..}] aop_heart_cd 1


# --------------------------------------------------
# Directed Electron Beam
# --------------------------------------------------

# Cooldown countdown.
scoreboard players remove @a[scores={aop_beam_cd=1..}] aop_beam_cd 1

# Current world tick, used to detect when a player has stopped using the Beam.
execute store result score #beam_now aop_beam_stamp run time query gametime

# If no using_item trigger has refreshed the timestamp for two ticks,
# the player has released right click.
execute as @a if score @s aop_beam_stamp = #beam_now aop_beam_stamp run function artifacts:beam/stop_using


# --------------------------------------------------
# Golem Puppet
# --------------------------------------------------

# Let the right-click lock expire after the player releases use.
scoreboard players remove @a[scores={aop_golem_click=1..}] aop_golem_click 1


# --------------------------------------------------
# Determine who currently carries the Puppet
# --------------------------------------------------

tag @a remove aop_golem_friend

# Main inventory / hotbar.
execute as @a if items entity @s container.* minecraft:heavy_core[minecraft:custom_data~{artifact:"golem_puppet"}] run tag @s add aop_golem_friend

# Offhand.
execute as @a if items entity @s weapon.offhand minecraft:heavy_core[minecraft:custom_data~{artifact:"golem_puppet"}] run tag @s add aop_golem_friend


# Creative and Spectator players are ignored.
tag @a remove aop_golem_ignore
tag @a[gamemode=creative] add aop_golem_ignore
tag @a[gamemode=spectator] add aop_golem_ignore


# --------------------------------------------------
# Puppet Golem targeting
# --------------------------------------------------

scoreboard players add @e[type=minecraft:iron_golem,tag=aop_golem_puppet] aop_golem_ai 1

# Check every tick whether a golem has somehow selected the bearer.
scoreboard players set @e[type=minecraft:iron_golem,tag=aop_golem_puppet] aop_golem_guard 0

execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet] store success score @s aop_golem_guard run execute on target if entity @s[tag=aop_golem_friend]

# Immediately abandon the bearer if vanilla AI somehow targets them.
execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet,scores={aop_golem_guard=1}] at @s run function artifacts:golem_puppet/retarget

# Full retarget twice per second.
execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet,scores={aop_golem_ai=10..}] at @s run function artifacts:golem_puppet/retarget