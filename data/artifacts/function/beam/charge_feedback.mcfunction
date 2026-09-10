# Small electrical particles throughout charging.
particle minecraft:electric_spark ~ ~1 ~ 0.35 0.6 0.35 0.03 2 force

# Increasingly rapid electrical cracks.

execute if score @s aop_beam_charge matches 1 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.35 0.65

execute if score @s aop_beam_charge matches 21 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.4 0.70

execute if score @s aop_beam_charge matches 39 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.45 0.78

execute if score @s aop_beam_charge matches 55 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.5 0.86

execute if score @s aop_beam_charge matches 69 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.55 0.95

execute if score @s aop_beam_charge matches 81 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.6 1.05

execute if score @s aop_beam_charge matches 91 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.7 1.15

execute if score @s aop_beam_charge matches 96 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.8 1.25

execute if score @s aop_beam_charge matches 99 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 0.9 1.4

execute if score @s aop_beam_charge matches 100 run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..32] ~ ~ ~ 1.0 1.6