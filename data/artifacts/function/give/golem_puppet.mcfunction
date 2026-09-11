execute if score #golem_puppet aop_unique matches 1.. run tellraw @s [{text:"[AOP] ",color:"dark_gray"},{text:"The Golem Puppet already exists in this world.",color:"red"}]
execute if score #golem_puppet aop_unique matches 1.. run return fail

# Give function
give @s minecraft:heavy_core[minecraft:item_name={text:"Golem Puppet",color:"dark_green",bold:true,italic:false},minecraft:lore=[{text:"Right Click: Deploy",color:"yellow",italic:false},{text:"Summons three accelerated Iron Golems.",color:"gray",italic:true},{text:"They recognize only the bearer as friendly.",color:"dark_gray",italic:true},{text:"Only one trio may be active.",color:"dark_gray",italic:true}],minecraft:custom_data={artifact:"golem_puppet"},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:damage_resistant={types:"#artifacts:artifact_item_immune"},minecraft:blocks_attacks={block_delay_seconds:999999.0,disable_cooldown_scale:0.0}] 1

scoreboard players set #golem_puppet aop_unique 1