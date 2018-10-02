function SetupEventListeners()
	print('[ErpEventDrivenArchitecture] Setting up event listeners')
	function OnMsg.AnomalyAnalyzed(anomaly) GrantEventResearchPoints(2, 'anomaly analyzed') end
	function OnMsg.DustStormEnded() GrantEventResearchPoints(2, 'survived dust storm') end
	function OnMsg.ColdWaveEnded() GrantEventResearchPoints(2, 'survived cold wave') end
	function OnMsg.MeteorStormEnded() GrantEventResearchPoints(2, 'survived meteor storm') end
	function OnMsg.MeteorIntercepted(meteor, laser) GrantEventResearchPoints(3, 'meteor intercepted') end
	function OnMsg.DomeHitByMeteor(dome, meteor) GrantEventResearchPoints(3, 'survived meteor hit') end
	function OnMsg.RocketLanded(rocket) GrantEventResearchPoints(1, 'safe landing') end
	function OnMsg.RocketLaunched(rocket) GrantEventResearchPoints(1, 'safe launch') end
	function OnMsg.AchievementUnlocked(player_id, achievement_id) GrantEventResearchPoints(3, 'achievement unlocked') end
	function OnMsg.BuildingUpgraded(building_obj, upgrade_id) GrantEventResearchPoints(1, 'building upgraded') end
	function OnMsg.ColonyApprovalPassed() GrantEventResearchPoints(3, 'colony approved') end
	function OnMsg.SectorScanned(status, x, y) GrantEventResearchPoints(2, 'sector scanned') end
	print('[ErpEventDrivenArchitecture] Done setting up event listeners')
end

function GrantEventResearchPoints(rewardType, reason)
	print('[ErpEventDrivenArchitecture] Checking event: ' .. reason)
	if IsTechResearched('ErpEventDrivenArchitecture') then
		rewardPoints = {100, 250, 500}
		amount = rewardPoints[rewardType]
		message = '+' .. amount .. 'RP: ' .. reason
		AddCustomOnScreenNotification('ErpEventDrivenArchitectureNotification', 'Event Driven Architecture', message)
		GrantResearchPoints(amount)
	end
	print('[ErpEventDrivenArchitecture] Done checking event: ' .. reason)
end

function OnMsg.NewMap()
	print('[ErpEventDrivenArchitecture] Handling event: OnMsg.NewMap')
	SetupEventListeners()
	--DiscoverTech('ErpAIBreakthroughRevealer')
	--GrantTech('ErpAIBreakthroughRevealer')
	print('[ErpEventDrivenArchitecture] Done handling event: OnMsg.NewMap')
end

function OnMsg.LoadGame()
	print('[ErpEventDrivenArchitecture] Handling event: OnMsg.LoadGame')
	SetupEventListeners()
	print('[ErpEventDrivenArchitecture] Done handling event: OnMsg.LoadGame')
end
