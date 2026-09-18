-- ⚽ MJ 1.0 | The Classic Soccer | by Mikael_n244br
pcall(function()
    local old=game.CoreGui:FindFirstChild("MJ")
    if old then old:Destroy() end
end)

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local L=game:GetService("Lighting")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_n244br"

local coresBola={
 {n="Branco",c=Color3.fromRGB(255,255,255)},
 {n="Amarelo",c=Color3.fromRGB(255,255,0)},
 {n="Verde",c=Color3.fromRGB(0,255,0)},
 {n="Vermelho",c=Color3.fromRGB(255,0,0)},
 {n="Azul",c=Color3.fromRGB(0,150,255)},
 {n="Roxo",c=Color3.fromRGB(180,0,255)},
 {n="Rosa",c=Color3.fromRGB(255,0,180)},
 {n="Ciano",c=Color3.fromRGB(0,255,255)},
 {n="Rainbow",c="rainbow"},
}
local coresCeu={
 {n="Padrao",c=Color3.fromRGB(255,255,255)},
 {n="Noite",c=Color3.fromRGB(20,20,50)},
 {n="Por do Sol",c=Color3.fromRGB(255,150,50)},
 {n="Roxo",c=Color3.fromRGB(80,20,120)},
 {n="Azul",c=Color3.fromRGB(50,100,200)},
 {n="Rosa",c=Color3.fromRGB(255,100,200)},
}

local st={
 autoBola=false, chuteForte=false, miraGol=false, superCurva=false,
 espBola=false, espGol=false, rage=false, speed=16,
 corBola=1, corCeu=1,
}

-- FUNÇÕES AUXILIARES
local function acharBola()
 for _,o in ipairs(workspace:GetDescendants()) do
  local n=o.Name:lower()
  if (n:find("ball") or n:find("bola")) and o:IsA("BasePart") then return o end
 end
end

local function acharGols()
 local gols={}
 for _,o in ipairs(workspace:GetDescendants()) do
  local n=o.Name:lower()
  if (n:find("goal") or n:find("gol") or n:find("net") or n:find("rede")) and o:IsA("BasePart") then
   table.insert(gols,o)
  end
 end
 return gols
end

local function acharGolAdversario()
 local c=p.Character
 if not c then return nil end
 local root=c:FindFirstChild("HumanoidRootPart")
 if not root then return nil end
 local gols=acharGols()
 if #gols==0 then return nil end
 local maisLonge,distMax=nil,0
 for _,g in ipairs(gols) do
  local d=(root.Position-g.Position).Magnitude
  if d>distMax then maisLonge,distMax=g,d end
 end
 return maisLonge
end

local function getCorBola()
 local c=coresBola[st.corBola].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

-- GUI
local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.DisplayOrder=999

-- FOGUETE
local rocket=Instance.new("TextLabel",gui)
rocket.Size=UDim2.new(0,80,0,80)
rocket.Position=UDim2.new(0.5,-40,1,80)
rocket.BackgroundTransparency=1
rocket.Text="🚀"
rocket.TextScaled=true
rocket.Font=Enum.Font.GothamBold
rocket.ZIndex=15

local smokes={}
for i=1,15 do
 local s=Instance.new("Frame",gui)
 s.Size=UDim2.new(0,20,0,20)
 s.BackgroundColor3=Color3.fromRGB(255,255,255)
 s.BackgroundTransparency=0.5
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
nomeMJ.Text="⚽ MJ 1.0 ⚽"
nomeMJ.TextColor3=Color3.fromRGB(255,255,255)
nomeMJ.TextStrokeColor3=Color3.fromRGB(0,0,0)
nomeMJ.TextStrokeTransparency=0
nomeMJ.Font=Enum.Font.GothamBold
nomeMJ.TextSize=60
nomeMJ.TextTransparency=1
nomeMJ.ZIndex=20

task.spawn(function()
 for t=0,1,0.008 do
  local yPos=1-t
  rocket.Position=UDim2.new(0.5,-40,yPos,0)
  for i,s in ipairs(smokes) do
   s.Visible=true
   s.Position=UDim2.new(0.5+math.random(-40,40)/100,-10,yPos+0.05*i,0)
   s.BackgroundTransparency=0.3+(i/15)*0.6
   s.Size=UDim2.new(0,18-i,0,18-i)
  end
  task.wait(0.015)
 end
 explosao.Position=UDim2.new(0.5,-100,-0.15,0)
 explosao.Size=UDim2.new(0,200,0,200)
 explosao.Visible=true
 for i=1,12 do
  explosao.Size=UDim2.new(0,200+i*30,0,200+i*30)
  explosao.Position=UDim2.new(0.5,-100-i*15,-0.15-i*15,0)
  explosao.TextTransparency=i/12
  task.wait(0.03)
 end
 explosao:Destroy()
 rocket:Destroy()
 for _,s in ipairs(smokes) do s:Destroy() end
 for i=1,10 do
  nomeMJ.TextTransparency=math.abs(math.sin(i/2))
  task.wait(0.08)
 end
 nomeMJ.TextTransparency=0
 task.wait(1.2)
 for i=1,20 do
  nomeMJ.TextTransparency=i/20
  task.wait(0.03)
 end
 nomeMJ:Destroy()
end)

task.wait(5)

-- BOLINHA ROXA
local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,60,0,60)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(50,0,80)
ball.BorderSizePixel=0
ball.Active=true
ball.ZIndex=100
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bs=Instance.new("UIStroke",ball)
bs.Color=Color3.fromRGB(200,150,255)
bs.Thickness=2

for i=1,10 do
 local s=Instance.new("Frame",ball)
 s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
 s.Position=UDim2.new(math.random()*90/100,0,math.random()*90/100,0)
 s.BackgroundColor3=Color3.fromRGB(255,255,255)
 s.BackgroundTransparency=math.random(0,30)/100
 s.BorderSizePixel=0
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
end

local mj=Instance.new("TextLabel",ball)
mj.Size=UDim2.new(1,0,1,0)
mj.BackgroundTransparency=1
mj.Text="MJ"
mj.TextColor3=Color3.fromRGB(255,255,255)
mj.TextStrokeColor3=Color3.fromRGB(100,0,150)
mj.TextStrokeTransparency=0.2
mj.Font=Enum.Font.GothamBold
mj.TextScaled=true
mj.ZIndex=101

-- PAINEL
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,280,0,420)
panel.Position=UDim2.new(0,90,0.5,-210)
panel.BackgroundColor3=Color3.fromRGB(10,5,20)
panel.BorderSizePixel=0
panel.Visible=false
panel.Active=true
panel.ZIndex=200
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=Color3.fromRGB(150,100,255)
ps.Thickness=1.5

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,30)
titulo.BackgroundColor3=Color3.fromRGB(60,30,100)
titulo.Text="⚽ MJ 1.0 ⚽"
titulo.TextColor3=Color3.fromRGB(255,255,255)
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=15
titulo.BorderSizePixel=0
titulo.ZIndex=201
Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local cred=Instance.new("TextLabel",panel)
cred.Size=UDim2.new(1,0,0,14)
cred.Position=UDim2.new(0,0,0,31)
cred.BackgroundTransparency=1
cred.Text="by "..CRIADOR
cred.TextColor3=Color3.fromRGB(200,200,220)
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=201

local fec=Instance.new("TextButton",panel)
fec.Size=UDim2.new(0,22,0,22)
fec.Position=UDim2.new(1,-26,0,4)
fec.BackgroundColor3=Color3.fromRGB(180,30,50)
fec.Text="X"
fec.TextColor3=Color3.fromRGB(255,255,255)
fec.Font=Enum.Font.GothamBold
fec.TextSize=12
fec.BorderSizePixel=0
fec.ZIndex=202
Instance.new("UICorner",fec).CornerRadius=UDim.new(1,0)
fec.MouseButton1Click:Connect(function() panel.Visible=false end)

-- 4 ABAS
local tabNomes={"Jogo","Skills","Visual","Rage"}
local tabBtns={}
local tabConteudos={}

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",panel)
 b.Size=UDim2.new(0.25,-4,0,26)
 b.Position=UDim2.new((i-1)*0.25+0.005,0,0,52)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=Color3.fromRGB(200,200,220)
 b.Font=Enum.Font.GothamBold
 b.TextSize=10
 b.BorderSizePixel=0
 b.ZIndex=202
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 table.insert(tabBtns,b)
 
 local c=Instance.new("Frame",panel)
 c.Size=UDim2.new(1,-10,1,-90)
 c.Position=UDim2.new(0,5,0,83)
 c.BackgroundTransparency=1
 c.Active=false
 c.ZIndex=201
 c.Visible=(i==1)
 table.insert(tabConteudos,c)
 
 b.MouseButton1Click:Connect(function()
  for j=1,#tabConteudos do
   tabConteudos[j].Visible=(j==i)
   tabBtns[j].BackgroundColor3=(j==i) and Color3.fromRGB(60,60,60) or Color3.fromRGB(25,25,25)
   tabBtns[j].TextColor3=(j==i) and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,220)
  end
 end)
end
tabBtns[1].BackgroundColor3=Color3.fromRGB(60,60,60)
tabBtns[1].TextColor3=Color3.fromRGB(255,255,255)

local function addT(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(30,30,30)
 b.Text=txt.." OFF"
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.GothamBold
 b.TextSize=10
 b.BorderSizePixel=0
 b.ZIndex=210
 b.Active=true
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function()
  local v=not b:GetAttribute("on")
  b:SetAttribute("on",v)
  b.Text=txt..(v and " ON" or " OFF")
  b.BackgroundColor3=v and Color3.fromRGB(60,60,60) or Color3.fromRGB(30,30,30)
  fn(v)
 end)
 return b
end

local function addB(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(50,50,50)
 b.Text=txt
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.GothamBold
 b.TextSize=10
 b.BorderSizePixel=0
 b.ZIndex=210
 b.Active=true
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function() fn(b) end)
 return b
end

-- Arrastar bolinha
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
  if tick()-clickStart<0.3 then
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

-- ⚽ LÓGICA

-- Auto-Bola
task.spawn(function()
 while true do
  if st.autoBola then
   local bola=acharBola()
   local c=p.Character
   if bola and c then
    local root=c:FindFirstChild("HumanoidRootPart")
    local hum=c:FindFirstChildOfClass("Humanoid")
    if root and hum then
     local dist=(root.Position-bola.Position).Magnitude
     if dist>5 then hum:MoveTo(bola.Position) end
    end
   end
  end
  task.wait(0.2)
 end
end)

-- Chute Forte + Super Curva + Mira no Gol
task.spawn(function()
 while true do
  if st.chuteForte or st.miraGol or st.superCurva then
   local bola=acharBola()
   local c=p.Character
   if bola and c then
    local root=c:FindFirstChild("HumanoidRootPart")
    if root then
     local dist=(root.Position-bola.Position).Magnitude
     if dist<6 then
      local alvo=nil
      if st.miraGol or st.superCurva then
       alvo=acharGolAdversario()
      end
      if alvo then
       local dir=(alvo.Position-bola.Position).Unit
       local forca=st.chuteForte and 350 or 200
       if st.superCurva then
        -- Adiciona arco na trajetória
        local perpendicular=Vector3.new(-dir.Z,0,dir.X)
        bola.AssemblyLinearVelocity=dir*forca+perpendicular*80+Vector3.new(0,60,0)
       else
        bola.AssemblyLinearVelocity=dir*forca
       end
      else
       local dir=(bola.Position-root.Position).Unit
       bola.AssemblyLinearVelocity=dir*300
      end
     end
    end
   end
  end
  task.wait(0.4)
 end
end)

-- Cor da bola
task.spawn(function()
 while true do
  local bola=acharBola()
  if bola then
   local cor=getCorBola()
   pcall(function() bola.Color=cor end)
   pcall(function() bola.Material=Enum.Material.Neon end)
  end
  task.wait(0.5)
 end
end)

-- Cor do céu
task.spawn(function()
 while true do
  if L then
   local cor=coresCeu[st.corCeu].c
   pcall(function()
    L.Ambient=cor
    L.OutdoorAmbient=cor
    L.ColorShift_Top=cor
   end)
  end
  task.wait(1)
 end
end)

-- Rage Mode
task.spawn(function()
 while true do
  if st.rage then
   local c=p.Character
   if c then
    local hum=c:FindFirstChildOfClass("Humanoid")
    if hum then
     pcall(function()
      hum.BodyDepthScale.Value=2
      hum.BodyHeightScale.Value=2
      hum.BodyWidthScale.Value=2
      hum.HeadScale.Value=2
     end)
    end
   end
  end
  task.wait(0.5)
 end
end)

-- ESP Bola + Gol
local espHLS={}
task.spawn(function()
 while true do
  local cor=getCorBola()
  -- ESP Bola
  if st.espBola then
   local bola=acharBola()
   if bola and not bola:FindFirstChild("MJBallHL") then
    local hl=Instance.new("Highlight",bola)
    hl.Name="MJBallHL"
    hl.FillColor=cor
    hl.OutlineColor=cor
    hl.FillTransparency=0.5
    hl.OutlineTransparency=0
    hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
    table.insert(espHLS,hl)
   end
  else
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJBallHL" then o:Destroy() end
   end
  end
  -- ESP Gol
  if st.espGol then
   for _,g in ipairs(acharGols()) do
    if not g:FindFirstChild("MJGolHL") then
     local hl=Instance.new("Highlight",g)
     hl.Name="MJGolHL"
     hl.FillColor=Color3.fromRGB(0,255,0)
     hl.OutlineColor=Color3.fromRGB(0,255,0)
     hl.FillTransparency=0.5
     hl.OutlineTransparency=0
     hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
    end
   end
  else
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJGolHL" then o:Destroy() end
   end
  end
  task.wait(0.5)
 end
end)

-- Time Display (Blue / Green)
local timeGui=Instance.new("ScreenGui",game.CoreGui)
timeGui.Name="MJ_Time"
timeGui.ResetOnSpawn=false

local timeFrame=Instance.new("Frame",timeGui)
timeFrame.Size=UDim2.new(0,240,0,60)
timeFrame.Position=UDim2.new(0.5,-120,0,20)
timeFrame.BackgroundColor3=Color3.fromRGB(5,5,5)
timeFrame.BackgroundTransparency=0.3
timeFrame.BorderSizePixel=0
Instance.new("UICorner",timeFrame).CornerRadius=UDim.new(0,8)
local tfSt=Instance.new("UIStroke",timeFrame)
tfSt.Color=Color3.fromRGB(150,100,255)
tfSt.Thickness=1.5

local blueLabel=Instance.new("TextLabel",timeFrame)
blueLabel.Size=UDim2.new(0.5,-5,1,0)
blueLabel.Position=UDim2.new(0,5,0,0)
blueLabel.BackgroundTransparency=1
blueLabel.Text="🔵 Blue"
blueLabel.TextColor3=Color3.fromRGB(100,150,255)
blueLabel.Font=Enum.Font.GothamBold
blueLabel.TextSize=14
blueLabel.TextScaled=true

local greenLabel=Instance.new("TextLabel",timeFrame)
greenLabel.Size=UDim2.new(0.5,-5,1,0)
greenLabel.Position=UDim2.new(0.5,0,0,0)
greenLabel.BackgroundTransparency=1
greenLabel.Text="🟢 Green"
greenLabel.TextColor3=Color3.fromRGB(100,255,100)
greenLabel.Font=Enum.Font.GothamBold
greenLabel.TextSize=14
greenLabel.TextScaled=true

task.spawn(function()
 while timeGui.Parent do
  pcall(function()
   local times=game:GetService("Teams"):GetTeams()
   for _,t in ipairs(times) do
    local nome=t.Name:lower()
    if nome:find("blue") then
     blueLabel.Text="🔵 "..t.Name
    elseif nome:find("green") then
     greenLabel.Text="🟢 "..t.Name
    end
   end
   -- Tentar pegar do meu time
   if p.Team then
    local n=p.Team.Name:lower()
    if n:find("blue") then
     blueLabel.Text="🔵 "..p.Team.Name.." (VOCÊ)"
    elseif n:find("green") then
     greenLabel.Text="🟢 "..p.Team.Name.." (VOCÊ)"
    end
   end
  end)
  task.wait(1)
 end
end)

-- BOTÕES

-- ABA JOGO
addT(tabConteudos[1],5,"⚽ Auto-Bola",function(v) st.autoBola=v end)
addT(tabConteudos[1],36,"💪 Chute Forte",function(v) st.chuteForte=v end)
addT(tabConteudos[1],67,"🎯 Mira no Gol",function(v) st.miraGol=v end)
addT(tabConteudos[1],98,"🌀 Super Curva",function(v) st.superCurva=v end)
addB(tabConteudos[1],129,"⚡ Speed: 16",function(b)
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 b.Text="⚡ Speed: "..st.speed
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)

-- ABA SKILLS
addT(tabConteudos[2],5,"🎯 ESP Bola",function(v) st.espBola=v end)
addT(tabConteudos[2],36,"🥅 ESP Gol",function(v) st.espGol=v end)
addB(tabConteudos[2],67,"🔄 Rejoin",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

-- ABA VISUAL
local bolaBtn=Instance.new("TextButton",tabConteudos[3])
bolaBtn.Size=UDim2.new(1,-8,0,28)
bolaBtn.Position=UDim2.new(0,4,0,5)
bolaBtn.BackgroundColor3=Color3.fromRGB(255,255,255)
bolaBtn.Text="🎨 Bola: Branco"
bolaBtn.TextColor3=Color3.fromRGB(0,0,0)
bolaBtn.Font=Enum.Font.GothamBold
bolaBtn.TextSize=10
bolaBtn.BorderSizePixel=0
bolaBtn.ZIndex=210
bolaBtn.Active=true
Instance.new("UICorner",bolaBtn).CornerRadius=UDim.new(0,6)
bolaBtn.MouseButton1Click:Connect(function()
 st.corBola=st.corBola+1
 if st.corBola>#coresBola then st.corBola=1 end
 local c=coresBola[st.corBola]
 bolaBtn.Text="🎨 Bola: "..c.n
 if c.c=="rainbow" then
  bolaBtn.BackgroundColor3=Color3.fromRGB(150,50,200)
  bolaBtn.TextColor3=Color3.fromRGB(255,255,255)
 else
  bolaBtn.BackgroundColor3=c.c
  bolaBtn.TextColor3=(c.c.R+c.c.G+c.c.B<300) and Color3.fromRGB(255,255,255) or Color3.fromRGB(0,0,0)
 end
end)

local ceuBtn=Instance.new("TextButton",tabConteudos[3])
ceuBtn.Size=UDim2.new(1,-8,0,28)
ceuBtn.Position=UDim2.new(0,4,0,38)
ceuBtn.BackgroundColor3=Color3.fromRGB(255,255,255)
ceuBtn.Text="🌌 Ceu: Padrao"
ceuBtn.TextColor3=Color3.fromRGB(0,0,0)
ceuBtn.Font=Enum.Font.GothamBold
ceuBtn.TextSize=10
ceuBtn.BorderSizePixel=0
ceuBtn.ZIndex=210
ceuBtn.Active=true
Instance.new("UICorner",ceuBtn).CornerRadius=UDim.new(0,6)
ceuBtn.MouseButton1Click:Connect(function()
 st.corCeu=st.corCeu+1
 if st.corCeu>#coresCeu then st.corCeu=1 end
 local c=coresCeu[st.corCeu]
 ceuBtn.Text="🌌 Ceu: "..c.n
 ceuBtn.BackgroundColor3=c.c
 ceuBtn.TextColor3=(c.c.R+c.c.G+c.c.B<300) and Color3.fromRGB(255,255,255) or Color3.fromRGB(0,0,0)
end)

-- ABA RAGE
addT(tabConteudos[4],5,"💪 RAGE MODE (Skin Box)",function(v)
 st.rage=v
 if not v then
  local c=p.Character
  if c then local hum=c:FindFirstChildOfClass("Humanoid")
   if hum then
    pcall(function()
     hum.BodyDepthScale.Value=1
     hum.BodyHeightScale.Value=1
     hum.BodyWidthScale.Value=1
     hum.HeadScale.Value=1
    end)
   end
  end
 end
end)

print("⚽ MJ 1.0 by "..CRIADOR.." carregado! ⚽")
