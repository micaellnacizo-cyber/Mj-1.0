-- ⚫ MJ 1.0 | by Mikael_n244br
pcall(function()
    local old=game.CoreGui:FindFirstChild("MJ")
    if old then old:Destroy() end
end)

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
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
gui.DisplayOrder=999

-- 🚀 FOGUETE
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
 s.BackgroundColor3=branco
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
nomeMJ.Text="⚫ MJ 1.0 ⚫"
nomeMJ.TextColor3=branco
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

-- ⚫ BOLINHA
local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,60,0,60)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(5,5,5)
ball.BorderSizePixel=0
ball.Active=true
ball.ZIndex=100
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bs=Instance.new("UIStroke",ball)
bs.Color=branco
bs.Thickness=2

local mj=Instance.new("TextLabel",ball)
mj.Size=UDim2.new(1,0,1,0)
mj.BackgroundTransparency=1
mj.Text="MJ"
mj.TextColor3=branco
mj.TextStrokeColor3=Color3.fromRGB(0,0,0)
mj.TextStrokeTransparency=0.2
mj.Font=Enum.Font.GothamBold
mj.TextScaled=true
mj.ZIndex=101

-- ⚫ PAINEL
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,280,0,400)
panel.Position=UDim2.new(0,90,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,5,5)
panel.BorderSizePixel=0
panel.Visible=false
panel.Active=true
panel.ZIndex=200
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=branco
ps.Thickness=1.5

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,30)
titulo.BackgroundColor3=Color3.fromRGB(30,30,30)
titulo.Text="⚫ MJ 1.0 ⚫"
titulo.TextColor3=branco
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
cred.TextColor3=cinza
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=201

local fec=Instance.new("TextButton",panel)
fec.Size=UDim2.new(0,22,0,22)
fec.Position=UDim2.new(1,-26,0,4)
fec.BackgroundColor3=Color3.fromRGB(180,30,50)
fec.Text="X"
fec.TextColor3=branco
fec.Font=Enum.Font.GothamBold
fec.TextSize=12
fec.BorderSizePixel=0
fec.ZIndex=202
Instance.new("UICorner",fec).CornerRadius=UDim.new(1,0)
fec.MouseButton1Click:Connect(function() panel.Visible=false end)

-- 3 ABAS
local tabNomes={"Principal","Vovó","Chaves"}
local tabBtns={}
local tabConteudos={}

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",panel)
 b.Size=UDim2.new(0.333,-4,0,26)
 b.Position=UDim2.new((i-1)*0.333+0.005,0,0,52)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=cinza
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
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
 b.Text=txt.." OFF"
 b.TextColor3=branco
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
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
 b.Size=UDim2.new(1,-8,0,30)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(50,50,50)
 b.Text=txt
 b.TextColor3=branco
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
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

task.spawn(function()
 while true do
  local cor=getCor()
  local v=(st.vovo or st.alerta) and acharV() or nil
  if v and st.vovo then espV(v) end
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

-- PRINCIPAL
addT(tabConteudos[1],5,"Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addB(tabConteudos[1],40,"Speed: 16",function(b)
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 b.Text="Speed: "..st.speed
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addB(tabConteudos[1],75,"Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

-- VOVÓ (com botão de cor embaixo)
addT(tabConteudos[2],5,"ESP Vovo",function(v)
 st.vovo=v
 if not v then
  if gHL and gHL.Parent then gHL:Destroy() end
  if gBB and gBB.Parent then gBB:Destroy() end
  gHL,gBB=nil,nil
 end
end)
addT(tabConteudos[2],40,"Mira Vovo",function(v) st.mira=v end)
addT(tabConteudos[2],75,"Alerta Vovo",function(v) st.alerta=v end)

-- Botão de COR embaixo do ESP Vovó
local corBtn=Instance.new("TextButton",tabConteudos[2])
corBtn.Size=UDim2.new(1,-8,0,30)
corBtn.Position=UDim2.new(0,4,0,110)
corBtn.BackgroundColor3=branco
corBtn.Text="🎨 Cor: ⚪ Branco"
corBtn.TextColor3=Color3.fromRGB(0,0,0)
corBtn.Font=Enum.Font.GothamBold
corBtn.TextSize=11
corBtn.BorderSizePixel=0
corBtn.ZIndex=210
corBtn.Active=true
Instance.new("UICorner",corBtn).CornerRadius=UDim.new(0,6)
corBtn.MouseButton1Click:Connect(function()
 st.cor=st.cor+1
 if st.cor>#cores then st.cor=1 end
 local c=cores[st.cor]
 corBtn.Text="🎨 Cor: "..c.n
 if c.c=="rainbow" then
  corBtn.BackgroundColor3=Color3.fromRGB(150,50,200)
  corBtn.TextColor3=branco
 else
  corBtn.BackgroundColor3=c.c
  corBtn.TextColor3=(c.c.R+c.c.G+c.c.B<300) and branco or Color3.fromRGB(0,0,0)
 end
end)

-- CHAVES
addT(tabConteudos[3],5,"ESP Chaves",function(v)
 st.chave=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" then o:Destroy() end
 end end
end)
addT(tabConteudos[3],40,"ESP Portas",function(v)
 st.porta=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJP" then o:Destroy() end
 end end
end)

print("⚫ MJ 1.0 by "..CRIADOR.." carregado! ⚫")
