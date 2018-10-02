return {123
PlaceObj('ModItemCode', {
	'name', "EventDrivenArchitectureEffect",
	'comment', "Supports the 'Event Driven Architecture' technology",
	'FileName', "Code/EventDrivenArchitectureEffect.lua",
}),
PlaceObj('ModItemTechPreset', {
	comment = "Reduces the electricity usage of apartments",
	description = T{214691663240, --[[ModItemTechPreset ErpLightsOut description]] 'Sets strict electricity usage limits for each family living in apartments, cutting down the power consumption by half.\n\n<grey>"Waste is worse than loss."\n<right>Thomas Edison<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpLightsOut display_name]] "Lights Out"},
	group = "Social",
	icon = "UI/lights_out.tga",
	id = "ErpLightsOut",
	param1comment = "",
	position = range(3, 8),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Apartments",
		Percent = -50,
		Prop = "electricity_consumption",
		comment = "ErpLightsOut-Effect",
	}),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Reveals breakthrough technologies",
	description = T{847837112377, --[[ModItemTechPreset ErpAIBreakthroughRevealer description]] 'Uses advanced AI-bots to reveal a breakthrough technology. This tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>"Success in creating effective AI, could be the biggest event in the history of our civilization. Or the worst."\n<right>Stephen Hawking<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpAIBreakthroughRevealer display_name]] "AI Breakthrough Revealer"},
	group = "Robotics",
	icon = "UI/ai_breakthrough_revealer.tga",
	id = "ErpAIBreakthroughRevealer",
	name = "AI Breakthrough Revealer",
	position = range(7, 12),
	repeatable = true,
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
print('[ErpAIBreakthroughRevealer] Revealing random breakthrough')
for _,tech_id in ipairs(UICity.tech_field['Breakthroughs']) do
  print('[ErpAIBreakthroughRevealer] Checking: ' .. tech_id)
	if(not IsTechDiscovered(tech_id)) then
		print('[ErpAIBreakthroughRevealer] Revealing: ' .. tech_id)
		DiscoverTech(tech_id)
		break
	end
end
print('[ErpAIBreakthroughRevealer] Done revealing random breakthrough')
end,
	}),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Increases the RC Transport cargo capacity",
	description = T{633059147019, --[[ModItemTechPreset ErpCompressedMatter description]] 'Uses an evolution of the ZIP format to compress solid matter, increasing the capacity of RC Transport in <param1> units.<newline><newline><grey>"It was just a hobby. I didn\'t expect it to turn into a business."<newline><right>Phil Katz, inventor of the ZIP format<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpCompressedMatter display_name]] "Compressed Matter"},
	group = "Physics",
	icon = "UI/compressed_matter.tga",
	id = "ErpCompressedMatter",
	name = "Compressed Matter",
	param1 = 30,
	param1comment = "Extra capacity",
	position = range(3, 8),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
print('[ErpCompressedMatter] Increasing RCTransport max storage by ' .. parent.param1)
CreateLabelModifier('ErpCompressedMatter-Effect', 'RCTransport', 'max_shared_storage', parent.param1, 0)
end,
	}),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Generates research points from distinct events",
	description = T{578099905452, --[[ModItemTechPreset ErpEventDrivenArchitecture description]] 'Generates research points from distinct events that happen during the mission.<newline><newline><grey>"Often it doesn\'t expect any answer at all, or if there is a response that the source does care about, it\'s indirect."<newline><right>Martin Fowler, Software Architect<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpEventDrivenArchitecture display_name]] "Event Driven Architecture"},
	group = "Robotics",
	icon = "UI/event_driven_architecture.tga",
	id = "ErpEventDrivenArchitecture",
	name = "Event Driven Architecture",
	position = range(1, 6),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Increases the sponsor research amount",
	description = T{887490482208, --[[ModItemTechPreset ErpExtendedSponsorResearch description]] 'Further negotiations with the sponsor improve the generated research by <param1> points.<newline><newline><grey>"You shouldn’t try to tackle the entire deal in one meeting, and you should never try to negotiate before understanding the rest of the details."<newline><right>Warren Buffett<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpExtendedSponsorResearch display_name]] "Extended Sponsor Research"},
	group = "Social",
	icon = "UI/extended_sponsor_research.tga",
	id = "ErpExtendedSponsorResearch",
	name = "Extended Sponsor Research",
	param1 = 500,
	param1comment = "Research point increase",
	position = range(1, 6),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
print('[ErpExtendedSponsorResearch] Increasing sponsor research by ' .. parent.param1)
CreateLabelModifier('ErpExtendedSponsorResearch-Effect', 'Consts', 'SponsorResearch', parent.param1, 0)
end,
	}),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Decreases the outsource research cost",
	description = T{631714357427, --[[ModItemTechPreset ErpOutsourceDiscount description]] 'As the mission moves forward more research companies compete for outsourcing contracts, dropping the cost by <param1>%.\n\n<grey>"Underlying most arguments against the free market is a lack of belief in freedom itself."\n<right>Milton Friedman<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpOutsourceDiscount display_name]] "Outsource Discount"},
	group = "Social",
	icon = "UI/outsource_discount.tga",
	id = "ErpOutsourceDiscount",
	name = "Outsource Discount",
	param1 = 50,
	param1comment = "DiscountPercent",
	position = range(7, 14),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
print('[ErpOutsourceDiscount] Enabling outsource discount of ' .. parent.param1 .. '%')
CreateLabelModifier('ErpOutsourceDiscount-Effect', 'Consts', 'OutsourceResearchCost', 0, -parent.param1)
end,
	}),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Decreases the resupply material cost and weight",
	description = T{665228128968, --[[ModItemTechPreset ErpResupplyAlternatives description]] 'The mission progress leads to advances in the field of materials engineering, replacing the resupply materials with cheaper and lighter alternatives.<newline><newline><grey>"The skyscrapers of the future will be made of wood."<newline><right>Peter Wilson, Architect<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpResupplyAlternatives display_name]] "Resupply Alternatives"},
	group = "Physics",
	icon = "UI/resupply_alternatives.tga",
	id = "ErpResupplyAlternatives",
	name = "Resupply Alternatives",
	param1 = -20,
	param1comment = "Price discount",
	param2 = -20,
	param2comment = "Weight decrease",
	position = range(1, 6),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
print('[ErpResupplyAlternatives] Applying resupply effects: price ' .. parent.param1 .. '%, weight ' .. parent.param2 .. 'Kg')
ModifyResupplyParams('price', parent.param1)
ModifyResupplyParams('weight', parent.param2)
end,
	}),
}),
PlaceObj('ModItemTechPreset', {
	comment = "Adds boost effect to tech fields",
	description = T{633059147019, --[[ModItemTechPreset ErpTechFieldBooster description]] 'Uses biocomputers - those made from human living cells - to assist research in all tech fields, granting a <param1>% boost.<newline><newline><grey>"Pretty much anything can be a computer, if it can compute logical functions, store data, and transmit information -- even living cells."<newline><right>Drew Endy, Bioengineering professor<left></grey>'},
	display_name = T{3900, --[[ModItemTechPreset ErpTechFieldBooster display_name]] "Tech Field Booster"},
	group = "Biotech",
	icon = "UI/tech_field_booster.tga",
	id = "ErpTechFieldBooster",
	name = "Tech Field Booster",
	param1 = 20,
	param1comment = "Boost percentage",
	position = range(3, 8),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
print('[ErpTechFieldBooster] Boosting all tech fields by ' .. parent.param1 .. '%')
BoostTechField('', parent.param1)
end,
	}),
}),
}
