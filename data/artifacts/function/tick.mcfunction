# --------------------------------------------------
# Golem Puppet
# --------------------------------------------------

# Let the right-click lock expire after the player releases use.
scoreboard players remove @a[scores={aop_golem_click=1..}] aop_golem_click 1


# --------------------------------------------------
# Determine who currently carries the Puppet.
# --------------------------------------------------

# Rebuild the protected-player tag every tick.
tag @a remove aop_golem_friend

# Main inventory + hotbar.
execute as @a if items entity @s container.* minecraft:heavy_core[minecraft:custom_data~{artifact:"golem_puppet"}] run tag @s add aop_golem_friend

# Offhand is not part of container.*, so check it separately.
execute as @a if items entity @s weapon.offhand minecraft:heavy_core[minecraft:custom_data~{artifact:"golem_puppet"}] run tag @s add aop_golem_friend


# Creative and Spectator players are bad AI targets.
tag @a remove aop_golem_ignore
tag @a[gamemode=creative] add aop_golem_ignore
tag @a[gamemode=spectator] add aop_golem_ignore


# --------------------------------------------------
# Puppet Golem targeting
# --------------------------------------------------

# Count toward the next full target scan.
scoreboard players add @e[type=minecraft:iron_golem,tag=aop_golem_puppet] aop_golem_ai 1

# Check every tick whether a golem has somehow selected the current bearer.
scoreboard players set @e[type=minecraft:iron_golem,tag=aop_golem_puppet] aop_golem_guard 0

execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet] store success score @s aop_golem_guard run execute on target if entity @s[tag=aop_golem_friend]

# If a golem ever acquires the bearer, immediately replace that target.
execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet,scores={aop_golem_guard=1}] at @s run function artifacts:golem_puppet/retarget

# Normal target scan every 10 ticks = twice per second.
execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet,scores={aop_golem_ai=10..}] at @s run function artifacts:golem_puppet/retarget