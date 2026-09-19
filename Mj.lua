-- ⚫ MJ 1.0 | Destrua a Vovó | by Mikael_n244br
-- Tema: Loading com constelação (igual ao do futebol)

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local SS=game:GetService("SoundService")
local T=game:GetService("TweenService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_n244br"

-- Container
local container=p:WaitForChild("PlayerGui")
for _,g in ipairs(container:GetChildren()) do
    if g.Name=="MJ" or g.Name=="MJLoading" then g:Destroy() end
end

-- Cores
local BRANCO=Color3.fromRGB(255,255,255)
local CINZA=Color3.fromRGB(200,200,220)
local ROXO=Color3.fromRGB(150,80,255)
local ROXO_CLARO=Color3.fromRGB(200,150,255)
local FUNDO=Color3.fromRGB(5,5,10)

local st={
 noclip=false,vovo=false,mira=false,chave=false,porta=false,alerta=false,
 rage=false,rageSize=2,speed=16,cor=1,
}

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

-- ═══════════════════════════════════════
--   ⏳ TELA DE LOADING COM CONSTELAÇÃO
-- ═══════════════════════════════════════
local loadGui=Instance.new("ScreenGui")
loadGui.Name="MJLoading"
loadGui.ResetOnSpawn=false
loadGui.IgnoreGuiInset=true
loadGui.DisplayOrder=20000
loadGui.Parent=container

local lBg=Instance.new("Frame",loadGui)
lBg.Size=UDim2.new(1,0,1,0)
lBg.BackgroundColor3=FUNDO
lBg.BorderSizePixel=0

-- ═══════ CONSTELAÇÕES (linhas conectando estrelas) ═══════
local constStars={}
for c=1,10 do
 local bx=math.random(5,85)/100
 local by=math.random(5,85)/100
 local n=math.random(4,7)
 local grupo={}
 for i=1,n do
  local s=Instance.new("Frame",lBg)
  s.Size=UDim2.new(0,math.random(2,4),0,math.random(2,4))
  s.Position=UDim2.new(bx+math.random(-8,8)/100,0,by+math.random(-8,8)/100,0)
  s.BackgroundColor3=BRANCO
  s.BackgroundTransparency=math.random(20,50)/100
  s.BorderSizePixel=0
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(grupo,s)
  table.insert(constStars,s)
 end
 -- Linhas conectando as estrelas
 for i=1,#grupo-1 do
  local a=grupo[i]
  local b=grupo[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",lBg)
  line.Size=UDim2.new(0,dist*3.2,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=BRANCO
  line.BackgroundTransparency=0.7
  line.BorderSizePixel=0
  table.insert(constStars,line)
 end
end

-- Estrelinhas soltas extras
for i=1,30 do
 local s=Instance.new("Frame",lBg)
 s.Size=UDim2.new(0,1,0,1)
 s.Position=UDim2.new(math.random(),0,math.random(),0)
 s.BackgroundColor3=BRANCO
 s.BackgroundTransparency=math.random(50,85)/100
 s.BorderSizePixel=0
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(constStars,s)
end

-- Animação de piscar
task.spawn(function()
 while lBg.Parent do
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=3 then
    s.BackgroundTransparency=math.random(20,85)/100
   end
  end
  task.wait(0.5)
 end
end)

-- Título
local lTitle=Instance.new("TextLabel",lBg)
lTitle.Size=UDim2.new(0,500,0,80)
lTitle.Position=UDim2.new(0.5,-250,0.5,-60)
lTitle.BackgroundTransparency=1
lTitle.Text="⚫ MJ 1.0 ⚫"
lTitle.TextColor3=BRANCO
lTitle.TextStrokeColor3=Color3.fromRGB(80,80,80)
lTitle.TextStrokeTransparency=0
lTitle.Font=Enum.Font.GothamBold
lTitle.TextSize=52
lTitle.TextTransparency=1

-- Crédito
local lSub=Instance.new("TextLabel",lBg)
lSub.Size=UDim2.new(0,500,0,30)
lSub.Position=UDim2.new(0.5,-250,0.5,30)
lSub.BackgroundTransparency=1
lSub.Text="by "..CRIADOR
lSub.TextColor3=CINZA
lSub.Font=Enum.Font.Gotham
lSub.TextSize=14
lSub.TextTransparency=1

-- Barra de loading
local lBarBg=Instance.new("Frame",lBg)
lBarBg.Size=UDim2.new(0,280,0,4)
lBarBg.Position=UDim2.new(0.5,-140,0.5,80)
lBarBg.BackgroundColor3=Color3.fromRGB(30,30,40)
lBarBg.BorderSizePixel=0
Instance.new("UICorner",lBarBg).CornerRadius=UDim.new(0,2)

local lBar=Instance.new("Frame",lBarBg)
lBar.Size=UDim2.new(0,0,1,0)
lBar.BackgroundColor3=BRANCO
lBar.BorderSizePixel=0
Instance.new("UICorner",lBar).CornerRadius=UDim.new(0,2)

-- Texto de status
local lStatus=Instance.new("TextLabel",lBg)
lStatus.Size=UDim2.new(0,500,0,20)
lStatus.Position=UDim2.new(0.5,-250,0.5,100)
lStatus.BackgroundTransparency=1
lStatus.Text="⏳ Carregando..."
lStatus.TextColor3=Color3.fromRGB(150,150,180)
lStatus.Font=Enum.Font.Gotham
lStatus.TextSize=12
lStatus.TextTransparency=1

-- Animação do loading
task.spawn(function()
 local etapas={
  "⏳ Iniciando...",
  "🔧 Carregando módulos...",
  "🎨 Aplicando tema...",
  "🌟 Preparando interface...",
  "🚀 Pronto!"
 }
 -- Fade in do título
 for i=1,20 do
  lTitle.TextTransparency=1-i/20
  lSub.TextTransparency=1-i/20
  lStatus.TextTransparency=1-i/20
  task.wait(0.02)
 end
 -- Progresso da barra
 for e=1,#etapas do
  lStatus.Text=etapas[e]
  for j=1,20 do
   local total=(e-1)/#etapas + (j/20)/#etapas
   lBar.Size=UDim2.new(total,0,1,0)
   task.wait(0.02)
  end
  task.wait(0.1)
 end
 task.wait(0.3)
 -- Fade out
 for i=1,20 do
  local a=i/20
  lTitle.TextTransparency=a
  lSub.TextTransparency=a
  lStatus.TextTransparency=a
  lBarBg.BackgroundTransparency=a
  lBar.BackgroundTransparency=a
  lBg.BackgroundTransparency=a
  for _,s in ipairs(constStars) do
   if s.Parent then
    s.BackgroundTransparency=math.min(1,s.BackgroundTransparency+a)
   end
  end
  task.wait(0.02)
 end
 loadGui:Destroy()
end)

task.wait(3.5)

-- ═══════════════════════════════════════
--   ⚫ GUI PRINCIPAL
-- ═══════════════════════════════════════
local gui=Instance.new("ScreenGui")
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.DisplayOrder=9999
gui.Parent=container

-- ═══════ BOLINHA (preta com estrelinhas) ═══════
local ball=Instance.new("TextButton")
ball.Size=UDim2.new(0,65,0,65)
ball.Position=UDim2.new(0,20,0.5,-32)
ball.BackgroundColor3=Color3.fromRGB(5,5,5)
ball.Text="MJ"
ball.TextColor3=BRANCO
ball.TextStrokeColor3=Color3.fromRGB(0,0,0)
ball.TextStrokeTransparency=0.2
ball.Font=Enum.Font.GothamBold
ball.TextSize=22
ball.BorderSizePixel=0
ball.Active=true
ball.AutoButtonColor=false
ball.ZIndex=100
ball.Parent=gui
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bStroke=Instance.new("UIStroke",ball)
bStroke.Color=BRANCO
bStroke.Thickness=3

for i=1,12 do
 local s=Instance.new("Frame",ball)
 s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
 s.Position=UDim2.new(math.random()*85/100,0,math.random()*85/100,0)
 s.BackgroundColor3=BRANCO
 s.BackgroundTransparency=math.random(0,30)/100
 s.BorderSizePixel=0
 s.ZIndex=101
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
end

-- ═══════ MENU ═══════
local menu=Instance.new("Frame")
menu.Size=UDim2.new(0,290,0,430)
menu.Position=UDim2.new(0,100,0.5,-215)
menu.BackgroundColor3=FUNDO
menu.BorderSizePixel=0
menu.Visible=false
menu.Active=true
menu.ZIndex=200
menu.Parent=gui
Instance.new("UICorner",menu).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke",menu).Color=BRANCO
Instance.new("UIStroke",menu).Thickness=1.5

-- Constelações dentro do menu
for i=1,25 do
 local s=Instance.new("Frame",menu)
 s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
 s.Position=UDim2.new(math.random()*95/100,0,math.random()*95/100,0)
 s.BackgroundColor3=BRANCO
 s.BackgroundTransparency=math.random(50,85)/100
 s.BorderSizePixel=0
 s.ZIndex=201
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
end

local title=Instance.new("TextLabel",menu)
title.Size=UDim2.new(1,0,0,32)
title.BackgroundColor3=Color3.fromRGB(30,30,30)
title.Text="⚫ MJ 1.0 ⚫"
title.TextColor3=BRANCO
title.Font=Enum.Font.GothamBold
title.TextSize=15
title.BorderSizePixel=0
title.ZIndex=203
Instance.new("UICorner",title).CornerRadius=UDim.new(0,14)

local cred=Instance.new("TextLabel",menu)
cred.Size=UDim2.new(1,0,0,14)
cred.Position=UDim2.new(0,0,0,32)
cred.BackgroundTransparency=1
cred.Text="by "..CRIADOR
cred.TextColor3=CINZA
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=203

local closeBtn=Instance.new("TextButton",menu)
closeBtn.Size=UDim2.new(0,24,0,24)
closeBtn.Position=UDim2.new(1,-30,0,4)
closeBtn.BackgroundColor3=Color3.fromRGB(200,30,60)
closeBtn.Text="X"
closeBtn.TextColor3=BRANCO
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=13
closeBtn.BorderSizePixel=0
closeBtn.ZIndex=205
closeBtn.Parent=menu
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(1,0)
closeBtn.MouseButton1Click:Connect(function() menu.Visible=false end)

-- ═══════ ABAS ═══════
local TABS={"Principal","Vovó","Chaves","Rage"}
local tabBtns={}
local tabFrames={}

local contentArea=Instance.new("Frame",menu)
contentArea.Size=UDim2.new(1,-10,1,-100)
contentArea.Position=UDim2.new(0,5,0,95)
contentArea.BackgroundTransparency=1
contentArea.ZIndex=202

local function mostrarTab(i)
 for j=1,#tabFrames do
  tabFrames[j].Visible=(j==i)
  tabBtns[j].BackgroundColor3=(j==i) and Color3.fromRGB(80,80,80) or Color3.fromRGB(25,25,25)
  tabBtns[j].TextColor3=(j==i) and BRANCO or CINZA
 end
end

for i,nome in ipairs(TABS) do
 local b=Instance.new("TextButton",menu)
 b.Size=UDim2.new(0.25,-4,0,24)
 b.Position=UDim2.new((i-1)*0.25+0.005,0,0,52)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=CINZA
 b.Font=Enum.Font.GothamBold
 b.TextSize=9
 b.BorderSizePixel=0
 b.ZIndex=205
 b.Active=true
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 table.insert(tabBtns,b)
 
 local c=Instance.new("ScrollingFrame",contentArea)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=3
 c.ScrollBarImageColor3=BRANCO
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=(i==1)
 c.ZIndex=203
 table.insert(tabFrames,c)
 
 b.MouseButton1Click:Connect(function() mostrarTab(i) end)
end
mostrarTab(1)

-- Helpers
local function addT(par,y,txt,fn)
 local b=Instance.new("TextButton",par)
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=txt.."  ⭕"
 b.TextColor3=BRANCO
 b.Font=Enum.Font.GothamBold
 b.TextSize=10
 b.BorderSizePixel=0
 b.ZIndex=205
 b.Active=true
 b.AutoButtonColor=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 local est=false
 b.MouseButton1Click:Connect(function()
  est=not est
  b.Text=txt..(est and "  ✅" or "  ⭕")
  b.BackgroundColor3=est and Color3.fromRGB(80,80,80) or Color3.fromRGB(25,25,25)
  fn(est)
 end)
end

local function addB(par,y,txt,fn)
 local b=Instance.new("TextButton",par)
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(50,50,50)
 b.Text=txt
 b.TextColor3=BRANCO
 b.Font=Enum.Font.GothamBold
 b.TextSize=10
 b.BorderSizePixel=0
 b.ZIndex=205
 b.Active=true
 b.AutoButtonColor=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function()
  b.BackgroundColor3=Color3.fromRGB(100,100,100)
  task.wait(0.1)
  b.BackgroundColor3=Color3.fromRGB(50,50,50)
  fn()
 end)
end

local function addLbl(par,y,txt)
 local l=Instance.new("TextLabel",par)
 l.Size=UDim2.new(1,-8,0,18)
 l.Position=UDim2.new(0,4,0,y)
 l.BackgroundTransparency=1
 l.Text=txt
 l.TextColor3=CINZA
 l.Font=Enum.Font.Gotham
 l.TextSize=10
 l.TextXAlignment=Enum.TextXAlignment.Left
 l.ZIndex=205
 return l
end

-- DETECÇÃO
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

-- LÓGICAS
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
  gHL.Name="MJHV"
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
   t.TextColor3=cor
   t.TextStrokeColor3=Color3.fromRGB(0,0,0)
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

-- Rage
task.spawn(function()
 while true do
  local c=p.Character
  if c then
   local hum=c:FindFirstChildOfClass("Humanoid")
   if hum then
    pcall(function()
     if st.rage then
      hum.BodyDepthScale.Value=st.rageSize
      hum.BodyHeightScale.Value=st.rageSize
      hum.BodyWidthScale.Value=st.rageSize
      hum.HeadScale.Value=st.rageSize
     elseif hum.BodyDepthScale.Value~=1 then
      hum.BodyDepthScale.Value=1
      hum.BodyHeightScale.Value=1
      hum.BodyWidthScale.Value=1
      hum.HeadScale.Value=1
     end
    end)
   end
  end
  task.wait(0.5)
 end
end)

-- Alerta
local ultimoBip=0
task.spawn(function()
 while true do
  if st.alerta then
   local v=acharV()
   local c=p.Character
   if v and c then
    local mr=c:FindFirstChild("HumanoidRootPart")
    local vr=v:FindFirstChild("HumanoidRootPart")
    if mr and vr then
     local d=(mr.Position-vr.Position).Magnitude
     if d<40 and tick()-ultimoBip>1 then
      ultimoBip=tick()
      pcall(function() som:Play() end)
      print("[MJ] Vovó perto! "..math.floor(d).." studs")
     end
    end
   end
  end
  task.wait(0.4)
 end
end)

-- Loop ESP
task.spawn(function()
 while true do
  local cor=getCor()
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
    if o:IsA("BasePart") and (o.Name:lower():find("door") or o.Name:lower():find("porta") or o.Name:lower():find("lock")) then
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

-- Principal
addT(tabFrames[1],5,"🚶 Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addB(tabFrames[1],40,"⚡ Speed: 16",function()
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addB(tabFrames[1],75,"🔄 Rejoin",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

-- Vovó
addT(tabFrames[2],5,"👵 ESP Vovó",function(v) st.vovo=v if not v then remV() end end)
addT(tabFrames[2],40,"🎯 Mira Vovó",function(v) st.mira=v end)
addT(tabFrames[2],75,"🚨 Alerta Vovó",function(v) st.alerta=v end)

local corBtn=Instance.new("TextButton",tabFrames[2])
corBtn.Size=UDim2.new(1,-8,0,30)
corBtn.Position=UDim2.new(0,4,0,110)
corBtn.BackgroundColor3=BRANCO
corBtn.Text="🎨 Cor: ⚪ Branco"
corBtn.TextColor3=Color3.fromRGB(0,0,0)
corBtn.Font=Enum.Font.GothamBold
corBtn.TextSize=10
corBtn.BorderSizePixel=0
corBtn.ZIndex=205
corBtn.Active=true
Instance.new("UICorner",corBtn).CornerRadius=UDim.new(0,6)
corBtn.MouseButton1Click:Connect(function()
 st.cor=st.cor+1
 if st.cor>#cores then st.cor=1 end
 local c=cores[st.cor]
 corBtn.Text="🎨 Cor: "..c.n
 if c.c=="rainbow" then
  corBtn.BackgroundColor3=Color3.fromRGB(150,50,200)
  corBtn.TextColor3=BRANCO
 else
  corBtn.BackgroundColor3=c.c
  corBtn.TextColor3=(c.c.R+c.c.G+c.c.B<300) and BRANCO or Color3.fromRGB(0,0,0)
 end
end)

-- Chaves
addT(tabFrames[3],5,"🔑 ESP Chaves",function(v)
 st.chave=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" then o:Destroy() end
 end end
end)
addT(tabFrames[3],40,"🚪 ESP Portas",function(v)
 st.porta=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJP" then o:Destroy() end
 end end
end)
addB(tabFrames[3],75,"🧹 Limpar",function()
 for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" or o.Name=="MJP" then o:Destroy() end
 end
end)

-- Rage
addT(tabFrames[4],5,"💪 Rage (Hitbox)",function(v) st.rage=v end)
addLbl(tabFrames[4],40,"Tamanho: 2x")
addB(tabFrames[4],60,"➕ Aumentar",function()
 st.rageSize=math.min(5,st.rageSize+0.5)
 tabFrames[4]:GetChildren()[2].Text="Tamanho: "..st.rageSize.."x"
end)
addB(tabFrames[4],95,"➖ Diminuir",function()
 st.rageSize=math.max(1,st.rageSize-0.5)
 tabFrames[4]:GetChildren()[2].Text="Tamanho: "..st.rageSize.."x"
end)

-- ═══════ ABRIR MENU ═══════
ball.MouseButton1Click:Connect(function()
 menu.Visible=not menu.Visible
 if menu.Visible then
  menu.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+75,ball.Position.Y.Scale,ball.Position.Y.Offset-215)
 end
end)

-- ═══════ ARRASTAR ═══════
local drag=false
local dStart=nil
local sPos=nil
ball.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=true dStart=i.Position sPos=ball.Position
 end
end)
U.InputChanged:Connect(function(i)
 if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-dStart
  ball.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
  if menu.Visible then
   menu.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+75,ball.Position.Y.Scale,ball.Position.Y.Offset-215)
  end
 end
end)
U.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=false
 end
end)

print("⚫ [MJ 1.0] by "..CRIADOR.." carregado!")
print("[MJ] Toque na bolinha pra abrir")
