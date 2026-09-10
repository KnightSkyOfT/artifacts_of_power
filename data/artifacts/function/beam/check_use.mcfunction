# Runs every tick while the Directed Electron Beam is being used.

advancement revoke @s only artifacts:beam/use

# Read current game tick.
execute store result score #beam_now aop_beam_stamp run time query gametime

# If the previous use timestamp has expired, this is a new right-click.
execute unless score @s aop_beam_stamp >= #beam_now aop_beam_stamp run function artifacts:beam/start_using

# If the timestamp is still ahead of the current tick, this is continuous use.
execute if score @s aop_beam_stamp > #beam_now aop_beam_stamp run function artifacts:beam/using_tick

# Push the stop-detection timestamp two ticks into the future.
scoreboard players operation @s aop_beam_stamp = #beam_now aop_beam_stamp
scoreboard players add @s aop_beam_stamp 2