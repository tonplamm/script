if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");

repeat wait()
	print('select team')
	join = game.Players.localPlayer.Neutral == false
	if _G.Team == nil then
		_G.Team = "Pirates"
	end
	_G.Team = "Pirates"
	if (_G.Team == "Pirates" or _G.Team == "Marines") and not join then
		repeat wait()
			pcall(function()
				join = game.Players.localPlayer.Neutral == false
				if _G.Team == "Pirates" then
					for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
						for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
							v.Function()
						end
					end
				elseif _G.Team == "Marines" then
					for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
						for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
							v.Function()
						end
					end
				else
					for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
						for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
							v.Function()
						end
					end
				end
			end)
		until join == true
	end
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

do local ui =  game:GetService("CoreGui"):FindFirstChild("UI") if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
local CloseBind = Enum.KeyCode.RightControl
coroutine.wrap(
	function()
		while wait() do
			Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
			Red.HueSelectionPosition = Red.HueSelectionPosition + 1

			if Red.RainbowColorValue >= 1 then
				Red.RainbowColorValue = 0
			end

			if Red.HueSelectionPosition == 160 then
				Red.HueSelectionPosition = 0
			end
		end
	end
)()

local UI = Instance.new("ScreenGui")
UI.Name = "UI"
UI.Parent = game:GetService("CoreGui")
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	--if syn then
	--	syn.protect_gui(UI)
	--end


local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local ui = {}

function ui:CreateWindow(text,logo1,logo2,toclose)

	CloseBind = toclose or Enum.KeyCode.RightControl
	if logo1 == nil then
		logo1 = 9549288452
	end
	if logo2 == nil then
		logo2 = "9549288452"
	end

	local fs = false
	local currentservertoggled = ""

	local Main = Instance.new("Frame")

	Main.Name = "Main"
	Main.Parent = UI
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 623, 0, 504)

	local Logo = Instance.new("ImageLabel")

	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.Active = true
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0.0126051363, 0, 0.013920635, 0)
	Logo.Size = UDim2.new(0, 27, 0, 27)
	Logo.Image = "http://www.roblox.com/asset/?id="..tostring(logo1)

	local Name = Instance.new("TextLabel")

	Name.Name = "Name"
	Name.Parent = Main
	Name.Active = true
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Position = UDim2.new(0.05, 0, 0, 0)
	Name.Size = UDim2.new(0, 130, 0, 42)
	Name.Font = Enum.Font.GothamSemibold
	Name.Text = text
	Name.TextColor3 = Color3.fromRGB(80, 245, 245)
	Name.TextSize = 14.000
	Name.TextXAlignment = Enum.TextXAlignment.Left

	local LogoMain = Instance.new("Frame")

	LogoMain.Name = "LogoMain"
	LogoMain.Parent = Main
	LogoMain.Active = true
	LogoMain.AnchorPoint = Vector2.new(0.5, 0.5)
	LogoMain.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	LogoMain.BorderSizePixel = 0
	LogoMain.Position = UDim2.new(0.124091722, 0, 0.191334918, 0)
	LogoMain.Size = UDim2.new(0, 155, 0, 107)

	local ImageLabel = Instance.new("ImageLabel")

	ImageLabel.Parent = LogoMain
	ImageLabel.Active = true
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Position = UDim2.new(0.174193546, 0, 0.0277541801, 0)
	ImageLabel.Size = UDim2.new(0, 100, 0, 100)
	ImageLabel.Image = "http://www.roblox.com/asset/?id="..tostring(logo2)

	local Topbar = Instance.new("Frame")

	--Properties:

	Topbar.Name = "Topbar"
	Topbar.Parent = Main
	Topbar.Active = true
	Topbar.AnchorPoint = Vector2.new(0.5, 0.5)
	Topbar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Topbar.BackgroundTransparency = 1
	Topbar.BorderSizePixel = 0
	Topbar.Position = UDim2.new(0.499693662, 0, 0.0324715078, 0)
	Topbar.Size = UDim2.new(0, 623, 0, 33)

	local PageTap = Instance.new("Frame")

	PageTap.Name = "PageTap"
	PageTap.Parent = Main
	PageTap.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	PageTap.BorderSizePixel = 0
	PageTap.Position = UDim2.new(-0.00113782077, 0, 0.297485709, 0)
	PageTap.Size = UDim2.new(0, 155, 0, 354)

	local ScolTap = Instance.new("ScrollingFrame")

	ScolTap.Name = "ScolTap"
	ScolTap.Parent = PageTap
	ScolTap.Active = true
	ScolTap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScolTap.BackgroundTransparency = 1
	ScolTap.BorderSizePixel = 0
	ScolTap.Size = UDim2.new(0, 155, 0, 354)
	ScolTap.ScrollBarThickness = 3
	ScolTap.CanvasSize = UDim2.new(0, 0, 1, 0)
	ScolTap.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local UIListLayout_ScolTap = Instance.new("UIListLayout")
	local UIPadding_ScolTap = Instance.new("UIPadding")

	UIListLayout_ScolTap.Name = "UIListLayout_ScolTap"
	UIListLayout_ScolTap.Parent = ScolTap
	UIListLayout_ScolTap.FillDirection = Enum.FillDirection.Vertical
	UIListLayout_ScolTap.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_ScolTap.Padding = UDim.new(0, -3)

	UIPadding_ScolTap.Name = "UIPadding_ScolTap"
	UIPadding_ScolTap.Parent = ScolTap
	UIPadding_ScolTap.PaddingLeft = UDim.new(0.30, 0)
	UIPadding_ScolTap.PaddingTop = UDim.new(0, 5)

	local pagesFolder = Instance.new("Folder")

	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = Main

	MakeDraggable(Logo,Main)
	MakeDraggable(Topbar,Main)

	local uitap = {}

	function uitap:CreateTap(text,logo)
		if logo == nil then
			logo = 7072718362
		end

		local TextButton_Tap = Instance.new("TextButton")
		TextButton_Tap.Name = "TextButton_Tap"
		TextButton_Tap.Parent = ScolTap
		TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton_Tap.BackgroundTransparency = 1.00
		TextButton_Tap.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextButton_Tap.BorderSizePixel = 0
		TextButton_Tap.Position = UDim2.new(0.2, 0, 0.00142450142, 0)
		TextButton_Tap.Size = UDim2.new(0, 100, 0, 50)
		TextButton_Tap.Font = Enum.Font.Gotham
		TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
		TextButton_Tap.TextSize = 15.000
		TextButton_Tap.TextWrapped = true
		TextButton_Tap.TextXAlignment = Enum.TextXAlignment.Left
		TextButton_Tap.Text = text

		local ImageTap = Instance.new("ImageLabel")

		ImageTap.Parent = TextButton_Tap
		ImageTap.Active = true
		ImageTap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageTap.BackgroundTransparency = 1.000
		ImageTap.Position = UDim2.new(-0.35, 0, 0.3, 1)
		ImageTap.Size = UDim2.new(0, 20, 0, 20)
		ImageTap.Image = "http://www.roblox.com/asset/?id="..tostring(logo)

		local MainFramePage = Instance.new("Frame")

		MainFramePage.Name = "MainFramePage"
		MainFramePage.Parent = pagesFolder
		MainFramePage.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		MainFramePage.BorderSizePixel = 0
		MainFramePage.Position = UDim2.new(0.247658327, 0, 0.0851841271, 0)
		MainFramePage.Size = UDim2.new(0, 468, 0, 460)
		MainFramePage.Visible = false

		local FramePage = Instance.new("Frame")

		FramePage.Name = "FramePage"
		FramePage.Parent = MainFramePage
		FramePage.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		FramePage.BorderSizePixel = 0
		FramePage.Size = UDim2.new(0, 468, 0, 461)

		local ScolPage = Instance.new("ScrollingFrame")

		ScolPage.Name = "ScolPage"
		ScolPage.Parent = FramePage
		ScolPage.Active = true
		ScolPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScolPage.BackgroundTransparency = 1
		ScolPage.BorderSizePixel = 0
		ScolPage.Size = UDim2.new(0, 468, 0, 461)
		ScolPage.ScrollBarThickness = 3

		local MainPage = Instance.new("Frame")
		MainPage.Name = "MainPage"
		MainPage.Parent = ScolPage
		MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainPage.BackgroundTransparency = 1
		MainPage.Size = UDim2.new(0, 468, 0, 461)

		local UIGridLayout_MainPage = Instance.new("UIGridLayout")
		local UIListLayout_MainPage = Instance.new("UIListLayout")
		local UIPadding_MainPage = Instance.new("UIPadding")

		UIGridLayout_MainPage.Name = "UIGridLayout_MainPage"
		UIGridLayout_MainPage.Parent = MainPage
		UIGridLayout_MainPage.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout_MainPage.CellPadding = UDim2.new(0, 35, 0, 10)
		UIGridLayout_MainPage.CellSize = UDim2.new(0, 468, 0, 200)

		UIListLayout_MainPage.Name = "UIListLayout_MainPage"
		UIListLayout_MainPage.Parent = MainPage
		UIListLayout_MainPage.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_MainPage.Padding = UDim.new(0, 6)

		UIPadding_MainPage.Name = "UIPadding_MainPage"
		UIPadding_MainPage.Parent = MainPage

		TextButton_Tap.MouseButton1Click:connect(function (  )
			currentservertoggled = MainPage.Name
			for i, v in next, pagesFolder:GetChildren() do
				if v.Name == "MainFramePage" then
					-- TweenService:Create(
					--     fucklib,
					--     TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					--     {BackgroundTransparency = 0}
					-- ):Play()
					v.Visible = false

				end

				MainFramePage.Visible = true
				--     wait(0.125)
				-- TweenService:Create(
				--     fucklib,
				--     TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				--     {BackgroundTransparency = 1}
				-- ):Play()
				--    MainPage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Quad", 0.15, true)
			end

			for i ,v in next , ScolTap:GetChildren() do
				if v:IsA("TextButton") then
					TweenService:Create(
						v,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155,155,155)}
					):Play()


				end
				TweenService:Create(
					TextButton_Tap,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(80, 245, 245)}
				):Play()
			end
		end)



		if fs == false then
			TweenService:Create(
				TextButton_Tap,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(80, 245, 245)}
			):Play()

			MainFramePage.Visible = true
			MainFramePage.Name  = text .. "Server"
			fs  = true
		end

		local uipage = {}

		function uipage:Createpage()
			local Page = Instance.new("Frame")


			Page.Name = "Page"
			Page.Parent = MainPage
			Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Page.BackgroundTransparency = 1.000
			Page.Size = UDim2.new(0, 100, 0, 100)

			local ScolPage2 = Instance.new("ScrollingFrame")
			local UIListLayout_ScolPage2 = Instance.new("UIListLayout")
			local UIPadding_ScolPage2 = Instance.new("UIPadding")

			--Properties:

			ScolPage2.Name = "ScolPage2"
			ScolPage2.Parent = Page
			ScolPage2.Active = true
			ScolPage2.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			ScolPage2.BorderColor3 = Color3.fromRGB(20, 20, 20)
			ScolPage2.BorderSizePixel = 0
			ScolPage2.Size = UDim2.new(0, 457, 0, 461)
			ScolPage2.CanvasPosition = Vector2.new(0, 375)
			ScolPage2.ScrollBarThickness = 0

			UIListLayout_ScolPage2.Name = "UIListLayout_ScolPage2"
			UIListLayout_ScolPage2.Parent = ScolPage2
			UIListLayout_ScolPage2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_ScolPage2.Padding = UDim.new(0, 5)

			UIPadding_ScolPage2.Name = "UIPadding_ScolPage2"
			UIPadding_ScolPage2.Parent = ScolPage2
			UIPadding_ScolPage2.PaddingLeft = UDim.new(0, 50)
			UIPadding_ScolPage2.PaddingTop = UDim.new(0, 15)

			game:GetService("RunService").Stepped:Connect(function ()
				pcall(function ()
					ScolPage.CanvasSize = UDim2.new(0,0,0,UIGridLayout_MainPage.AbsoluteContentSize.Y + 10 )
					ScolPage2.CanvasSize = UDim2.new(0,0,0,UIListLayout_ScolPage2.AbsoluteContentSize.Y+ 30 )
				end)
			end)

			local NotiFrame = Instance.new("Frame")
			NotiFrame.Name = "NotiFrame"
			NotiFrame.Parent = UI
			NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			NotiFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NotiFrame.BackgroundTransparency = 1.000
			NotiFrame.Position = UDim2.new(1.4, 0, 0.0613496937, 0)
			NotiFrame.Size = UDim2.new(0, 1632, 0, 100)

			local Notilistlayout = Instance.new("UIListLayout")

			Notilistlayout.Name = "Notilistlayout"
			Notilistlayout.Parent = NotiFrame
			Notilistlayout.FillDirection = Enum.FillDirection.Horizontal
			Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
			Notilistlayout.Padding = UDim.new(0, 5)

			function ui:Notification(text,text2,delays,logo)
				if logo == nil then
					logo = 8346185306
				end
				if delays == nil then
					delays = 1
				end
				local TitleFrame = Instance.new("Frame")

				TitleFrame.Name = "TitleFrame"
				TitleFrame.Parent = NotiFrame
				TitleFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				TitleFrame.Size = UDim2.new(0, 0, 0, 0)

				TitleFrame:TweenSizeAndPosition(UDim2.new(0, 250-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Back", 0.3, true)

				local ConnerTitile = Instance.new("UICorner")

				ConnerTitile.CornerRadius = UDim.new(0, 4)
				ConnerTitile.Name = "ConnerTitile"
				ConnerTitile.Parent = TitleFrame

				local imagenoti = Instance.new("ImageLabel")

				imagenoti.Name = "imagenoti"
				imagenoti.Parent = TitleFrame
				imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
				imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				imagenoti.Position = UDim2.new(0.135999978, 0, 0.5, 0)
				imagenoti.Size = UDim2.new(0, 50, 0, 50)
				imagenoti.BackgroundTransparency = 1
				imagenoti.Image = "http://www.roblox.com/asset/?id="..tostring(logo)

				local txdlid = Instance.new("TextLabel")
				local LableFrame = Instance.new("Frame")

				txdlid.Name = "txdlid"
				txdlid.Parent = TitleFrame
				txdlid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				txdlid.BackgroundTransparency = 1.000
				txdlid.Position = UDim2.new(0.275999993, 0, 0.25, 0)
				txdlid.Size = UDim2.new(0, 175, 0, 24)
				txdlid.Font = Enum.Font.GothamSemibold
				txdlid.TextColor3 = Color3.fromRGB(80, 245, 245)
				txdlid.TextSize = 11.000
				txdlid.Text = text
				txdlid.TextXAlignment = Enum.TextXAlignment.Left

				LableFrame.Name = "LableFrame"
				LableFrame.Parent = TitleFrame
				LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				LableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LableFrame.BackgroundTransparency = 1.000
				LableFrame.Position = UDim2.new(0.625999987, 0, 0.620000005, 0)
				LableFrame.Size = UDim2.new(0, 175, 0, 25)

				local TextNoti = Instance.new("TextLabel")

				TextNoti.Name = "TextNoti"
				TextNoti.Parent = LableFrame
				TextNoti.Active = true
				TextNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextNoti.BackgroundTransparency = 1.000
				TextNoti.Size = UDim2.new(0, 175, 0, 25)
				TextNoti.Font = Enum.Font.Gotham
				TextNoti.Text = text2
				TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextNoti.TextSize = 11.000
				TextNoti.TextXAlignment = Enum.TextXAlignment.Left

				repeat wait() until TitleFrame.Size == UDim2.new(0, 250-10, 0, 70)

				local Time = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local UIPadding = Instance.new("UIPadding")

				Time.Name = "Time"
				Time.Parent = TitleFrame
				Time.Active = true
				Time.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				Time.BorderSizePixel = 0
				Time.Position = UDim2.new(0.0320000015, 0, 0.870000005, 0)
				Time.Size = UDim2.new(0, 236, 0, 3)

				UICorner.Parent = Time
				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Name = ""

				UIPadding.Parent = NotiFrame
				UIPadding.PaddingLeft = UDim.new(0, 15)
				UIPadding.PaddingTop = UDim.new(0, 15)

				TweenService:Create(
					Time,
					TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
				):Play()
				delay(tonumber(delays),function()
					TweenService:Create(
						imagenoti,
						TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
						{ImageTransparency = 1} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextNoti,
						TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
						{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						txdlid,
						TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
						{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
					):Play()
					wait(0.3)
					TweenService:Create(
						TitleFrame,
						TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
						{Size = UDim2.new(0, 0, 0, 70)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					wait(0.3)
					TitleFrame:Destroy()
				end
				)
			end

			local uitoggled = false
			UserInputService.InputBegan:Connect(function(io, p)
				if io.KeyCode == CloseBind then
					if uitoggled == false then
						TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
						uitoggled = true
					else
						Main:TweenSize(UDim2.new(0, 623, 0, 504), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .4, true)
						uitoggled = false
					end
				end
			end)

			local main = {}

			function main:Button(text,callback)

				local ButtonFrame = Instance.new("Frame")

				ButtonFrame.Name = "ButtonFrame"
				ButtonFrame.Parent = ScolPage2
				ButtonFrame.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				ButtonFrame.BorderSizePixel = 0
				ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ButtonFrame.Size = UDim2.new(0, 375, 0, 25) -- UDim2.new(0, 213, 0, 35)
				ButtonFrame.BackgroundTransparency  = 1
				ButtonFrame.ClipsDescendants = true

				local Button = Instance.new("TextButton")

				Button.Parent = ButtonFrame
				Button.Name = "Button"
				Button.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				Button.Size = UDim2.new(0,345, 0, 25)
				Button.Font = Enum.Font.Gotham
				Button.Text = tostring(text)
				Button.TextColor3 = Color3.fromRGB(155, 155, 155)
				Button.TextSize = 11.000
				Button.AnchorPoint = Vector2.new(0.5, 0.5)
				Button.Position = UDim2.new(0.5, 0, 0.5, 0)
				Button.TextXAlignment = Enum.TextXAlignment.Center
				Button.BackgroundTransparency = 0.6
				Button.TextWrapped = true
				Button.AutoButtonColor = false
				Button.ClipsDescendants = true

				local ConnerPage = Instance.new("UICorner")

				ConnerPage.CornerRadius = UDim.new(0, 4)
				ConnerPage.Name = ""
				ConnerPage.Parent = Button

				Button.MouseEnter:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{Size =  UDim2.new(0, 375, 0, 25)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)
				Button.MouseLeave:Connect(function()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{Size =  UDim2.new(0, 345, 0, 25)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				Button.MouseButton1Click:Connect(function()
					--    Ripple(Button)
					callback()
					Button.TextSize = 0
					TweenService:Create(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{TextSize =  11} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)
			end
			function main:Title(text)
				local tiframe = Instance.new("Frame")

				tiframe.Name = "tiframe"
				tiframe.Parent = ScolPage2
				tiframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				tiframe.BackgroundTransparency = 1
				tiframe.BorderSizePixel = 0
				tiframe.ClipsDescendants = true
				tiframe.AnchorPoint = Vector2.new(0.5, 0.5)
				tiframe.Position = UDim2.new(0.5, 0, 0.5, 0)
				tiframe.Size = UDim2.new(0, 373, 0, 20)

				local  lineframe = Instance.new("TextLabel")

				lineframe.Parent = tiframe
				lineframe.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				lineframe.BackgroundTransparency = 0
				lineframe.AnchorPoint = Vector2.new(0.1, 0.5)
				lineframe.Position = UDim2.new(0., 0, 0.4, 0)
				lineframe.BorderSizePixel = 0
				lineframe.Size = UDim2.new(0, 75, 0, 1)
				lineframe.Font = Enum.Font.GothamSemibold
				lineframe.TextColor3 = Color3.fromRGB(255, 255, 255)
				lineframe.TextSize = 13.000
				lineframe.Text = ""

				local  lineframe2 = Instance.new("TextLabel")

				lineframe2.Parent = tiframe
				lineframe2.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				lineframe2.BackgroundTransparency = 0
				lineframe2.AnchorPoint = Vector2.new(0.9, 0.5)
				lineframe2.Position = UDim2.new(1, 0, 0.4, 0)
				lineframe2.BorderSizePixel = 0
				lineframe2.Size = UDim2.new(0, 75, 0, 1)
				lineframe2.Font = Enum.Font.GothamSemibold
				lineframe2.TextColor3 = Color3.fromRGB(255, 255, 255)
				lineframe2.TextSize = 11.000
				lineframe2.Text = ""

				local  lineframe3 = Instance.new("TextLabel")

				lineframe3.Parent = tiframe
				lineframe3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				lineframe3.BackgroundTransparency = 1
				lineframe3.AnchorPoint = Vector2.new(0.5, 0.5)
				lineframe3.Position = UDim2.new(0.5, 0, 0.5, 0)
				lineframe3.BorderSizePixel = 0
				lineframe3.Size = UDim2.new(0, 130, 0, 20)
				lineframe3.Font = Enum.Font.Gotham
				lineframe3.Text = tostring(text)
				lineframe3.TextColor3 = Color3.fromRGB(80, 245, 245)
				lineframe3.TextSize = 11.000
				lineframe3.TextWrapped = true
			end

			function main:Label(text)

				local labelfuc = {}
				local  Labelxd = Instance.new("TextLabel")

				Labelxd.Parent = ScolPage2
				Labelxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Labelxd.BackgroundTransparency = 1
				Labelxd.AnchorPoint = Vector2.new(0.5, 0.5)
				Labelxd.Position = UDim2.new(0.5, 0, 0.8, 0)
				Labelxd.BorderSizePixel = 0
				Labelxd.Size = UDim2.new(0, 30, 0, 13)
				Labelxd.Font = Enum.Font.Gotham
				Labelxd.Text = tostring(text)
				Labelxd.TextColor3 = Color3.fromRGB(255, 255, 255)
				Labelxd.TextSize = 11.000
				Labelxd.TextXAlignment = Enum.TextXAlignment.Left

				function  labelfuc:Change(text2)
					Labelxd.Text = tostring(text2)
				end
				return  labelfuc
			end

			function main:Blank(count)
				if count == nil then
					count = 0.01
				end
				local BlankFrame = Instance.new("Frame")


				BlankFrame.Name = "Mainframenoti"
				BlankFrame.Parent = ScolPage2
				BlankFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				BlankFrame.BackgroundTransparency = 1
				BlankFrame.BorderSizePixel = 0
				BlankFrame.ClipsDescendants = false
				BlankFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				BlankFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
				BlankFrame.Size = UDim2.new(0, 213, 0, count)
			end

			function main:Line()
				local LineFrame = Instance.new("Frame")

				LineFrame.Name = "LineFrame"
				LineFrame.Parent = ScolPage2
				LineFrame.BackgroundColor3 =  Color3.fromRGB(80, 245, 245)
				LineFrame.BorderSizePixel = 0
				LineFrame.Position = UDim2.new(0.5, 0, 0.7, 0)
				LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				LineFrame.Size = UDim2.new(0, 374.5, 0, 1)
				LineFrame.BackgroundTransparency  = 0
				LineFrame.ClipsDescendants = true

				local LineFrame_BindConner = Instance.new("UICorner")

				LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
				LineFrame_BindConner.Name = ""
				LineFrame_BindConner.Parent = LineFrame
			end

			function main:Toggle(text,config,callback)
				local Toggle = Instance.new("Frame")

				Toggle.Name = "Toggle"
				Toggle.Parent = ScolPage2
				Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
				Toggle.Size = UDim2.new(0, 213, 0, 35)

				local TextButton_Toggle = Instance.new("TextButton")

				TextButton_Toggle.Name = "TextButton_Toggle"
				TextButton_Toggle.Parent = Toggle
				TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_Toggle.BackgroundTransparency = 1.000
				TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
				TextButton_Toggle.AutoButtonColor = false
				TextButton_Toggle.Font = Enum.Font.SourceSans
				TextButton_Toggle.Text = " "
				TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_Toggle.TextSize = 14.000

				local TextButton_2_Toggle = Instance.new("TextButton")

				TextButton_2_Toggle.Name = "TextButton_2_Toggle"
				TextButton_2_Toggle.Parent = TextButton_Toggle
				TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				TextButton_2_Toggle.BorderSizePixel = 0
				TextButton_2_Toggle.Position = UDim2.new(0.0807512328, 0, 0.5, 0)
				TextButton_2_Toggle.Size = UDim2.new(0, 23, 0, 23)
				TextButton_2_Toggle.AutoButtonColor = false
				TextButton_2_Toggle.Font = Enum.Font.SourceSans
				TextButton_2_Toggle.Text = " "
				TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2_Toggle.TextSize = 14.000


				local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

				TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 5)
				TextButton_Pageframe_Uiconner.Name = "TextButton_Pageframe_Uiconner"
				TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

				local TextButton_2_Toggle_UIStroke = Instance.new("UIStroke")

				TextButton_2_Toggle_UIStroke.Thickness = 1
				TextButton_2_Toggle_UIStroke.Name = ""
				TextButton_2_Toggle_UIStroke.Parent = TextButton_2_Toggle
				TextButton_2_Toggle_UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				TextButton_2_Toggle_UIStroke.LineJoinMode = Enum.LineJoinMode.Round
				TextButton_2_Toggle_UIStroke.Color = Color3.fromRGB(0,0,0)
				TextButton_2_Toggle_UIStroke.Transparency = 0

				local farmtoglist2 = Instance.new("TextButton")

				farmtoglist2.Parent = TextButton_2_Toggle
				farmtoglist2.BackgroundColor3 = Color3.fromRGB(64,64,64)
				farmtoglist2.BorderColor3 = Color3.fromRGB(80, 245, 245)
				farmtoglist2.BorderSizePixel = 0
				farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
				farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
				farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
				farmtoglist2.Font = Enum.Font.SourceSans
				farmtoglist2.Text = " "
				farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
				farmtoglist2.TextSize = 14.000
				farmtoglist2.AutoButtonColor = false

				local listimage = Instance.new("ImageButton")

				listimage.Parent = farmtoglist2
				listimage.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				listimage.BackgroundTransparency = 0
				listimage.AutoButtonColor = false
				listimage.AnchorPoint = Vector2.new(0.5, 0.5)
				listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
				listimage.BorderSizePixel = 0
				listimage.Size = UDim2.new(0, 0, 0, 0)
				listimage.ImageTransparency = 1
				listimage.Image = "rbxassetid://6031094667"
				listimage.ImageTransparency = 0

				local listimageUiconner2 = Instance.new("UICorner")

				listimageUiconner2.CornerRadius = UDim.new(0, 5)
				listimageUiconner2.Name = ""
				listimageUiconner2.Parent = listimage

				local TextLabel_Toggle = Instance.new("TextLabel")

				TextLabel_Toggle.Name = "TextLabel_Toggle"
				TextLabel_Toggle.Parent = Toggle
				TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_Toggle.BackgroundTransparency = 1.000
				TextLabel_Toggle.ClipsDescendants = true
				TextLabel_Toggle.Position = UDim2.new(0.607863724, 0, 0.5, 0)
				TextLabel_Toggle.Size = UDim2.new(0, 167, 0, 25)
				TextLabel_Toggle.Font = Enum.Font.Gotham
				TextLabel_Toggle.Text = text
				TextLabel_Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_Toggle.TextSize = 11.000
				TextLabel_Toggle.TextWrapped = true
				TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

				TextButton_Toggle.MouseEnter:Connect(function()
					TweenService:Create(
						TextLabel_Toggle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(80, 245, 245)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				TextButton_Toggle.MouseLeave:Connect(function()
					TweenService:Create(
						TextLabel_Toggle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				local check = {toogle = false ; loacker = true ; togfunction = {

				};}

				TextButton_Toggle.MouseButton1Click:Connect(function()
					if check.toogle == false and check.loacker == true  then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					elseif  check.loacker ==  true then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					end
					if  check.loacker == true  then
						check.toogle = not check.toogle
						callback(check.toogle)
					end
				end)

				farmtoglist2.MouseButton1Click:Connect(function()
					if check.toogle == false and check.loacker == true  then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					elseif  check.loacker ==  true then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					end
					if  check.loacker == true  then
						check.toogle = not check.toogle
						callback(check.toogle)
					end
				end)

				listimage.MouseButton1Click:Connect(function()
					if check.toogle == false and check.loacker == true  then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					elseif  check.loacker ==  true then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					end
					if  check.loacker == true  then
						check.toogle = not check.toogle
						callback(check.toogle)
					end
				end)

				if config == true then
					listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					wait(0.1)
					listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
					check.toogle = true
					callback(check.toogle)
				end
				local lockerframe = Instance.new("Frame")

				lockerframe.Name = "lockerframe"
				lockerframe.Parent = Toggle
				lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				lockerframe.BackgroundTransparency = 1
				lockerframe.BorderSizePixel = 0
				lockerframe.Size = UDim2.new(0, 500, 0, 35)
				lockerframe.Position = UDim2.new(0.9, 0, 0.5, 0)
				lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

				local LockerImageLabel = Instance.new("ImageLabel")
				LockerImageLabel.Parent = lockerframe
				LockerImageLabel.BackgroundTransparency = 1.000
				LockerImageLabel.BorderSizePixel = 0
				LockerImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				LockerImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				LockerImageLabel.Size = UDim2.new(0, 0, 0, 0)
				LockerImageLabel.Image = "http://www.roblox.com/asset/?id=3926305904"
				LockerImageLabel.ImageRectOffset = Vector2.new(404, 364)
				LockerImageLabel.ImageRectSize = Vector2.new(36, 36)
				LockerImageLabel.ImageColor3 = Color3.fromRGB(255,25,25)

				function check.togfunction:lock()
					TweenService:Create(
						lockerframe,
						TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
						{BackgroundTransparency = 0.7}
					):Play()
					TweenService:Create(
						LockerImageLabel,
						TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
						{Size = UDim2.new(0, 25, 0, 25)}
					):Play()

					check.loacker  = false
				end
				function check.togfunction:unlock()
					TweenService:Create(
						lockerframe,
						TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						LockerImageLabel,
						TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
						{Size = UDim2.new(0, 0, 0, 0)}
					):Play()
					check.loacker  = true
				end
				return  check.togfunction
			end

			function main:Dropdown(text,option,callback)
				local FrameButton = Instance.new("Frame")

				--Properties:

				FrameButton.Name = "FrameButton"
				FrameButton.Parent = ScolPage2
				FrameButton.AnchorPoint = Vector2.new(0.5, 0.5)
				FrameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				FrameButton.BackgroundTransparency = 1.000
				FrameButton.Position = UDim2.new(10, 0, 0.347239256, 0)
				FrameButton.Size = UDim2.new(0, 250, 0, 0)

				local DropFrame = Instance.new("Frame")
				DropFrame.Name = "DropFrame"
				DropFrame.Parent = ScolPage2
				DropFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				DropFrame.Position = UDim2.new(0.375307113, 0, 0.9, 0)
				DropFrame.Size = UDim2.new(0, 375, 0, 25)
				DropFrame.ClipsDescendants = true
				local ConnerDropFrame = Instance.new("UICorner")
				ConnerDropFrame.CornerRadius = UDim.new(0, 4)
				ConnerDropFrame.Name = "ConnerDropFrame"
				ConnerDropFrame.Parent = DropFrame
				local LabelFrameDrop = Instance.new("TextLabel")
				LabelFrameDrop.Name = "LabelFrameDrop"
				LabelFrameDrop.Parent = DropFrame
				LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelFrameDrop.BackgroundTransparency = 1.000
				LabelFrameDrop.Position = UDim2.new(0.01728395, 0, 0, 0)
				LabelFrameDrop.Size = UDim2.new(0, 368, 0, 25)
				LabelFrameDrop.Font = Enum.Font.GothamSemibold
				LabelFrameDrop.TextColor3 = Color3.fromRGB(136, 136, 138)
				LabelFrameDrop.TextSize = 11.000
				LabelFrameDrop.TextWrapped = true
				LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left
				LabelFrameDrop.Text = tostring(text).." :"

				local DropArbt_listimage = Instance.new("ImageLabel")
				DropArbt_listimage.Name = "DropArbt_listimage"
				DropArbt_listimage.Parent = LabelFrameDrop
				DropArbt_listimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropArbt_listimage.BackgroundTransparency = 1.000
				DropArbt_listimage.Position = UDim2.new(0.934673369, 0, 0.099999994, 0)
				DropArbt_listimage.Rotation = 90.000
				DropArbt_listimage.Size = UDim2.new(0, 20, 0, 20)
				DropArbt_listimage.Image = "rbxassetid://3926305904"
				DropArbt_listimage.ImageRectOffset = Vector2.new(724, 284)
				DropArbt_listimage.ImageRectSize = Vector2.new(33, 33)
				DropArbt_listimage.ImageTransparency = 0.500

				local ScolDown = Instance.new("ScrollingFrame")

				ScolDown.Name = "ScolDown"
				ScolDown.Parent = LabelFrameDrop
				ScolDown.Active = true
				ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScolDown.BackgroundTransparency = 1.000
				ScolDown.BorderSizePixel = 0
				ScolDown.Position = UDim2.new(-0.0175879393, 0, 0.899999976, 0)
				ScolDown.Size = UDim2.new(0, 375, 0, 97)
				ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)
				ScolDown.ScrollBarThickness = 2

				local UIListLayoutlist = Instance.new("UIListLayout")
				local UIPaddinglist = Instance.new("UIPadding")

				UIListLayoutlist.Name = "UIListLayoutlist"
				UIListLayoutlist.Parent = ScolDown
				UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayoutlist.Padding = UDim.new(0, 5)

				UIPaddinglist.Name = "UIPaddinglist"
				UIPaddinglist.Parent = ScolDown
				UIPaddinglist.PaddingTop = UDim.new(0, 5)

				local ButtonDrop = Instance.new("TextButton")

				ButtonDrop.Name = "ButtonDrop"
				ButtonDrop.Parent = DropFrame
				ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonDrop.BackgroundTransparency = 1.000
				ButtonDrop.ClipsDescendants = true
				ButtonDrop.Size = UDim2.new(0, 375, 0, 25)
				ButtonDrop.Font = Enum.Font.SourceSans
				ButtonDrop.Text = ""
				ButtonDrop.TextColor3 = Color3.fromRGB(0, 0, 0)
				ButtonDrop.TextSize = 14.000

				local dog = false

				local FrameSize = 58
				local cout = 0
				for i , v in pairs(option) do
					cout =cout + 1
					if cout == 1 then
						FrameSize = 58
					elseif cout == 2 then
						FrameSize = 95
					elseif cout >= 3 then
						FrameSize = 115
					end

					local ListFrame = Instance.new("Frame")

					ListFrame.Name = "ListFrame"
					ListFrame.Parent = ScolDown
					ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
					ListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
					ListFrame.BackgroundTransparency = 1.000
					ListFrame.BorderSizePixel = 0
					ListFrame.Position = UDim2.new(0.5, 0, 0.163043484, 0)
					ListFrame.Size = UDim2.new(0, 375, 0, 30)

					local TextLabel_TapDro2p = Instance.new("TextLabel")

					TextLabel_TapDro2p.Name = "TextLabel_TapDro2p"
					TextLabel_TapDro2p.Parent = ListFrame
					TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
					TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_TapDro2p.BackgroundTransparency = 1.000
					TextLabel_TapDro2p.Position = UDim2.new(0.508641958, 0, 0.5, 0)
					TextLabel_TapDro2p.Size = UDim2.new(0, 368, 0, 30)
					TextLabel_TapDro2p.Font = Enum.Font.GothamSemibold
					TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(136, 136, 138)
					TextLabel_TapDro2p.TextSize = 11.000
					TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel_TapDro2p.Text = tostring(v)

					local ButtonDrop2 = Instance.new("TextButton")

					ButtonDrop2.Name = "ButtonDrop2"
					ButtonDrop2.Parent = ListFrame
					ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonDrop2.BackgroundTransparency = 1.000
					ButtonDrop2.Size = UDim2.new(0, 368, 0, 30)
					ButtonDrop2.Font = Enum.Font.SourceSans
					ButtonDrop2.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonDrop2.TextSize = 14.000
					ButtonDrop2.Text = ""

					local Line = Instance.new("Frame")

					Line.Name = "Line"
					Line.Parent = ButtonDrop2
					Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
					Line.BorderSizePixel = 0
					Line.Position = UDim2.new(0, 0, 1, 0)
					Line.Size = UDim2.new(0, 375, 0, 1)

					ButtonDrop2.MouseButton1Click:Connect(function()
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 25)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Rotation = 90}
						):Play()
						LabelFrameDrop.Text =  text.." : "..tostring(v)
						callback(v)
						dog = not dog
					end)
					ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
				end

				ButtonDrop.MouseButton1Click:Connect(function()
					if dog == false then
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
							{Rotation = 270}
						):Play()
						ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
					else
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 25)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
							{Rotation = 90}
						):Play()
						ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
					end
					dog = not dog
				end)
				ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
				local dropfunc = {}

				function dropfunc:Clear()
					LabelFrameDrop.Text = tostring(text).." :"
					TweenService:Create(
						DropFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 375, 0, 25)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					dog = not dog
					for i, v in next, ScolDown:GetChildren() do
						if v:IsA("Frame") then
							v:Destroy()
						end
					end
				end
				function dropfunc:Add(t)
					local ListFrame = Instance.new("Frame")

					ListFrame.Name = "ListFrame"
					ListFrame.Parent = ScolDown
					ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
					ListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
					ListFrame.BackgroundTransparency = 1.000
					ListFrame.BorderSizePixel = 0
					ListFrame.Position = UDim2.new(0.5, 0, 0.163043484, 0)
					ListFrame.Size = UDim2.new(0, 375, 0, 30)

					local TextLabel_TapDro2p = Instance.new("TextLabel")

					TextLabel_TapDro2p.Name = "TextLabel_TapDro2p"
					TextLabel_TapDro2p.Parent = ListFrame
					TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
					TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_TapDro2p.BackgroundTransparency = 1.000
					TextLabel_TapDro2p.Position = UDim2.new(0.508641958, 0, 0.5, 0)
					TextLabel_TapDro2p.Size = UDim2.new(0, 368, 0, 30)
					TextLabel_TapDro2p.Font = Enum.Font.GothamSemibold
					TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(136, 136, 138)
					TextLabel_TapDro2p.TextSize = 11.000
					TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel_TapDro2p.Text = tostring(t)

					local ButtonDrop2 = Instance.new("TextButton")

					ButtonDrop2.Name = "ButtonDrop2"
					ButtonDrop2.Parent = ListFrame
					ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonDrop2.BackgroundTransparency = 1.000
					ButtonDrop2.Size = UDim2.new(0, 368, 0, 30)
					ButtonDrop2.Font = Enum.Font.SourceSans
					ButtonDrop2.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonDrop2.TextSize = 14.000
					ButtonDrop2.Text = ""

					local Line = Instance.new("Frame")

					Line.Name = "Line"
					Line.Parent = ButtonDrop2
					Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
					Line.BorderSizePixel = 0
					Line.Position = UDim2.new(0, 0, 1, 0)
					Line.Size = UDim2.new(0, 375, 0, 1)

					ButtonDrop2.MouseButton1Click:Connect(function()
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 25)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Rotation = 90}
						):Play()
						LabelFrameDrop.Text =  text.." : "..tostring(t)
						callback(t)
						dog = not dog
					end)
					ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10)
				end
				return dropfunc
			end

			function main:Slider(text,floor,min,max,de,lol,callback)
				local SliderFrame = Instance.new("Frame")

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = ScolPage2
				SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
				SliderFrame.ClipsDescendants = true
				SliderFrame.Position = UDim2.new(0.5, 0, 0.457317084, 0)
				SliderFrame.Size = UDim2.new(0, 375, 0, 47)

				local SliderFrame_UICorner = Instance.new("UICorner")
				SliderFrame_UICorner.Name = "SliderFrame_UICorner"
				SliderFrame_UICorner.Parent = SliderFrame
				SliderFrame_UICorner.CornerRadius = UDim.new(0, 4)

				local SliderFrame_UIStroke = Instance.new("UIStroke")

				SliderFrame_UIStroke.Thickness = 1
				SliderFrame_UIStroke.Name = ""
				SliderFrame_UIStroke.Parent = SliderFrame
				SliderFrame_UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				SliderFrame_UIStroke.LineJoinMode = Enum.LineJoinMode.Round
				SliderFrame_UIStroke.Color = Color3.fromRGB(80, 245, 245)
				SliderFrame_UIStroke.Transparency = 0.7

				local LabelNameSlider = Instance.new("TextLabel")

				LabelNameSlider.Name = "LabelNameSlider"
				LabelNameSlider.Parent = SliderFrame
				LabelNameSlider.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelNameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSlider.BackgroundTransparency = 1.000
				LabelNameSlider.BorderSizePixel = 0
				LabelNameSlider.Position = UDim2.new(0.2, 0, 0.285106242, 0)
				LabelNameSlider.Size = UDim2.new(0, 114, 0, 20)
				LabelNameSlider.Font = Enum.Font.Gotham
				LabelNameSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSlider.Text = tostring(text)
				LabelNameSlider.TextSize = 12.000
				LabelNameSlider.TextWrapped = true
				LabelNameSlider.TextXAlignment = Enum.TextXAlignment.Left

				local ShowValueFrame = Instance.new("Frame")

				ShowValueFrame.Name = "ShowValueFrame"
				ShowValueFrame.Parent = SliderFrame
				ShowValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ShowValueFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				ShowValueFrame.BorderSizePixel = 0
				ShowValueFrame.Position = UDim2.new(0.85, 0, 0.285106391, 0)
				ShowValueFrame.Size = UDim2.new(0, 100, 0, 15)

				local ShowValueFrameUICorner = Instance.new("UICorner")
				ShowValueFrameUICorner.CornerRadius = UDim.new(0, 4)
				ShowValueFrameUICorner.Name = "ShowValueFrameUICorner"
				ShowValueFrameUICorner.Parent = ShowValueFrame

				local ShowValueFrame_UIStroke = Instance.new("UIStroke")

				ShowValueFrame_UIStroke.Thickness = 1
				ShowValueFrame_UIStroke.Name = ""
				ShowValueFrame_UIStroke.Parent = ShowValueFrame
				ShowValueFrame_UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ShowValueFrame_UIStroke.LineJoinMode = Enum.LineJoinMode.Round
				ShowValueFrame_UIStroke.Color = Color3.fromRGB(80, 245, 245)
				ShowValueFrame_UIStroke.Transparency = 0.7

				local CustomValue = Instance.new("TextBox")

				CustomValue.Name = "CustomValue"
				CustomValue.Parent = ShowValueFrame
				CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
				CustomValue.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				CustomValue.BackgroundTransparency = 1.000
				CustomValue.ClipsDescendants = true
				CustomValue.Position = UDim2.new(0.501112819, 0, 0.5, 0)
				CustomValue.Size = UDim2.new(0, 100, 0, 26)
				CustomValue.Font = Enum.Font.Gotham
				CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
				CustomValue.Text = ""
				CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				if floor == true then
					CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
				else
					CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
				end

				local ValueFrame = Instance.new("Frame")

				ValueFrame.Name = "ValueFrame"
				ValueFrame.Parent = SliderFrame
				ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				ValueFrame.BorderSizePixel = 0
				ValueFrame.Position = UDim2.new(0.499824077, 0, 0.800000012, 0)
				ValueFrame.Size = UDim2.new(0, 350, 0, 5)

				local ValueFrameUICorner = Instance.new("UICorner")
				ValueFrameUICorner.CornerRadius = UDim.new(0, 4)
				ValueFrameUICorner.Name = "ShowValueFrameUICorner"
				ValueFrameUICorner.Parent = ValueFrame

				local PartValue = Instance.new("Frame")

				PartValue.Name = "PartValue"
				PartValue.Parent = ValueFrame
				PartValue.Active = true
				PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
				PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
				PartValue.BackgroundTransparency = 1.000
				PartValue.Position = UDim2.new(0.498982757, 0, 0.300000012, 0)
				PartValue.Size = UDim2.new(0, 350, 0, 5)

				local MainValue = Instance.new("Frame")

				MainValue.Name = "MainValue"
				MainValue.Parent = PartValue
				MainValue.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				MainValue.Position = UDim2.new(0.00101725257, 0, 0.200000003, 0)
				MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)

				local MainValueUICorner = Instance.new("UICorner")
				MainValueUICorner.CornerRadius = UDim.new(0, 4)
				MainValueUICorner.Name = "a"
				MainValueUICorner.Parent = MainValue

				local ConneValue = Instance.new("Frame")

				ConneValue.Name = "ConneValue"
				ConneValue.Parent = PartValue
				ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
				ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.6,0, 0)
				ConneValue.Size = UDim2.new(0, 10, 0, 10)

				local UICorner = Instance.new("UICorner")

				UICorner.CornerRadius = UDim.new(0, 300)
				UICorner.Parent = ConneValue

				SliderFrame.MouseEnter:Connect(function()
					TweenService:Create(
						SliderFrame_UIStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						ShowValueFrame_UIStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()

					SliderFrame.MouseLeave:Connect(function()
						TweenService:Create(
							SliderFrame_UIStroke,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ShowValueFrame_UIStroke,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
					local function move(input)
						local pos =
							UDim2.new(
								math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
								0,
								0.6,
								0
							)
						local pos1 =
							UDim2.new(
								math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
								0,
								0,
								5
							)

						MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

						ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
						if floor == true then
							local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
							CustomValue.Text = tostring(value)
							callback(value)
						else
							local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
							CustomValue.Text = tostring(value)
							callback(value)
						end



					end
					local dragging = false
					ConneValue.InputBegan:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = true

							end
						end
					)
					ConneValue.InputEnded:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = false

							end
						end
					)
					SliderFrame.InputBegan:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = true

							end
						end
					)
					SliderFrame.InputEnded:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = false

							end
						end
					)


					ValueFrame.InputBegan:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = true

							end
						end
					)
					ValueFrame.InputEnded:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = false

							end
						end
					)
					game:GetService("UserInputService").InputChanged:Connect(function(input)
						if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
							move(input)
						end
					end)

					CustomValue.FocusLost:Connect(function()
						if CustomValue.Text == "" then
							CustomValue.Text  = de
						end
						if  tonumber(CustomValue.Text) > max then
							CustomValue.Text  = max
						end
						MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
						ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.6, 0) , "Out", "Sine", 0.2, true)
						if floor == true then
							CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
						else
							CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
						end
						pcall(callback, CustomValue.Text)
					end)
				end)
			end

			function main:Textbox(text,text2,callback)
				local TextFrame = Instance.new("Frame")

				TextFrame.Name = "TextFrame"
				TextFrame.Parent = ScolPage2
				TextFrame.Active = true
				TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				TextFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrame.BackgroundTransparency = 1.000
				TextFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextFrame.Size = UDim2.new(0, 375, 0, 70)

				local LabelNameSliderxd = Instance.new("TextLabel")

				LabelNameSliderxd.Name = "LabelNameSliderxd"
				LabelNameSliderxd.Parent = TextFrame
				LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSliderxd.BackgroundTransparency = 1.000
				LabelNameSliderxd.BorderSizePixel = 0
				LabelNameSliderxd.Position = UDim2.new(0.5, 0, 0.200000003, 0)
				LabelNameSliderxd.Size = UDim2.new(0, 160, 0, 20)
				LabelNameSliderxd.Font = Enum.Font.Gotham
				LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSliderxd.TextSize = 12.000
				LabelNameSliderxd.Text = tostring(text)

				local ConerTextBox = Instance.new("UICorner")

				ConerTextBox.CornerRadius = UDim.new(0, 4)
				ConerTextBox.Name = "ConerTextBox"
				ConerTextBox.Parent = TextFrame

				local FrameBox = Instance.new("Frame")

				FrameBox.Name = "FrameBox"
				FrameBox.Parent = TextFrame
				FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
				FrameBox.BackgroundColor3 = Color3.fromRGB(10,10,10)
				FrameBox.BorderSizePixel = 0
				FrameBox.ClipsDescendants = true
				FrameBox.Position = UDim2.new(0.5, 0, 0.649999976, 0)
				FrameBox.Size = UDim2.new(0, 375, 0, 30)

				local ConerTextBox2 = Instance.new("UICorner")

				--Properties:

				ConerTextBox2.CornerRadius = UDim.new(0, 4)
				ConerTextBox2.Name = "ConerTextBox2"
				ConerTextBox2.Parent = FrameBox

				local TextBox2Stroke = Instance.new("UIStroke")

				TextBox2Stroke.Thickness = 1
				TextBox2Stroke.Name = ""
				TextBox2Stroke.Parent = FrameBox
				TextBox2Stroke.LineJoinMode = Enum.LineJoinMode.Round
				TextBox2Stroke.Color = Color3.fromRGB(80, 245, 245)
				TextBox2Stroke.Transparency = 0.7

				local TextFrame2 = Instance.new("TextBox")

				TextFrame2.Name = "TextFrame2"
				TextFrame2.Parent = FrameBox
				TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
				TextFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrame2.BackgroundTransparency = 1.000
				TextFrame2.BorderSizePixel = 0
				TextFrame2.ClipsDescendants = true
				TextFrame2.Position = UDim2.new(0.499413133, 0, 0.5, 0)
				TextFrame2.Size = UDim2.new(0, 375, 0, 35)
				TextFrame2.Font = Enum.Font.GothamSemibold
				TextFrame2.PlaceholderText = text2
				TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
				TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
				TextFrame2.TextSize = 11.000

				TextFrame.MouseEnter:Connect(function()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelNameSliderxd,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextBox2Stroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				TextFrame.MouseLeave:Connect(function()
					TweenService:Create(
						FrameBox,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(10,10,10)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextBox2Stroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelNameSliderxd,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				TextFrame2.FocusLost:Connect(function ()
					if #TextFrame2.Text > 0 then
						pcall(callback,TextFrame2.Text)
					end
				end)
			end

			function main:Bind(text,bi,callback)
				local BindFrame = Instance.new("Frame")

				BindFrame.Name = "BindFrame"
				BindFrame.Parent = ScolPage2
				BindFrame.BackgroundColor3 =  Color3.fromRGB(10,10,10)
				BindFrame.BorderSizePixel = 0
				BindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				BindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				BindFrame.Size = UDim2.new(0, 375, 0, 35)
				BindFrame.BackgroundTransparency  = 0
				BindFrame.ClipsDescendants = true

				local BindConner = Instance.new("UICorner")

				BindConner.CornerRadius = UDim.new(0, 4)
				BindConner.Name = ""
				BindConner.Parent = BindFrame

				local BindStroke = Instance.new("UIStroke")

				BindStroke.Thickness = 1
				BindStroke.Name = ""
				BindStroke.Parent = BindFrame
				BindStroke.LineJoinMode = Enum.LineJoinMode.Round
				BindStroke.Color = Color3.fromRGB(80, 245, 245)
				BindStroke.Transparency = 0.7

				local LabelBind = Instance.new("TextLabel")

				LabelBind.Parent = BindFrame
				LabelBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelBind.BackgroundTransparency = 1
				LabelBind.BorderSizePixel = 0
				LabelBind.Position = UDim2.new(0.25, 0, 0.5, 0)
				LabelBind.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelBind.Size = UDim2.new(0, 140, 0, 35)
				LabelBind.Font = Enum.Font.Gotham
				LabelBind.Text = tostring(text)
				LabelBind.TextColor3 = Color3.fromRGB(155, 155, 155)
				LabelBind.TextSize = 11.000
				LabelBind.TextXAlignment = Enum.TextXAlignment.Left

				local key = bi.Name
				local LabelBind2 = Instance.new("TextButton")

				LabelBind2.Parent = BindFrame
				LabelBind2.Name = "LabelBind2"
				LabelBind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelBind2.Size = UDim2.new(0, 100, 0, 19)
				LabelBind2.Font = Enum.Font.Gotham
				LabelBind2.Text =  key
				LabelBind2.TextColor3 = Color3.fromRGB(155, 155, 155)
				LabelBind2.TextSize = 11.000
				LabelBind2.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelBind2.Position = UDim2.new(0.8, 0, 0.5, 0)
				LabelBind2.TextXAlignment = Enum.TextXAlignment.Right
				LabelBind2.BackgroundTransparency = 1
				LabelBind2.TextWrapped = true

				local LabelBind22 = Instance.new("TextButton")

				LabelBind22.Parent = BindFrame
				LabelBind22.Name = "LabelBind22"
				LabelBind22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelBind22.Size = UDim2.new(0, 213, 0, 35)
				LabelBind22.Font = Enum.Font.GothamBold
				LabelBind22.Text =  ""
				LabelBind22.TextColor3 = Color3.fromRGB(155, 155, 155)
				LabelBind22.TextSize = 11.000
				LabelBind22.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelBind22.Position = UDim2.new(0.5, 0, 0.5, 0)
				LabelBind22.TextXAlignment = Enum.TextXAlignment.Center
				LabelBind22.BackgroundTransparency = 1
				LabelBind22.TextWrapped = true

				BindFrame.MouseEnter:Connect(function()
					TweenService:Create(
						BindStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelBind22,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelBind2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelBind,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end
				)
				BindFrame.MouseLeave:Connect(function()
					TweenService:Create(
						BindStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelBind22,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelBind2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelBind,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end
				)

				LabelBind22.MouseButton1Click:Connect(function ()


					LabelBind2.Text = "..."
					local inputwait = game:GetService("UserInputService").InputBegan:wait()
					local fuckulop = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

					if
						fuckulop.Name ~= "Focus" and fuckulop.Name ~= "MouseMovement" and fuckulop.Name ~= "Focus"
					then
						LabelBind2.Text =  fuckulop.Name
						key = fuckulop.Name
					end
				end)


				game:GetService("UserInputService").InputBegan:connect(function(current)
					local fuckulop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

					if fuckulop2.Name ==  key then
						pcall(callback)

					end
				end)

			end

			function main:MultiDropdown(text,use,option,callback)

				local location = option.location or self.flags
				local flag = not use and option.flag or ""
				local callback = callback or function() end
				local list = option.list or {}
				local default = list.default or list[1].Name

				if not use then
					location[flag] = default
				end


				local DropFrame = Instance.new("Frame")

				DropFrame.Name = "DropFrame"
				DropFrame.Parent = ScolPage2
				DropFrame.BackgroundColor3 =  Color3.fromRGB(10,10,10)-- Color3.fromRGB(255, 23, 46)
				DropFrame.BorderSizePixel = 0
				DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				DropFrame.Size = UDim2.new(0, 375, 0, 30) -- UDim2.new(0, 213, 0, 35)
				DropFrame.BackgroundTransparency  = 0
				DropFrame.ClipsDescendants = true

				local ConnerDropFrame = Instance.new("UICorner")

				ConnerDropFrame.CornerRadius = UDim.new(0, 4)
				ConnerDropFrame.Name = ""
				ConnerDropFrame.Parent = DropFrame

				local DropFrameStroke = Instance.new("UIStroke")

				DropFrameStroke.Thickness = 1
				DropFrameStroke.Name = ""
				DropFrameStroke.Parent = DropFrame
				DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
				DropFrameStroke.Color = Color3.fromRGB(80, 245, 245)
				DropFrameStroke.Transparency = 0.7





				local LabelFrameDrop = Instance.new("TextLabel")

				LabelFrameDrop.Parent = DropFrame
				LabelFrameDrop.Name = "LabelFrameDrop"
				LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
				LabelFrameDrop.Size =    UDim2.new(0, 375, 0, 30)
				LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
				LabelFrameDrop.Text = ""
				LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
				LabelFrameDrop.TextSize = 14.000
				--   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelFrameDrop.BackgroundTransparency = 1
				LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


				local TextLabel_TapDrop = Instance.new("TextLabel")

				TextLabel_TapDrop.Parent = LabelFrameDrop
				TextLabel_TapDrop.Name = "TextLabel_TapDrop"
				TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
				TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
				TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
				TextLabel_TapDrop.Text = tostring(text)
				TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
				TextLabel_TapDrop.TextSize = 14.000
				--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_TapDrop.BackgroundTransparency = 1
				TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


				local DropArbt_listimage = Instance.new("ImageButton")

				DropArbt_listimage.Parent = LabelFrameDrop
				DropArbt_listimage.BackgroundTransparency = 1.000
				DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
				DropArbt_listimage.Position = UDim2.new(0.95, 0, 0.5, 0)
				DropArbt_listimage.BorderSizePixel = 0
				DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
				DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
				DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

				local ScolDown = Instance.new("ScrollingFrame")

				ScolDown.Name = "ScolDown"
				ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
				ScolDown.Parent = LabelFrameDrop
				ScolDown.Active = true
				ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScolDown.BorderSizePixel = 0
				ScolDown.Size = UDim2.new(0, 375, 0, 115)
				ScolDown.ScrollBarThickness = 3
				ScolDown.ClipsDescendants = true
				ScolDown.BackgroundTransparency = 1
				ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

				local UIListLayoutlist = Instance.new("UIListLayout")
				local UIPaddinglist = Instance.new("UIPadding")

				UIListLayoutlist.Name = "UIListLayoutlist"
				UIListLayoutlist.Parent = ScolDown
				UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayoutlist.Padding = UDim.new(0, 5)

				UIPaddinglist.Name = "UIPaddinglist"
				UIPaddinglist.Parent = ScolDown
				UIPaddinglist.PaddingTop = UDim.new(0, 5)
				UIPaddinglist.PaddingLeft = UDim.new(0, 12)

				local ButtonDrop = Instance.new("TextButton")

				ButtonDrop.Parent = DropFrame
				ButtonDrop.Name = "ButtonDrop"
				ButtonDrop.BackgroundColor3 = Color3.fromRGB(0, 136, 255)
				ButtonDrop.Size = UDim2.new(0, 375, 0, 30)
				ButtonDrop.Font = Enum.Font.SourceSansSemibold
				ButtonDrop.Text = ""
				ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
				ButtonDrop.TextSize = 13.000
				--   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
				ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
				ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
				ButtonDrop.BackgroundTransparency = 1
				ButtonDrop.TextWrapped = true
				ButtonDrop.AutoButtonColor = false
				ButtonDrop.ClipsDescendants = true

				local dog = false

				local FrameSize = 75
				local cout = 0
				for i , v in pairs(list) do
					cout =cout + 1
					if cout == 1 then
						FrameSize = 75
					elseif cout == 2 then
						FrameSize = 110
					elseif cout >= 3 then
						FrameSize = 150
					end

					local listtog = Instance.new("Frame")

					listtog.Name = "listtog"
					listtog.Parent = ScolDown
					listtog.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
					listtog.BackgroundTransparency =1
					listtog.BorderSizePixel = 0
					listtog.ClipsDescendants = true
					listtog.AnchorPoint = Vector2.new(0.5, 0.5)
					listtog.Position = UDim2.new(0.5, 0, 0.5, 0)
					listtog.Size = UDim2.new(0, 375, 0, 33)


					local listtextbutton = Instance.new("TextButton")

					listtextbutton.Parent = listtog
					listtextbutton.BackgroundTransparency =1
					listtextbutton.BackgroundColor3 = Color3.fromRGB(5,5,5)
					listtextbutton.BorderSizePixel = 0
					listtextbutton.Size =  UDim2.new(0, 375, 0, 33)
					listtextbutton.AutoButtonColor = false
					listtextbutton.Font = Enum.Font.SourceSans
					listtextbutton.Text = " "
					listtextbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
					listtextbutton.TextSize = 14.000

					local farmtoglist = Instance.new("TextButton")

					farmtoglist.Parent = listtextbutton
					farmtoglist.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
					farmtoglist.BorderColor3 = Color3.fromRGB(255, 255, 255)
					farmtoglist.BorderSizePixel = 0
					farmtoglist.AnchorPoint = Vector2.new(0.5, 0.5)
					farmtoglist.Position = UDim2.new(0.1, 0, 0.5, 0)
					farmtoglist.Size = UDim2.new(0, 23, 0, 23)
					farmtoglist.Font = Enum.Font.SourceSans
					farmtoglist.Text = " "
					farmtoglist.TextColor3 = Color3.fromRGB(0, 0, 0)
					farmtoglist.TextSize = 14.000
					farmtoglist.AutoButtonColor = false


					local farmtoglist2 = Instance.new("TextButton")

					farmtoglist2.Parent = farmtoglist
					farmtoglist2.BackgroundColor3 = Color3.fromRGB(10,10,10)
					farmtoglist2.BorderColor3 = Color3.fromRGB(80, 245, 245)
					farmtoglist2.BorderSizePixel = 0
					farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
					farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
					farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
					farmtoglist2.Font = Enum.Font.SourceSans
					farmtoglist2.Text = " "
					farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
					farmtoglist2.TextSize = 14.000
					farmtoglist2.AutoButtonColor = false


					local listimage = Instance.new("ImageButton")

					listimage.Parent = farmtoglist2
					listimage.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
					listimage.BackgroundTransparency = 0
					listimage.AnchorPoint = Vector2.new(0.5, 0.5)
					listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
					listimage.BorderSizePixel = 0
					listimage.Size = UDim2.new(0, 0, 0, 0)
					listimage.ImageTransparency = 1

					local listimageUiconner2 = Instance.new("UICorner")

					listimageUiconner2.CornerRadius = UDim.new(0, 5)
					listimageUiconner2.Name = ""
					listimageUiconner2.Parent = listimage


					local textlist = Instance.new("TextLabel")


					textlist.Parent = listtextbutton
					textlist.Name = "textlist"
					textlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textlist.BackgroundTransparency = 1.000
					textlist.AnchorPoint = Vector2.new(0.5, 0.5)
					textlist.Position = UDim2.new(0.5, 0, 0.5, 0)
					textlist.BorderSizePixel = 0
					textlist.Size = UDim2.new(0, 91, 0, 25)
					textlist.Font = Enum.Font.Gotham
					textlist.Text = tostring(v.Name)
					textlist.TextColor3 = Color3.fromRGB(255,255,255)
					textlist.TextSize = 12.000



					local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

					TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 5)
					TextButton_Pageframe_Uiconner2.Name = ""
					TextButton_Pageframe_Uiconner2.Parent = farmtoglist

					local TextButton_Pageframe_Uiconner22 = Instance.new("UICorner")

					TextButton_Pageframe_Uiconner22.CornerRadius = UDim.new(0, 5)
					TextButton_Pageframe_Uiconner22.Name = ""
					TextButton_Pageframe_Uiconner22.Parent = farmtoglist2

					listtextbutton.MouseEnter:Connect(function()
						TweenService:Create(
							textlist,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(80, 245, 245)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					listtextbutton.MouseLeave:Connect(function()
						TweenService:Create(
							textlist,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					listtextbutton.MouseButton1Click:Connect(function()
						if not  location[v.flag] then
							listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
							wait(0.1)
							listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						else
							listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
							wait(0.1)
							listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						end
						location[v.flag] = not location[v.flag]
						callback(location[v.flag])
					end
					)

					if  location[v.flag] then
						listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
						wait(0.1)
						listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)

						callback(location[v.flag])

					end

					ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
				end


				DropFrame.MouseEnter:Connect(function()
					TweenService:Create(
						DropFrameStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextLabel_TapDrop,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						DropArbt_listimage,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end
				)

				DropFrame.MouseLeave:Connect(function()
					TweenService:Create(
						DropFrameStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextLabel_TapDrop,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						DropArbt_listimage,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end
				)


				ButtonDrop.MouseButton1Click:Connect(function()
					if dog == false then
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Rotation = 180}
						):Play()
						ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
					else
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 30)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Rotation = 0}
						):Play()
						ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
					end
					dog = not dog
				end)
				ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

			end

			function main:Color(text,preset,callback)
				local Pixker = Instance.new("Frame")

				Pixker.Name = "Pixker"
				Pixker.Parent = ScolPage2
				Pixker.BackgroundColor3 = Color3.fromRGB(10,10,10)
				Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
				Pixker.Size = UDim2.new(0, 375, 0, 33)
				Pixker.BackgroundTransparency = 0
				Pixker.BorderSizePixel = 0
				Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
				Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
				Pixker.ClipsDescendants = true


				local BoxColorCorner2 = Instance.new("UICorner")

				BoxColorCorner2.CornerRadius = UDim.new(0, 4)
				BoxColorCorner2.Name = "BoxColorCorner"
				BoxColorCorner2.Parent = Pixker

				local FrameStroke = Instance.new("UIStroke")

				FrameStroke.Thickness = 1
				FrameStroke.Name = ""
				FrameStroke.Parent = Pixker
				FrameStroke.LineJoinMode = Enum.LineJoinMode.Round
				FrameStroke.Color = Color3.fromRGB(80, 245, 245)
				FrameStroke.Transparency = 0.7


				local TextFrameColor = Instance.new("TextLabel")

				TextFrameColor.Parent = Pixker
				TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrameColor.BorderSizePixel = 0
				TextFrameColor.Size = UDim2.new(0, 375, 0, 34)
				TextFrameColor.Font = Enum.Font.SourceSans
				TextFrameColor.Text = "  "
				TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextFrameColor.TextSize = 14.000
				TextFrameColor.BackgroundTransparency = 1
				TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

				local TextReal = Instance.new("TextLabel")

				TextReal.Parent = TextFrameColor
				TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextReal.BorderSizePixel = 0
				TextReal.Size = UDim2.new(0, 140, 0, 34)
				TextReal.Font = Enum.Font.Gotham
				TextReal.Text = text
				TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
				TextReal.TextSize = 11.000
				TextReal.BackgroundTransparency = 1
				TextReal.Position = UDim2.new(0.07, 0, 0., 0)
				TextReal.TextXAlignment = Enum.TextXAlignment.Left

				local BoxColor = Instance.new("Frame")

				BoxColor.Name = "BoxColor"
				BoxColor.Parent = TextFrameColor
				BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BoxColor.Position = UDim2.new(0.9, 0, 0.5, 0)
				BoxColor.Size = UDim2.new(0, 35, 0, 19)
				BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

				local BoxColorCorner = Instance.new("UICorner")

				BoxColorCorner.CornerRadius = UDim.new(0, 4)
				BoxColorCorner.Name = "BoxColorCorner"
				BoxColorCorner.Parent = BoxColor

				local TextButton_Dropdown = Instance.new("TextButton")


				TextButton_Dropdown.Parent = TextFrameColor
				TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				TextButton_Dropdown.BorderSizePixel = 0
				TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
				TextButton_Dropdown.Size = UDim2.new(0, 375, 0, 33)
				TextButton_Dropdown.Font = Enum.Font.SourceSans
				TextButton_Dropdown.Text = "  "
				TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_Dropdown.TextSize = 14.000
				TextButton_Dropdown.AutoButtonColor = false
				--TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
				TextButton_Dropdown.BackgroundTransparency = 1



				Pixker.MouseEnter:Connect(function()
					TweenService:Create(
						FrameStroke,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0.}
					):Play()
					TweenService:Create(
						TextReal,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255, 255)}
					):Play()

				end)
				Pixker.MouseLeave:Connect(function()
					TweenService:Create(
						FrameStroke,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Transparency = 0.7}
					):Play()
					TweenService:Create(
						TextReal,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155,155, 155)}
					):Play()
				end)
				-- Rainbow Toggle


				local TextButton_2_Toggle = Instance.new("TextButton")

				TextButton_2_Toggle.Parent = TextFrameColor
				TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(15,15,15)
				--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(255, 23, 46)
				TextButton_2_Toggle.BorderSizePixel = 0
				TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_2_Toggle.Position = UDim2.new(0.1, 0, 1.87, 0)
				TextButton_2_Toggle.Size = UDim2.new(0, 35, 0, 17)
				TextButton_2_Toggle.Font = Enum.Font.SourceSans
				TextButton_2_Toggle.Text = " "
				TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2_Toggle.TextSize = 12.000
				TextButton_2_Toggle.AutoButtonColor = false

				local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

				TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
				TextButton_Pageframe_Uiconner.Name = ""
				TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

				local TextButton_PageframeStroke = Instance.new("UIStroke")

				TextButton_PageframeStroke.Thickness = 1
				TextButton_PageframeStroke.Name = ""
				TextButton_PageframeStroke.Parent = TextButton_2_Toggle
				TextButton_PageframeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				TextButton_PageframeStroke.LineJoinMode = Enum.LineJoinMode.Round
				TextButton_PageframeStroke.Color = Color3.fromRGB(0, 0, 0)
				TextButton_PageframeStroke.Transparency = 0

				local TextButton_3_Toggle = Instance.new("TextButton")

				TextButton_3_Toggle.Parent = TextButton_2_Toggle
				TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
				--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 23, 46)
				TextButton_3_Toggle.BorderSizePixel = 0
				TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_3_Toggle.Position = UDim2.new(0.214285731, 0, 0.5, 0)
				TextButton_3_Toggle.Size = UDim2.new(0, 13, 0, 13)
				TextButton_3_Toggle.Font = Enum.Font.SourceSans
				TextButton_3_Toggle.Text = " "
				TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_3_Toggle.TextSize = 12.000
				TextButton_3_Toggle.AutoButtonColor = false

				local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

				TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
				TextButton_Pageframe_Uiconner2.Name = ""
				TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

				local TextButton_4_Toggle = Instance.new("TextButton")

				TextButton_4_Toggle.Parent = TextButton_3_Toggle
				TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
				--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(255, 23, 46)
				TextButton_4_Toggle.BorderSizePixel = 0
				TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
				TextButton_4_Toggle.Font = Enum.Font.SourceSans
				TextButton_4_Toggle.Text = " "
				TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_4_Toggle.TextSize = 12.000
				TextButton_4_Toggle.AutoButtonColor = false
				TextButton_4_Toggle.BackgroundTransparency = 1
				TextButton_4_Toggle.Visible = true

				local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

				TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
				TextButton_Pageframe_Uiconner4.Name = ""
				TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


				local TextButton_Toggle = Instance.new("TextButton")

				TextButton_Toggle.Parent = ValueFrame
				TextButton_Toggle.BackgroundTransparency =1
				TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_Toggle.BorderSizePixel = 0
				TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
				TextButton_Toggle.AutoButtonColor = false
				TextButton_Toggle.Font = Enum.Font.SourceSans
				TextButton_Toggle.Text = " "
				TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_Toggle.TextSize = 12.000
				TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)

				local TextButton_3_Toggle2 = Instance.new("TextLabel")

				TextButton_3_Toggle2.Parent = TextButton_2_Toggle
				TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
				TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(80, 245, 245)
				TextButton_3_Toggle2.BorderSizePixel = 0
				TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_3_Toggle2.Position = UDim2.new(2.2, 0, 0.5, 0)
				TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
				TextButton_3_Toggle2.Font = Enum.Font.Gotham
				TextButton_3_Toggle2.Text = "Rainbow"
				TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_3_Toggle2.TextSize = 11.000
				TextButton_3_Toggle2.BackgroundTransparency = 1

				local OMF = Instance.new("TextButton")

				OMF.Parent = TextButton_2_Toggle
				OMF.BackgroundTransparency = 1
				OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OMF.BorderSizePixel = 0
				OMF.Size = UDim2.new(0, 100, 0, 20)
				OMF.AutoButtonColor = false
				OMF.Font = Enum.Font.SourceSans
				OMF.Text = " "
				OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
				OMF.TextSize = 12.000
				OMF.AnchorPoint = Vector2.new(0.5, 0.5)
				OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

				local Color =  Instance.new("ImageLabel")

				Color.Name = "Color"
				Color.Parent = TextFrameColor
				Color.BackgroundColor3 = Color3.fromRGB(80, 245, 245)
				Color.Position = UDim2.new(0.03,0,4,0)
				Color.Size = UDim2.new(0, 350, 0, 40)
				Color.ZIndex = 0
				Color.BorderSizePixel = 0
				Color.Image = "rbxassetid://4155801252"

				local ColorFucj = Instance.new("UICorner")

				ColorFucj.CornerRadius = UDim.new(0, 4)
				ColorFucj.Name = ""
				ColorFucj.Parent = Color

				local ColorSelection =  Instance.new("ImageLabel")

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit
				ColorSelection.Visible = true

				local Hue =  Instance.new("ImageLabel")

				Hue.Name = "Hue2"
				Hue.Parent = TextFrameColor
				Hue.Position = UDim2.new(0.03,0,3,0)
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Size = UDim2.new(0, 350, 0, 25)
				Hue.ZIndex = 0
				Hue.BorderSizePixel = 0

				local ColorFucj2 = Instance.new("UICorner")

				ColorFucj2.CornerRadius = UDim.new(0, 4)
				ColorFucj2.Name = ""
				ColorFucj2.Parent = Hue

				local HueGradient = Instance.new("UIGradient")

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(80, 245, 245)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 245, 245))
				}
				HueGradient.Rotation = 0
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				local HueSelection =  Instance.new("ImageLabel")

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				HueSelection.ScaleType = Enum.ScaleType.Fit
				HueSelection.Visible = true


				local BTN_XD = Instance.new("TextButton")

				BTN_XD.Parent = TextFrameColor
				BTN_XD.BackgroundColor3 = Color3.fromRGB(10,10,10)
				BTN_XD.BorderColor3 = Color3.fromRGB(10,10,10)
				BTN_XD.BorderSizePixel = 0
				BTN_XD.AnchorPoint = Vector2.new(0.5, 0.5)
				BTN_XD.Position = UDim2.new(0.43, 0, 1.9, 0)
				BTN_XD.Size = UDim2.new(0, 50, 0, 25)
				BTN_XD.Font = Enum.Font.GothamSemibold
				BTN_XD.Text = "Confirm"
				BTN_XD.TextColor3 = Color3.fromRGB(255, 255, 255)
				BTN_XD.TextSize = 11.000
				BTN_XD.AutoButtonColor = false

				local BTN_XD_COnner = Instance.new("UICorner")

				BTN_XD_COnner.CornerRadius = UDim.new(0, 4)
				BTN_XD_COnner.Name = ""
				BTN_XD_COnner.Parent = BTN_XD



				local BTN_XDStroke = Instance.new("UIStroke")

				BTN_XDStroke.Thickness = 1
				BTN_XDStroke.Name = ""
				BTN_XDStroke.Parent = BTN_XD
				BTN_XDStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				BTN_XDStroke.LineJoinMode = Enum.LineJoinMode.Round
				BTN_XDStroke.Color = Color3.fromRGB(80, 245, 245)
				BTN_XDStroke.Transparency = 0.7


				local UwU = false


				OMF.MouseButton1Click:Connect(function()
					if       UwU == false  then
						TweenService:Create(
							TextButton_3_Toggle,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextButton_2_Toggle,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 =  Color3.fromRGB(80, 245, 245)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 13, 0, 13), UDim2.new(0.8, 0, 0.5, 0), "Out", "Quad", 0.1, true)
					else
						TweenService:Create(
							TextButton_3_Toggle,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextButton_2_Toggle,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 =  Color3.fromRGB(15,15,15)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 13, 0, 13), UDim2.new(0.214285731, 0, 0.5, 0), "Out", "Quad", 0.1, true)
					end
					UwU = not UwU
				end)

				OMF.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then


							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)
				TextButton_3_Toggle.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then


							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)


				local function UpdateColorPicker(nope)
					BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, BoxColor.BackgroundColor3)
				end
				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				BoxColor.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, BoxColor.BackgroundColor3)

				local RainbowColorPicker = false

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)


				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)
									local HueX =
										(math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
											Hue.AbsoluteSize.X)

									HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)
				local sk = false
				TextButton_Dropdown.MouseButton1Click:Connect(function()
					if sk == false then
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 180)}
						):Play()
					else
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 33)}
						):Play()
					end
					sk = not sk
				end
				)
				BTN_XD.MouseButton1Click:Connect(
					function()
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 375, 0, 33)}
						):Play()
						sk = not sk
					end)
			end
			return main
		end
		return uipage
	end
	return uitap
end

local window = ui:CreateWindow("Xenon Hub Premium | " ..os.date("%d ")..os.date("%A ")..os.date("%B ")..os.date("%Y"),0,9358071743,Enum.KeyCode.RightControl)
local tap1 = window:CreateTap("Tab1","6026568198")
local tap2 = window:CreateTap("Tab2","7040410130")

local page1 = tap1:Createpage()

page1:Toggle("auto FULLY V3", _G.fullyautoV3, function(vu)
	_G.fullyautoV3 = vu
end)

page1:Toggle("auto 3 flower", _G.AutoEvoRace2, function(vu)
	_G.AutoEvoRace2 = vu
end)

page1:Toggle("auto tween chest", _G.chest, function(vu)
	_G.chest = vu
end)

page1:Toggle("white screen", _G.whitescreen, function(vu)
	_G.whitescreen = vu
end)

spawn(function()
	while wait() do
		if _G.whitescreen == true then
			game.RunService:Set3dRenderingEnabled(false)
		else
			game.RunService:Set3dRenderingEnabled(true)
		end
	end
end)

page1:Button("Reroll Race", function()
	local args = {
		[1] = "BlackbeardReward",
		[2] = "Reroll",
		[3] = "1"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	
	local args = {
		[1] = "BlackbeardReward",
		[2] = "Reroll",
		[3] = "2"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

page1:Button("Green Zone NPC", function()
	toTarget(CFrame.new(-2776.64111328125, 72.96612548828125, -3571.2177734375))
end)

page1:Button("Cafe", function()
	toTarget(CFrame.new(-385.25091552734375, 73.36333465576172, 297.3883972167969))
end)

page1:Button("Admin", function()
	toTarget(CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039))
end)

page1:Button("Rejoin", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

page1:Button("World 2", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)

page1:Button("Button", function()
	print("a")
	ui:Notification("aaa","bbb")
end)

page1:Title("Title")

page1:Label("Label")

page1:Line()

page1:Toggle("Toggle", _G.YouConfig, function(vu)
	print("Test")
	print(vu)
end)

local lock = page1:Toggle("Toggle", function(vu)
	print("Test")
	print(vu)
end)

page1:Button("Lock", function()
	lock:lock()
end)

page1:Button("Unlock", function()
		ock:unlock()
end)

local drope = page1:Dropdown("Dropdown",{"a","b","c"},function(Value)
	print("Noobie")
end)

ezSlider = 1
page1:Slider("Slider",false, 1, 100,ezSlider,function(a)
	ezSlider = a
end)

page1:Textbox("Textbox","Textbox",function()

end)

function toTarget(gotoCFrame)
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end)
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 150 then
        pcall(function() 
            tween:Cancel()
        end)
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
    else
        local tween_s = game:service"TweenService"
        local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude/300, Enum.EasingStyle.Linear)
        local tween, err = pcall(function()
            tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = gotoCFrame})
            _G.noclip = true
            tween:Play()
            _G.noclip = false
        end)
        if not tween then return err end
    end
end

function EquipWeapon(ToolSe)
    pcall(function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end)
end

spawn(function()
    while wait(1) do
		pcall(function()
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
				_G.SelectToolWeapon = "Electro"
				SelectToolWeaponOld = "Electro"
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
				_G.SelectToolWeapon = "Black Leg"
				SelectToolWeaponOld = "Black Leg"
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
				_G.SelectToolWeapon = "Fishman Karate"
				SelectToolWeaponOld = "Fishman Karate"
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
				_G.SelectToolWeapon = "Dragon Claw"
				SelectToolWeaponOld = "Dragon Claw"
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
				_G.SelectToolWeapon = "Superhuman"
				SelectToolWeaponOld = "Superhuman"
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") then
				_G.SelectToolWeapon = "Electric Claw"
				SelectToolWeaponOld = "Electric Claw"
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") then
				_G.SelectToolWeapon = "Dragon Talon"
				SelectToolWeaponOld = "Dragon Talon"
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") then
				_G.SelectToolWeapon = "Sharkman Karate"
				SelectToolWeaponOld = "Sharkman Karate"
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Death Step") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") then
				_G.SelectToolWeapon = "Death Step"
				SelectToolWeaponOld = "Death Step"
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
				_G.SelectToolWeapon = "Combat"
				SelectToolWeaponOld = "Combat"
			elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") then
				_G.SelectToolWeapon = "Godhuman"
				SelectToolWeaponOld = "Godhuman"
			end
			EquipWeapon(_G.SelectToolWeapon)
			wait(3)
		end)
    end
end)

local CombatFrameworkROld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local CombatFrameworkR = getupvalues(CombatFrameworkROld)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			CombatFrameworkR.activeController.hitboxMagnitude = 50
			if _G.FastAttack then
				if fastattack then
					if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
						CombatFrameworkR.activeController.timeToNextAttack = 3
					elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
						CombatFrameworkR.activeController.timeToNextAttack = 2
					else
						CombatFrameworkR.activeController.timeToNextAttack = 0
					end
					CombatFrameworkR.activeController.attacking = false
					CombatFrameworkR.activeController.increment = 3
					CombatFrameworkR.activeController.blocking = false
					CombatFrameworkR.activeController.timeToNextBlock = 0
					game.Players.LocalPlayer.Character.Humanoid.Sit = false	
				end
			end
		end)
	end)
end)

function Click()
	local VirtualUser = game:GetService('VirtualUser')
	VirtualUser:CaptureController()
	VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

--CFrame.new(-2777.6001, 72.9661407, -3571.42285)
spawn(function()
	while wait() do
		if _G.AutoEvoRace2 then
			if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3") ~= -2 then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") then
					_G.noclip = true
					toTarget(CFrame.new(-2777.6001, 72.9661407, -3571.42285))
					_G.noclip = false
				else
					local args = {
						[1] = "Alchemist",
						[2] = "1"
					}
					
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					
					local args = {
						[1] = "Alchemist",
						[2] = "2"
					}
					
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") then
						if game.Workspace.Enemies:FindFirstChild("Marine Lieutenant [Lv. 875]") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								pcall(function()
									repeat wait()
											_G.noclip = true
											toTarget(v.HumanoidRootPart.CFrame)
											EquipWeapon(SelectToolWeapon)
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
											Click()
									until not v.Parent or v.Humanoid.Health <= 0 or AutoEvoRace2 == false or LocalPlayer.Backpack:FindFirstChild("Flower 3")
									_G.noclip = false
								end)
							end
						else
							_G.noclip = true
							toTarget(CFrame.new(-2776.64111328125, 72.96612548828125, -3571.2177734375))
							_G.noclip = false
						end
					elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and workspace.Flower1.Transparency ~= 1 then
						_G.noclip = true
						toTarget(workspace.Flower1.CFrame)
						_G.noclip = false
					elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and workspace.Flower1.Transparency ~= 2 then
						_G.noclip = true
						toTarget(workspace.Flower2.CFrame)
						_G.noclip = false
					end
				end
			end
		end
	end
end)

spawn(function()
	local count = 0
	local RAYATANG = 0
	local kuy = false
    while wait() do
		if _G.chest then
			if not kuy then
				repeat
					_G.noclip = true
					toTarget(CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039))
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
				until (CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150
				_G.noclip = false
				kuy = true
			else
				if count >= 30 then
					repeat
						_G.noclip = true
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
						toTarget(CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039))
					until (CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150
					_G.noclip = false
				else
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
							if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= RAYATANG then
								_G.noclip = false
								repeat wait()
									_G.noclip = true
									toTarget(v.CFrame)
								until _G.chest == false or not v.Parent
								tween:Cancel()
								_G.noclip = false
								wait(.5)
								count = count + 1
								a = 0
								ui:Notification("count",count)
								print("count : " ..count)
								RAYATANG = 0
							else
								RAYATANG = RAYATANG + 1
								print("RAYATANG : " ..RAYATANG)
							end
						end
					end
				end
			end
		end
	end
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.noclip or _G.AutoEvoRace2 then
            if syn then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            end
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end)
        end
    end)
end)

spawn(function()
	local count = 0
	local RAYATANG = 0
	local kuy = false
	while wait() do
		if _G.fullyautoV3 then
			if game.PlaceId == 4442272183 then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3") ~= -2 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") then
							_G.noclip = true
							toTarget(CFrame.new(-2777.6001, 72.9661407, -3571.42285))
							_G.noclip = false
						else
							local args = {
								[1] = "Alchemist",
								[2] = "1"
							}
							
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							
							local args = {
								[1] = "Alchemist",
								[2] = "2"
							}
							
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") then
								if game.Workspace.Enemies:FindFirstChild("Marine Lieutenant [Lv. 875]") then
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										pcall(function()
											repeat wait()
													_G.noclip = true
													toTarget(v.HumanoidRootPart.CFrame)
													EquipWeapon(SelectToolWeapon)
													if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
														local args = {
															[1] = "Buso"
														}
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
													end
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
													Click()
											until not v.Parent or v.Humanoid.Health <= 0 or AutoEvoRace2 == false or LocalPlayer.Backpack:FindFirstChild("Flower 3")
											_G.noclip = false
										end)
									end
								else
									_G.noclip = true
									toTarget(CFrame.new(-2776.64111328125, 72.96612548828125, -3571.2177734375))
									_G.noclip = false
								end
							elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and workspace.Flower1.Transparency ~= 1 then
								_G.noclip = true
								toTarget(workspace.Flower1.CFrame)
								_G.noclip = false
							elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and workspace.Flower1.Transparency ~= 2 then
								_G.noclip = true
								toTarget(workspace.Flower2.CFrame)
								_G.noclip = false
							else
								_G.noclip = true
								toTarget(CFrame.new(-2776.64111328125, 72.96612548828125, -3571.2177734375))
								_G.noclip = false
							end
						end
					else
						if not kuy then
							repeat
								_G.noclip = true
								toTarget(CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039))
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
							until (CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150
							_G.noclip = false
							kuy = true
						else
							if count >= 30 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3") == -2 then
								repeat
									_G.noclip = true
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
									toTarget(CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039))

                                    local RAMAccount = loadstring(game:HttpGet'https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua')()
                                    local MyAccount = RAMAccount.new(game:GetService'Players'.LocalPlayer.Name)
                                    MyAccount:SetAlias('finish V3')
                                    wait(10)
                                    game:shutdown()
								until (CFrame.new(-1991.0274658203125, 125.49334716796875, -70.9441909790039).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150
								_G.noclip = false
							else
								for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
									if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
										if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= RAYATANG then
											_G.noclip = false
											repeat wait()
												_G.noclip = true
												toTarget(v.CFrame)
											until _G.chest == false or not v.Parent
											tween:Cancel()
											_G.noclip = false
											wait(.5)
											count = count + 1
											a = 0
											ui:Notification("count",count)
											print("count : " ..count)
											RAYATANG = 0
										else
											RAYATANG = RAYATANG + 1
											print("RAYATANG : " ..RAYATANG)
										end
									end
								end
							end
						end
					end
				else
					local args = {
						[1] = "BlackbeardReward",
						[2] = "Reroll",
						[3] = "1"
					}
					
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					
					local args = {
						[1] = "BlackbeardReward",
						[2] = "Reroll",
						[3] = "2"
					}
					
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			else
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
			end
		end
	end
end)

if syn then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end

game:GetService('RunService').RenderStepped:connect(function()
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end)
end)

-- back to world 2 
-- game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")

-- cafe pos
-- -385.25091552734375, 73.36333465576172, 297.3883972167969

-- green zone pos
-- -2776.64111328125, 72.96612548828125, -3571.2177734375

-- admin
-- -1991.0274658203125, 125.49334716796875, -70.9441909790039