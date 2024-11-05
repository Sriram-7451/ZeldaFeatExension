-- Credit Earning Methods in BotW (Simulated)

-- Define a table to hold different credit earning methods
local creditMethods = {
    quests = {
        {name = "Side Quest: Animal Rescue", reward = 50},
        {name = "Main Quest: Defeat the Lynel", reward = 200},
        {name = "Side Quest: Treasure Hunt", reward = 30},
    },
    defeatingEnemies = {
        {enemy = "Bokoblin", reward = 5},
        {enemy = "Lynel", reward = 100},
        {enemy = "Guardian", reward = 150},
    },
    treasure = {
        {treasure = "Chest in Hyrule Castle", reward = 80},
        {treasure = "Chest in Korok Forest", reward = 40},
    },
}

-- Define a function to calculate total credits earned from quests
function calculateCreditsFromQuests()
    local totalCredits = 0
    for _, quest in ipairs(creditMethods.quests) do
        totalCredits = totalCredits + quest.reward
    end
    return totalCredits
end

-- Define a function to calculate total credits earned from defeating enemies
function calculateCreditsFromEnemies()
    local totalCredits = 0
    for _, enemy in ipairs(creditMethods.defeatingEnemies) do
        totalCredits = totalCredits + enemy.reward
    end
    return totalCredits
end

-- Define a function to calculate total credits from finding treasure
function calculateCreditsFromTreasure()
    local totalCredits = 0
    for _, treasure in ipairs(creditMethods.treasure) do
        totalCredits = totalCredits + treasure.reward
    end
    return totalCredits
end

-- Main function to calculate total credits
function calculateTotalCredits()
    local totalCredits = 0
    totalCredits = totalCredits + calculateCreditsFromQuests()
    totalCredits = totalCredits + calculateCreditsFromEnemies()
    totalCredits = totalCredits + calculateCreditsFromTreasure()
    
    print("Total Credits Earned: " .. totalCredits)
end

-- Run the program
calculateTotalCredits()
