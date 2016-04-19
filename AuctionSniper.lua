
B_AS_VERSION = "1.1"

B_AS_RecipeNames = {
	"Pattern", "Schematic", "Plans", "Recipe", "Manual", "Formula",
	"Book", "Codex"
}

B_AS_QualityList = {
	[0] = "Poor", "Common", "Uncommon", "Rare", "Epic", "Legendary", "Artifact"
}
for k,v in B_AS_QualityList do
	B_AS_QualityList[k] = ITEM_QUALITY_COLORS[k].hex .. v .. "|r"
end

B_AS_ClassNames = {
	[0] = "ALL", "Weapon", "Armor", "Container",
	"Consumable", "Trade Goods", "Projectile", "Quiver",
	"Recipe", "Reagent", "Miscellaneous"
}

-- Minimum time between 2 auction house scan queries
B_AS_SCAN_BASE = 5.0

-- Maximum random time added if RandomInterval is on
B_AS_SCAN_RANDOM = 0.5

-- Minimum time between 2 item buyouts using SlowBuy
B_AS_SLOWBUY_BASE = 1.0

-- Maximum random time added to SlowBuy (always applied)
B_AS_SLOWBUY_RANDOM = 0.5

-- Maximum time sync skew in seconds
B_AS_SYNC_MAXSKEW = 0.5


-------------------------------------------------------------------------------

B_AS_I_NAME		= 1
B_AS_I_PARTIAL		= 2
B_AS_I_QUALITY		= 3
B_AS_I_STACK		= 4


B_AS_T_BOOL		= 1		-- Button is an ON/OFF toggle button
B_AS_T_LIST		= 2		-- Button switches between multiple values
B_AS_T_TEXT		= 3		-- EditBox with just one line
B_AS_T_NUMBER		= 4		-- EditBox with one number
B_AS_T_LINES		= 5		-- EditBox with many lines
B_AS_T_MISC		= 6		-- Something else

B_AS_S_TYPE		= 1		-- Setting type: BOOL/LIST
B_AS_S_DEFAULT		= 2		-- Default value (set on first time addon use)
B_AS_S_GUI		= 3		-- GUI Button element for this setting
B_AS_S_TEXT		= 4		-- Text on the GUI button
B_AS_S_VALUES		= 5		-- Only LISTs. Array of all possible values
B_AS_S_RANGE_S		= 6		-- Only LISTs. First item index in array
B_AS_S_RANGE_E		= 7		-- Only LISTs. Last item index in array
B_AS_S_CALLBACK		= 8		-- function(newValue) callback when value is changed

B_AS_VarSettings = {
	--			Type		Default		GUI Button			GUI Text		Value names		Value Array Range
	["AutoScan"]		= {B_AS_T_BOOL,		false,	B_AS_Button_AutoScanToggle,		"AutoScan"							},
	["AutoBuy"]		= {B_AS_T_BOOL,		false,	B_AS_Button_AutoBuyToggle,		"AutoBuy"							},
	["AutoSlowBuy"]		= {B_AS_T_BOOL,		false,	B_AS_Button_AutoSlowBuyToggle,		"SlowBuy"							},
	["PageLock"]  		= {B_AS_T_BOOL,		true,	B_AS_Button_PageLockToggle,		"LastPage"							},
	["PageFixed"]  		= {B_AS_T_BOOL,		false,	B_AS_Button_PageFixedToggle,		"FixedPage"							},
	["WhichPage"]  		= {B_AS_T_NUMBER,	0,	B_AS_Input_WhichPage,											},
	["Sync"]  		= {B_AS_T_BOOL,		false,	B_AS_Button_SyncToggle,			"TimeSync"							},
	["SyncChars"]  		= {B_AS_T_NUMBER,	1,	B_AS_Input_SyncChars,											},
	["SyncIndex"]  		= {B_AS_T_NUMBER,	1,	B_AS_Input_SyncIndex,											},
	["ScanMinQuality"]	= {B_AS_T_LIST,		1,	B_AS_Button_ScanMinQuality,		"Scan Q",		B_AS_QualityList,	1, 5		},
	["BuyMinQuality"]	= {B_AS_T_LIST,		4,	B_AS_Button_BuyMinQuality,		"Buy Q",		B_AS_QualityList,	1, 5		},
	["RecipeMinQuality"]	= {B_AS_T_LIST,		5,	B_AS_Button_RecipeMinQuality,		"Recipe Q",		B_AS_QualityList,	1, 5		},
	["ScanClass"]		= {B_AS_T_LIST,		0,	B_AS_Button_ScanClass,			"Class",		B_AS_ClassNames,	0, 10		},
	["Output"] 		= {B_AS_T_BOOL,		false,	B_AS_Button_OutputToggle,		"Debug Output"							},
	["Log"] 		= {B_AS_T_LINES,	{},	B_AS_LogBox												},
	["ShowLog"] 		= {B_AS_T_BOOL,		true,														},
	["ShowOptions"] 	= {B_AS_T_BOOL,		true,														},
	["ShowItems"] 		= {B_AS_T_BOOL,		false,														},

	["OptionPriceQuality1"]	= {B_AS_T_NUMBER,	50,		B_AS_Input_OptionPriceQuality1,									},
	["OptionPriceQuality2"]	= {B_AS_T_NUMBER,	1000,		B_AS_Input_OptionPriceQuality2,									},
	["OptionPriceQuality3"]	= {B_AS_T_NUMBER,	10000,		B_AS_Input_OptionPriceQuality3,									},
	["OptionPriceQuality4"]	= {B_AS_T_NUMBER,	110000,		B_AS_Input_OptionPriceQuality4,									},
	["OptionPriceQuality5"]	= {B_AS_T_NUMBER,	2000000,	B_AS_Input_OptionPriceQuality5,									},
	["OptionPriceQuality6"]	= {B_AS_T_NUMBER,	5000000,	B_AS_Input_OptionPriceQuality6,									},
	["IgnoreLowGear"]	= {B_AS_T_BOOL,		true,		B_AS_Button_IgnoreLowGearToggle,	"IgnoreLowGear"						},
	["LowGearLevel"]	= {B_AS_T_NUMBER,	50,		B_AS_Input_IgnoreLowGearLevel,									},

	["Items"] 		= {B_AS_T_MISC,		{},														},
}

-- AutoBuy and SlowBuy are mutually exclusive
-- Callback: AutoBuy turns off SlowBuy
B_AS_VarSettings["AutoBuy"][B_AS_S_CALLBACK] = function(setting, value)
	if (value == true) then
		B_AS_SetVar("AutoSlowBuy", false)
	end
end
-- Callback: SlowBuy turns off AutoBuy
B_AS_VarSettings["AutoSlowBuy"][B_AS_S_CALLBACK] = function(setting, value)
	if (value == true) then
		B_AS_SetVar("AutoBuy", false)
	end
end
-- PageLock and PageFixed are mutually exclusive
-- Callback: PageLock
B_AS_VarSettings["PageLock"][B_AS_S_CALLBACK] = function(setting, value)
	if (value == true) then
		B_AS_SetVar("PageFixed", false)
	end
end
-- Callback: PageFixed
B_AS_VarSettings["PageFixed"][B_AS_S_CALLBACK] = function(setting, value)
	if (value == true) then
		B_AS_SetVar("PageLock", false)
	end
end
-- Callback: Show Log
B_AS_VarSettings["ShowLog"][B_AS_S_CALLBACK] = function(setting, value)
	if value then
		B_AS_LogBoxContainer:Show()
	else
		B_AS_LogBoxContainer:Hide()
	end
end
-- Callback: Show Options
B_AS_VarSettings["ShowOptions"][B_AS_S_CALLBACK] = function(setting, value)
	if value then
		B_AS_OptionsContainer:Show()
	else
		B_AS_OptionsContainer:Hide()
	end
end
-- Callback: Show Items
B_AS_VarSettings["ShowItems"][B_AS_S_CALLBACK] = function(setting, value)
	if value then
		B_AS_ItemsContainer:Show()
	else
		B_AS_ItemsContainer:Hide()
	end
end
-- Callback: Options: Setting price quality changes money text
B_AS_OptionPriceQuality_Callback = function(setting, value)
	local numberValue = tonumber(value)
	if (numberValue ~= nil) then
		getglobal("B_AS_Text_" .. setting):SetText(B_AS_MoneyToText(numberValue))
	end
end
B_AS_VarSettings["OptionPriceQuality1"][B_AS_S_CALLBACK] = B_AS_OptionPriceQuality_Callback
B_AS_VarSettings["OptionPriceQuality2"][B_AS_S_CALLBACK] = B_AS_OptionPriceQuality_Callback
B_AS_VarSettings["OptionPriceQuality3"][B_AS_S_CALLBACK] = B_AS_OptionPriceQuality_Callback
B_AS_VarSettings["OptionPriceQuality4"][B_AS_S_CALLBACK] = B_AS_OptionPriceQuality_Callback
B_AS_VarSettings["OptionPriceQuality5"][B_AS_S_CALLBACK] = B_AS_OptionPriceQuality_Callback
B_AS_VarSettings["OptionPriceQuality6"][B_AS_S_CALLBACK] = B_AS_OptionPriceQuality_Callback

-------------------------------------------------------------------------------

-- True if the auction house window is shown
B_AS_IsOpen = false

-- Absolute time in SECONDS when last item was bought using the SlowBuy option
B_AS_SlowBuy_LastTime = 0.0

-- Relative to SlowBuy_LastTime: How many SECONDS to wait until next item buy
B_AS_SlowBuy_WaitTime = 0.0

-- Number of auctions on the currently shown page
B_AS_CurrentPageAuctions = 0

-- Total number of auctions in this auction house
B_AS_TotalAuctions = 0

-- Currently opened auction house page number
B_AS_Page = 0


-------------------------------------------------------------------------------

--[[
	Converts an amount of money into a readable text
	Argument: money - not negative integer amount of copper
	Returns: string: money as text
]]
function B_AS_MoneyToText(money)
	-- Conversion copied from Blizzard's MoneyFrame.lua, line 185
	local gold = floor(money / (COPPER_PER_SILVER * SILVER_PER_GOLD))
	local silver = floor((money - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER)
	local copper = mod(money, COPPER_PER_SILVER)

	local o = ""

	if (gold > 0) then
		o = o .. "|cffffff00" .. gold .. "g|r"
	end
	if (silver > 0) then
		o = o .. "|cfff0f0f0" .. silver .. "s|r"
	end
	if ((copper > 0) or (o == "")) then
		o = o .. "|cffff9020" .. copper .. "c|r"
	end
	return o
end

--[[
	Prints a table recursively
	http://stackoverflow.com/a/27028488
]]
function B_AS_PrintTable(o)
	if type(o) == 'table' then
		local s = '{'
		for k,v in pairs(o) do
			local kk = k
			if type(kk) ~= 'number' then kk = '"'..kk..'"' end
			s = s .. '['..kk..']=' .. B_AS_PrintTable(v) .. ','
		end
		return s .. '}'
	elseif type(o) == 'string' then
		return '"' .. o .. '"'
	else
		return tostring(o)
	end
end


-------------------------------------------------------------------------------


--[[
	Print text in the chat frame if the "Output" setting is enabled
	Argument: msg - the text that you want to print
]]
function B_AS_Print(msg)
	if (B_AS_GS["Output"]) then
		DEFAULT_CHAT_FRAME:AddMessage("[AS] "..msg, 1, 0.3, 1)
	end
end

--[[
	Add a line of text to the log (even if the log window is hidden)
	Argument: msg - the text to be logged
]]
function B_AS_Log(msg)
	table.insert(B_AS_GS["Log"], msg)
	B_AS_LogBox:AddMessage(msg)
end

--[[
	Delete all messages in the log
]]
function B_AS_LogClear()
	B_AS_GS["Log"] = {}
	B_AS_LogBox:Clear()
end

--[[
	Enter a log message that shows what item was bought, the time and the price
]]
function B_AS_LogBuyout(name, count, quality, level, buyPrice, owner, link)

	local desc = link
	if desc == nil then
		desc = name
	end

	local msg = count .. "x " .. desc .. " " .. B_AS_MoneyToText(buyPrice)
		.. " " .. owner .. " " .. date("%H:%M:%S %d.%m.%y")
	B_AS_Log(msg)
	B_AS_Print("Buying: " .. msg)
end


-------------------------------------------------------------------------------


--[[
	Buys all items that meet the user's specified requirements.
	Argument: buyAll
		- True: Buy all items at once
		- False: Buy only 1 item at maximum
]]
function B_AS_Buy(buyAll)

	if (B_AS_IsOpen == false) then
		return
	end

	B_AS_Print("Buying Results. Min quality: "..B_AS_GS["BuyMinQuality"])

	local auctionIndex
	for auctionIndex = B_AS_CurrentPageAuctions, 1, -1 do

		--[[
			name, texture, count, quality, canUse, level, minBid, minIncrement,
			buyoutPrice, bidAmount, highBidder, owner = GetAuctionItemInfo("list|bidder|owner", offset)
		]]
		local name,_,count,quality,_,level,_,_,buyPrice,_,_,owner = GetAuctionItemInfo("list", auctionIndex)
		local link = GetAuctionItemLink("list", auctionIndex)

		if name and buyPrice ~= 0 then
			local buy = B_AS_CheckItem(name, count, quality, level, buyPrice, owner)
			if buy then
				PlaceAuctionBid("list", auctionIndex, buyPrice)
				B_AS_LogBuyout(name, count, quality, level, buyPrice, owner, link)
				if not buyAll then
					return
				end
			end
		end
	end
end

--[[
	Queries an auction house page using the user's defined settings.
]]
function B_AS_Scan()

	-- Only scan if the auction house is actually open
	if (B_AS_IsOpen == false) then
		return
	end

	-- If PageLock then set the current page to the last page
	-- If PageFixed then use the page that the user specified
	if (B_AS_GS["PageLock"]) then
		B_AS_Page = math.floor(B_AS_TotalAuctions / 50)
	elseif (B_AS_GS["PageFixed"]) then
		B_AS_Page = B_AS_GS["WhichPage"]
	end

	-- GUI fix only: Make the AH interface show the right page number
	AuctionFrameBrowse.page = B_AS_Page

	B_AS_Print("Querying Page "..B_AS_Page..". Min. Quality: "..B_AS_GS["ScanMinQuality"])

	--[[
		QueryAuctionItems("name", minLevel, maxLevel, invTypeIndex, classIndex,
			subclassIndex, page, isUsable, qualityIndex, getAll)
	]]
	QueryAuctionItems("", nil, nil, 0, B_AS_GS["ScanClass"], 0, B_AS_Page, false, B_AS_GS["ScanMinQuality"], false)

	-- Increase the page number by one; so next scan will show the next page
	B_AS_Page = B_AS_Page + 1
	if (B_AS_Page * 50 > B_AS_TotalAuctions) then
		B_AS_Page = 0
	end
end

--[[
	Check if an item should be bought or not
	Arguments:
		name		Item Name
		quality		Item quality number
		level		Required item level to use this item
		buyPrice	Buyout price
		owner		Player name of the seller

	Returns a boolean. True: Buy the item; False: Do NOT buy the item
]]
function B_AS_CheckItem(name, count, quality, level, buyPrice, owner)

	local doNotIgnoreLowGear = false	-- Ignore the min. gear level check if true

	-- Do not buy your own auctions
	if (owner == UnitName("player")) then
		return false
	end

	-- Check if the seller is whitelisted
	if (B_AS_TraderWhitelist[owner] == true) then
		return false
	end

	--[[
		Check if this item is in the Specials list and
		save the item's custom quality level in priceQuality
	]]
	local priceQuality = quality
	for specialName, specialQuality in B_AS_Specials do
		if string.find(name, specialName, 1, true) ~= nil then
			priceQuality = specialQuality
			doNotIgnoreLowGear = true
			break
		end
	end

	--[[
		Check if the item is in the SpecialsExact list
	]]
	if B_AS_SpecialsExact[name] then
		priceQuality = B_AS_SpecialsExact[name]
		doNotIgnoreLowGear = true
	end

	--[[
		Check if the item is in the SpecialsExactConditional list and the stack
		minimum is reached.
	]]
	if B_AS_SpecialsExactConditional[name] then
		local specialQuality	= B_AS_SpecialsExactConditional[name][1]
		local minStack		= B_AS_SpecialsExactConditional[name][2]
		if count >= minStack then
			priceQuality = specialQuality
			doNotIgnoreLowGear = true
		end
	end

	--[[
		Check if the item is a recipe/plan/pattern by checking if
		the item name contains strings like "Pattern: " or "Plans: "
	]]
	local isRecipe = false
	for _, recipeName in B_AS_RecipeNames do
		if string.find(name, recipeName..": ", 1, true) ~= nil then
			isRecipe = true
			break
		end
	end

	-- Do not buy the item if it's a recipe with quality below RecipeMinQuality
	if (isRecipe and priceQuality < B_AS_GS["RecipeMinQuality"]) then
		return false
	end

	-- Do not buy the item if it's quality is below BuyMinQuality
	if (priceQuality < B_AS_GS["BuyMinQuality"]) then
		return false
	end

	-- Do not buy gray items
	if (priceQuality == 0) then
		return false
	end

	-- Do not buy the item if it's too expensive for its quality
	if (buyPrice > tonumber(B_AS_GS["OptionPriceQuality" .. priceQuality])) then
		return false
	end

	--[[
		Ignore items with required lvl between 1 and LowGearLevel
		if the option IgnoreLowGear is active
	]]
	if (doNotIgnoreLowGear == false and B_AS_GS["IgnoreLowGear"] == true) then
		local minLevel = tonumber(B_AS_GS["LowGearLevel"])
		if (minLevel ~= nil) then
			if (level > 1 and level < minLevel) then
				return false
			end
		end
	end

	-- Do not buy auctions that cost more than you have
	if (buyPrice > GetMoney()) then
		-- Warn the user that you need more money
		B_AS_Print(">>> " .. name .. " too expensive: " .. B_AS_MoneyToText(buyPrice))
		return false
	end

	-- Buy the item
	return true
end


-------------------------------------------------------------------------------


function B_AS_SetVar(var, value)

	local settings = B_AS_VarSettings[var]
	if not settings then
		return
	end

	local type	= settings[B_AS_S_TYPE]
	local gui	= settings[B_AS_S_GUI]
	local text	= settings[B_AS_S_TEXT]
	local values	= settings[B_AS_S_VALUES]
	local callback	= settings[B_AS_S_CALLBACK]

	local doSetValue = true

	if (gui ~= nil) then
		local valueText = nil

		if (type == B_AS_T_BOOL) then
			if (value == true) then
				valueText = "|cFF00FF00[ON]|r"
			else
				valueText = "|cFFFF5050[OFF]|r"
			end
		elseif (type == B_AS_T_LIST) then
			if (values[value] ~= nil) then
				valueText = "|cFFA0A0FF" .. values[value] .. "|r"
			else
				valueText = value
			end
		elseif (type == B_AS_T_TEXT) then
			gui:SetText(value)
		elseif (type == B_AS_T_NUMBER) then
			value = tonumber(value)
			if (value~= nil) then
				gui:SetText(value)
			else
				doSetValue = false
			end
		elseif (type == B_AS_T_LINES) then
			gui:Clear()
			for _,v in value do
				gui:AddMessage(v)
			end
		end

		if (valueText == nil) then
			valueText = tostring(value)
		end

		if (text and valueText) then
			gui:SetText(text .. ": " .. valueText)
			B_AS_Print("SET "..var.." = "..valueText)
		else
			B_AS_Print("SET "..var)
		end
	else
		B_AS_Print("SET "..var)
	end

	if (doSetValue == true) then
		B_AS_GS[var] = value
	end

	if (callback ~= nil) then
		callback(var, value)
	end

end
function B_AS_ToggleVar(var)

	local newValue = not B_AS_GS[var]
	B_AS_SetVar(var, newValue)
end
function B_AS_IncreaseVar(var)

	local settings	= B_AS_VarSettings[var]
	local values	= settings[B_AS_S_VALUES]
	local startNum	= settings[B_AS_S_RANGE_S]
	local endNum	= settings[B_AS_S_RANGE_E]

	local newValue = B_AS_GS[var] + 1
	if newValue > endNum then
		newValue = startNum
	end

	B_AS_SetVar(var, newValue)
end

function B_AS_InitializeSettings()
	-- B_AS_GS (global saved variable) is nil on first addon use
	if (B_AS_GS == nil) then
		-- Fill global settings with default values
		B_AS_GS = {}
		for var, settings in B_AS_VarSettings do
			B_AS_GS[var] = settings[B_AS_S_DEFAULT]
		end
	end

	for var, value in B_AS_GS do
		B_AS_SetVar(var, value)
	end
end

function B_AS_InitializeItems()
	local numItems = 22

	for i = 1, numItems do
		local settingsItem = B_AS_GS["Items"][i]

		if not settingsItem then
			B_AS_GS["Items"][i] = {}
			settingsItem = B_AS_GS["Items"][i]
			settingsItem[B_AS_I_NAME] = ""
			settingsItem[B_AS_I_PARTIAL] = false
			settingsItem[B_AS_I_QUALITY] = 1
			settingsItem[B_AS_I_STACK] = 1
		end

		local frameItem = CreateFrame("frame", "B_AS_Item" .. i, B_AS_ItemsContainer, "B_AS_ItemTemplate")
		local frameName, framePartial, frameQuality, frameStack = frameItem:GetChildren()

		frameName:SetText(settingsItem[B_AS_I_NAME])
		frameName:SetScript("OnTextChanged", function()
			settingsItem[B_AS_I_NAME] = frameName:GetText()
		end)

		framePartial:SetChecked(settingsItem[B_AS_I_PARTIAL])
		framePartial:SetScript("OnClick", function()
			settingsItem[B_AS_I_PARTIAL] = framePartial:GetChecked()
		end)

		UIDropDownMenu_Initialize(frameQuality, function()
			local info = {}
			for i = 1, table.getn(B_AS_QualityList) do
				info.text = B_AS_QualityList[i]
				info.value = i
				info.func = function()
					UIDropDownMenu_SetSelectedID(frameQuality, this:GetID())
					settingsItem[B_AS_I_QUALITY] = this:GetID()
				end
				info.checked = nil
				UIDropDownMenu_AddButton(info, 1)
			end
		end)
		UIDropDownMenu_SetSelectedID(frameQuality, settingsItem[B_AS_I_QUALITY])

		frameStack:SetText(settingsItem[B_AS_I_STACK])
		frameStack:SetScript("OnTextChanged", function()
			local number = tonumber(frameStack:GetText())
			if (number ~= nil) then
				settingsItem[B_AS_I_STACK] = frameStack:GetText()
			end
		end)

		frameItem:SetPoint("TOPLEFT", B_AS_ItemsContainer, "TOPLEFT", 20, -20 + i * -16)
		frameItem:Show()
	end
end

-------------------------------------------------------------------------------


function B_AS_OnLoad()
	this:RegisterEvent("ADDON_LOADED")
	this:RegisterEvent("AUCTION_HOUSE_SHOW")
	this:RegisterEvent("AUCTION_HOUSE_CLOSED")
	this:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
end

function B_AS_OnEvent()
	if (event == "ADDON_LOADED") then
		if (string.lower(arg1) == "auctionsniper") then
			-- Initialize global variable if it's nil
			B_AS_InitializeSettings()
			B_AS_InitializeItems()

			DEFAULT_CHAT_FRAME:AddMessage("AuctionSniper " .. B_AS_VERSION .. " loaded.", 0.37, 1, 0)
		end

	elseif (event == "AUCTION_HOUSE_SHOW") then
		B_AS_Frame:Show()
		B_AS_IsOpen = true

	elseif (event == "AUCTION_HOUSE_CLOSED") then
		B_AS_Frame:Hide()
		B_AS_IsOpen = false

	elseif (event == "AUCTION_ITEM_LIST_UPDATE") then

		B_AS_CurrentPageAuctions, B_AS_TotalAuctions = GetNumAuctionItems("list")

		if (B_AS_GS["AutoBuy"] == true) then
			B_AS_Buy(true)
		end
	end
end

function B_AS_SlowBuyTick(currTime)
	if (currTime - B_AS_SlowBuy_LastTime >= B_AS_SlowBuy_WaitTime) then
		B_AS_SlowBuy_LastTime = currTime
		B_AS_Buy(false)
		B_AS_SlowBuy_WaitTime = B_AS_SLOWBUY_BASE + math.random() * B_AS_SLOWBUY_RANDOM
	end
end
function B_AS_SyncTime()
	if B_AS_GS["Sync"] == true then
		local timePart = mod(GetTime(), B_AS_SCAN_BASE)
		local timeWait = (B_AS_SCAN_BASE / B_AS_GS["SyncChars"]) * (B_AS_GS["SyncIndex"] - 1)

		if timePart < timeWait or timePart > timeWait + B_AS_SYNC_MAXSKEW then
			return false
		end
	end
	return true
end
function B_AS_AutoScanTick(currTime)

	if (CanSendAuctionQuery() and B_AS_SyncTime()) then
		B_AS_Scan()
	end
end
function B_AS_OnUpdate()

	if (B_AS_IsOpen == true) then

		local currTime = GetTime()

		if B_AS_GS["AutoSlowBuy"] == true then
			B_AS_SlowBuyTick(currTime)
		end

		if B_AS_GS["AutoScan"] == true then
			B_AS_AutoScanTick(currTime)
		end
	end
end