# Heart of Aspiration activation.

# Start the 45-second cooldown immediately.
scoreboard players set @s aop_heart_cd 900

# Main effects.
effect give @s minecraft:regeneration 8 3 true
effect give @s minecraft:speed 8 0 true

# Activation feedback.
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.8 1.4

# Temporary development logging. Remove after testing.
tellraw @s [{"text":"[AOP DEBUG] ","color":"dark_gray"},{"text":"Heart of Aspiration activated: Regeneration IV + Speed I for 8s; cooldown 45s.","color":"gold"}]