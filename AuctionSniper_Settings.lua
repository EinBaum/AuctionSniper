
--[[

Quality Number List

0 - Poor	- Gray
1 - Common	- White
2 - Uncommon	- Green
3 - Rare	- Blue
4 - Epic	- Purple
5 - Legendary	- Orange
6 - Artifact	- Beige

Copper Conversion List

1	= 1	Copper
10	= 10	Copper
100	= 1	Silver
1000	= 10	Silver
10000	= 1	Gold
100000	= 10	Gold

]]


--[[
	Player Whitelist.
	Will not buy any items from these players.
]]
B_AS_TraderWhitelist = {
	["Exampleplayername"] = true,
}


--[[
	Specials:
	The items in these list will be treated as if they had another quality.
	The quality here has priority over all other settings.
]]

--[[
	Partial name matches.
]]
B_AS_Specials = {
	-- Downgrade
	["Half of Advanced Armorsmithing"]			= 2,	--
	-- Upgrade
	["Dragon Finger"]					= 4,	-- 100g-600g
}

--[[
	Exact name matches
]]
B_AS_SpecialsExact = {

	-- Downgrade

	["Small Glimmering Shard"]				= 1,	-- 4s
	["Small Glowing Shard"]					= 1,	-- 25s
	["Small Radiant Shard"]					= 2,	-- 2g - 3g
	["Large Glimmering Shard"]				= 2,	-- 80s
	["Small Brilliant Shard"]				= 2,	-- 95s
	["Nexus Crystal"]					= 3,	-- 8g - 9g	C

	-- Upgrade

	["Illusion Dust"]					= 2,	-- 90s
	["Gromsblood"]						= 2,	-- 85s
	["Dreamfoil"]						= 2,	-- 1g
	["Plaguebloom"]						= 2,	-- 1g

	["Devilsaur Leather"]					= 3,	-- 11g	C
	["Core Leather"]					= 3,	-- 6g
	["Cured Rugged Hide"]					= 3,	-- 6g	C

	["Elixir of the Mongoose"]				= 3,	-- 6g
	["Dark Rune"]						= 3,	-- 4g
	["Greater Eternal Essence"]				= 3,	-- 4.5g	C

	["Black Lotus"]						= 3,	-- 60g	C
	["Arcane Crystal"]					= 3,	-- 24g	C
	["Arcanite Bar"]					= 3,	-- 30g	C
	["Lava Core"]						= 3,	-- 20g	C
	["Fiery Core"]						= 3,	-- 20g	C
	["Righteous Orb"]					= 3,	-- 20g	C

	["Libram of Constitution"]				= 4,	-- 50g
	["Libram of Voracity"]					= 4,	-- 70g
	["Harnessing Shadows"]					= 4,	-- 45g
	["The Greatest Race of Hunters"]			= 4,	-- 70g
	["Holy Bologna: What the Light Won't Tell You"]		= 4,	-- 90g

	["Flask of Distilled Wisdom"]				= 4,	-- 100g
	["Flask of Supreme Power"]				= 4,	-- 100g
	["Flask of the Titans"]					= 4,	-- 125g

	["Cassandra's Grace"]					= 4,	-- 130g
	["Pristine Hide of the Beast"]				= 4,	-- 125g
	["Orb of Deception"]					= 4,	-- 35g - 80g
	["Medallion of Grand Marshal Morris"]			= 4,	-- 135g

	["Biznicks 247x128 Accurascope"]			= 4,	-- 200g+
	["Onyxia Scale Cloak"]					= 4,	--
	["Devilsaur Gauntlets"]					= 4,	-- 110g
	["Devilsaur Leggings"]					= 4,	-- 210g
	["Bloodvine Boots"]					= 4,	-- 150g
	["Bloodvine Vest"]					= 4,	-- 170g

	["Elementals Deck"]					= 5,	-- 300g - 400g

	["Lionheart Helm"]					= 5,	-- 500g+
	["Plans: Lionheart Helm"]				= 5,	-- 700g+
	["Corehound Belt"]					= 5,	-- 390g
	["Nightfall"]						= 5,	--
	["Sageblade"]						= 5,	-- 400g
	["Flarecore Robe"]					= 5,	-- 300g - 400g
	["Flarecore Leggings"]					= 5,	-- 300g - 450g

	["Underworld Band"]					= 5,	-- 300g
	["Freezing Band"]					= 5,	-- 380g
	["Sash of Mercy"]					= 5,	-- 250g
	["Foror's Compendium of Dragon Slaying"]		= 5,	-- 400g - 800g

	["Recipe: Flask of Distilled Wisdom"]			= 6,	--
	["Recipe: Flask of Supreme Power"]			= 6,	-- 750g
	["Recipe: Flask of the Titans"]				= 6,	-- 1000g - 2000g

	["Sulfuron Ignot"]					= 6,	-- 1000g - 1500g ?
	["Alcor's Sunrazor"]					= 6,	-- 1500g
	["Beasts Deck"]						= 6,	-- 1400g
	["Edgemaster's Handguards"]				= 6,	-- 1100g
	["Teebu's Blazing Longsword"]				= 6,	-- 1500g ?
}

--[[
	Conditional: Buy these items but only if they have a certain stack size

	Exact name matches.
	Format: {Quality,	MinimumStackOfItems}
]]
B_AS_SpecialsExactConditional = {
	["Plaguebloom"]						= {4,	20},		-- 1g * 20	= 20g

	["Encrypted Twilight Text"]				= {4,	150},		-- 0.3g * 150	= 45g
	["Mooncloth"]						= {4,	5},		-- 11g * 5	= 55g
	["Bloodvine"]						= {4,	5},		-- 12g * 5	= 60g

	["Devilsaur Leather"]					= {4,	5},		-- 11g * 5	= 55g
	["Core Leather"]					= {4,	8},		-- 6g * 8	= 48g
	["Cured Rugged Hide"]					= {4,	8},		-- 6g * 8	= 48g
	["Refined Deeprock Salt"]				= {4,	8},		-- 6g * 8	= 48g

	["Greater Eternal Essence"]				= {4,	6},		-- 7g?* 6	= 42g
	["Large Brilliant Shard"]				= {4,	5},		-- 5g * 10	= 50g
	["Nexus Crystal"]					= {4,	5},		-- 8g * 5	= 40g

	["Black Lotus"]						= {4,	2},		-- 60g * 2	= 120g
	["Arcane Crystal"]					= {4,	3},		-- 24g * 3	= 72g
	["Arcanite Bar"]					= {4,	2},		-- 30g * 2	= 60g
	["Lava Core"]						= {4,	3},		-- 20g * 3	= 60g
	["Fiery Core"]						= {4,	3},		-- 20g * 3	= 60g
	["Righteous Orb"]					= {4,	3},		-- 20g * 3	= 60g
}
