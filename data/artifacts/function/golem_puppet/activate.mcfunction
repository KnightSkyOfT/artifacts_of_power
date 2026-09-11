# Golem Puppet activation.
# Only one loaded Puppet trio may exist at once.

scoreboard players set #golem_puppet_loaded aop_golem_state 0

# Check the current dimension.
execute if entity @e[type=minecraft:iron_golem,tag=aop_golem_puppet] run scoreboard players set #golem_puppet_loaded aop_golem_state 1

# Also check all three vanilla dimensions.
execute in minecraft:overworld if entity @e[type=minecraft:iron_golem,tag=aop_golem_puppet] run scoreboard players set #golem_puppet_loaded aop_golem_state 1
execute in minecraft:the_nether if entity @e[type=minecraft:iron_golem,tag=aop_golem_puppet] run scoreboard players set #golem_puppet_loaded aop_golem_state 1
execute in minecraft:the_end if entity @e[type=minecraft:iron_golem,tag=aop_golem_puppet] run scoreboard players set #golem_puppet_loaded aop_golem_state 1

# Refuse deployment while any Puppet Golem remains alive and loaded.
execute if score #golem_puppet_loaded aop_golem_state matches 1.. run tellraw @s [{text:"[AOP] ",color:"dark_gray"},{text:"The Golem Puppet is already deployed.",color:"gray"}]
execute if score #golem_puppet_loaded aop_golem_state matches 1.. run return fail

function artifacts:golem_puppet/summon