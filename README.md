#AuctionSniper#

###Features###

- Auto Scan
- Auto Buyout
- Slow Auto Buyout (Anti-Bot)
- Scan last page only
- Scan a fixed page only
- Seller whitelist (won't buy from them)
- Manual Scan + Buyout buttons
- Log (Item + Seller + Price + Time)

###Filters###

- Minimum item quality
- Separate minimum item quality for recipes
- Maximum price for each item quality
- Ignore low level gear
- List of items that will be treated as if they had another quality
- Partial name matches or exact name matches
- Minimum item stack number

###GUI explained###

**AutoScan**
Refresh the auction house automatically. Uses a slightly random time.

**AutoBuy**
Will buy all items that match the filters AT ONCE, e.g. it can buy 10 items at the same time.

**SlowBuy**
Same as AutoBuy except that it won't buy more than 1 item every few seconds. Use this instead.

**LastPage**
Scan the last page only because that's where new auctions appear. Will scan all pages if this is disabled.

**IgnoreLowGear**
Won't buy gear under level 50 (by default) if this is enabled. Notice: Items that are in your special quality lists are not ignored!

**Min. Gear Level**
Text input where you can set the minimum gear level. Only used if IgnoreLowGear is enabled.

**Scan Q**
Which item quality to scan for.

**Buy Q**
Minimum item quality that should be bought. Applied to all items except recipes.
Note that you can mark items in the Settings file be treated as if they had a different quality.

**Recipe Q**
Minimum item quality that applies to recipes only.

**Class**
Which item class (e.g. Weapon/Armor/Container...) to search for. Set it to "ALL".

**Debug Output**
Will show what the addon is doing exactly. You don't need this.

**Manual Scan**
Clicking this will start a scan manually. Use this if you aren't using the "AutoScan" function.

**Manual Buy**
Buy items that match the current filters. Use this if you aren't using the "AutoBuy" function.

###TODO List###

- No GUI for settings, they are hardcoded in the _Settings file
- You should be able to modify it if you're not a pleb