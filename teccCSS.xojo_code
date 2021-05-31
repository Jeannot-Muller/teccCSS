#tag Class
Protected Class teccCSS
Inherits WebSDKControl
	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  // Events sent with TriggerServerEvent using your controlID will end up here
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(Request As WebRequest, Response As WebResponse) As Boolean
		  // Requests sent to the session with the following pattern
		  // 
		  // /<Session Identifier>/data/<controlID>/request_path
		  #Pragma unused Request
		  #Pragma unused Response
		  
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  // Name of your class which extends XojoWeb.XojoControl
		  Return "tecc.teccCSS"
		End Function
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  Var teccSA As String
		  
		  If Me.Enabled = False Then
		    Return
		  End If
		  
		  If Simpleanalyticsdotcom = True Then
		    teccSA = "https://scripts.simpleanalyticscdn.com/latest.js"
		  Else
		    teccSA = ""
		  End If
		  
		  Var cssStr As String
		  Var css() As String
		  Var borderStyleStr As String
		  Select Case HeaderBottomStyle
		  Case BorderStyles.dashed
		    borderStyleStr = "dashed"
		  Case BorderStyles.dotted
		    borderStyleStr = "dotted"
		  Case BorderStyles.Double
		    borderStyleStr = "double"
		  Case BorderStyles.groove
		    borderStyleStr = "groove"
		  Case BorderStyles.inset
		    borderStyleStr = "inset"
		  Case BorderStyles.outset
		    borderStyleStr = "outset"
		  Case BorderStyles.ridge
		    borderStyleStr = "ridge"
		  Case BorderStyles.solid
		    borderStyleStr = "solid"
		  End Select
		  Var TooltipBorderStyleStr As String
		  Select Case TooltipBorderstyle
		  Case BorderStyles.dashed
		    TooltipBorderStyleStr = "dashed"
		  Case BorderStyles.dotted
		    TooltipBorderStyleStr = "dotted"
		  Case BorderStyles.Double
		    TooltipBorderStyleStr = "double"
		  Case BorderStyles.groove
		    TooltipBorderStyleStr = "groove"
		  Case BorderStyles.inset
		    TooltipBorderStyleStr = "inset"
		  Case BorderStyles.outset
		    TooltipBorderStyleStr = "outset"
		  Case BorderStyles.ridge
		    TooltipBorderStyleStr = "ridge"
		  Case BorderStyles.solid
		    TooltipBorderStyleStr = "solid"
		  End Select
		  
		  If ControlsWithoutBorder Then
		    css.AddRow( "iframe { " )
		    css.AddRow( "border: 0px; " )
		    css.AddRow( "} ")
		  End If
		  
		  if CustomizeWebListbox = true then
		    css.AddRow( ".table-striped tbody tr:nth-Of-type(odd) {" )
		    css.AddRow( "background-Color: #" + rowOdd.ToString.Right(6) + ";" )
		    css.AddRow( "}")
		    
		    css.AddRow( ".table-striped tbody tr:nth-Of-type(even) { ")
		    css.AddRow( "background-Color: #" + RowEven.ToString.Right(6) + ";" ) 
		    css.AddRow( "}")
		    
		    css.AddRow( "th { ")
		    css.AddRow( "background-Color: #" + HeaderBackground.ToString.Right(6) + ";" ) 
		    css.AddRow( "color: #" + HeaderText.ToString.Right(6) + ";" ) 
		    css.AddRow( "}")
		    
		    css.AddRow( ".table thead th { ")
		    css.AddRow( "border-bottom: " + HeaderBottomLinePixelSize.ToString + "px "+ borderStyleStr + " #" + HeaderBottomLine.ToString.Right(6) + ";" ) 
		    css.AddRow( "line-height: " + HeaderRowHeight.toString + "px;" )
		    css.AddRow( "font-size: " + HeaderFontSize.toString + "px;" )
		    css.AddRow( "}")
		  End If
		  
		  If MinimalRowHeight Then
		    css.AddRow( ".table-striped tbody { ")
		    css.AddRow( "line-height: 0.1 !important; ")
		    css.AddRow( "} ")
		  End If
		  
		  If CustomizeWebTooltip Then
		    css.AddRow( ".tooltip-inner {")
		    css.AddRow( "color: #" + TooltipColor.ToString.Right(6) + ";")
		    css.AddRow( "background-Color: #" + TooltipBackground.ToString.Right(6) + "!important;")
		    css.AddRow( "border: " + TooltipBorderSize.ToString + "px " +  TooltipBorderStyleStr + " #" + TooltipColor.ToString.Right(6) + ";")
		    css.AddRow( "}")
		    
		    css.AddRow( ".tooltip.bs-tooltip-auto[x-placement^=top] .arrow::before, .tooltip.bs-tooltip-Top .arrow::before { ")
		    css.AddRow( "border-Top-Color: #" + TooltipArrow.ToString.Right(6) + " !important; ")
		    css.AddRow( "}")
		    
		    css.AddRow( ".tooltip.bs-tooltip-auto[x-placement^=right] .arrow::before, .tooltip.bs-tooltip-Right .arrow::before { ")
		    css.AddRow( "border-Right-Color: #" + TooltipArrow.ToString.Right(6) + " !important; ")
		    css.AddRow( "}")
		    
		    css.AddRow( ".tooltip.bs-tooltip-auto[x-placement^=left] .arrow::before, .tooltip.bs-tooltip-Left .arrow::before { ")
		    css.AddRow( "border-Left-Color: #" + TooltipArrow.ToString.Right(6) + " !important; ")
		    css.AddRow( "}")
		    
		    css.AddRow( ".tooltip.bs-tooltip-auto[x-placement^=bottom] .arrow::before, .tooltip.bs-tooltip-Bottom .arrow::before { ")
		    css.AddRow( "border-Bottom-Color: #" + TooltipArrow.ToString.Right(6) + " !important; ")
		    css.AddRow( "}")
		  End If
		  
		  If CustomizeScrollMore = True Then
		    css.AddRow( "div.dts div.dataTables_scrollBody { ")
		    css.AddRow( "background: #" + ScrollMore.toString.Right(6) + " !important; ")
		    css.AddRow( "}")
		  End If
		  
		  If CustomizeWebtoolbar Then
		    css.AddRow( ".bg-light { ")
		    css.AddRow( "background-Color: #" + WebtoolbarBackground.toString.Right(6) + " !important; ")  
		    css.AddRow( "}" )
		    css.AddRow( ".navbar-light .navbar-brand { ")
		    css.AddRow( "Color: #" + WebtoolbarBrand.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar-light .navbar-brand:hover { ")
		    css.AddRow( "Color: #" + WebtoolbarBrandHover.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    css.AddRow( ".nav-link { ")
		    css.AddRow( "Color: #" + WebtoolbarLinks.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" )
		    css.AddRow( ".nav-link:hover { ")
		    css.AddRow( "Color: #" + WebtoolbarHover.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar-text { ")
		    css.AddRow( "Color: #" + WebtoolbarLabel.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar .dropdown-toggle::after{ " )
		    css.AddRow( "border-top-Color: #" + WebtoolbarArrow.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar .dropdown-menu { ") 
		    css.AddRow( "background-Color: #" + SubmenuBackground.toString.Right(6) + " !important; ")  
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar li.dropdown-item a  { ") 
		    css.AddRow( "Color: #" + SubmenuText.toString.Right(6) + " !important; ")
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar li.dropdown-item:hover  { ")  
		    css.AddRow( "background: #" + SubmenuHover.toString.Right(6) + " !important; ")
		    css.AddRow( "}" ) 
		    css.AddRow( ".navbar .dropdown-submenu>a:after { ")  
		    css.AddRow( "border-left-color: #" + SubmenuArrow.toString.Right(6) + " !important; ")
		    css.AddRow( "}" ) 
		  End If
		  
		  If CustomizeWebComboBox = True Then
		    css.AddRow( ".XojoCombobox .btn .dropdown-menu { ")   
		    css.AddRow( "background-Color: #" + ComboboxBackground.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    css.AddRow( ".XojoCombobox .btn li.dropdown-item a  { ")   
		    css.AddRow( "Color: #" + ComboboxText.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    css.AddRow( ".XojoCombobox .btn li.dropdown-item:hover  { ")   
		    css.AddRow( "background: #" + ComboboxHover.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		  End If
		  
		  If CustomizeWebPopupmenu = True Then
		    css.AddRow( ".XojoPopupMenu .dropdown-menu { ")   
		    css.AddRow( "background-Color: #" + PopupmenuBackground.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    css.AddRow( ".XojoPopupMenu li.dropdown-item a  { ")   
		    css.AddRow( "Color: #" + PopupmenuText.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    css.AddRow( ".XojoPopupMenu li.dropdown-item:hover  { ")   
		    css.AddRow( "background: #" + PopupmenuHover.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		  End If
		  
		  cssStr = String.FromArray( css, "" )
		  
		  js.value("teccCSS") = cssStr
		  js.value("teccSA") = teccSA
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  // Return anything that you needed added to the <head> of the web app
		  Return "<style id ='teccinject'></style>"
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  #Pragma unused session
		  If JSFramework = Nil Then
		    JSFramework = New WebFile
		    JSFramework.Filename = "teccCSS.js"
		    JSFramework.MIMEType ="text/javascript"
		    JSFramework.data = kJSCode
		    JSFramework.Session = Nil 
		  End If
		  
		  Var urls() As String
		  urls.Add( JSFramework.URL )
		  
		  Return urls
		  
		  
		  
		End Function
	#tag EndEvent


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mComboboxBackground
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mComboboxBackground = value
			  UpdateControl
			End Set
		#tag EndSetter
		ComboboxBackground As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mComboboxHover
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mComboboxHover = value
			  UpdateControl
			End Set
		#tag EndSetter
		ComboboxHover As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mComboboxText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mComboboxText = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		ComboboxText As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mControlsWithoutBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mControlsWithoutBorder = value
			  UpdateControl
			End Set
		#tag EndSetter
		ControlsWithoutBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCustomizeScrollMore
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeScrollMore = value
			  UpdateControl
			End Set
		#tag EndSetter
		CustomizeScrollMore As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCustomizeWebCombobox
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebCombobox = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		CustomizeWebCombobox As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCustomizeWebListbox
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebListbox = value
			  UpdateControl
			End Set
		#tag EndSetter
		CustomizeWebListbox As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCustomizeWebPopupmenu
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebPopupmenu = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		CustomizeWebPopupmenu As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCustomizeWebtoolbar
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebtoolbar = value
			  UpdateControl
			End Set
		#tag EndSetter
		CustomizeWebtoolbar As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCustomizeWebTooltip
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebTooltip = value
			  UpdateControl
			End Set
		#tag EndSetter
		CustomizeWebTooltip As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderBackground
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderBackground = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		HeaderBackground As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderBottomLine
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderBottomLine = value
			  UpdateControl
			End Set
		#tag EndSetter
		HeaderBottomLine As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderBottomLinePixelSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderBottomLinePixelSize = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		HeaderBottomLinePixelSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderBottomStyle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderBottomStyle = value
			  UpdateControl
			End Set
		#tag EndSetter
		HeaderBottomStyle As BorderStyles
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderFontSize = value
			  UpdateControl
			End Set
		#tag EndSetter
		HeaderFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderRowHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderRowHeight = value
			  UpdateControl
			End Set
		#tag EndSetter
		HeaderRowHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHeaderText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHeaderText = value
			  UpdateControl
			End Set
		#tag EndSetter
		HeaderText As color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared JSFramework As WebFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mComboboxBackground As color = &c75d5ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mComboboxHover As Color = &c005392
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mComboboxText As color = &c0096ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mControlsWithoutBorder As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeScrollMore As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebCombobox As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebListbox As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebPopupmenu As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebtoolbar As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebTooltip As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderBackground As color = &c3774ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderBottomLine As Color = &cff0000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderBottomLinePixelSize As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderBottomStyle As BorderStyles
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderFontSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderRowHeight As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderText As color = &cffffff
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMinimalRowHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMinimalRowHeight = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		MinimalRowHeight As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMinimalRowHeight As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPopupmenuBackground As Color = &cfefc78
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPopupmenuHover As color = &c929000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPopupmenuText As Color = &c521b92
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowEven As Color = &cd9f1fd
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowOdd As Color = &c8ff4fc
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollMore As color = &cffffff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSimpleanalyticsdotcom As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubmenuArrow As Color = &c0000ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubmenuBackground As color = &c797979
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubmenuHover As color = &cff0000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubmenuText As Color = &cffffff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTooltipArrow As Color = &cff0000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTooltipBackground As Color = &c75d5ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTooltipBorder As Color = &c0096ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTooltipBorderSize As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTooltipBorderstyle As BorderStyles
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTooltipColor As Color = &c0096ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarArrow As Color = &c008f51
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBackground As Color = &ceaeaea
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrand As Color = &c0096ff
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandHover As color = &c011993
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarHover As Color = &cff2600
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarLabel As Color = &cff9300
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarLinks As Color = &cff7d78
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared MyControlCSS As WebFile
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPopupmenuBackground
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPopupmenuBackground = value
			  UpdateControl
			End Set
		#tag EndSetter
		PopupmenuBackground As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPopupmenuHover
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPopupmenuHover = value
			  UpdateControl
			End Set
		#tag EndSetter
		PopupmenuHover As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPopupmenuText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPopupmenuText = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		PopupmenuText As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRowEven
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRowEven = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		RowEven As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRowOdd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRowOdd = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		RowOdd As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mScrollMore
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mScrollMore = value
			  updatecontrol
			End Set
		#tag EndSetter
		ScrollMore As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSimpleanalyticsdotcom
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSimpleanalyticsdotcom = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		Simpleanalyticsdotcom As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSubmenuArrow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSubmenuArrow = value
			  updateControl
			End Set
		#tag EndSetter
		SubmenuArrow As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSubmenuBackground
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSubmenuBackground = value
			  UpdateControl
			End Set
		#tag EndSetter
		SubmenuBackground As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSubmenuHover
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSubmenuHover = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		SubmenuHover As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSubmenuText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSubmenuText = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		SubmenuText As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTooltipArrow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTooltipArrow = value
			  UpdateControl
			End Set
		#tag EndSetter
		TooltipArrow As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTooltipBackground
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTooltipBackground = value
			  UpdateControl
			End Set
		#tag EndSetter
		TooltipBackground As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTooltipBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTooltipBorder = value
			End Set
		#tag EndSetter
		TooltipBorder As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTooltipBorderSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTooltipBorderSize = value
			  UpdateControl
			End Set
		#tag EndSetter
		TooltipBorderSize As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTooltipBorderstyle
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTooltipBorderstyle = value
			  UpdateControl
			End Set
		#tag EndSetter
		TooltipBorderstyle As BorderStyles
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTooltipColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTooltipColor = value
			  UpdateControl
			End Set
		#tag EndSetter
		TooltipColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared Untitled As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarArrow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarArrow = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarArrow As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBackground
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBackground = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBackground As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrand
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrand = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrand As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandHover
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandHover = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandHover As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarHover
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarHover = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarHover As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarLabel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarLabel = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarLabel As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarLinks
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarLinks = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarLinks As Color
	#tag EndComputedProperty


	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar tecc;\n(function (tecc) {\n    class teccCSS extends XojoWeb.XojoControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n        }\n        updateControl(data) {\n            super.updateControl(data);\n            let js \x3D $.parseJSON(data);\n            this.teccCSS \x3D js.teccCSS;\n            this.teccSA \x3D js.teccSA;\n            this.teccClicky \x3D js.teccClicky;\n\t    var element \x3D document.getElementById(\'teccinject\');\n            element.innerHTML\x3D this.teccCSS;\n            const existingSA \x3D document.getElementById(\'teccSA\');\n            if (!existingSA) {  \n               if ( this.teccSA !\x3D \"\" ) {\n                  var scriptElement\x3Ddocument.createElement(\'script\');\n                  scriptElement.id \x3D \'teccSA\';\n                  scriptElement.type \x3D \'text/javascript\';\n                  scriptElement.src \x3D this.teccSA;\n                  document.head.appendChild(scriptElement);\n                   }\n             }\n             this.refresh();\n          }\n      }\n    tecc.teccCSS \x3D teccCSS;\n})(tecc || (tecc \x3D {}));\n\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LibraryIcon, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NavigatorIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABemlDQ1BJQ0MgUHJvZmlsZQAAKJF9kE0rRFEYx39miLzNgoWFxY1hY4hRYqPMJNQsNCiDzZ1rXtTMuN25QjYWynaKEhtvCz4BGwtlrZQiJTtfgNhI13NmaLyUp57z/M5znvPvnD+4fLpppko7IZ2xrfBQQJuMTGnlj5TRiIda2nQjaw6MjoaQ+Ko/4/WGElWv25XW3/N/o2o2ljWgpEK43zAtW3hYuHnRNhUrvXpLHiW8qjhR4E3F0QIf52fGw0HhM2HNSOqzwvfCPiNppcGl9L3RbzOJb5xOLRif71E/qY5lJsakNkk2kiXMEAE0RhgkSA9d9MnaQzt+OmSHHVuy1eXgvLlszSWStjYgTsS0kYzR4dP8nX6ZUb7+9qvYm9+D3hdw54q96BacrkPDXbHn3QXPGpxcmLql51tuSVc8Dk9HUBOBuiuonM7Gu/2FH1UHoOzBcZ5boHwD3nOO87bvOO8Hclk8Os8UPPrU4vAWxlcgdAnbO9Aq2p6ZDyszZzCPSKziAAAAbGVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgAAwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAGAAAAABAAAAYAAAAAEAAqACAAQAAAABAAAAEKADAAQAAAABAAAAEAAAAADImMOoAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAA3ElEQVQ4Ec2TPQrCQBCFVwUvYWthL2ihpVgL2trZ2nsBGyuxtlBvYGXvBTyB9jYJ/iP4900IYbIoxLVx4YO3O/PeTkJijDFZGIEHz4RIr3jEG4ikRrtPQr662Q7wUgTIofNKOztD47uAG7WjCj4ofUbf1T6Q+rkWnFShCWtoQAuWMIUa9EF7YpsSxb1qqKAnIFMNoANb+BhQpKgDduy7MIQHzEFCowD7HfQo1kHG3kAbVpAHmWAGBYitKI1T0Vc4KX0JtdRkolj/f3wHPmO5Lj+DMwdlx4Sx+H76nV8sE3ug9JK8jwAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant


	#tag Enum, Name = BorderStyles, Flags = &h0
		dashed
		  dotted
		  double
		  groove
		  inset
		  outset
		  ridge
		solid
	#tag EndEnum


	#tag ViewBehavior
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
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeWebListbox"
			Visible=true
			Group="WebListbox"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderBackground"
			Visible=true
			Group="WebListbox"
			InitialValue="&c3774ff"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderText"
			Visible=true
			Group="WebListbox"
			InitialValue="&cffffff"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderFontSize"
			Visible=true
			Group="WebListbox"
			InitialValue="24"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderBottomLine"
			Visible=true
			Group="WebListbox"
			InitialValue="&cff0000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderBottomLinePixelSize"
			Visible=true
			Group="WebListbox"
			InitialValue="4"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderBottomStyle"
			Visible=true
			Group="WebListbox"
			InitialValue="7"
			Type="BorderStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - dashed"
				"1 - dotted"
				"2 - double"
				"3 - groove"
				"4 - inset"
				"5 - outset"
				"6 - ridge"
				"7 - solid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderRowHeight"
			Visible=true
			Group="WebListbox"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowOdd"
			Visible=true
			Group="WebListbox"
			InitialValue="&c8dd4fc"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowEven"
			Visible=true
			Group="WebListbox"
			InitialValue="&cd9f1fd"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeScrollMore"
			Visible=true
			Group="WebListBoxScrollMore"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollMore"
			Visible=true
			Group="WebListBoxScrollMore"
			InitialValue="&cffffff"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeWebtoolbar"
			Visible=true
			Group="WebToolbar"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBackground"
			Visible=true
			Group="WebToolbar"
			InitialValue="&ceaeaea"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrand"
			Visible=true
			Group="WebToolbar"
			InitialValue="&c0096ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandHover"
			Visible=true
			Group="WebToolbar"
			InitialValue="&c011993"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarLabel"
			Visible=true
			Group="WebToolbar"
			InitialValue="&cff9300"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarLinks"
			Visible=true
			Group="WebToolbar"
			InitialValue="&cff7d78"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarHover"
			Visible=true
			Group="WebToolbar"
			InitialValue="&cff2600"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarArrow"
			Visible=true
			Group="WebToolbar"
			InitialValue="&c008f51"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubmenuBackground"
			Visible=true
			Group="WebToolbar"
			InitialValue="&c797979"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubmenuHover"
			Visible=true
			Group="WebToolbar"
			InitialValue="&cff0000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubmenuText"
			Visible=true
			Group="WebToolbar"
			InitialValue="&cffffff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubmenuArrow"
			Visible=true
			Group="WebToolbar"
			InitialValue="&c0000ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeWebCombobox"
			Visible=true
			Group="WebCombobox"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ComboboxBackground"
			Visible=true
			Group="WebCombobox"
			InitialValue="&c75d5ff"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ComboboxText"
			Visible=true
			Group="WebCombobox"
			InitialValue="&c0096ff"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ComboboxHover"
			Visible=true
			Group="WebCombobox"
			InitialValue="&c005392"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeWebPopupmenu"
			Visible=true
			Group="WebPopupMenu"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PopupmenuBackground"
			Visible=true
			Group="WebPopupMenu"
			InitialValue="&cfefc78"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PopupmenuText"
			Visible=true
			Group="WebPopupMenu"
			InitialValue="&c521b92"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PopupmenuHover"
			Visible=true
			Group="WebPopupMenu"
			InitialValue="&c929000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeWebTooltip"
			Visible=true
			Group="WebTooltip"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TooltipColor"
			Visible=true
			Group="WebTooltip"
			InitialValue="&c0096ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TooltipBackground"
			Visible=true
			Group="WebTooltip"
			InitialValue="&c75d5ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TooltipBorder"
			Visible=true
			Group="WebTooltip"
			InitialValue="&c0096ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TooltipBorderSize"
			Visible=true
			Group="WebTooltip"
			InitialValue="2"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TooltipBorderstyle"
			Visible=true
			Group="WebTooltip"
			InitialValue="7"
			Type="BorderStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - dashed"
				"1 - dotted"
				"2 - double"
				"3 - groove"
				"4 - inset"
				"5 - outset"
				"6 - ridge"
				"7 - solid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TooltipArrow"
			Visible=true
			Group="WebTooltip"
			InitialValue="&cff0000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Simpleanalyticsdotcom"
			Visible=true
			Group="Analytics"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlsWithoutBorder"
			Visible=true
			Group="Experimental"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimalRowHeight"
			Visible=true
			Group="Experimental"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
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
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
