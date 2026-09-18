-- 🚀 MJ 1.0 | by Mikael_N244BR

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_N244BR"

local st={
 noclip=false,
 infJump=false,
 vovo=false,
 mira=false,
 chave=false,
 fechadura=false,
 speed=16,
 cor=1
}

local cores={
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
 if c=="rainbow" then
  return Color3.fromHSV(tick()*0.4%1,1,1)
 end
 return c
end

-- GUI
local gui=Instance.new("ScreenGui")
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.Parent=game.CoreGui

-- ═══════ 🌌 FUNDO DE CONSTELAÇÕES ═══════

local constBg=Instance.new("Frame",gui)
constBg.Size=UDim2.new(1,0,1,0)
constBg.BackgroundTransparency=1
constBg.ZIndex=0

local constStars={}

for c=1,8 do
 local bx=math.random(5,85)/100
 local by=math.random(5,85)/100
 local n=math.random(4,7)
 local g={}

 for i=1,n do
  local s=Instance.new("Frame",constBg)
  s.Size=UDim2.new(0,math.random(1,3),0,math.random(1,3))
  s.Position=UDim2.new(
   bx+math.random(-8,8)/100,0,
   by+math.random(-8,8)/100,0
  )
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(20,60)/100
  s.BorderSizePixel=0
  s.ZIndex=1

  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

  table.insert(g,s)
  table.insert(constStars,s)
 end

 for i=1,#g-1 do
  local a=g[i]
  local b=g[i+1]

  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100

  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))

  local line=Instance.new("Frame",constBg)
  line.Size=UDim2.new(0,dist*3.2,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.7
  line.BorderSizePixel=0
  line.ZIndex=0

  table.insert(constStars,line)
 end
end

for i=1,30 do
 local s=Instance.new("Frame",constBg)
 s.Size=UDim2.new(0,1,0,1)
 s.Position=UDim2.new(math.random(),0,math.random(),0)
 s.BackgroundColor3=Color3.fromRGB(200,200,255)
 s.BackgroundTransparency=math.random(50,85)/100
 s.BorderSizePixel=0
 s.ZIndex=0

 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

 table.insert(constStars,s)
end

task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=3 then
    s.BackgroundTransparency=math.random(20,85)/100
   end
  end
  task.wait(0.5)
 end
end)

-- ═══════ 🚀 FOGUETE MJ 1.0 ═══════

local rocket=Instance.new("Frame",gui)
rocket.Size=UDim2.new(0,90,0,150)
rocket.Position=UDim2.new(0.5,-45,1,180)
rocket.BackgroundTransparency=1
rocket.ZIndex=15

-- Corpo
local corpo=Instance.new("Frame",rocket)
corpo.Size=UDim2.new(0,52,0,95)
corpo.Position=UDim2.new(0.5,-26,0,35)
corpo.BackgroundColor3=Color3.fromRGB(235,235,245)
corpo.BorderSizePixel=0

Instance.new("UICorner",corpo).CornerRadius=UDim.new(0.5,0)

local corpoStroke=Instance.new("UIStroke",corpo)
corpoStroke.Color=Color3.fromRGB(145,80,255)
corpoStroke.Thickness=2

-- Ponta
local ponta=Instance.new("TextLabel",rocket)
ponta.Size=UDim2.new(0,70,0,55)
ponta.Position=UDim2.new(0.5,-35,0,0)
ponta.BackgroundTransparency=1
ponta.Text="🚀"
ponta.TextScaled=true
ponta.Font=Enum.Font.GothamBold
ponta.ZIndex=17

-- Janela
local janela=Instance.new("Frame",corpo)
janela.Size=UDim2.new(0,24,0,24)
janela.Position=UDim2.new(0.5,-12,0,20)
janela.BackgroundColor3=Color3.fromRGB(90,180,255)
janela.BorderSizePixel=0

Instance.new("UICorner",janela).CornerRadius=UDim.new(1,0)

local janelaStroke=Instance.new("UIStroke",janela)
janelaStroke.Color=Color3.fromRGB(210,240,255)
janelaStroke.Thickness=2

-- Faixa MJ
local faixa=Instance.new("Frame",corpo)
faixa.Size=UDim2.new(1,0,0,12)
faixa.Position=UDim2.new(0,0,0,52)
faixa.BackgroundColor3=Color3.fromRGB(145,80,255)
faixa.BorderSizePixel=0

local mj=Instance.new("TextLabel",faixa)
mj.Size=UDim2.new(1,0,1,0)
mj.BackgroundTransparency=1
mj.Text="MJ"
mj.TextColor3=Color3.fromRGB(255,255,255)
mj.Font=Enum.Font.GothamBold
mj.TextSize=9

-- Asa esquerda
local asaE=Instance.new("TextLabel",rocket)
asaE.Size=UDim2.new(0,30,0,50)
asaE.Position=UDim2.new(0,-3,0,80)
asaE.BackgroundTransparency=1
asaE.Text="◀"
asaE.TextColor3=Color3.fromRGB(145,80,255)
asaE.TextScaled=true
asaE.ZIndex=16

-- Asa direita
local asaD=Instance.new("TextLabel",rocket)
asaD.Size=UDim2.new(0,30,0,50)
asaD.Position=UDim2.new(1,-27,0,80)
asaD.BackgroundTransparency=1
asaD.Text="▶"
asaD.TextColor3=Color3.fromRGB(145,80,255)
asaD.TextScaled=true
asaD.ZIndex=16

-- Chama
local chama=Instance.new("TextLabel",rocket)
chama.Size=UDim2.new(0,45,0,55)
chama.Position=UDim2.new(0.5,-22,0,125)
chama.BackgroundTransparency=1
chama.Text="🔥"
chama.TextScaled=true
chama.ZIndex=14

-- Partículas
local rocketParticles={}

for i=1,24 do
 local s=Instance.new("TextLabel",gui)
 s.Size=UDim2.new(0,math.random(8,16),0,math.random(8,16))
 s.BackgroundTransparency=1
 s.Text=math.random(1,2)==1 and "✨" or "•"
 s.TextColor3=Color3.fromRGB(210,170,255)
 s.TextScaled=true
 s.Visible=false
 s.ZIndex=13

 table.insert(rocketParticles,s)
end

-- Fumaça
local rocketSmoke={}

for i=1,14 do
 local s=Instance.new("Frame",gui)
 s.Size=UDim2.new(0,math.random(12,25),0,math.random(12,25))
 s.BackgroundColor3=Color3.fromRGB(210,210,225)
 s.BackgroundTransparency=0.45
 s.BorderSizePixel=0
 s.Visible=false
 s.ZIndex=12

 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

 table.insert(rocketSmoke,s)
end

-- Texto final
local mjGrande=Instance.new("TextLabel",gui)
mjGrande.Size=UDim2.new(0,400,0,100)
mjGrande.Position=UDim2.new(0.5,-200,0.5,-50)
mjGrande.BackgroundTransparency=1
mjGrande.Text="MJ 1.0"
mjGrande.TextColor3=Color3.fromRGB(255,255,255)
mjGrande.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjGrande.TextStrokeTransparency=0
mjGrande.Font=Enum.Font.GothamBold
mjGrande.TextSize=60
mjGrande.TextTransparency=1
mjGrande.ZIndex=20

-- Animação do foguete
task.spawn(function()

 for t=0,1,0.008 do

  local y=1-t

  rocket.Position=UDim2.new(
   0.5,-45,
   y,20
  )

  rocket.Rotation=math.sin(t*18)*4

  chama.Size=UDim2.new(
   0,38+math.random(0,14),
   0,45+math.random(0,20)
  )

  chama.Position=UDim2.new(
   0.5,-22,
   0,122
  )

  for i,s in ipairs(rocketSmoke) do
   s.Visible=true

   s.Position=UDim2.new(
    0.5,math.random(-30,30),
    y+0.13+(i*0.006),
    20
   )

   s.BackgroundTransparency=0.25+(i/18)
  end

  for _,s in ipairs(rocketParticles) do
   s.Visible=true

   s.Position=UDim2.new(
    0.5+math.random(-45,45)/100,
    -7,
    y+math.random(10,30)/100,
    0
   )

   s.TextTransparency=math.random(0,60)/100
  end

  task.wait(0.012)
 end

 -- Explosão
 local explosao=Instance.new("TextLabel",gui)
 explosao.Size=UDim2.new(0,80,0,80)
 explosao.Position=UDim2.new(0.5,-40,-0.08,0)
 explosao.BackgroundTransparency=1
 explosao.Text="💥"
 explosao.TextScaled=true
 explosao.ZIndex=20

 for i=1,18 do
  explosao.Size=UDim2.new(
   0,80+i*14,
   0,80+i*14
  )

  explosao.Position=UDim2.new(
   0.5,-40-i*7,
   -0.08-i*0.007,
   0
  )

  explosao.TextTransparency=i/18

  task.wait(0.035)
 end

 explosao:Destroy()
 rocket:Destroy()

 for _,s in ipairs(rocketSmoke) do
  s:Destroy()
 end

 for _,s in ipairs(rocketParticles) do
  s:Destroy()
 end

 mjGrande.Text="🚀 MJ 1.0 🚀"

 for i=1,10 do
  mjGrande.TextSize=58+i*2
  mjGrande.TextTransparency=math.abs(math.sin(i))
  task.wait(0.07)
 end

 mjGrande.TextTransparency=0
 mjGrande.Text="✨ MJ 1.0 ✨"

 task.wait(1)

 for i=1,20 do
  mjGrande.TextTransparency=i/20
  task.wait(0.03)
 end

 mjGrande:Destroy()
end)

-- ═══════ 🎯 BOLINHA MJ ═══════

task.wait(3)

local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,55,0,55)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(5,3,15)
ball.BorderSizePixel=0
ball.Active=true
ball.ZIndex=10

Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)

local bs=Instance.new("UIStroke",ball)
bs.Color=Color3.fromRGB(180,120,255)
bs.Thickness=2

local mjTxt=Instance.new("TextLabel",ball)
mjTxt.Size=UDim2.new(1,0,1,0)
mjTxt.BackgroundTransparency=1
mjTxt.Text="🌟MJ🌟"
mjTxt.TextColor3=Color3.fromRGB(255,255,255)
mjTxt.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjTxt.TextStrokeTransparency=0.3
mjTxt.Font=Enum.Font.GothamBold
mjTxt.TextScaled=true
mjTxt.ZIndex=11

-- ═══════ PAINEL ═══════

local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,300,0,400)
panel.Position=UDim2.new(0,85,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,3,15)
panel.BorderSizePixel=0
panel.Visible=false
panel.ZIndex=3

Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)

local ps=Instance.new("UIStroke",panel)
ps.Color=Color3.fromRGB(150,100,255)
ps.Thickness=1.5

-- Estrelas do painel
local pStars={}

for c=1,3 do
 local bx=math.random(10,70)/100
 local by=math.random(10,70)/100
 local g={}

 for i=1,5 do
  local s=Instance.new("Frame",panel)
  s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
  s.Position=UDim2.new(
   bx+math.random(-10,10)/100,0,
   by+math.random(-10,10)/100,0
  )
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(30,70)/100
  s.BorderSizePixel=0
  s.ZIndex=1

  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

  table.insert(g,s)
  table.insert(pStars,s)
 end

 for i=1,#g-1 do
  local a=g[i]
  local b=g[i+1]

  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100

  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))

  local line=Instance.new("Frame",panel)
  line.Size=UDim2.new(0,dist*3,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.75
  line.BorderSizePixel=0
  line.ZIndex=1

  table.insert(pStars,line)
 end
end

task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(pStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=2 then
    s.BackgroundTransparency=math.random(30,80)/100
   end
  end
  task.wait(0.4)
 end
end)

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,30)
titulo.BackgroundColor3=Color3.fromRGB(90,50,170)
titulo.BackgroundTransparency=0.2
titulo.Text="✨🚀 MJ 1.0 🚀✨"
titulo.TextColor3=Color3.fromRGB(255,255,255)
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=14
titulo.BorderSizePixel=0
titulo.ZIndex=3

Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local credito=Instance.new("TextLabel",panel)
credito.Size=UDim2.new(1,0,0,14)
credito.Position=UDim2.new(0,0,0,32)
credito.BackgroundTransparency=1
credito.Text="💜 by "..CRIADOR.." 💜"
credito.TextColor3=Color3.fromRGB(200,160,255)
credito.Font=Enum.Font.Gotham
credito.TextSize=10
credito.ZIndex=3

-- Fechar
local fechar=Instance.new("TextButton",panel)
fechar.Size=UDim2.new(0,22,0,22)
fechar.Position=UDim2.new(1,-26,0,4)
fechar.BackgroundColor3=Color3.fromRGB(200,50,80)
fechar.Text="❌"
fechar.TextColor3=Color3.fromRGB(255,255,255)
fechar.Font=Enum.Font.GothamBold
fechar.TextSize=12
fechar.BorderSizePixel=0
fechar.ZIndex=4

Instance.new("UICorner",fechar).CornerRadius=UDim.new(1,0)

fechar.MouseButton1Click:Connect(function()
 panel.Visible=false
end)

-- Abas
local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,28)
tabBar.Position=UDim2.new(0,5,0,52)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-90)
content.Position=UDim2.new(0,5,0,85)
content.BackgroundTransparency=1
content.ZIndex=3

local tabNomes={
 "🏠 Principal",
 "👵 Vovó",
 "🔑 Chaves",
 "⚙️ Extra"
}

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

 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)

 table.insert(tabBtns,b)

 local c=Instance.new("ScrollingFrame",content)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=3
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=i==1

 table.insert(conteudos,c)

 b.MouseButton1Click:Connect(function()

  for j=1,#conteudos do
   conteudos[j].Visible=j==i

   tabBtns[j].BackgroundColor3=
    j==i and Color3.fromRGB(90,50,170)
    or Color3.fromRGB(40,25,80)

   tabBtns[j].TextColor3=
    j==i and Color3.fromRGB(255,255,255)
    or Color3.fromRGB(200,200,220)
  end

 end)
end

tabBtns[1].BackgroundColor3=Color3.fromRGB(90,50,170)
tabBtns[1].TextColor3=Color3.fromRGB(255,255,255)

-- ═══════ BOTÕES ═══════

local function addToggle(parent,y,txt,fn)

 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=txt.." ⭕"
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0

 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)

 b.MouseButton1Click:Connect(function()

  local v=not b:GetAttribute("on")

  b:SetAttribute("on",v)

  b.Text=txt..(v and " ✅" or " ⭕")

  b.BackgroundColor3=
   v and Color3.fromRGB(0,150,50)
   or Color3.fromRGB(40,25,80)

  fn(v)
 end)

 return b
end

local function addButton(parent,y,txt,fn)

 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(60,40,110)
 b.Text=txt
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0

 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)

 b.MouseButton1Click:Connect(function()
  fn(b)
 end)

 return b
end

-- ═══════ ARRASTAR BOLINHA ═══════

local drag=false
local dStart=nil
local sPos=nil
local clickStart=0

ball.InputBegan:Connect(function(i)

 if i.UserInputType==Enum.UserInputType.MouseButton1
 or i.UserInputType==Enum.UserInputType.Touch then

  drag=true
  dStart=i.Position
  sPos=ball.Position
  clickStart=tick()

 end
end)

ball.InputEnded:Connect(function(i)

 if i.UserInputType==Enum.UserInputType.MouseButton1
 or i.UserInputType==Enum.UserInputType.Touch then

  drag=false

  if tick()-clickStart<0.25 then

   panel.Visible=not panel.Visible

   panel.Position=UDim2.new(
    ball.Position.X.Scale,
    ball.Position.X.Offset+65,
    ball.Position.Y.Scale,
    ball.Position.Y.Offset-10
   )

  end
 end
end)

U.InputChanged:Connect(function(i)

 if drag and (
  i.UserInputType==Enum.UserInputType.MouseMovement
  or i.UserInputType==Enum.UserInputType.Touch
 ) then

  local d=i.Position-dStart

  ball.Position=UDim2.new(
   sPos.X.Scale,
   sPos.X.Offset+d.X,
   sPos.Y.Scale,
   sPos.Y.Offset+d.Y
  )

  panel.Position=UDim2.new(
   ball.Position.X.Scale,
   ball.Position.X.Offset+65,
   ball.Position.Y.Scale,
   ball.Position.Y.Offset-10
  )
 end
end)

-- ═══════ FUNÇÕES ═══════

local function sizeChar(m)

 if not m then return 0 end

 local h=m:FindFirstChild("HumanoidRootPart")

 if not h then return 0 end

 return math.max(
  h.Size.X,
  h.Size.Y,
  h.Size.Z
 )
end

local function outros()

 local t={}

 for _,j in ipairs(P:GetPlayers()) do

  if j~=p and j.Character then

   local h=j.Character:FindFirstChildOfClass("Humanoid")

   if h and h.Health>0 then
    table.insert(t,{
     p=j,
     c=j.Character,
     s=sizeChar(j.Character),
     h=h
    })
   end
  end
 end

 return t
end

local vovoRef=nil

local function acharVovo()

 if vovoRef and vovoRef.Parent then

  local h=vovoRef:FindFirstChildOfClass("Humanoid")

  if h and h.Health>0 then
   return vovoRef
  end
 end

 local o=outros()

 if #o==0 then
  return nil
 end

 table.sort(o,function(a,b)
  return a.s>b.s
 end)

 vovoRef=o[1].c

 return o[1].c
end

-- ═══════ ESP ═══════

local hls={}

local function limpar()

 for _,h in ipairs(hls) do
  if h.Parent then
   h:Destroy()
  end
 end

 hls={}
end

local function addHL(part,txt)

 if not part
 or not part.Parent
 or part:FindFirstChild("MJHL") then
  return
 end

 local c=getCor()

 local hl=Instance.new("Highlight",part)
 hl.Name="MJHL"
 hl.FillColor=c
 hl.OutlineColor=c
 hl.FillTransparency=0.75
 hl.OutlineTransparency=0
 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop

 table.insert(hls,hl)

 if txt then

  local b=Instance.new("BillboardGui",part)
  b.Size=UDim2.new(0,80,0,12)
  b.StudsOffset=Vector3.new(0,2,0)
  b.AlwaysOnTop=true

  local t=Instance.new("TextLabel",b)
  t.Size=UDim2.new(1,0,1,0)
  t.BackgroundTransparency=1
  t.Text=txt
  t.TextColor3=c
  t.TextStrokeTransparency=0
  t.TextScaled=true
  t.Font=Enum.Font.GothamBold
 end
end

local gHL,gBB

local function espVovo(c)

 if not c or not c.Parent then
  return
 end

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

 local h=c:FindFirstChild("Head")
  or c:FindFirstChild("HumanoidRootPart")

 if h then

  if gBB and gBB.Parent then

   gBB.Parent=h

   local t=gBB:FindFirstChildWhichIsA("TextLabel")

   if t then
    t.TextColor3=cor
   end

  else

   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,80,0,12)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true

   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1

   local pl=P:GetPlayerFromCharacter(c)

   t.Text="👵 "..(pl and pl.Name or c.Name)
   t.TextColor3=cor
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold

  end
 end
end

local function remVovo()

 if gHL and gHL.Parent then
  gHL:Destroy()
 end

 if gBB and gBB.Parent then
  gBB:Destroy()
 end

 gHL=nil
 gBB=nil
end

-- ═══════ NOCOLIDE ═══════

R.Stepped:Connect(function()

 if st.noclip then

  local c=p.Character

  if c then

   for _,x in ipairs(c:GetDescendants()) do

    if x:IsA("BasePart") then
     x.CanCollide=false
    end

   end
  end
 end
end)

-- ═══════ PULO INFINITO ═══════

U.JumpRequest:Connect(function()

 if st.infJump then

  local c=p.Character

  if c then

   local h=c:FindFirstChildOfClass("Humanoid")

   if h then
    h:ChangeState(Enum.HumanoidStateType.Jumping)
   end

  end
 end
end)

-- ═══════ MIRA ═══════

pcall(function()
 R:UnbindFromRenderStep("MJA")
end)

R:BindToRenderStep("MJA",201,function()

 if st.mira then

  local v=acharVovo()

  if v then

   local h=v:FindFirstChild("HumanoidRootPart")
    or v:FindFirstChild("Head")

   if h then
    cam.CFrame=CFrame.lookAt(
     cam.CFrame.Position,
     h.Position
    )
   end
  end
 end
end)

-- ═══════ LOOP ESP ═══════

task.spawn(function()

 while gui.Parent do

  local cor=getCor()

  if st.vovo then

   local v=acharVovo()

   if v then
    espVovo(v)
   end

  end

  if st.chave then

   for _,o in ipairs(workspace:GetDescendants()) do

    if o:IsA("BasePart")
    and (
     o.Name:lower():find("key")
     or o.Name:lower():find("chave")
    ) then

     addHL(o,"🔑")

    end
   end
  end

  if st.fechadura then

   for _,o in ipairs(workspace:GetDescendants()) do

    if o:IsA("BasePart")
    and (
     o.Name:lower():find("lock")
     or o.Name:lower():find("porta")
     or o.Name:lower():find("door")
    ) then

     addHL(o,"🚪")

    end
   end
  end

  if cores[st.cor].c=="rainbow" then

   for _,o in ipairs(workspace:GetDescendants()) do

    if o.Name=="MJHL" then
     o.FillColor=cor
     o.OutlineColor=cor
    end

   end

   if gHL and gHL.Parent then
    gHL.FillColor=cor
    gHL.OutlineColor=cor
   end
  end

  task.wait(0.5)
 end
end)

-- ═══════ PRINCIPAL ═══════

local c1=conteudos[1]

addToggle(c1,5,"🚶 Noclip",function(v)

 st.noclip=v

 if not v then

  local c=p.Character

  if c then

   for _,x in ipairs(c:GetDescendants()) do

    if x:IsA("BasePart") then
     x.CanCollide=true
    end

   end
  end
 end
end)

addButton(c1,35,"⚡ Speed: 16",function(b)

 st.speed=st.speed+16

 if st.speed>200 then
  st.speed=16
 end

 b.Text="⚡ Speed: "..st.speed

 local c=p.Character

 if c then

  local h=c:FindFirstChildOfClass("Humanoid")

  if h then
   h.WalkSpeed=st.speed
  end

 end
end)

addToggle(c1,65,"🦘 Infinite Jump",function(v)
 st.infJump=v
end)

-- ═══════ VOVÓ ═══════

local c2=conteudos[2]

addButton(c2,5,"🎨 Cor: 🟡 Amarelo",function(b)

 st.cor=st.cor+1

 if st.cor>#cores then
  st.cor=1
 end

 b.Text="🎨 Cor: "..cores[st.cor].n
end)

addToggle(c2,35,"👵 ESP Vovó",function(v)

 st.vovo=v

 if not v then
  remVovo()
 end
end)

addToggle(c2,65,"🎯 Mira Vovó",function(v)
 st.mira=v
end)

addButton(c2,95,"📋 Listar Jogadores (F9)",function()

 local o=outros()

 table.sort(o,function(a,b)
  return a.s>b.s
 end)

 print("═══════ 🎮 JOGADORES ═══════")

 for i,j in ipairs(o) do

  print(
   "["..i.."] 👤 "
   ..j.p.Name
   .." | 📏 "
   ..string.format("%.2f",j.s)
  )

 end
end)

-- ═══════ CHAVES ═══════

local c3=conteudos[3]

addToggle(c3,5,"🔑 ESP Chaves",function(v)
 st.chave=v
end)

addToggle(c3,35,"🚪 ESP Fechaduras",function(v)
 st.fechadura=v
end)

addButton(c3,65,"🧹 Limpar Destaques",function()
 limpar()
end)

-- ═══════ EXTRA ═══════

local c4=conteudos[4]

addButton(c4,5,"🔄 Rejoin Server",function()

 game:GetService("TeleportService"):Teleport(
  game.PlaceId,
  p
 )

end)

print("🚀 [MJ 1.0] by "..CRIADOR.." carregado! ✨")-- 🚀 MJ 1.0 | by Mikael_N244BR

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_N244BR"

local st={
 noclip=false,
 infJump=false,
 vovo=false,
 mira=false,
 chave=false,
 fechadura=false,
 speed=16,
 cor=1
}

local cores={
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
 if c=="rainbow" then
  return Color3.fromHSV(tick()*0.4%1,1,1)
 end
 return c
end

-- GUI
local gui=Instance.new("ScreenGui")
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.Parent=game.CoreGui

-- ═══════ 🌌 FUNDO DE CONSTELAÇÕES ═══════

local constBg=Instance.new("Frame",gui)
constBg.Size=UDim2.new(1,0,1,0)
constBg.BackgroundTransparency=1
constBg.ZIndex=0

local constStars={}

for c=1,8 do
 local bx=math.random(5,85)/100
 local by=math.random(5,85)/100
 local n=math.random(4,7)
 local g={}

 for i=1,n do
  local s=Instance.new("Frame",constBg)
  s.Size=UDim2.new(0,math.random(1,3),0,math.random(1,3))
  s.Position=UDim2.new(
   bx+math.random(-8,8)/100,0,
   by+math.random(-8,8)/100,0
  )
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(20,60)/100
  s.BorderSizePixel=0
  s.ZIndex=1

  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

  table.insert(g,s)
  table.insert(constStars,s)
 end

 for i=1,#g-1 do
  local a=g[i]
  local b=g[i+1]

  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100

  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))

  local line=Instance.new("Frame",constBg)
  line.Size=UDim2.new(0,dist*3.2,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.7
  line.BorderSizePixel=0
  line.ZIndex=0

  table.insert(constStars,line)
 end
end

for i=1,30 do
 local s=Instance.new("Frame",constBg)
 s.Size=UDim2.new(0,1,0,1)
 s.Position=UDim2.new(math.random(),0,math.random(),0)
 s.BackgroundColor3=Color3.fromRGB(200,200,255)
 s.BackgroundTransparency=math.random(50,85)/100
 s.BorderSizePixel=0
 s.ZIndex=0

 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

 table.insert(constStars,s)
end

task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=3 then
    s.BackgroundTransparency=math.random(20,85)/100
   end
  end
  task.wait(0.5)
 end
end)

-- ═══════ 🚀 FOGUETE MJ 1.0 ═══════

local rocket=Instance.new("Frame",gui)
rocket.Size=UDim2.new(0,90,0,150)
rocket.Position=UDim2.new(0.5,-45,1,180)
rocket.BackgroundTransparency=1
rocket.ZIndex=15

-- Corpo
local corpo=Instance.new("Frame",rocket)
corpo.Size=UDim2.new(0,52,0,95)
corpo.Position=UDim2.new(0.5,-26,0,35)
corpo.BackgroundColor3=Color3.fromRGB(235,235,245)
corpo.BorderSizePixel=0

Instance.new("UICorner",corpo).CornerRadius=UDim.new(0.5,0)

local corpoStroke=Instance.new("UIStroke",corpo)
corpoStroke.Color=Color3.fromRGB(145,80,255)
corpoStroke.Thickness=2

-- Ponta
local ponta=Instance.new("TextLabel",rocket)
ponta.Size=UDim2.new(0,70,0,55)
ponta.Position=UDim2.new(0.5,-35,0,0)
ponta.BackgroundTransparency=1
ponta.Text="🚀"
ponta.TextScaled=true
ponta.Font=Enum.Font.GothamBold
ponta.ZIndex=17

-- Janela
local janela=Instance.new("Frame",corpo)
janela.Size=UDim2.new(0,24,0,24)
janela.Position=UDim2.new(0.5,-12,0,20)
janela.BackgroundColor3=Color3.fromRGB(90,180,255)
janela.BorderSizePixel=0

Instance.new("UICorner",janela).CornerRadius=UDim.new(1,0)

local janelaStroke=Instance.new("UIStroke",janela)
janelaStroke.Color=Color3.fromRGB(210,240,255)
janelaStroke.Thickness=2

-- Faixa MJ
local faixa=Instance.new("Frame",corpo)
faixa.Size=UDim2.new(1,0,0,12)
faixa.Position=UDim2.new(0,0,0,52)
faixa.BackgroundColor3=Color3.fromRGB(145,80,255)
faixa.BorderSizePixel=0

local mj=Instance.new("TextLabel",faixa)
mj.Size=UDim2.new(1,0,1,0)
mj.BackgroundTransparency=1
mj.Text="MJ"
mj.TextColor3=Color3.fromRGB(255,255,255)
mj.Font=Enum.Font.GothamBold
mj.TextSize=9

-- Asa esquerda
local asaE=Instance.new("TextLabel",rocket)
asaE.Size=UDim2.new(0,30,0,50)
asaE.Position=UDim2.new(0,-3,0,80)
asaE.BackgroundTransparency=1
asaE.Text="◀"
asaE.TextColor3=Color3.fromRGB(145,80,255)
asaE.TextScaled=true
asaE.ZIndex=16

-- Asa direita
local asaD=Instance.new("TextLabel",rocket)
asaD.Size=UDim2.new(0,30,0,50)
asaD.Position=UDim2.new(1,-27,0,80)
asaD.BackgroundTransparency=1
asaD.Text="▶"
asaD.TextColor3=Color3.fromRGB(145,80,255)
asaD.TextScaled=true
asaD.ZIndex=16

-- Chama
local chama=Instance.new("TextLabel",rocket)
chama.Size=UDim2.new(0,45,0,55)
chama.Position=UDim2.new(0.5,-22,0,125)
chama.BackgroundTransparency=1
chama.Text="🔥"
chama.TextScaled=true
chama.ZIndex=14

-- Partículas
local rocketParticles={}

for i=1,24 do
 local s=Instance.new("TextLabel",gui)
 s.Size=UDim2.new(0,math.random(8,16),0,math.random(8,16))
 s.BackgroundTransparency=1
 s.Text=math.random(1,2)==1 and "✨" or "•"
 s.TextColor3=Color3.fromRGB(210,170,255)
 s.TextScaled=true
 s.Visible=false
 s.ZIndex=13

 table.insert(rocketParticles,s)
end

-- Fumaça
local rocketSmoke={}

for i=1,14 do
 local s=Instance.new("Frame",gui)
 s.Size=UDim2.new(0,math.random(12,25),0,math.random(12,25))
 s.BackgroundColor3=Color3.fromRGB(210,210,225)
 s.BackgroundTransparency=0.45
 s.BorderSizePixel=0
 s.Visible=false
 s.ZIndex=12

 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

 table.insert(rocketSmoke,s)
end

-- Texto final
local mjGrande=Instance.new("TextLabel",gui)
mjGrande.Size=UDim2.new(0,400,0,100)
mjGrande.Position=UDim2.new(0.5,-200,0.5,-50)
mjGrande.BackgroundTransparency=1
mjGrande.Text="MJ 1.0"
mjGrande.TextColor3=Color3.fromRGB(255,255,255)
mjGrande.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjGrande.TextStrokeTransparency=0
mjGrande.Font=Enum.Font.GothamBold
mjGrande.TextSize=60
mjGrande.TextTransparency=1
mjGrande.ZIndex=20

-- Animação do foguete
task.spawn(function()

 for t=0,1,0.008 do

  local y=1-t

  rocket.Position=UDim2.new(
   0.5,-45,
   y,20
  )

  rocket.Rotation=math.sin(t*18)*4

  chama.Size=UDim2.new(
   0,38+math.random(0,14),
   0,45+math.random(0,20)
  )

  chama.Position=UDim2.new(
   0.5,-22,
   0,122
  )

  for i,s in ipairs(rocketSmoke) do
   s.Visible=true

   s.Position=UDim2.new(
    0.5,math.random(-30,30),
    y+0.13+(i*0.006),
    20
   )

   s.BackgroundTransparency=0.25+(i/18)
  end

  for _,s in ipairs(rocketParticles) do
   s.Visible=true

   s.Position=UDim2.new(
    0.5+math.random(-45,45)/100,
    -7,
    y+math.random(10,30)/100,
    0
   )

   s.TextTransparency=math.random(0,60)/100
  end

  task.wait(0.012)
 end

 -- Explosão
 local explosao=Instance.new("TextLabel",gui)
 explosao.Size=UDim2.new(0,80,0,80)
 explosao.Position=UDim2.new(0.5,-40,-0.08,0)
 explosao.BackgroundTransparency=1
 explosao.Text="💥"
 explosao.TextScaled=true
 explosao.ZIndex=20

 for i=1,18 do
  explosao.Size=UDim2.new(
   0,80+i*14,
   0,80+i*14
  )

  explosao.Position=UDim2.new(
   0.5,-40-i*7,
   -0.08-i*0.007,
   0
  )

  explosao.TextTransparency=i/18

  task.wait(0.035)
 end

 explosao:Destroy()
 rocket:Destroy()

 for _,s in ipairs(rocketSmoke) do
  s:Destroy()
 end

 for _,s in ipairs(rocketParticles) do
  s:Destroy()
 end

 mjGrande.Text="🚀 MJ 1.0 🚀"

 for i=1,10 do
  mjGrande.TextSize=58+i*2
  mjGrande.TextTransparency=math.abs(math.sin(i))
  task.wait(0.07)
 end

 mjGrande.TextTransparency=0
 mjGrande.Text="✨ MJ 1.0 ✨"

 task.wait(1)

 for i=1,20 do
  mjGrande.TextTransparency=i/20
  task.wait(0.03)
 end

 mjGrande:Destroy()
end)

-- ═══════ 🎯 BOLINHA MJ ═══════

task.wait(3)

local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,55,0,55)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(5,3,15)
ball.BorderSizePixel=0
ball.Active=true
ball.ZIndex=10

Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)

local bs=Instance.new("UIStroke",ball)
bs.Color=Color3.fromRGB(180,120,255)
bs.Thickness=2

local mjTxt=Instance.new("TextLabel",ball)
mjTxt.Size=UDim2.new(1,0,1,0)
mjTxt.BackgroundTransparency=1
mjTxt.Text="🌟MJ🌟"
mjTxt.TextColor3=Color3.fromRGB(255,255,255)
mjTxt.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjTxt.TextStrokeTransparency=0.3
mjTxt.Font=Enum.Font.GothamBold
mjTxt.TextScaled=true
mjTxt.ZIndex=11

-- ═══════ PAINEL ═══════

local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,300,0,400)
panel.Position=UDim2.new(0,85,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,3,15)
panel.BorderSizePixel=0
panel.Visible=false
panel.ZIndex=3

Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)

local ps=Instance.new("UIStroke",panel)
ps.Color=Color3.fromRGB(150,100,255)
ps.Thickness=1.5

-- Estrelas do painel
local pStars={}

for c=1,3 do
 local bx=math.random(10,70)/100
 local by=math.random(10,70)/100
 local g={}

 for i=1,5 do
  local s=Instance.new("Frame",panel)
  s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
  s.Position=UDim2.new(
   bx+math.random(-10,10)/100,0,
   by+math.random(-10,10)/100,0
  )
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(30,70)/100
  s.BorderSizePixel=0
  s.ZIndex=1

  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)

  table.insert(g,s)
  table.insert(pStars,s)
 end

 for i=1,#g-1 do
  local a=g[i]
  local b=g[i+1]

  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100

  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))

  local line=Instance.new("Frame",panel)
  line.Size=UDim2.new(0,dist*3,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.75
  line.BorderSizePixel=0
  line.ZIndex=1

  table.insert(pStars,line)
 end
end

task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(pStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=2 then
    s.BackgroundTransparency=math.random(30,80)/100
   end
  end
  task.wait(0.4)
 end
end)

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,30)
titulo.BackgroundColor3=Color3.fromRGB(90,50,170)
titulo.BackgroundTransparency=0.2
titulo.Text="✨🚀 MJ 1.0 🚀✨"
titulo.TextColor3=Color3.fromRGB(255,255,255)
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=14
titulo.BorderSizePixel=0
titulo.ZIndex=3

Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local credito=Instance.new("TextLabel",panel)
credito.Size=UDim2.new(1,0,0,14)
credito.Position=UDim2.new(0,0,0,32)
credito.BackgroundTransparency=1
credito.Text="💜 by "..CRIADOR.." 💜"
credito.TextColor3=Color3.fromRGB(200,160,255)
credito.Font=Enum.Font.Gotham
credito.TextSize=10
credito.ZIndex=3

-- Fechar
local fechar=Instance.new("TextButton",panel)
fechar.Size=UDim2.new(0,22,0,22)
fechar.Position=UDim2.new(1,-26,0,4)
fechar.BackgroundColor3=Color3.fromRGB(200,50,80)
fechar.Text="❌"
fechar.TextColor3=Color3.fromRGB(255,255,255)
fechar.Font=Enum.Font.GothamBold
fechar.TextSize=12
fechar.BorderSizePixel=0
fechar.ZIndex=4

Instance.new("UICorner",fechar).CornerRadius=UDim.new(1,0)

fechar.MouseButton1Click:Connect(function()
 panel.Visible=false
end)

-- Abas
local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,28)
tabBar.Position=UDim2.new(0,5,0,52)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-90)
content.Position=UDim2.new(0,5,0,85)
content.BackgroundTransparency=1
content.ZIndex=3

local tabNomes={
 "🏠 Principal",
 "👵 Vovó",
 "🔑 Chaves",
 "⚙️ Extra"
}

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

 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)

 table.insert(tabBtns,b)

 local c=Instance.new("ScrollingFrame",content)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=3
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=i==1

 table.insert(conteudos,c)

 b.MouseButton1Click:Connect(function()

  for j=1,#conteudos do
   conteudos[j].Visible=j==i

   tabBtns[j].BackgroundColor3=
    j==i and Color3.fromRGB(90,50,170)
    or Color3.fromRGB(40,25,80)

   tabBtns[j].TextColor3=
    j==i and Color3.fromRGB(255,255,255)
    or Color3.fromRGB(200,200,220)
  end

 end)
end

tabBtns[1].BackgroundColor3=Color3.fromRGB(90,50,170)
tabBtns[1].TextColor3=Color3.fromRGB(255,255,255)

-- ═══════ BOTÕES ═══════

local function addToggle(parent,y,txt,fn)

 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=txt.." ⭕"
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0

 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)

 b.MouseButton1Click:Connect(function()

  local v=not b:GetAttribute("on")

  b:SetAttribute("on",v)

  b.Text=txt..(v and " ✅" or " ⭕")

  b.BackgroundColor3=
   v and Color3.fromRGB(0,150,50)
   or Color3.fromRGB(40,25,80)

  fn(v)
 end)

 return b
end

local function addButton(parent,y,txt,fn)

 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(60,40,110)
 b.Text=txt
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0

 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)

 b.MouseButton1Click:Connect(function()
  fn(b)
 end)

 return b
end

-- ═══════ ARRASTAR BOLINHA ═══════

local drag=false
local dStart=nil
local sPos=nil
local clickStart=0

ball.InputBegan:Connect(function(i)

 if i.UserInputType==Enum.UserInputType.MouseButton1
 or i.UserInputType==Enum.UserInputType.Touch then

  drag=true
  dStart=i.Position
  sPos=ball.Position
  clickStart=tick()

 end
end)

ball.InputEnded:Connect(function(i)

 if i.UserInputType==Enum.UserInputType.MouseButton1
 or i.UserInputType==Enum.UserInputType.Touch then

  drag=false

  if tick()-clickStart<0.25 then

   panel.Visible=not panel.Visible

   panel.Position=UDim2.new(
    ball.Position.X.Scale,
    ball.Position.X.Offset+65,
    ball.Position.Y.Scale,
    ball.Position.Y.Offset-10
   )

  end
 end
end)

U.InputChanged:Connect(function(i)

 if drag and (
  i.UserInputType==Enum.UserInputType.MouseMovement
  or i.UserInputType==Enum.UserInputType.Touch
 ) then

  local d=i.Position-dStart

  ball.Position=UDim2.new(
   sPos.X.Scale,
   sPos.X.Offset+d.X,
   sPos.Y.Scale,
   sPos.Y.Offset+d.Y
  )

  panel.Position=UDim2.new(
   ball.Position.X.Scale,
   ball.Position.X.Offset+65,
   ball.Position.Y.Scale,
   ball.Position.Y.Offset-10
  )
 end
end)

-- ═══════ FUNÇÕES ═══════

local function sizeChar(m)

 if not m then return 0 end

 local h=m:FindFirstChild("HumanoidRootPart")

 if not h then return 0 end

 return math.max(
  h.Size.X,
  h.Size.Y,
  h.Size.Z
 )
end

local function outros()

 local t={}

 for _,j in ipairs(P:GetPlayers()) do

  if j~=p and j.Character then

   local h=j.Character:FindFirstChildOfClass("Humanoid")

   if h and h.Health>0 then
    table.insert(t,{
     p=j,
     c=j.Character,
     s=sizeChar(j.Character),
     h=h
    })
   end
  end
 end

 return t
end

local vovoRef=nil

local function acharVovo()

 if vovoRef and vovoRef.Parent then

  local h=vovoRef:FindFirstChildOfClass("Humanoid")

  if h and h.Health>0 then
   return vovoRef
  end
 end

 local o=outros()

 if #o==0 then
  return nil
 end

 table.sort(o,function(a,b)
  return a.s>b.s
 end)

 vovoRef=o[1].c

 return o[1].c
end

-- ═══════ ESP ═══════

local hls={}

local function limpar()

 for _,h in ipairs(hls) do
  if h.Parent then
   h:Destroy()
  end
 end

 hls={}
end

local function addHL(part,txt)

 if not part
 or not part.Parent
 or part:FindFirstChild("MJHL") then
  return
 end

 local c=getCor()

 local hl=Instance.new("Highlight",part)
 hl.Name="MJHL"
 hl.FillColor=c
 hl.OutlineColor=c
 hl.FillTransparency=0.75
 hl.OutlineTransparency=0
 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop

 table.insert(hls,hl)

 if txt then

  local b=Instance.new("BillboardGui",part)
  b.Size=UDim2.new(0,80,0,12)
  b.StudsOffset=Vector3.new(0,2,0)
  b.AlwaysOnTop=true

  local t=Instance.new("TextLabel",b)
  t.Size=UDim2.new(1,0,1,0)
  t.BackgroundTransparency=1
  t.Text=txt
  t.TextColor3=c
  t.TextStrokeTransparency=0
  t.TextScaled=true
  t.Font=Enum.Font.GothamBold
 end
end

local gHL,gBB

local function espVovo(c)

 if not c or not c.Parent then
  return
 end

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

 local h=c:FindFirstChild("Head")
  or c:FindFirstChild("HumanoidRootPart")

 if h then

  if gBB and gBB.Parent then

   gBB.Parent=h

   local t=gBB:FindFirstChildWhichIsA("TextLabel")

   if t then
    t.TextColor3=cor
   end

  else

   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,80,0,12)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true

   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1

   local pl=P:GetPlayerFromCharacter(c)

   t.Text="👵 "..(pl and pl.Name or c.Name)
   t.TextColor3=cor
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold

  end
 end
end

local function remVovo()

 if gHL and gHL.Parent then
  gHL:Destroy()
 end

 if gBB and gBB.Parent then
  gBB:Destroy()
 end

 gHL=nil
 gBB=nil
end

-- ═══════ NOCOLIDE ═══════

R.Stepped:Connect(function()

 if st.noclip then

  local c=p.Character

  if c then

   for _,x in ipairs(c:GetDescendants()) do

    if x:IsA("BasePart") then
     x.CanCollide=false
    end

   end
  end
 end
end)

-- ═══════ PULO INFINITO ═══════

U.JumpRequest:Connect(function()

 if st.infJump then

  local c=p.Character

  if c then

   local h=c:FindFirstChildOfClass("Humanoid")

   if h then
    h:ChangeState(Enum.HumanoidStateType.Jumping)
   end

  end
 end
end)

-- ═══════ MIRA ═══════

pcall(function()
 R:UnbindFromRenderStep("MJA")
end)

R:BindToRenderStep("MJA",201,function()

 if st.mira then

  local v=acharVovo()

  if v then

   local h=v:FindFirstChild("HumanoidRootPart")
    or v:FindFirstChild("Head")

   if h then
    cam.CFrame=CFrame.lookAt(
     cam.CFrame.Position,
     h.Position
    )
   end
  end
 end
end)

-- ═══════ LOOP ESP ═══════

task.spawn(function()

 while gui.Parent do

  local cor=getCor()

  if st.vovo then

   local v=acharVovo()

   if v then
    espVovo(v)
   end

  end

  if st.chave then

   for _,o in ipairs(workspace:GetDescendants()) do

    if o:IsA("BasePart")
    and (
     o.Name:lower():find("key")
     or o.Name:lower():find("chave")
    ) then

     addHL(o,"🔑")

    end
   end
  end

  if st.fechadura then

   for _,o in ipairs(workspace:GetDescendants()) do

    if o:IsA("BasePart")
    and (
     o.Name:lower():find("lock")
     or o.Name:lower():find("porta")
     or o.Name:lower():find("door")
    ) then

     addHL(o,"🚪")

    end
   end
  end

  if cores[st.cor].c=="rainbow" then

   for _,o in ipairs(workspace:GetDescendants()) do

    if o.Name=="MJHL" then
     o.FillColor=cor
     o.OutlineColor=cor
    end

   end

   if gHL and gHL.Parent then
    gHL.FillColor=cor
    gHL.OutlineColor=cor
   end
  end

  task.wait(0.5)
 end
end)

-- ═══════ PRINCIPAL ═══════

local c1=conteudos[1]

addToggle(c1,5,"🚶 Noclip",function(v)

 st.noclip=v

 if not v then

  local c=p.Character

  if c then

   for _,x in ipairs(c:GetDescendants()) do

    if x:IsA("BasePart") then
     x.CanCollide=true
    end

   end
  end
 end
end)

addButton(c1,35,"⚡ Speed: 16",function(b)

 st.speed=st.speed+16

 if st.speed>200 then
  st.speed=16
 end

 b.Text="⚡ Speed: "..st.speed

 local c=p.Character

 if c then

  local h=c:FindFirstChildOfClass("Humanoid")

  if h then
   h.WalkSpeed=st.speed
  end

 end
end)

addToggle(c1,65,"🦘 Infinite Jump",function(v)
 st.infJump=v
end)

-- ═══════ VOVÓ ═══════

local c2=conteudos[2]

addButton(c2,5,"🎨 Cor: 🟡 Amarelo",function(b)

 st.cor=st.cor+1

 if st.cor>#cores then
  st.cor=1
 end

 b.Text="🎨 Cor: "..cores[st.cor].n
end)

addToggle(c2,35,"👵 ESP Vovó",function(v)

 st.vovo=v

 if not v then
  remVovo()
 end
end)

addToggle(c2,65,"🎯 Mira Vovó",function(v)
 st.mira=v
end)

addButton(c2,95,"📋 Listar Jogadores (F9)",function()

 local o=outros()

 table.sort(o,function(a,b)
  return a.s>b.s
 end)

 print("═══════ 🎮 JOGADORES ═══════")

 for i,j in ipairs(o) do

  print(
   "["..i.."] 👤 "
   ..j.p.Name
   .." | 📏 "
   ..string.format("%.2f",j.s)
  )

 end
end)

-- ═══════ CHAVES ═══════

local c3=conteudos[3]

addToggle(c3,5,"🔑 ESP Chaves",function(v)
 st.chave=v
end)

addToggle(c3,35,"🚪 ESP Fechaduras",function(v)
 st.fechadura=v
end)

addButton(c3,65,"🧹 Limpar Destaques",function()
 limpar()
end)

-- ═══════ EXTRA ═══════

local c4=conteudos[4]

addButton(c4,5,"🔄 Rejoin Server",function()

 game:GetService("TeleportService"):Teleport(
  game.PlaceId,
  p
 )

end)

print("🚀 [MJ 1.0] by "..CRIADOR.." carregado! ✨")
