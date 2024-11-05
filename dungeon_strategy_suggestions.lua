-- Dungeon Strategy Suggestions for BotW

-- Define a table to hold strategies
local dungeonStrategies = {
    preparation = {
        "Gather resources like health-restoring items and weapons.",
        "Cook meals that grant temporary hearts or buffs (increased attack or defense).",
        "Choose armor based on the dungeon's environment or enemy types."
    },
    environment = {
        "Look for clues in the environment to solve puzzles.",
        "Use the Sheikah Slate's runes creatively (Magnesis, Stasis, Cryonis, Bombs)."
    },
    combat = {
        "Utilize stealth to avoid detection by strong enemies.",
        "Master dodge and parry mechanics for flurry rush and perfect guard.",
        "Use the right weapon for the job; different weapons excel against different enemies."
    },
    exploration = {
        "Explore thoroughly for hidden treasures and shortcuts.",
        "Check for secret areas that may contain valuable items or shortcuts."
    },
    teamwork = {
        "If playing multiplayer, coordinate with your partner for tackling tougher challenges.",
        "Utilize the abilities of other players to complement your play style."
    }
}

-- Function to display strategies
local function displayStrategies()
    print("Dungeon Strategy Suggestions for BotW:")
    print("---------------------------------------")
    
    for category, strategies in pairs(dungeonStrategies) do
        print(category:upper() .. ":")
        for _, strategy in ipairs(strategies) do
            print(" - " .. strategy)
        end
        print()  -- Print a blank line for separation
    end
end

-- Main function to execute the program
local function main()
    displayStrategies()
end

-- Run the main function
main()
