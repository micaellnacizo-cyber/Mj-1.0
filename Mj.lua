-- ⚫ MJ 1.0 | by Mikael_n244br
pcall(function()
    for _, obj in ipairs(game.CoreGui:GetChildren()) do
        if obj.Name=="MJ" then obj:Destroy() end
    end
end)

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_n244br"

local cores={
 {n="Branco",c=Color3.fromRGB(255,255,255)},
 {n="Amarelo",c=Color3.fromRGB(255,255,0)},
 {n="Verde",c=Color3.fromRGB(0,255,0)},
 {n="Vermelho",c=Color3.fromRGB(255,0,0)},
 {n="Azul",c=Color3.fromRGB(0,150,255)},
 {n="Roxo",c=Color3.fromRGB(180,0,255)},
 {n="Rosa",c=Color3.fromRGB(255,0,180)},
 {n="Ciano",c=Color3.fromRGB(0,255,255)},
 {n="Laranja",c=Color3.fromRGB(255,130,0)},
 {n="Rainbow",c="rainbow"},
}
local corIdx=1
local function getCor()
 local c=cores[corIdx].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

local st={noclip=false,infJump=false,vovo=false,mira=false,chave=false,fechadura=false,speed=16}
local branco=Color3.fromRGB(255,255,255)
local cinza=Color3.fromRGB(200,200,220)

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true

-- BOLINHA MJ
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
 s.Position=UDim2.new(math.random()*0.9,0,math.random()*0.9,0)
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

-- PAINEL
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,290,0,400)
panel.Position=UDim2.new(0,90,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,5,5)
panel.BorderSizePixel=0
panel.Visible=false
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
titulo.ZIndex=3
Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local cred=Instance.new("TextLabel",panel)
cred.Size=UDim2.new(1,0,0,14)
cred.Position=UDim2.new(0,0,0,31)
cred.BackgroundTransparency=1
cred.Text="by "..CRIADOR
cred.TextColor3=cinza
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=3

local fec=Instance.new("TextButton",panel)
fec.Size=UDim2.new(0,22,0,22)
fec.Position=UDim2.new(1,-26,0,4)
fec.BackgroundColor3=Color3.fromRGB(180,30,50)
fec.Text="X"
fec.TextColor3=branco
fec.Font=Enum.Font.GothamBold
fec.TextSize=12
fec.BorderSizePixel=0
fec.ZIndex=4
Instance.new("UICorner",fec).CornerRadius=UDim.new(1,0)
fec.MouseButton1Click:Connect(function() panel.Visible=false end)

-- ABAS
local tabNomes={"Principal","Vovo","Cores","Arremessar","Extra"}
local tabBtns={}
local tabConteudos={}
local tabBarY=52
local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,26)
tabBar.Position=UDim2.new(0,5,0,tabBarY)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-90)
content.Position=UDim2.new(0,5,0,tabBarY+30)
content.BackgroundTransparency=1
content.ZIndex=3

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",tabBar)
 b.Size=UDim2.new(1/#tabNomes,-2,1,0)
 b.Position=UDim2.new((i-1)/#tabNomes,0,0,0)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=cinza
 b.Font=Enum.Font.Gotham
 b.TextSize=8
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
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=txt.." OFF"
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
  b.Text=txt..(v and " ON" or " OFF")
  b.BackgroundColor3=v and Color3.fromRGB(60,60,60) or Color3.fromRGB(25,25,25)
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
 b.TextColor3=branco
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
 b.BorderSizePixel=0
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
   gBB.Size=UDim2.new(0,90,0,12)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true
   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1
   local pl=P:GetPlayerFromCharacter(c)
   t.Text=(pl and pl.Name or c.Name)
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
  if st.fechadura then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("lock") or o.Name:lower():find("fechadura") or o.Name:lower():find("porta") or o.Name:lower():find("door")) then
     if not o:FindFirstChild("MJF") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJF"
      hl.FillColor=cor
      hl.OutlineColor=cor
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
    end
   end
  end
  if cores[corIdx].c=="rainbow" then
   if gHL and gHL.Parent then gHL.FillColor=cor gHL.OutlineColor=cor end
   if gBB and gBB.Parent then
    local t=gBB:FindFirstChildWhichIsA("TextLabel")
    if t then t.TextColor3=cor end
   end
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJK" or o.Name=="MJF" then
     o.FillColor=cor
     o.OutlineColor=cor
    end
   end
  end
  task.wait(0.5)
 end
end)

-- ARREMESSO
local function getTool()
 local c=p.Character
 if not c then return nil end
 for _,t in ipairs(c:GetChildren()) do
  if t:IsA("Tool") then return t end
 end
 return nil
end
local function arremessar()
 local v=acharV()
 if not v then print("Vovo nao encontrada") return end
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 if not root then return end
 local tool=getTool()
 if not tool then print("Sem item na mao") return end
 local hr=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
 if not hr then return end
 cam.CFrame=CFrame.lookAt(cam.CFrame.Position,hr.Position)
 local flat=Vector3.new(hr.Position.X,root.Position.Y,hr.Position.Z)
 root.CFrame=CFrame.lookAt(root.Position,flat)
 task.wait(0.05)
 pcall(function() mouse1click() end)
 pcall(function() mouse1press() task.wait(0.05) mouse1release() end)
 pcall(function() tool:Activate() end)
 print("Arremessado!")
end

-- FPS COUNTER
local fpsGui=Instance.new("ScreenGui",game.CoreGui)
fpsGui.Name="MJ_FPS"
fpsGui.ResetOnSpawn=false
fpsGui.Enabled=false

local fpsFrame=Instance.new("Frame",fpsGui)
fpsFrame.Size=UDim2.new(0,120,0,55)
fpsFrame.Position=UDim2.new(0.85,0,0,20)
fpsFrame.BackgroundColor3=Color3.fromRGB(5,5,5)
fpsFrame.BackgroundTransparency=0.3
fpsFrame.BorderSizePixel=0
fpsFrame.Active=true
Instance.new("UICorner",fpsFrame).CornerRadius=UDim.new(0,8)
local fSt=Instance.new("UIStroke",fpsFrame)
fSt.Color=branco
fSt.Thickness=1.5

local fpsLabel=Instance.new("TextLabel",fpsFrame)
fpsLabel.Size=UDim2.new(1,0,0,25)
fpsLabel.BackgroundTransparency=1
fpsLabel.Text="FPS: --"
fpsLabel.TextColor3=branco
fpsLabel.Font=Enum.Font.Code
fpsLabel.TextSize=13

local pingLabel=Instance.new("TextLabel",fpsFrame)
pingLabel.Size=UDim2.new(1,0,0,15)
pingLabel.Position=UDim2.new(0,0,0,25)
pingLabel.BackgroundTransparency=1
pingLabel.Text="Ping: -- ms"
pingLabel.TextColor3=cinza
pingLabel.Font=Enum.Font.Code
pingLabel.TextSize=10

local pauseBtn=Instance.new("TextButton",fpsFrame)
pauseBtn.Size=UDim2.new(1,-10,0,18)
pauseBtn.Position=UDim2.new(0,5,0,42)
pauseBtn.BackgroundColor3=Color3.fromRGB(50,50,50)
pauseBtn.Text="Pausar"
pauseBtn.TextColor3=branco
pauseBtn.Font=Enum.Font.GothamBold
pauseBtn.TextSize=9
pauseBtn.BorderSizePixel=0
Instance.new("UICorner",pauseBtn).CornerRadius=UDim.new(0,4)

local fDrag,fDStart,fSPos=false,nil,nil
fpsFrame.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  fDrag=true fDStart=i.Position fSPos=fpsFrame.Position
 end
end)
fpsFrame.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  fDrag=false
 end
end)
U.InputChanged:Connect(function(i)
 if fDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-fDStart
  fpsFrame.Position=UDim2.new(fSPos.X.Scale,fSPos.X.Offset+d.X,fSPos.Y.Scale,fSPos.Y.Offset+d.Y)
 end
end)

local fpsPausado=false
local fpsAtual=0
local pingAtual=0
pauseBtn.MouseButton1Click:Connect(function()
 fpsPausado=not fpsPausado
 pauseBtn.Text=fpsPausado and "Continuar" or "Pausar"
 pauseBtn.BackgroundColor3=fpsPausado and Color3.fromRGB(100,50,50) or Color3.fromRGB(50,50,50)
end)

local fc,lft=0,tick()
R.RenderStepped:Connect(function()
 fc=fc+1
 if tick()-lft>=1 then
  if not fpsPausado then
   fpsAtual=fc
   pingAtual=math.floor(p:GetNetworkPing()*1000)
  end
  fc=0;lft=tick()
  fpsLabel.Text="FPS: "..fpsAtual
  pingLabel.Text="Ping: "..pingAtual.." ms"
 end
end)

-- ABA PRINCIPAL
local c1=tabConteudos[1]
addT(c1,5,"Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addB(c1,40,"Speed: 16",function(b)
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 b.Text="Speed: "..st.speed
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addT(c1,75,"Infinite Jump",function(v) st.infJump=v end)
addB(c1,110,"Mostrar FPS",function()
 fpsGui.Enabled=not fpsGui.Enabled
end)

-- ABA VOVÓ
local c2=tabConteudos[2]
addT(c2,5,"ESP Vovo",function(v) st.vovo=v if not v then remV() end end)
addT(c2,40,"Mira Vovo",function(v) st.mira=v end)
addB(c2,75,"Listar Jogadores (F9)",function()
 local o=outros()
 table.sort(o,function(a,b) return a.s>b.s end)
 print("=== JOGADORES ===")
 for i,j in ipairs(o) do print("["..i.."] "..j.p.Name.." | Tam: "..string.format("%.2f",j.s)) end
end)

-- ABA CORES
local c3=tabConteudos[3]
local corY=5
for i,cor in ipairs(cores) do
 local b=Instance.new("TextButton",c3)
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
  corIdx=i
  print("Cor: "..cor.n)
 end)
 corY=corY+32
end

-- ABA ARREMESSAR
local c4=tabConteudos[4]
addB(c4,5,"Arremessar (Forca 500)",function() arremessar() end)
addB(c4,40,"Arremessar (Curva)",function()
 local v=acharV()
 if not v then return end
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 local hr=v:FindFirstChild("HumanoidRootPart")
 if not root or not hr then return end
 local dir=(root.Position-hr.Position)
 dir=Vector3.new(dir.X,0,dir.Z)
 if dir.Magnitude<0.1 then dir=Vector3.new(0,0,1) end
 dir=dir.Unit
 root.CFrame=CFrame.new(hr.Position+dir*12+Vector3.new(0,45,0),hr.Position)
 task.wait(0.15)
 cam.CFrame=CFrame.lookAt(cam.CFrame.Position,hr.Position)
 task.wait(0.05)
 pcall(function() mouse1click() end)
 pcall(function() mousepress() task.wait(0.05) mouserelease() end)
 print("Arremesso curvo!")
end)

-- ABA EXTRA
local c5=tabConteudos[5]
addT(c5,5,"ESP Chaves",function(v)
 st.chave=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" then o:Destroy() end
 end end
end)
addT(c5,40,"ESP Fechaduras",function(v)
 st.fechadura=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJF" then o:Destroy() end
 end end
end)
addB(c5,75,"Limpar Destaques",function()
 for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" or o.Name=="MJF" then o:Destroy() end
 end
end)
addB(c5,110,"Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

print("MJ 1.0 by "..CRIADOR.." carregado!")-- ⚫ MJ 1.0 | by Mikael_n244br
pcall(function()
    for _, obj in ipairs(game.CoreGui:GetChildren()) do
        if obj.Name == "MJ" then obj:Destroy() end
    end
end)

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_n244br"

-- ═══════ CORES ═══════
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
local corIdx=1
local function getCor()
 local c=cores[corIdx].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

local st={noclip=false,infJump=false,vovo=false,mira=false,chave=false,fechadura=false,speed=16,forca=500}

local branco=Color3.fromRGB(255,255,255)
local cinza=Color3.fromRGB(200,200,220)

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true

-- 🌌 CONSTELAÇÕES
local constBg=Instance.new("Frame",gui)
constBg.Size=UDim2.new(1,0,1,0)
constBg.BackgroundTransparency=1
constBg.ZIndex=-9
constBg.Visible=false

local constStars={}
for c=1,10 do
 local bx=math.random(5,85)/100
 local by=math.random(5,85)/100
 local n=math.random(4,7)
 local g={}
 for i=1,n do
  local s=Instance.new("Frame",constBg)
  s.Size=UDim2.new(0,math.random(2,3),0,math.random(2,3))
  s.Position=UDim2.new(bx+math.random(-10,10)/100,0,by+math.random(-10,10)/100,0)
  s.BackgroundColor3=branco
  s.BackgroundTransparency=math.random(20,50)/100
  s.BorderSizePixel=0
  s.ZIndex=-8
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(g,s)
  table.insert(constStars,s)
 end
 for i=1,#g-1 do
  local a=g[i] local b=g[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",constBg)
  line.Size=UDim2.new(0,dist*3.2,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=branco
  line.BackgroundTransparency=0.6
  line.BorderSizePixel=0
  line.ZIndex=-9
  table.insert(constStars,line)
 end
end
for i=1,40 do
 local s=Instance.new("Frame",constBg)
 s.Size=UDim2.new(0,1,0,1)
 s.Position=UDim2.new(math.random(),0,math.random(),0)
 s.BackgroundColor3=branco
 s.BackgroundTransparency=math.random(40,80)/100
 s.BorderSizePixel=0
 s.ZIndex=-9
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(constStars,s)
end

task.spawn(function()
 while gui.Parent do
  if constBg.Visible then
   for _,s in ipairs(constStars) do
    if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=3 then
     s.BackgroundTransparency=math.random(20,80)/100
    end
   end
  end
  task.wait(0.5)
 end
end)

-- 🚀 FOGUETE
local fogueteRodando=false
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
nomeMJ.Size=UDim2.new(0,500,0,100)
nomeMJ.Position=UDim2.new(0.5,-250,0.5,-50)
nomeMJ.BackgroundTransparency=1
nomeMJ.Text="MJ 1.0"
nomeMJ.TextColor3=branco
nomeMJ.TextStrokeColor3=Color3.fromRGB(80,80,80)
nomeMJ.TextStrokeTransparency=0
nomeMJ.Font=Enum.Font.GothamBold
nomeMJ.TextSize=60
nomeMJ.TextTransparency=1
nomeMJ.ZIndex=20

task.spawn(function()
 if fogueteRodando then return end
 fogueteRodando=true
 constBg.Visible=true
 for i=1,20 do
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") then
    if s.Size.X.Offset<=3 then
     s.BackgroundTransparency=math.random(20,80)*i/20/100
    else
     s.BackgroundTransparency=0.6+0.4*i/20
    end
   end
  end
  task.wait(0.03)
 end
 task.wait(0.3)
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
 for i=1,20 do
  local alpha=i/20
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") then
    s.BackgroundTransparency=math.min(1,s.BackgroundTransparency+alpha/20)
   end
  end
  task.wait(0.02)
 end
 constBg.Visible=false
 nomeMJ.Text="🚀 MJ 1.0 🚀"
 for i=1,8 do
  nomeMJ.TextTransparency=math.abs(math.sin(i/2))
  nomeMJ.TextSize=60+i*3
  task.wait(0.08)
 end
 nomeMJ.TextTransparency=0
 nomeMJ.Text="MJ 1.0"
 task.wait(1)
 for i=1,20 do
  nomeMJ.TextTransparency=i/20
  task.wait(0.03)
 end
 nomeMJ:Destroy()
end)

task.wait(6)

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
 s.Position=UDim2.new(math.random()*0.9,0,math.random()*0.9,0)
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

-- ⚫ PAINEL
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,290,0,430)
panel.Position=UDim2.new(0,90,0.5,-215)
panel.BackgroundColor3=Color3.fromRGB(5,5,5)
panel.BorderSizePixel=0
panel.Visible=false
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=branco
ps.Thickness=1.5

local pStars={}
for c=1,4 do
 local bx=math.random(10,70)/100
 local by=math.random(10,70)/100
 local g={}
 for i=1,5 do
  local s=Instance.new("Frame",panel)
  s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
  s.Position=UDim2.new(bx+math.random(-10,10)/100,0,by+math.random(-10,10)/100,0)
  s.BackgroundColor3=branco
  s.BackgroundTransparency=math.random(30,60)/100
  s.BorderSizePixel=0
  s.ZIndex=1
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(g,s)
  table.insert(pStars,s)
 end
 for i=1,#g-1 do
  local a=g[i] local b=g[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",panel)
  line.Size=UDim2.new(0,dist*3,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=branco
  line.BackgroundTransparency=0.7
  line.BorderSizePixel=0
  line.ZIndex=1
  table.insert(pStars,line)
 end
end

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
cred.Size=UDim2.new(1,0,0,16)
cred.Position=UDim2.new(0,0,0,34)
cred.BackgroundTransparency=1
cred.Text="by "..CRIADOR
cred.TextColor3=cinza
cred.Font=Enum.Font.Gotham
cred.TextSize=10
cred.ZIndex=3

task.spawn(function()
 local ok,uid=pcall(function() return P:GetUserIdFromNameAsync(CRIADOR) end)
 if ok and uid then
  local ok2,thumb=pcall(function()
   return P:GetUserThumbnailAsync(uid,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
  end)
  if ok2 and thumb then
   local av=Instance.new("ImageLabel",panel)
   av.Size=UDim2.new(0,30,0,30)
   av.Position=UDim2.new(1,-36,0,38)
   av.BackgroundColor3=Color3.fromRGB(20,20,20)
   av.BorderSizePixel=0
   av.Image=thumb
   av.ZIndex=4
   Instance.new("UICorner",av).CornerRadius=UDim.new(1,0)
  end
 end
end)

local fec=Instance.new("TextButton",panel)
fec.Size=UDim2.new(0,22,0,22)
fec.Position=UDim2.new(1,-26,0,5)
fec.BackgroundColor3=Color3.fromRGB(180,30,50)
fec.Text="X"
fec.TextColor3=branco
fec.Font=Enum.Font.GothamBold
fec.TextSize=12
fec.BorderSizePixel=0
fec.ZIndex=4
Instance.new("UICorner",fec).CornerRadius=UDim.new(1,0)
fec.MouseButton1Click:Connect(function() panel.Visible=false end)

local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,28)
tabBar.Position=UDim2.new(0,5,0,56)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-95)
content.Position=UDim2.new(0,5,0,90)
content.BackgroundTransparency=1
content.ZIndex=3

local tabNomes={"🏠 Principal","👵 Vovó","🎨 Cores","💪 Arremessar","⚙️ Extra"}
local tabBtns={}
local conteudos={}

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",tabBar)
 b.Size=UDim2.new(1/#tabNomes,-2,1,0)
 b.Position=UDim2.new((i-1)/#tabNomes,0,0,0)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=cinza
 b.Font=Enum.Font.Gotham
 b.TextSize=8
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
 c.Visible=i==1
 table.insert(conteudos,c)
 
 b.MouseButton1Click:Connect(function()
  for j=1,#conteudos do
   conteudos[j].Visible=j==i
   tabBtns[j].BackgroundColor3=j==i and Color3.fromRGB(60,60,60) or Color3.fromRGB(25,25,25)
   tabBtns[j].TextColor3=j==i and branco or cinza
  end
 end)
end
tabBtns[1].BackgroundColor3=Color3.fromRGB(60,60,60)
tabBtns[1].TextColor3=branco

local function addT(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,30)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=txt.." OFF"
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
  b.Text=txt..(v and " ON" or " OFF")
  b.BackgroundColor3=v and Color3.fromRGB(60,60,60) or Color3.fromRGB(25,25,25)
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
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function() fn(b) end)
 return b
end

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

-- ESP VOVÓ (com cor escolhida)
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

-- ESP LOOP (chaves, portas e vovó) — todos com a mesma cor
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
      local bb=Instance.new("BillboardGui",o)
      bb.Name="MJKB"
      bb.Size=UDim2.new(0,60,0,12)
      bb.StudsOffset=Vector3.new(0,2,0)
      bb.AlwaysOnTop=true
      local t=Instance.new("TextLabel",bb)
      t.Size=UDim2.new(1,0,1,0)
      t.BackgroundTransparency=1
      t.Text="🔑"
      t.TextColor3=cor
      t.TextStrokeTransparency=0
      t.TextScaled=true
      t.Font=Enum.Font.GothamBold
     end
    end
   end
  end
  if st.fechadura then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("lock") or o.Name:lower():find("fechadura") or o.Name:lower():find("porta") or o.Name:lower():find("door")) then
     if not o:FindFirstChild("MJF") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJF"
      hl.FillColor=cor
      hl.OutlineColor=cor
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
      local bb=Instance.new("BillboardGui",o)
      bb.Name="MJFB"
      bb.Size=UDim2.new(0,60,0,12)
      bb.StudsOffset=Vector3.new(0,2,0)
      bb.AlwaysOnTop=true
      local t=Instance.new("TextLabel",bb)
      t.Size=UDim2.new(1,0,1,0)
      t.BackgroundTransparency=1
      t.Text="🚪"
      t.TextColor3=cor
      t.TextStrokeTransparency=0
      t.TextScaled=true
      t.Font=Enum.Font.GothamBold
     end
    end
   end
  end
  -- Rainbow: atualiza tudo
  if cores[corIdx].c=="rainbow" then
   if gHL and gHL.Parent then gHL.FillColor=cor gHL.OutlineColor=cor end
   if gBB and gBB.Parent then
    local t=gBB:FindFirstChildWhichIsA("TextLabel")
    if t then t.TextColor3=cor end
   end
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJK" or o.Name=="MJF" then
     o.FillColor=cor
     o.OutlineColor=cor
    end
    if o.Name=="MJKB" or o.Name=="MJFB" then
     local t=o:FindFirstChildWhichIsA("TextLabel")
     if t then t.TextColor3=cor end
    end
   end
  end
  task.wait(0.5)
 end
end)

-- ARREMESSO
local function getTool()
 local c=p.Character
 if not c then return nil end
 for _,t in ipairs(c:GetChildren()) do
  if t:IsA("Tool") then return t end
 end
 return nil
end
local function arremessar(forca)
 local v=acharV()
 if not v then print("❌ Vovó não encontrada") return end
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 if not root then return end
 local tool=getTool()
 if not tool then
  print("❌ Sem item na mão")
  return
 end
 local hr=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
 if not hr then return end
 cam.CFrame=CFrame.lookAt(cam.CFrame.Position,hr.Position)
 local flat=Vector3.new(hr.Position.X,root.Position.Y,hr.Position.Z)
 root.CFrame=CFrame.lookAt(root.Position,flat)
 task.wait(0.05)
 pcall(function() mouse1click() end)
 pcall(function() mouse1press() task.wait(0.05) mouse1release() end)
 pcall(function() tool:Activate() end)
 print("💪 Arremessado! Força: "..forca)
end

-- FPS COUNTER
local fpsGui=Instance.new("ScreenGui",game.CoreGui)
fpsGui.Name="MJ_FPS"
fpsGui.ResetOnSpawn=false
fpsGui.Enabled=false

local fpsFrame=Instance.new("Frame",fpsGui)
fpsFrame.Size=UDim2.new(0,140,0,60)
fpsFrame.Position=UDim2.new(0.85,0,0,20)
fpsFrame.BackgroundColor3=Color3.fromRGB(5,5,5)
fpsFrame.BackgroundTransparency=0.3
fpsFrame.BorderSizePixel=0
fpsFrame.Active=true
Instance.new("UICorner",fpsFrame).CornerRadius=UDim.new(0,8)
local fSt=Instance.new("UIStroke",fpsFrame)
fSt.Color=branco
fSt.Thickness=1.5

local fpsLabel=Instance.new("TextLabel",fpsFrame)
fpsLabel.Size=UDim2.new(1,0,0,30)
fpsLabel.Position=UDim2.new(0,0,0,0)
fpsLabel.BackgroundTransparency=1
fpsLabel.Text="FPS: --"
fpsLabel.TextColor3=branco
fpsLabel.Font=Enum.Font.Code
fpsLabel.TextSize=14

local pingLabel=Instance.new("TextLabel",fpsFrame)
pingLabel.Size=UDim2.new(1,0,0,15)
pingLabel.Position=UDim2.new(0,0,0,28)
pingLabel.BackgroundTransparency=1
pingLabel.Text="Ping: -- ms"
pingLabel.TextColor3=cinza
pingLabel.Font=Enum.Font.Code
pingLabel.TextSize=11

local pauseBtn=Instance.new("TextButton",fpsFrame)
pauseBtn.Size=UDim2.new(0,60,0,20)
pauseBtn.Position=UDim2.new(0.5,-30,0,45)
pauseBtn.BackgroundColor3=Color3.fromRGB(50,50,50)
pauseBtn.Text="▶ Pausar"
pauseBtn.TextColor3=branco
pauseBtn.Font=Enum.Font.GothamBold
pauseBtn.TextSize=9
pauseBtn.BorderSizePixel=0
Instance.new("UICorner",pauseBtn).CornerRadius=UDim.new(0,4)

-- Arrastar FPS
local fDrag,fDStart,fSPos=false,nil,nil
fpsFrame.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  fDrag=true fDStart=i.Position fSPos=fpsFrame.Position
 end
end)
fpsFrame.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  fDrag=false
 end
end)
U.InputChanged:Connect(function(i)
 if fDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-fDStart
  fpsFrame.Position=UDim2.new(fSPos.X.Scale,fSPos.X.Offset+d.X,fSPos.Y.Scale,fSPos.Y.Offset+d.Y)
 end
end)

local fpsPausado=false
local fpsAtual=0
local pingAtual=0
pauseBtn.MouseButton1Click:Connect(function()
 fpsPausado=not fpsPausado
 pauseBtn.Text=fpsPausado and "▶ Continuar" or "▶ Pausar"
 pauseBtn.BackgroundColor3=fpsPausado and Color3.fromRGB(100,50,50) or Color3.fromRGB(50,50,50)
end)

local fc,lft=0,tick()
R.RenderStepped:Connect(function()
 fc=fc+1
 if tick()-lft>=1 then
  if not fpsPausado then
   fpsAtual=fc
   pingAtual=math.floor(p:GetNetworkPing()*1000)
  end
  fc=0;lft=tick()
  fpsLabel.Text="FPS: "..fpsAtual
  pingLabel.Text="Ping: "..pingAtual.." ms"
 end
end)

-- CONTEÚDO DAS ABAS
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
addT(c1,110,"🌌 Constelações",function(v)
 constBg.Visible=v
 if v then
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") then
    if s.Size.X.Offset<=3 then
     s.BackgroundTransparency=math.random(20,60)/100
    else
     s.BackgroundTransparency=0.6
    end
   end
  end
 end
end)
addB(c1,145,"📊 Mostrar FPS",function()
 fpsGui.Enabled=not fpsGui.Enabled
end)

-- ABA VOVÓ
local c2=conteudos[2]
addT(c2,5,"👵 ESP Vovó",function(v) st.vovo=v if not v then remV() end end)
addT(c2,40,"🎯 Mira Vovó",function(v) st.mira=v end)
addB(c2,75,"📋 Listar Jogadores (F9)",function()
 local o=outros()
 table.sort(o,function(a,b) return a.s>b.s end)
 print("═══ JOGADORES ═══")
 for i,j in ipairs(o) do print("["..i.."] "..j.p.Name.." | Tam: "..string.format("%.2f",j.s)) end
end)

-- ABA CORES (nova)
local c3=conteudos[3]
c3:FindFirstChildWhichIsA
local corY=5
for i,cor in ipairs(cores) do
 local b=Instance.new("TextButton",c3)
 b.Size=UDim2.new(1,-8,0,28)
 b.Position=UDim2.new(0,4,0,corY)
 b.BackgroundColor3=cor.c=="rainbow" and Color3.fromRGB(150,50,200) or cor.c
 b.Text=cor.n
 b.TextColor3=(cor.c=="rainbow" or cor.c.R+cor.c.G+cor.c.B<300) and branco or Color3.fromRGB(0,0,0)
 b.Font=Enum.Font.GothamBold
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
 b.MouseButton1Click:Connect(function()
  corIdx=i
  print("🎨 Cor: "..cor.n)
 end)
 corY=corY+32
end

-- ABA ARREMESSAR (nova)
local c4=conteudos[4]
addB(c4,5,"💪 Arremessar (Força 500)",function() st.forca=500 arremessar(500) end)
addB(c4,40,"💪💥 Arremessar (Força 1000)",function() st.forca=1000 arremessar(1000) end)
addB(c4,75,"💪🔥 Arremessar (Força 2000)",function() st.forca=2000 arremessar(2000) end)
addB(c4,110,"🎯💥 Arremessar (Curva)",function()
 local v=acharV()
 if not v then return end
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 local hr=v:FindFirstChild("HumanoidRootPart")
 if not root or not hr then return end
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

-- ABA CHAVES movida para dentro de Extra
local c5=conteudos[5]
addT(c5,5,"🔑 ESP Chaves",function(v)
 st.chave=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" or o.Name=="MJKB" then o:Destroy() end
 end end
end)
addT(c5,40,"🚪 ESP Fechaduras",function(v)
 st.fechadura=v
 if not v then for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJF" or o.Name=="MJFB" then o:Destroy() end
 end end
end)
addB(c5,75,"🧹 Limpar Destaques",function()
 for _,o in ipairs(workspace:GetDescendants()) do
  if o.Name=="MJK" or o.Name=="MJF" or o.Name=="MJKB" or o.Name=="MJFB" then o:Destroy() end
 end
end)
addB(c5,110,"📋 Listar no Console",function()
 print("═══ CHAVES E PORTAS ═══")
 for _,o in ipairs(workspace:GetDescendants()) do
  local n=o.Name:lower()
  if o:IsA("BasePart") and (n:find("key") or n:find("chave") or n:find("lock") or n:find("porta") or n:find("door")) then
   print("["..o.ClassName.."] "..o:GetFullName())
  end
 end
end)
addB(c5,145,"🔄 Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

print("⚫ [MJ 1.0] by "..CRIADOR.." carregado! ⚫")
