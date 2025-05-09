local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Pesci selezionabili
local pesciDisponibili = {
    "Ember Snapper",
    "Volcanic Geode",
    "Obsidian Salmon",
    "Obsidian Swordfish",
    "Herring",
    "Arctic Char",
    "Glacier Pike",
    "Pond Emperor",
    "Glacierfish",
    "Swamp Bass",
    "Bowfin",
    "Marsh Gar",
    "Alligator",
    "Haddock",
    "Mackerel",
    "Sea Bass",
    "Smallmouth Bass",
    "White Bass",
    "Golden Smallmouth Bass",
    "Gazerfish",
    "Globe Jellyfish",
    "Eyefestation",
    "Skate Tuna",
    "Phantom Ray",
    "Cockatoo Squid",
    "Shortfin Mako Shark",
    "Galleon Goliath",
    "Shipwreck Barracuda",
    "Captain’s Goldfish",
    "Deep-Sea Hatchetfish",
    "Deep-Sea Dragonfish",
    "Candy Fish",
    "Skelefish",
    "Lego Fish",
    "Phantom Megalodon",
    "Megalodon",
    "Ancient Megalodon"
}

local pescaSelezionata = nil
local autoPescaAttivata = false

-- Creiamo la GUI per la selezione del pesce
local gui = Instance.new("ScreenGui", player.PlayerGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 450)
frame.Position = UDim2.new(0.5, -150, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Visible = true

local menuPesci = Instance.new("TextButton", frame)
menuPesci.Size = UDim2.new(0, 280, 0, 50)
menuPesci.Position = UDim2.new(0.5, -140, 0, 20)
menuPesci.Text = "Seleziona Pesce"
menuPesci.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuPesci.TextColor3 = Color3.fromRGB(255, 255, 255)

local dropdown = Instance.new("Frame", frame)
dropdown.Size = UDim2.new(0, 280, 0, 200)
dropdown.Position = UDim2.new(0.5, -140, 0, 80)
dropdown.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
dropdown.Visible = false

-- Aggiungiamo un menu a tendina con tutti i pesci
for i, pesce in ipairs(pesciDisponibili) do
    local button = Instance.new("TextButton", dropdown)
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, (i - 1) / #pesciDisponibili, 0)
    button.Text = pesce
    button.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.MouseButton1Click:Connect(function()
        pescaSelezionata = pesce
        menuPesci.Text = "Pesce Selezionato: " .. pescaSelezionata
        dropdown.Visible = false
    end)
end

menuPesci.MouseButton1Click:Connect(function()
    dropdown.Visible = not dropdown.Visible
end)

-- Aggiungiamo un bottone di pesca
local pescaButton = Instance.new("TextButton", frame)
pescaButton.Size = UDim2.new(0, 280, 0, 50)
pescaButton.Position = UDim2.new(0.5, -140, 0, 300)
pescaButton.Text = "Pesca!"
pescaButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
pescaButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Funzione che simula la pesca
local function iniziaPesca()
    if pescaSelezionata then
        -- Simula la pesca del pesce scelto
        print("Pesca in corso... Pescando il pesce: " .. pescaSelezionata)
        -- Qui puoi aggiungere il codice per attivare l'animazione di pesca o il processo di pesca in gioco
    else
        print("Seleziona un pesce prima di pescare.")
    end
end

-- Colleghiamo la funzione di pesca al bottone
pescaButton.MouseButton1Click:Connect(function()
    iniziaPesca()
end)

-- Funzione per attivare/disattivare l'auto-pesca con il tasto R
local function toggleAutoPesca()
    autoPescaAttivata = not autoPescaAttivata
    if autoPescaAttivata then
        print("Auto-pesca attivata")
    else
        print("Auto-pesca disattivata")
    end
end

-- Imposta il tasto "R" per attivare/disattivare l'auto-pesca
mouse.KeyDown:Connect(function(key)
    if key:lower() == "r" then
        toggleAutoPesca()
    end
end)

-- Funzione di auto-pesca (la pesca automatica avviene ogni 5 secondi se attivata)
while true do
    wait(5)
    if autoPescaAttivata then
        if pescaSelezionata then
            print("Auto-pesca in corso... Pescando il pesce: " .. pescaSelezionata)
            -- Qui puoi aggiungere il codice per attivare l'animazione di pesca automatica
        else
            print("Seleziona un pesce per l'auto-pesca.")
        end
    end
end

-- Rendi la GUI visibile al giocatore
gui.Enabled = true
