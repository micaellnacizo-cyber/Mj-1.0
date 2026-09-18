-- 💜 MJ 1.0 | by Mikael_N244BR
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera

local st={noclip=false,infJump=false,vovo=false,mira=false,chave=false,arremesso=false,speed=16}
local verde=Color3.fromRGB(180,120,255)
local roxo=Color3.fromRGB(150,80,255)
local roxoEsc=Color3.fromRGB(90,50,170)
local roxoClaro=Color3.fromRGB(220,180,255)

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false

-- ═══════ 🚀 FOGUETE ULTRA ANIMADO ═══════
local rocket=Instance.new("TextLabel",gui)
rocket.Size=UDim2.new(0,80,0,80)
rocket.Position=UDim2.new(0.5,-40,1,80)
rocket.BackgroundTransparency=1
rocket.Text="🚀"
rocket.TextScaled=true
rocket.Font=Enum.Font.GothamBold
rocket.ZIndex=15

local fogo=Instance.new("TextLabel",gui)
fogo.Size=UDim2.new(0,50,0,50)
fogo.BackgroundTransparency=1
fogo.Text="🔥"
fogo.TextScaled=true
fogo.ZIndex=14

local sparks={}
for i=1,25 do
 local s=Instance.new("TextLabel",gui)
 s.Size=UDim2.new(0,16,0,16)
 s.BackgroundTransparency=1
 s.Text="✨"
 s.TextScaled=true
 s.Visible=false
 s.ZIndex=13
 table.insert(sparks,s)
end

local smokes={}
for i=1,20 do
 local s=Instance.new("Frame",gui)
 s.Size=UDim2.new(0,22,0,22)
 s.BackgroundColor3=Color3.fromRGB(230,230,255)
 s.BackgroundTransparency=0.4
 s.BorderSizePixel=0
 s.Visible=false
 s.ZIndex=12
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(smokes,s)
end

local explosao=Instance.new("TextLabel",gui)
explosao.Size=UDim2.new(0,10,0,10)
explosao.BackgroundTransparency=1
explosao.Text="💥"
explosao.TextScaled=true
explosao.Visible=false
explosao.ZIndex=20

local nomeMJ=Instance.new("TextLabel",gui)
nomeMJ.Size=UDim2.new(0,500,0,100)
nomeMJ.Position=UDim2.new(0.5,-250,0.5,-50)
nomeMJ.BackgroundTransparency=1
nomeMJ.Text="MJ 1.0"
nomeMJ.TextColor3=Color3.fromRGB(255,255,255)
nomeMJ.TextStrokeColor3=roxo
nomeMJ.TextStrokeTransparency=0
nomeMJ.Font=Enum.Font.GothamBold
nomeMJ.TextSize=60
nomeMJ.TextTransparency=1
nomeMJ.ZIndex=20

task.spawn(function()
 for t=0,1,0.006 do
  local yPos=1-t
  rocket.Position=UDim2.new(0.5,-40,yPos,0)
  rocket.Rotation=math.sin(t*15)*20
  
  fogo.Position=UDim2.new(0.5,-25,yPos,65)
  fogo.Size=UDim2.new(0,50+math.random(-8,8),0,50+math.random(-8,8))
  fogo.Rotation=math.random(-15,15)
  
  for i,s in ipairs(smokes) do
   s.Visible=true
   local off=0.04*i
   s.Position=UDim2.new(0.5+math.random(-50,50)/100,-11,yPos+off,0)
   s.BackgroundTransparency=0.2+(i/20)*0.7
   s.Size=UDim2.new(0,20-i/2,0,20-i/2)
  end
  
  for i,s in ipairs(sparks) do
   if not s.Visible then
    s.Visible=true
    s.Position=UDim2.new(0.5+math.random(-40,40)/100,-8,yPos+0.05+math.random(0,15)/100,0)
    s.TextTransparency=math.random(0,40)/100
   end
   s.Position=s.Position+UDim2.new(math.random(-3,3)/100,0,-2/100,0)
   s.TextTransparency=s.TextTransparency+0.02
  end
  
  task.wait(0.012)
 end
 
 -- Explosão
 explosao.Position=UDim2.new(0.5,-100,-0.15,0)
 explosao.Size=UDim2.new(0,200,0,200)
 explosao.Visible=true
 for i=1,15 do
  explosao.Size=UDim2.new(0,200+i*30,0,200+i*30)
  explosao.Position=UDim2.new(0.5,-100-i*15,-0.15-i*15,0)
  explosao.TextTransparency=i/15
  task.wait(0.03)
 end
 explosao:Destroy()
 rocket:Destroy()
 fogo:Destroy()
 for _,s in ipairs(smokes) do s:Destroy() end
 for _,s in ipairs(sparks) do s:Destroy() end
 
 -- Nome aparece piscando
 nomeMJ.Text="🚀 MJ 1.0 🚀"
 for i=1,8 do
  nomeMJ.TextTransparency=math.abs(math.sin(i/2))
  nomeMJ.TextSize=60+i*3
  task.wait(0.08)
 end
 nomeMJ.TextTransparency=0
 nomeMJ.Text="✨ MJ 1.0 ✨"
 task.wait(1)
 for i=1,20 do
  nomeMJ.TextTransparency=i/20
  task.wait(0.03)
 end
 nomeMJ:Destroy()
end)

task.wait(4)

-- ═══════ 🎯 BOLINHA MJ ═══════
local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,60,0,60)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(15,8,35)
ball.BorderSizePixel=0
ball.Active=true
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bs=Instance.new("UIStroke",ball)
bs.Color=roxo
bs.Thickness=3

local mj=Instance.new("TextLabel",ball)
mj.Size=UDim2.new(1,0,1,0)
mj.BackgroundTransparency=1
mj.Text="💜MJ💜"
mj.TextColor3=roxoClaro
mj.TextStrokeColor3=roxo
mj.TextStrokeTransparency=0.3
mj.Font=Enum.Font.GothamBold
mj.TextScaled=true
mj.ZIndex=5

-- ═══════ 🎨 PAINEL ═══════
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,270,0,400)
panel.Position=UDim2.new(0,90,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(10,5,25)
panel.BorderSizePixel=0
panel.Visible=false
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=roxo
ps.Thickness=2

-- ═══════ ESTRELAS DO PAINEL ═══════
for i=1,30 do
 local s=Instance.new("Frame",panel)
 s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
 s.Position=UDim2.new(math.random()*0.95,0,math.random()*0.95,0)
 s.BackgroundColor3=Color3.fromRGB(220,220,255)
 s.BackgroundTransparency=math.random(40,80)/100
 s.BorderSizePixel=0
 s.ZIndex=1
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
end

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,32)
titulo.BackgroundColor3=roxoEsc
titulo.Text="💜✨ MJ 1.0 ✨💜"
titulo.TextColor3=Color3.fromRGB(255,255,255)
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=15
titulo.BorderSizePixel=0
titulo.ZIndex=3
Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local cred=Instance.new("TextLabel",panel)
cred.Size=UDim2.new(1,0,0,16)
cred.Position=UDim2.new(0,0,0,34)
cred.BackgroundTransparency=1
cred.Text="💜 by Mikael_N244BR 💜"
cred.TextColor3=roxoClaro
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=3

local fec=Instance.new("TextButton",panel)
fec.Size=UDim2.new(0,22,0,22)
fec.Position=UDim2.new(1,-26,0,5)
fec.BackgroundColor3=Color3.fromRGB(200,30,60)
fec.Text="❌"
fec.TextColor3=Color3.fromRGB(255,255,255)
fec.Font=Enum.Font.GothamBold
fec.TextSize=12
fec.BorderSizePixel=0
fec.ZIndex=4
Instance.new("UICorner",fec).CornerRadius=UDim.new(1,0)
fec.MouseButton1Click:Connect(function() panel.Visible=false end)

-- ═══════ ABAS ═══════
local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,30)
tabBar.Position=UDim2.new(0,5,0,55)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local tabNomes={"🏠 Principal","👵 Vovó","💪 Arremessar","⚙️ Extra"}
local tabBtns={}
local conteudos={}

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",tabBar)
 b.Size=UDim2.new(1/#tabNomes,-2,1,0)
 b.Position=UDim2.new((i-1)/#tabNomes,0,0,0)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=nome
 b.TextColor3=Color3.fromRGB(200,200,220)
 b.Font=Enum.Font.Gotham
 b.TextSize=9
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 table.insert(tabBtns,b)
 
 local c=Instance.new("ScrollingFrame",panel)
 c.Size=UDim2.new(1,-10,1,-95)
 c.Position=UDim2.new(0,5,0,90)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=4
 c.ScrollBarImageColor3=roxo
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=i==1
 c.ZIndex=3
 table.insert(conteudos,c)
 
 b.MouseButton1Click:Connect(function()
  for j=1,#conteudos do
   conteudos[j].Visible=j==i
   tabBtns[j].BackgroundColor3=j==i and roxoEsc or Color3.fromRGB(40,25,80)
   tabBtns[j].TextColor3=j==i and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,220)
  end
 end)
end
tabBtns[1].BackgroundColor3=roxoEsc
tabBtns[1].TextColor3=Color3.fromRGB(255,255,255)

local function addT(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,30)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=txt.." ⭕"
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.GothamBold
 b.TextSize=12
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 local sk=Instance.new("UIStroke",b)
 sk.Color=roxoEsc
 sk.Thickness=1
 b.MouseButton1Click:Connect(function()
  local v=not b:GetAttribute("on")
  b:SetAttribute("on",v)
  b.Text=txt..(v and " ✅" or " ⭕")
  b.BackgroundColor3=v and roxoEsc or Color3.fromRGB(40,25,80)
  fn(v)
 end)
 return b
end

local function addB(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,30)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=roxo
 b.Text=txt
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.GothamBold
 b.TextSize=12
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function() fn(b) end)
 return b
end

-- Arrastar
local drag,dStart,sPos=false,nil,nil
local clickStart=0
ball.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=true dStart=i.Position sPos=ball.Position clickStart=tick()
 end
end)
ball.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=false
  if tick()-clickStart<0.25 then
   panel.Visible=not panel.Visible
   panel.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+70,ball.Position.Y.Scale,ball.Position.Y.Offset-10)
  end
 end
end)
U.InputChanged:Connect(function(i)
 if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-dStart
  ball.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
  panel.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+70,ball.Position.Y.Scale,ball.Position.Y.Offset-10)
 end
end)

-- ═══════ LÓGICA ═══════
local function sChar(m)
 if not m then return 0 end
 local h=m:FindFirstChild("HumanoidRootPart")
 if not h then return 0 end
 return math.max(h.Size.X,h.Size.Y,h.Size.Z)
end
local function outros()
 local t={}
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then table.insert(t,{p=j,c=j.Character,s=sChar(j.Character)}) end
  end
 end
 return t
end
local vRef=nil
local function acharV()
 if vRef and vRef.Parent then
  local h=vRef:FindFirstChildOfClass("Humanoid")
  if h and h.Health>0 then return vRef end
 end
 local o=outros()
 if #o==0 then return nil end
 table.sort(o,function(a,b) return a.s>b.s end)
 vRef=o[1].c
 return o[1].c
end

R.Stepped:Connect(function()
 if st.noclip then
  local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=false end
  end end
 end
end)
U.JumpRequest:Connect(function()
 if st.infJump then
  local c=p.Character
  if c then local h=c:FindFirstChildOfClass("Humanoid")
   if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
  end
 end
end)
R:BindToRenderStep("MJA",201,function()
 if st.mira then
  local v=acharV()
  if v then
   local h=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
   if h then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,h.Position) end
  end
 end
end)

-- ESP VOVÓ
local gHL,gBB
local function espV(c)
 if not c or not c.Parent then return end
 if gHL and gHL.Parent then
  gHL.Adornee=c
 else
  gHL=Instance.new("Highlight",c)
  gHL.Adornee=c
  gHL.FillColor=roxo
  gHL.FillTransparency=0.75
  gHL.OutlineColor=roxo
  gHL.OutlineTransparency=0
  gHL.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
 end
 local h=c:FindFirstChild("Head") or c:FindFirstChild("HumanoidRootPart")
 if h then
  if gBB and gBB.Parent then
   gBB.Parent=h
  else
   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,100,0,14)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true
   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1
   local pl=P:GetPlayerFromCharacter(c)
   t.Text="👵 "..(pl and pl.Name or c.Name)
   t.TextColor3=roxoClaro
   t.TextStrokeColor3=roxo
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold
  end
 end
end
local function remV()
 if gHL and gHL.Parent then gHL:Destroy() end
 if gBB and gBB.Parent then gBB:Destroy() end
 gHL,gBB=nil,nil
end

-- ARREMESSO COM FORÇA
local forca=500
local function getTool()
 local c=p.Character
 if not c then return nil end
 for _,t in ipairs(c:GetChildren()) do
  if t:IsA("Tool") then return t end
 end
 return nil
end
local function arremessar(alvo)
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 if not root then return end
 local tool=getTool()
 if not tool then
  print("❌ Sem item na mão")
  return
 end
 local hr=alvo:FindFirstChild("HumanoidRootPart") or alvo:FindFirstChild("Head")
 if not hr then return end
 
 -- Mira
 cam.CFrame=CFrame.lookAt(cam.CFrame.Position,hr.Position)
 local flat=Vector3.new(hr.Position.X,root.Position.Y,hr.Position.Z)
 root.CFrame=CFrame.lookAt(root.Position,flat)
 task.wait(0.05)
 
 -- Clica (múltiplos métodos)
 pcall(function() mouse1click() end)
 pcall(function() mouse1press() task.wait(0.05) mouse1release() end)
 pcall(function() tool:Activate() end)
 
 print("💪 Arremesso disparado! Força: "..forca)
end

-- LOOP ESP
task.spawn(function()
 while true do
  if st.vovo then
   local v=acharV()
   if v then espV(v) end
  end
  if st.chave then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("key") or o.Name:lower():find("chave")) then
     if not o:FindFirstChild("MJK") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJK"
      hl.FillColor=roxo
      hl.OutlineColor=roxo
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
    end
   end
  end
  task.wait(0.5)
 end
end)

-- ═══════ CONTEÚDO DAS ABAS ═══════
local c1=conteudos[1]
addT(c1,5,"🚶 Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addB(c1,40,"⚡ Speed: 16",function(b)
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 b.Text="⚡ Speed: "..st.speed
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addT(c1,75,"🦘 Infinite Jump",function(v) st.infJump=v end)

local c2=conteudos[2]
addT(c2,5,"👵 ESP Vovó",function(v) st.vovo=v if not v then remV() end end)
addT(c2,40,"🎯 Mira Vovó",function(v) st.mira=v end)
addB(c2,75,"📋 Listar (F9)",function()
 local o=outros()
 table.sort(o,function(a,b) return a.s>b.s end)
 print("═══ 💜 JOGADORES ═══")
 for i,j in ipairs(o) do print("["..i.."] 👤 "..j.p.Name.." | 📏 "..string.format("%.2f",j.s)) end
end)

local c3=conteudos[3]
addB(c3,5,"💪 Arremessar (Média Força)",function()
 local v=acharV()
 if not v then print("❌ Vovó não encontrada") return end
 forca=500
 arremessar(v)
end)
addB(c3,40,"💪💥 Arremessar (Força MÁXIMA)",function()
 local v=acharV()
 if not v then print("❌ Vovó não encontrada") return end
 forca=2000
 arremessar(v)
end)
addB(c3,75,"🎯💥 Arremessar (Curva)",function()
 local v=acharV()
 if not v then print("❌ Vovó não encontrada") return end
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 local hr=v:FindFirstChild("HumanoidRootPart")
 if not root or not hr then return end
 -- Sobe um pouco antes
 local dir=(root.Position-hr.Position)
 dir=Vector3.new(dir.X,0,dir.Z)
 if dir.Magnitude<0.1 then dir=Vector3.new(0,0,1) end
 dir=dir.Unit
 root.CFrame=CFrame.new(hr.Position+dir*12+Vector3.new(0,45,0),hr.Position)
 task.wait(0.15)
 cam.CFrame=CFrame.lookAt(cam.CFrame.Position,hr.Position)
 task.wait(0.05)
 pcall(function() mouse1click() end)
 pcall(function() mouse1press() task.wait(0.05) mouse1release() end)
 print("🌀 Arremesso curvo!")
end)
addT(c3,110,"🔑 ESP Chaves",function(v) st.chave=v end)
addB(c3,145,"🧹 Limpar",function()
 for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" then o:Destroy() end
 end
end)

local c4=conteudos[4]
addB(c4,5,"🔄 Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

print("💜 [MJ 1.0] by Mikael_N244BR carregado! 💜")
