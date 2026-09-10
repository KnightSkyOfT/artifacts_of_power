# Called on the first tick the Beam is raised.

# Start charging only if the weapon is ready.
execute unless score @s aop_beam_cd matches 1.. run scoreboard players set @s aop_beam_charge 1
execute unless score @s aop_beam_cd matches 1.. run scoreboard players set @s aop_beam_fire 0
execute unless score @s aop_beam_cd matches 1.. run function artifacts:beam/charge_feedback

# Development logging.
execute unless score @s aop_beam_cd matches 1.. run tellraw @s [{"text":"[AOP DEBUG] ","color":"dark_gray"},{"text":"Directed Electron Beam charging.","color":"aqua"}]
execute if score @s aop_beam_cd matches 1.. run tellraw @s [{"text":"[AOP DEBUG] ","color":"dark_gray"},{"text":"Directed Electron Beam is still cooling down.","color":"red"}]