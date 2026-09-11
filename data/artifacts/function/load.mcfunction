# Artifacts of Power initialization hook.

# --------------------------------------------------
# Global artifact systems
# --------------------------------------------------

# Persistent one-of-each artifact registry.
scoreboard objectives add aop_unique dummy


# --------------------------------------------------
# Heart of Aspiration
# --------------------------------------------------

scoreboard objectives add aop_heart_cd dummy


# --------------------------------------------------
# Directed Electron Beam
# --------------------------------------------------

scoreboard objectives add aop_beam_charge dummy
scoreboard objectives add aop_beam_fire dummy
scoreboard objectives add aop_beam_cd dummy
scoreboard objectives add aop_beam_stamp dummy
scoreboard objectives add aop_beam_ray dummy


# --------------------------------------------------
# Golem Puppet
# --------------------------------------------------

# Prevents repeated activation while right click remains held.
scoreboard objectives add aop_golem_click dummy

# Per-golem AI retarget timer.
scoreboard objectives add aop_golem_ai dummy

# Used for immediate bearer-protection checks.
scoreboard objectives add aop_golem_guard dummy

# Temporary/global summon-state bookkeeping.
scoreboard objectives add aop_golem_state dummy