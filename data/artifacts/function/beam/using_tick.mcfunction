# Continuous Beam use.

# --------------------------------------------------
# FIRING
# --------------------------------------------------

# If already firing, emit one beam tick.
execute if score @s aop_beam_fire matches 1.. run function artifacts:beam/fire_tick

# Count down the maximum six-second firing duration.
execute if score @s aop_beam_fire matches 1.. run scoreboard players remove @s aop_beam_fire 1


# --------------------------------------------------
# CHARGING
# --------------------------------------------------

# Charge only when not firing and not cooling down.
execute unless score @s aop_beam_cd matches 1.. unless score @s aop_beam_fire matches 1.. run scoreboard players add @s aop_beam_charge 1

execute unless score @s aop_beam_cd matches 1.. unless score @s aop_beam_fire matches 1.. run function artifacts:beam/charge_feedback

# Full charge reached.
execute if score @s aop_beam_charge matches 100.. run function artifacts:beam/fire_start