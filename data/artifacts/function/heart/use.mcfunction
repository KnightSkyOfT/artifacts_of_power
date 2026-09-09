# Fired by the Heart of Aspiration using_item advancement.

# Re-arm the advancement immediately so it can detect later uses.
advancement revoke @s only artifacts:heart/use

# Activate only if the cooldown isn't running.
execute unless score @s aop_heart_cd matches 1.. run function artifacts:heart/activate