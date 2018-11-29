techs = [{
    'name': 'AI Breakthrough Revealer',
    'description': 'Uses advanced AI-bots to reveal a breakthrough technology.',
    'remarks': 'This tech is repeatable and ignores the breakthrough cap set by the game, allowing all breakthroughs to be revealed!',
    'range': (7, 12),
    'field': 'Robotics'
}, {
    'name': 'Compressed Matter',
    'description': 'Uses an evolution of the ZIP format to compress solid matter, increasing the capacity of RC Transport in 30 units.',
    'remarks': 'Effect stacks with other similar technologies.',
    'range': (3, 8),
    'field': 'Physics'
}, {
    'name': 'Event Driven Architecture',
    'description': 'Generates research points from distinct events that happen during the mission.',
    'remarks': 'Events include: anomalies analyzed, natural events ended, meteor intercepted, dome hit by meteor, rocket landed/launched, achievement unlocked, building upgraded, colony approval passed, and sector scanned',
    'range': (1, 6),
    'field': 'Robotics'
}, {
    'name': 'Extended Sponsor Research',
    'description': 'Further negotiations with the sponsor improve the generated research by 700 points.',
    'remarks': 'Effect stacks with other similar technologies.',
    'range': (1, 6),
    'field': 'Social'
}, {
    'name': 'Outsource Discount',
    'description': 'As the mission moves forward more research companies compete for outsourcing contracts, dropping the cost by 50%.',
    'remarks': '',
    'range': (7, 14),
    'field': 'Social'
}, {
    'name': 'Resupply Alternatives',
    'description': 'The mission progress leads to advances in the field of materials engineering, replacing the resupply materials with cheaper and lighter alternatives.',
    'remarks': 'Resupply price and weight reduced by 20%.',
    'range': (1, 6),
    'field': 'Physics'
}, {
    'name': 'Tech Field Booster',
    'description': 'Uses biocomputers - those made from human living cells - to assist research in all tech fields, granting a 20% boost',
    'remarks': '',
    'range': (3, 8),
    'field': 'Biotech'
}, {
    'name': 'Lights Out',
    'description': 'Sets strict electricity usage limits for each family living in apartments, cutting down the power consumption by half.',
    'remarks': '',
    'range': (3, 8),
    'field': 'Social'
}, {
    'name': '',
    'description': '',
    'remarks': '',
    'range': (0, 0),
    'field': 'unknown'
}]

costs = {
    'regular': [1000, 1000, 1500, 1500, 2000, 2000, 3000, 3000, 4500, 4500, 7000, 7000, 10000, 10000, 15000, 15000,
                20000, 20000, 20000, 30000, 30000, 40000],
    'breakthrough': [2000, 2000, 3000, 3000, 4000, 4000, 6000, 6000, 9000, 9000, 14000, 14000, 20000, 20000, 30000,
                     30000, 40000, 40000, 40000, 60000, 60000, 80000, 80000]
}


def get_cost_range(tech):
    cost = costs['breakthrough'] if tech['name'] is 'breakthrough' else costs['regular']
    return cost[tech['range'][0] - 1], cost[tech['range'][1] - 1]


for tech in techs:
    if not tech['name']:
        continue

    cost_range = get_cost_range(tech)

    print('[quote]')
    print(f'[h1][b]{tech["name"]}[/b][/h1]')
    print(f'[b]{tech["description"]}[/b]')
    if tech['remarks']:
        print(f'{tech["remarks"]}')
    print(f'[i]Field: {tech["field"].lower()} | Range: {tech["range"][0]}-{tech["range"][1]} | Cost: {cost_range[0]}-{cost_range[1]} RP[/i]')
    print('[/quote]\n')
