-- ⚫ MJ 1.0 | by Mikael_n244br
pcall(function()
    local old=game.CoreGui:FindFirstChild("MJ")
    if old then old:Destroy() end
end)

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local SS=game:GetService("SoundService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_n244br"

local st={noclip=false,vovo=false,mira=false,chave=false,porta=false,alerta=false,speed=16,cor=1}
local branco=Color3.fromRGB(255,255,255)
local cinza=Color3.fromRGB(200,200,220)

local cores={
 {n="⚪ Branco",c=Color3.fromRGB(255,255,255)},
 {n="🟡 Amarelo",c=Color3.fromRGB(255,255,0)},
 {n="🟢 Verde",c=Color3.fromRGB(0,255,0)},
 {n="🔴 Vermelho",c=Color3.fromRGB(255,0,0)},
 {n="🔵 Azul",c=Color3.fromRGB(0,150,255)},
 {n="🟣 Roxo",c=Color3.fromRGB(180,0,255)},
 {n="🩷 Rosa",c=Color3.fromRGB(255,0,180)},
 {n="💠 Ciano",c=Color3.fromRGB(0,255,255)},
 {n="🟠 Laranja",c=Color3.fromRGB(255,130,0)},
 {n="🌈 Rainbow",c="rainbow"},
}
local function getCor()
 local c=cores[st.cor].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false

-- 🚀 FOGUETE
local rocket=Instance.new("TextLabel",gui)
rocket.Size=UDim2.new(0,80,0,80)
rocket.Position=UDim2.new(0.5,-40,1,80)
rocket.BackgroundTransparency=1
rocket.Text="🚀"
rocket.TextScaled=true
rocket.Font=Enum.Font.GothamBold
rocket.ZIndex=15

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
 s.BackgroundColor3=branco
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
nomeMJ.Size=UDim2.new(0,500,0,120)
nomeMJ.Position=UDim2.new(0.5,-250,0.5,-60)
nomeMJ.BackgroundTransparency=1
nomeMJ.Text="⚫ MJ 1.0 ⚫"
nomeMJ.TextColor3=branco
nomeMJ.TextStrokeColor3=Color3.fromRGB(80,80,80)
nomeMJ.TextStrokeTransparency=0
nomeMJ.Font=Enum.Font.GothamBold
nomeMJ.TextSize=70
nomeMJ.TextTransparency=1
nomeMJ.ZIndex=20

task.spawn(function()
 for t=0,1,0.006 do
  local yPos=1-t
  rocket.Position=UDim2.new(0.5,-40,yPos,0)
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
 for _,s in ipairs(smokes) do s:Destroy() end
 for _,s in ipairs(sparks) do s:Destroy() end
 
 -- ✨ NOME MJ 1.0 PISCANDO
 for i=1,10 do
  nomeMJ.TextTransparency=math.abs(math.sin(i/2))
  nomeMJ.TextSize=70+i*2
  task.wait(0.08)
 end
 nomeMJ.TextTransparency=0
 nomeMJ.TextSize=70
 task.wait(1.2)
 for i=1,20 do
  nomeMJ.TextTransparency=i/20
  task.wait(0.03)
 end
 nomeMJ:Destroy()
end)

task.wait(5.5)

-- ⚫ BOLINHA MJ
local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,60,0,60)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(5,5,5)
ball.BorderSizePixel=0
ball.Active=true
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bs=Instance.new("UIStroke",ball)
bs.Color=branco
bs.Thickness=2

for i=1,12 do
 local s=Instance.new("Frame",ball)
 s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
 s.Position=UDim2.new(math.random()*90/100,0,math.random()*90/100,0)
 s.BackgroundColor3=branco
 s.BackgroundTransparency=math.random(0,40)/100
 s.BorderSizePixel=0
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
end

local mj=Instance.new("TextLabel",ball)
mj.Size=UDim2.new(1,0,1,0)
mj.BackgroundTransparency=1
mj.Text="MJ"
mj.TextColor3=branco
mj.TextStrokeColor3=Color3.fromRGB(0,0,0)
mj.TextStrokeTransparency=0.2
mj.Font=Enum.Font.GothamBold
mj.TextScaled=true
mj.ZIndex=5

-- ⚫ PAINEL COM ABAS
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,280,0,400)
panel.Position=UDim2.new(0,90,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,5,5)
panel.BorderSizePixel=0
panel.Visible=false
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=branco
ps.Thickness=1.5

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,32)
titulo.BackgroundColor3=Color3.fromRGB(30,30,30)
titulo.Text="⚫✨ MJ 1.0 ✨⚫"
titulo.TextColor3=branco
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=15
titulo.BorderSizePixel=0
titulo.ZIndex=3
Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local cred=Instance.new("TextLabel",panel)
cred.Size=UDim2.new(1,0,0,14)
cred.Position=UDim2.new(0,0,0,32)
cred.BackgroundTransparency=1
cred.Text="💜 by "..CRIADOR
cred.TextColor3=cinza
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=3

local fec=Instance.new("TextButton",panel)
fec.Size=UDim2.new(0,22,0,22)
fec.Position=UDim2.new(1,-26,0,5)
fec.BackgroundColor3=Color3.fromRGB(180,30,50)
fec.Text="❌"
fec.TextColor3=branco
fec.Font=Enum.Font.GothamBold
fec.TextSize=11
fec.BorderSizePixel=0
fec.ZIndex=4
Instance.new("UICorner",fec).CornerRadius=UDim.new(1,0)
fec.MouseButton1Click:Connect(function() panel.Visible=false end)

-- ABAS
local tabNomes={"🏠 Principal","👵 Vovó","🔑 Chaves","🎨 Cores"}
local tabBtns={}
local conteudos={}
local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,26)
tabBar.Position=UDim2.new(0,5,0,52)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-90)
content.Position=UDim2.new(0,5,0,83)
content.BackgroundTransparency=1
content.ZIndex=3

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",tabBar)
 b.Size=UDim2.new(1/#tabNomes,-2,1,0)
 b.Position=UDim2.new((i-1)/#tabNomes,0,0,0)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=cinza
 b.Font=Enum.Font.GothamBold
 b.TextSize=9
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 table.insert(tabBtns,b)
 
 local c=Instance.new("ScrollingFrame",content)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=4
 c.ScrollBarImageColor3=branco
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=(i==1)
 c.ZIndex=3
 table.insert(conteudos,c)
 
 b.MouseButton1Click:Connect(function()
  for j=1,#conteudos do
   conteudos[j].Visible=(j==i)
   tabBtns[j].BackgroundColor3=(j==i) and Color3.fromRGB(60,60,60) or Color3.fromRGB(25,25,25)
   tabBtns[j].TextColor3=(j==i) and branco or cinza
  end
 end)
end
tabBtns[1].BackgroundColor3=Color3.fromRGB(60,60,60)
tabBtns[1].TextColor3=branco

local function addT(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,30)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(30,30,30)
 b.Text=txt.." ⭕"
 b.TextColor3=branco
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 local sk=Instance.new("UIStroke",b)
 sk.Color=Color3.fromRGB(100,100,100)
 sk.Thickness=1
 b.MouseButton1Click:Connect(function()
  local v=not b:GetAttribute("on")
  b:SetAttribute("on",v)
  b.Text=txt..(v and " ✅" or " ⭕")
  b.BackgroundColor3=v and Color3.fromRGB(60,60,60) or Color3.fromRGB(30,30,30)
  fn(v)
 end)
end

local function addB(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,30)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(50,50,50)
 b.Text=txt
 b.TextColor3=branco
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function() fn(b) end)
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

-- LÓGICA
local function sChar(m)
 if not m then return 0 end
 local h=m:FindFirstChild("HumanoidRootPart")
 if not h then return 0 end
 return math.max(h.Size.X,h.Size.Y,h.Size.Z)
end
local vRef=nil
local function acharV()
 if vRef and vRef.Parent then
  local h=vRef:FindFirstChildOfClass("Humanoid")
  if h and h.Health>0 then return vRef end
 end
 local maior,tam=nil,0
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then
    local s=sChar(j.Character)
    if s>tam then maior,tam=j.Character,s end
   end
  end
 end
 vRef=maior
 return maior
end

R.Stepped:Connect(function()
 if st.noclip then
  local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=false end
  end end
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

local som=Instance.new("Sound",SS)
som.SoundId="rbxassetid://9120386436"
som.Volume=2

local gHL,gBB
local function espV(c)
 if not c or not c.Parent then return end
 local cor=getCor()
 if gHL and gHL.Parent then
  gHL.Adornee=c
  gHL.FillColor=cor
  gHL.OutlineColor=cor
 else
  gHL=Instance.new("Highlight",c)
  gHL.Adornee=c
  gHL.FillColor=cor
  gHL.FillTransparency=0.75
  gHL.OutlineColor=cor
  gHL.OutlineTransparency=0
  gHL.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
 end
 local h=c:FindFirstChild("Head") or c:FindFirstChild("HumanoidRootPart")
 if h then
  if gBB and gBB.Parent then
   gBB.Parent=h
   local t=gBB:FindFirstChildWhichIsA("TextLabel")
   if t then t.TextColor3=cor end
  else
   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,100,0,12)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true
   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1
   local pl=P:GetPlayerFromCharacter(c)
   t.Text="👵 "..(pl and pl.Name or c.Name)
   t.TextColor3=cor
   t.TextStrokeColor3=Color3.fromRGB(0,0,0)
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold
  end
 end
end

local ultimoBip=0
task.spawn(function()
 while true do
  local cor=getCor()
  local v=(st.vovo or st.alerta) and acharV() or nil
  if v then
   if st.vovo then espV(v) end
   if st.alerta then
    local myC=p.Character
    local myRoot=myC and myC:FindFirstChild("HumanoidRootPart")
    local vRoot=v:FindFirstChild("HumanoidRootPart")
    if myRoot and vRoot then
     local dist=(myRoot.Position-vRoot.Position).Magnitude
     if dist<40 and tick()-ultimoBip>1 then
      ultimoBip=tick()
      pcall(function() som:Play() end)
      print("🚨 Vovo perto! "..math.floor(dist).." studs")
     end
    end
   end
  end
  if st.chave then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("key") or o.Name:lower():find("chave")) then
     if not o:FindFirstChild("MJK") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJK"
      hl.FillColor=cor
      hl.OutlineColor=cor
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
    end
   end
  end
  if st.porta then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("door") or o.Name:lower():find("porta") or o.Name:lower():find("lock") or o.Name:lower():find("fechadura")) then
     if not o:FindFirstChild("MJP") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJP"
      hl.FillColor=cor
      hl.OutlineColor=cor
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
    end
   end
  end
  if cores[st.cor].c=="rainbow" then
   if gHL and gHL.Parent then gHL.FillColor=cor gHL.OutlineColor=cor end
   if gBB and gBB.Parent then
    local t=gBB:FindFirstChildWhichIsA("TextLabel")
    if t then t.TextColor3=cor end
   end
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJK" or o.Name=="MJP" then
     o.FillColor=cor
     o.OutlineColor=cor
    end
   end
  end
  task.wait(0.5)
 end
end)

-- ═══════ CONTEÚDO DAS ABAS ═══════

-- 🏠 PRINCIPAL
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
addT(c1,75,"🌌 Volar",function(v)
 st.fly=v
 local c=p.Character
 if not c then return end
 local h=c:FindFirstChildOfClass("Humanoid")
 local r=c:FindFirstChild("HumanoidRootPart")
 if not h or not r then return end
 if v then
  local bv=Instance.new("BodyVelocity",r)
  bv.Name="MJFly"
  bv.MaxForce=Vector3.new(1e5,1e5,1e5)
  bv.Velocity=Vector3.new(0,0,0)
  h.PlatformStand=true
 else
  local f=r:FindFirstChild("MJFly")
  if f then f:Destroy() end
  h.PlatformStand=false
 end
end)
addB(c1,110,"🔄 Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

-- 👵 VOVÓ
local c2=conteudos[2]
addT(c2,5,"👵 ESP Vovó",function(v)
 st.vovo=v
 if not v then
  if gHL and gHL.Parent then gHL:Destroy() end
  if gBB and gBB.Parent then gBB:Destroy() end
  gHL,gBB=nil,nil
 end
end)
addT(c2,40,"🎯 Mira Vovó",function(v) st.mira=v end)
addT(c2,75,"🚨 Alerta Vovó (bipe)",function(v) st.alerta=v end)
addB(c2,110,"📋 Listar Jogadores (F9)",function()
 local o={}
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then table.insert(o,{n=j.Name,s=sChar(j.Character)}) end
  end
 end
 table.sort(o,function(a,b) return a.s>b.s end)
 print("═══ 👥 JOGADORES ═══")
 for i,j in ipairs(o) do print("["..i.."] 👤 "..j.n.." | 📏 "..string.format("%.2f",j.s)) end
end)

-- 🔑 CHAVES E PORTAS
local c3=conteudos[3]
addT(c3,5,"🔑 ESP Chaves",function(v)
 st.chave=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" then o:Destroy() end
 end end
end)
addT(c3,40,"🚪 ESP Portas",function(v)
 st.porta=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJP" then o:Destroy() end
 end end
end)
addB(c3,75,"🧹 Limpar Destaques",function()
 for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" or o.Name=="MJP" then o:Destroy() end
 end
end)
addB(c3,110,"📋 Listar Chaves/Portas (F9)",function()
 print("═══ 🔑 CHAVES E 🚪 PORTAS ═══")
 for _,o in ipairs(workspace:GetDescendants()) do
  local n=o.Name:lower()
  if o:IsA("BasePart") and (n:find("key") or n:find("chave") or n:find("lock") or n:find("porta") or n:find("door")) then
   print("["..o.ClassName.."] "..o:GetFullName())
  end
 end
end)

-- 🎨 CORES
local c4=conteudos[4]
local corY=5
for i,cor in ipairs(cores) do
 local b=Instance.new("TextButton",c4)
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,corY)
 b.BackgroundColor3=(cor.c=="rainbow") and Color3.fromRGB(150,50,200) or cor.c
 b.Text=cor.n
 b.TextColor3=((cor.c=="rainbow") or (cor.c.R+cor.c.G+cor.c.B<300)) and branco or Color3.fromRGB(0,0,0)
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function()
  st.cor=i
  print("🎨 Cor: "..cor.n)
 end)
 corY=corY+32
end

print("⚫ MJ 1.0 by "..CRIADOR.." carregado! ⚫")
