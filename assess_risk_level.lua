-- Dungeon Risk Assessment in BotW

-- Define a Dungeon class
local Dungeon = {}
Dungeon.__index = Dungeon

-- Constructor for Dungeon
function Dungeon:new(name, enemyLevel, treasureQuality, environmentalHazards)
    local instance = {
        name = name,
        enemyLevel = enemyLevel,          -- Integer: 1 (easy) to 10 (very hard)
        treasureQuality = treasureQuality, -- Integer: 1 (low) to 10 (high)
        environmentalHazards = environmentalHazards, -- Integer: 0 (none) to 10 (many)
    }
    setmetatable(instance, self)
    return instance
end

-- Function to assess risk level
function Dungeon:assessRisk()
    local riskLevel = self.enemyLevel + (10 - self.treasureQuality) + self.environmentalHazards
    
    if riskLevel <= 5 then
        return "Low Risk"
    elseif riskLevel <= 10 then
        return "Moderate Risk"
    elseif riskLevel <= 15 then
        return "High Risk"
    else
        return "Extreme Risk"
    end
end

-- Function to display dungeon details
function Dungeon:displayInfo()
    print("Dungeon: " .. self.name)
    print("Enemy Level: " .. self.enemyLevel)
    print("Treasure Quality: " .. self.treasureQuality)
    print("Environmental Hazards: " .. self.environmentalHazards)
    print("Risk Level: " .. self:assessRisk())
    print("---------------")
end

-- Example Dungeons
local dungeons = {
    Dungeon:new("Great Plateau", 3, 7, 1),
    Dungeon:new("Hyrule Castle", 8, 9, 5),
    Dungeon:new("Gerudo Desert", 6, 5, 7),
    Dungeon:new("Zora's Domain", 4, 8, 2),
}

-- Assess risk levels for each dungeon
for _, dungeon in ipairs(dungeons) do
    dungeon:displayInfo()
end
