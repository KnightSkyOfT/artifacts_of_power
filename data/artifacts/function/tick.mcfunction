# Global Artifacts of Power tick function.
# Add future per-tick artifact systems here.

# Heart of Aspiration cooldown.
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