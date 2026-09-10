# Player released right click.

# Development logging.
execute if score @s aop_beam_fire matches 1.. run tellraw @s [{"text":"[AOP DEBUG] ","color":"dark_gray"},{"text":"Directed Electron Beam terminated early.","color":"yellow"}]

execute if score @s aop_beam_charge matches 1.. run tellraw @s [{"text":"[AOP DEBUG] ","color":"dark_gray"},{"text":"Directed Electron Beam charge cancelled.","color":"gray"}]

# Cancel unfinished charge or remaining beam duration.
scoreboard players set @s aop_beam_charge 0
scoreboard players set @s aop_beam_fire 0

# Remove stale use timestamp.
scoreboard players reset @s aop_beam_stamp