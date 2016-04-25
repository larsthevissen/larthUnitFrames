 -- -- -----------------------------------------------------------------------------
 -- -- RaidFrames
 -- -- -----------------------------------------------------------------------------
 --
 --
 -- -- what was I thinking?
 -- larthRaidFrame = CreateFrame("Frame")
 -- larthRaidFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
 -- larthRaidFrame:RegisterEvent("PLAYER_ROLES_ASSIGNED")
 -- larthRaidFrame:SetScript("OnEvent", function(self, event, ...)
 --  for i = 1, 40, 1 do
 -- 	 if UnitExists("raid"..i) and UnitGroupRolesAssigned("player") ~= "HEALER" then
 -- 		 LarthUF["raid"..i].Frame:Show()
 -- 	 else
 -- 		 LarthUF["raid"..i].Frame:Hide()
 -- 	 end
 --  end
 -- end)
 --
 --
 -- -- even though little dps me doesn't care about others
 -- -- there is something like NUM_MAX_RAIDMEMBERS or with a similar name but 40 is nice, too
 -- for i = 1, 40, 1 do
 --  -- Create the Frame
 --  LarthUF["raid"..i] = {}
 --  LarthUF["raid"..i].Frame = CreateFrame("Button", "button_raid"..i, UIParent, "SecureUnitButtonTemplate ")
 --  LarthUF["raid"..i].Frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
 --  LarthUF["raid"..i].Frame:SetAttribute('type1', 'target')
 --  LarthUF["raid"..i].Frame:SetAttribute('unit', "raid"..i)
 --  LarthUF["raid"..i].Frame:SetAttribute('type2', 'spell')
 --  -- yeah it's only tricks of the trade (Schurkenhandel) here, go cry if you're no rogue
 --  LarthUF["raid"..i].Frame:SetAttribute('spell', "Tricks of the Trade")
 --  LarthUF["raid"..i].Frame:SetWidth(120)
 --  LarthUF["raid"..i].Frame:SetHeight(20)
 --  -- Position the Frame
 --  --
 --  if i <= 25 then
 -- 	 LarthUF["raid"..i].Frame:SetPoint("TOPLEFT", 15, -300-i*20)
 --  else
 -- 	 LarthUF["raid"..i].Frame:SetPoint("TOPLEFT", 150, -300-(i-25)*20)
 --  end
 --  LarthUF["raid"..i].Frame:Hide()
 --
 --  LarthUF.setText("raid"..i, "Name", "LEFT", 14)
 --  LarthUF.setText("raid"..i, "Health", "RIGHT", 14)
 --
 --  LarthUF["raid"..i].Frame:RegisterEvent("GROUP_ROSTER_UPDATE")
 --  LarthUF["raid"..i].Frame:RegisterEvent("PLAYER_ROLES_ASSIGNED")
 --     LarthUF["raid"..i].Frame:RegisterEvent("UNIT_NAME_UPDATE")
 --
 --  LarthUF["raid"..i].Frame:SetScript("OnEvent", function(self, event, ...)
 --     if UnitExists("raid"..i) then
 -- 		 local class, classFileName = UnitClass("raid"..i)
 -- 		 local role = UnitGroupRolesAssigned("raid"..i)
 -- 		 local derSring = ""
 -- 		 -- thought this was stupid, but it proved useful already
 -- 		 if role == "DAMAGER" then
 -- 			 derString = format("|cff%s%s|r", "ff9933", "D: ")
 -- 		 elseif role == "HEALER" then
 -- 			 derString = format("|cff%s%s|r", "33ff33", "H: ")
 -- 		 elseif role == "TANK" then
 -- 			 derString = format("|cff%s%s|r", "ccff33", "T: ")
 -- 		 else
 -- 			 derString = format("|cff%s%s|r", "ffffff", "_: ")
 -- 		 end
 -- 		 LarthUF["raid"..i].Name:SetText(derString..strsub(UnitName("raid"..i),1, 10))
 --
 -- 		 if (classFileName) then
 -- 			 LarthUF["raid"..i].Name:SetTextColor(RAID_CLASS_COLORS[classFileName].r, RAID_CLASS_COLORS[classFileName].g, RAID_CLASS_COLORS[classFileName].b)
 -- 		 end
 -- 	 end
 --  end)
 --
 --  -- guess i could move this to OnEvent
 --  LarthUF["raid"..i].Frame:SetScript("OnUpdate", function(self, elapsed)
 -- 	 if UnitExists("raid"..i) then
 -- 		 local health = UnitHealth("raid"..i)
 -- 		 local maxHealth = UnitHealthMax("raid"..i)
 -- 		 local percent = LarthUF.round(100*health/maxHealth, 0)
 -- 		 LarthUF["raid"..i].Health:SetText(LarthUF.round(percent))
 -- 		 LarthUF["raid"..i].Health:SetTextColor((1-percent/100)*2, percent/50, 0)
 -- 	 else
 -- 		 LarthUF["raid"..i].Health:SetText("")
 -- 		 LarthUF["raid"..i].Name:SetText("")
 -- 	 end
 --  end)
 --
 --  LarthUF["raid"..i].Frame:SetScript("OnEnter", function(self, elapsed)
 -- 	 LarthUF["raid"..i].Name:SetTextColor(0.7, 0.7, 0.7)
 --  end)
 --
 --  LarthUF["raid"..i].Frame:SetScript("OnLeave", function(self, elapsed)
 -- 	 local class, classFileName = UnitClass("raid"..i)
 -- 	 if (classFileName) then
 -- 		 LarthUF["raid"..i].Name:SetTextColor(RAID_CLASS_COLORS[classFileName].r, RAID_CLASS_COLORS[classFileName].g, RAID_CLASS_COLORS[classFileName].b)
 -- 	 end
 --  end)
 --
 -- end
