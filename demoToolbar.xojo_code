#tag Class
Protected Class demoToolbar
Inherits WebToolbar
	#tag Event
		Sub Opening()
		  // Self.style.BackgroundColor = &c770000
		  
		  Self.Title = "My Toolbar"
		  
		  // Plain Button
		  Var btn As New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.PushButton // This is the default
		  btn.Caption = "Button"
		  btn.Icon = WebPicture.BootstrapIcon("start")
		  btn.Badge = "5"
		  Self.AddItem(btn)
		  
		  // Label
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.Label
		  btn.Caption = "Just a label"
		  Self.AddItem(btn)
		  
		  // Space
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.Space
		  btn.Caption = "Labels on spaces are ignored"
		  Self.AddItem(btn)
		  
		  // Toggle Button
		  btn = New WebToolbarButton
		  btn.Icon = WebPicture.BootstrapIcon("suit club")
		  btn.Style = WebToolbarButton.ButtonStyles.Toggle
		  btn.Caption = "Toggle Button 1"
		  Self.AddItem(btn)
		  
		  // Flexible Space
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.FlexibleSpace
		  Self.AddItem(btn)
		  
		  // Toggle Buttons to force an overflow
		  For i As Integer = 2 To 3
		    btn = New WebToolbarButton
		    btn.Style = WebToolbarButton.ButtonStyles.Toggle
		    btn.Caption = "Toggle Button " + Str(i)
		    Self.AddItem(btn)
		  Next
		  
		  // Menu Button
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.Menu
		  btn.Caption = "Menu"
		  btn.Menu.AddMenuItem(New WebMenuItem("menu item"))
		  Self.AddItem(btn)
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=true
			Group="Toolbar"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullWidth"
			Visible=true
			Group="Toolbar"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Position"
			Visible=true
			Group="Toolbar"
			InitialValue=""
			Type="WebToolbar.Positions"
			EditorType="Enum"
			#tag EnumValues
				"0 - Inset"
				"1 - Top"
				"2 - Bottom"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group=""
			InitialValue="600"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=false
			Group=""
			InitialValue="56"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
