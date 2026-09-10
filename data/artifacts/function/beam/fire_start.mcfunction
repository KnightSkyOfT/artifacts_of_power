# Directed Electron Beam has reached full charge.

scoreboard players set @s aop_beam_charge 0
scoreboard players set @s aop_beam_fire 120
scoreboard players set @s aop_beam_cd 1800

# Full-charge discharge cue.
playsound minecraft:entity.lightning_bolt.thunder player @a[distance=..48] ~ ~ ~ 1.0 1.6
playsound minecraft:entity.guardian.attack player @a[distance=..32] ~ ~ ~ 1.0 1.7

particle minecraft:flash ~ ~1.4 ~ 0 0 0 0 1 force

tellraw @s [{"text":"[AOP DEBUG] ","color":"dark_gray"},{"text":"Directed Electron Beam FIRED. 120-tick burst; 1800-tick cooldown committed.","color":"aqua","bold":true}]

# First firing tick happens immediately.
function artifacts:beam/fire_tick
scoreboard players remove @s aop_beam_fire 1