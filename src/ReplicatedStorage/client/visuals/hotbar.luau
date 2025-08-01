local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.vendor.ReactLua.React)

local create_element = React.createElement

local function main()
	return create_element("ScreenGui",{},
		create_element("Frame",{
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.5,
				Position = UDim2.new(0.5, 0, 1, -10),
				Size = UDim2.fromOffset(685, 80),
			},
			create_element("UICorner",{
				CornerRadius = UDim.new(0.45, 0),
			}),
			create_element("UIStroke",{
				Color = Color3.new(1, 1, 1),
				Thickness = 2,
			},
				create_element("UIGradient",{
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(201, 201, 201)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70)),
						}),
					Rotation = -90
				})
			),
			create_element("Frame",{ --health bar
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = Color3.fromRGB(91, 43, 44),
				Position = UDim2.new(0.5, 0, 0, -10),
				Size = UDim2.new(1, -20, 0, 26),
			},
				create_element("UICorner",{
					CornerRadius = UDim.new(0.45, 0),
				}),
				create_element("UIStroke",{
					Thickness = 2,
					Color = Color3.fromRGB(146, 60, 62),
					ApplyStrokeMode = "Border",
				}),
				create_element("TextLabel",{
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
					ZIndex = 3,
					Text = "50",
					TextScaled = true,
					TextColor3 = Color3.new(1, 1, 1),
				}),
				create_element("Frame",{ --overlay (for example, at 50 hp, overlay will be at 50% size)
					BackgroundColor3 = Color3.new(1, 1, 1),
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.fromScale(0, 0.5),
					Size = UDim2.fromScale(0.5, 1),
					ZIndex = 2
				},
					create_element("UIGradient",{
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromRGB(177, 76, 78)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(132, 62, 63)),
						}),
					}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0)
					})
				)
			),
			create_element("Frame",{ --absorption bar
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = Color3.fromRGB(121, 85, 1),
				Position = UDim2.fromOffset(10, -46),
				Size = UDim2.fromOffset(255, 26),
			},
				create_element("UICorner",{
					CornerRadius = UDim.new(0.45, 0),
				}),
				create_element("UIStroke",{
					Thickness = 2,
					Color = Color3.fromRGB(170, 140, 39),
					ApplyStrokeMode = "Border",
				}),
				create_element("TextLabel",{
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(255, 26),
					FontFace = Font.fromId(11702779409, Enum.FontWeight.Regular),
					ZIndex = 3,
					Text = "10",
					TextScaled = true,
					TextColor3 = Color3.new(1, 1, 1),
				}),
				create_element("Frame",{ --overlay (for example, at 10 hp, overlay will be at 50% size)
					BackgroundColor3 = Color3.new(1, 1, 1),
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.fromScale(0, 0.5),
					Size = UDim2.fromScale(0.5, 1),
					ZIndex = 2
				},
					create_element("UIGradient",{
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromRGB(239, 173, 82)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(211, 170, 34)),
						}),
					}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				)
			),
			create_element("Frame",{ --slots container
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -10, 1, -10),
			},
			create_element("UIListLayout",{
				Padding = UDim.new(0, 5),
				FillDirection = "Horizontal",
				HorizontalAlignment = "Center",
				SortOrder = "LayoutOrder",
			}),
--[[

this will be extremely messy
i'm not sure how to make the equivalent of functions in react

]]
				create_element("Frame",{ --slot 1 (active slot)
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 1,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					}),
					create_element("UIStroke",{
						Color = Color3.new(1, 1, 1),
						Thickness = 2,
					},
						create_element("UIGradient",{
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromRGB(201, 201, 201)),
								ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70)),
						}),
						Rotation = -90,
						})
					)
				),
				create_element("Frame",{ --slot 2
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 2,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 3
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 3,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 4
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 4,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 5
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 5,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 6
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 6,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 7
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 7,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 8
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 8,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				),
				create_element("Frame",{ --slot 9
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 0.75,
					Size = UDim2.fromScale(1, 1),
					LayoutOrder = 9,
				},
					create_element("UIAspectRatioConstraint",{}),
					create_element("UICorner",{
						CornerRadius = UDim.new(0.45, 0),
					})
				)
			)
		)
	)
end

return main