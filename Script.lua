**Abaixo estara a Lib da nossa Ui

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

local UI = Lib:Create{
    Theme = "Dark", -- or any other theme
    Size = UDim2.new(0, 555, 0, 400) -- default
 }
 
 local Main = UI:Tab{
    Name = "Inicio"
 }
 
 local Divider = Main:Divider{
    Name = "Inicio shit"
 }
 
 local QuitDivider = Main:Divider{
    Name = "Sair"
 }

 local player = game.Players.LocalPlayer
 local mouse = player:GetMouse()
 local flying = false
 local speed = 10
 local keys = { a = false, d = false, w = false, s = false }
 
 local function startFlying()
     local torso = player.Character:WaitForChild("HumanoidRootPart")
     local bg = Instance.new("BodyGyro", torso)
     bg.P = 9e4
     bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
     bg.cframe = torso.CFrame
 
     local bv = Instance.new("BodyVelocity", torso)
     bv.velocity = Vector3.new(0, 0.1, 0)
     bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
 
     while flying do
         local moveDirection = Vector3.new()
         if keys.w then
             moveDirection = moveDirection + Vector3.new(0, 1, 0)
         end
         if keys.s then
             moveDirection = moveDirection - Vector3.new(0, 1, 0)
         end
         if keys.a then
             moveDirection = moveDirection - torso.CFrame.rightVector
         end
         if keys.d then
             moveDirection = moveDirection + torso.CFrame.rightVector
         end
 
         bv.velocity = moveDirection * speed
         bg.cframe = torso.CFrame * CFrame.Angles(-math.rad(keys.w and 50 or 0), 0, 0)
         wait()
     end
 
     bv:Destroy()
     bg:Destroy()
 end
 
 mouse.KeyDown:Connect(function(key)
     if key == "w" or key == "a" or key == "s" or key == "d" then
         keys[key] = true
     end
 end)
 
 mouse.KeyUp:Connect(function(key)
     if key == "w" or key == "a" or key == "s" or key == "d" then
         keys[key] = false
     end
 end)
 
 mouse.Button1Down:Connect(function()
     flying = not flying
     if flying then
         startFlying()
     end
 end)