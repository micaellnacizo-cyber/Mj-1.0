-- ═══════ 🚀 FOGUETE MJ 1.0 — DETALHADO ═══════

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

-- Chama principal
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

-- Animação
task.spawn(function()

 for t=0,1,0.008 do

  local y=1-t

  rocket.Position=UDim2.new(
   0.5,-45,
   y,20
  )

  rocket.Rotation=math.sin(t*18)*4

  -- chama pulsando
  chama.Size=UDim2.new(
   0,38+math.random(0,14),
   0,45+math.random(0,20)
  )

  chama.Position=UDim2.new(
   0.5,-22,
   0,122
  )

  -- fumaça
  for i,s in ipairs(rocketSmoke) do
   s.Visible=true

   local spread=math.random(-30,30)

   s.Position=UDim2.new(
    0.5,spread,
    y+0.13+(i*0.006),
    20
   )

   s.BackgroundTransparency=0.25+(i/18)
  end

  -- partículas
  for _,s in ipairs(rocketParticles) do
   s.Visible=true

   local px=math.random(-45,45)/100
   local py=y+math.random(10,30)/100

   s.Position=UDim2.new(
    0.5+px,-7,
    py,0
   )

   s.TextTransparency=math.random(0,60)/100
  end

  task.wait(0.012)
 end

 -- explosão
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

 -- título
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
