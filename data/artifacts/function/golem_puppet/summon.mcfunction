# Deploy three Puppet Golems around the bearer.

playsound minecraft:block.anvil.land player @a[distance=..32] ~ ~ ~ 0.8 0.7

summon minecraft:iron_golem ~2 ~ ~ {Tags:["aop_golem_puppet"],PlayerCreated:0b}
summon minecraft:iron_golem ~-2 ~ ~ {Tags:["aop_golem_puppet"],PlayerCreated:0b}
summon minecraft:iron_golem ~ ~ ~2 {Tags:["aop_golem_puppet"],PlayerCreated:0b}

# Speed II. Vanilla health and attack damage remain unchanged.
effect give @e[type=minecraft:iron_golem,tag=aop_golem_puppet,distance=..6] minecraft:speed infinite 1 true

# Increase acquisition/chase range for the custom targeting system.
execute as @e[type=minecraft:iron_golem,tag=aop_golem_puppet,distance=..6] run attribute @s minecraft:follow_range base set 48

# Force an immediate target scan instead of waiting half a second.
scoreboard players set @e[type=minecraft:iron_golem,tag=aop_golem_puppet,distance=..6] aop_golem_ai 10

tellraw @s [{text:"[AOP DEBUG] ",color:"dark_gray"},{text:"Golem Puppet deployed: 3 Puppet Golems, Speed II.",color:"gray"}]