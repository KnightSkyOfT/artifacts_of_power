# Runs as one entity intersected by the beam.

# Prevent the same entity being damaged repeatedly by different ray samples
# during this same game tick.
tag @s add aop_beam_hit

# 7 raw damage.
# The attacker is supplied so shields know which direction the hit came from.
damage @s 7 artifacts:electron_beam by @a[tag=aop_beam_shooter,limit=1]