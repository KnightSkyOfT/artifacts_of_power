# Fired every tick while the Golem Puppet is being used.

advancement revoke @s only artifacts:golem_puppet/use

# Only activate once per continuous right-click.
execute unless score @s aop_golem_click matches 1.. run function artifacts:golem_puppet/activate

# Keep the click lock alive while the button remains held.
scoreboard players set @s aop_golem_click 2