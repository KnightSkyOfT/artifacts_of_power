# Golem Puppet

## Overview

The **Golem Puppet** is an Artifact of Power based on a Heavy Core.

Right-clicking it deploys three accelerated Iron Golems.

Only one Golem Puppet may exist in the world through the normal artifact give system, and only one Puppet Golem group may be active at a time.

## Golem Statistics

Each deployment creates:

- 3 Iron Golems
- Vanilla Iron Golem health: 100 HP each
- Vanilla Iron Golem attack damage
- Speed II
- 48-block custom target acquisition range

The golems persist until killed.

A new group cannot be summoned while any Puppet Golem from the previous group remains loaded and alive.

## Activation

The Golem Puppet uses a custom `minecraft:using_item` advancement.

While the Heavy Core is being used:

`artifacts:golem_puppet/use`

is triggered.

A short scoreboard lock prevents holding right-click from repeatedly activating the artifact.

## Targeting

Puppet Golems retain normal Iron Golem AI but also receive a custom targeting layer.

Every 10 ticks, each Puppet Golem scans within 48 blocks.

Eligible living entities are identified by the presence of a `Health` NBT value.

The nearest eligible target has its UUID written into the golem's `AngryAt` field, and `AngerTime` is refreshed.

The golems therefore attack essentially any nearby living entity rather than behaving like ordinary defensive Iron Golems.

## Protected Bearer

The player currently carrying the Golem Puppet is protected.

The protected-player tag is recalculated every tick.

Protection follows possession of the artifact rather than the original summoner.

If Player A summons the golems and gives the Puppet to Player B:

- Player B becomes protected
- Player A becomes a valid target

Other Puppet Golems are also excluded from targeting.

Creative and Spectator players are ignored.

## Artifact Uniqueness

The global scoreboard:

`aop_unique`

tracks whether each artifact has already been issued.

For the Golem Puppet:

`#golem_puppet aop_unique = 1`

means the artifact already exists.

The registry is persistent and deliberately does not automatically clear if an artifact is lost or destroyed.

An operator must explicitly authorize a replacement by resetting the relevant score.

## Active Group Limitation

Before deployment, the artifact checks the Overworld, Nether, and End for existing Puppet Golems.

If any remain, deployment is refused.

Minecraft selectors cannot detect entities inside completely unloaded chunks. This is a known limitation of the current implementation.

## Internal Tags

`aop_golem_puppet`
Identifies Puppet Golems.

`aop_golem_friend`
Identifies the current protected bearer.

`aop_golem_ignore`
Used for Creative and Spectator players.

`aop_golem_candidate`
Temporary target-selection marker.

## Internal Scoreboards

`aop_golem_click`
Prevents repeated activation from one continuous right-click.

`aop_golem_ai`
Controls the 10-tick targeting interval.

`aop_golem_guard`
Detects accidental targeting of the current bearer.

`aop_golem_state`
Temporary deployment-state bookkeeping.

## Balance Notes

The artifact currently uses unmodified Iron Golem health and attack damage.

Its primary enhancement is Speed II and aggressive target acquisition.

This gives the artifact approximately 300 total distributed summon HP without making any individual golem unusually durable.