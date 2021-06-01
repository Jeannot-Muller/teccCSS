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
		  https://forum.xojo.com/t/webdatepicker-date-range-css-adjustments/63
		  
		  Var teccSA As String
		  Var code() As String
		  
		  code.Add( kClass + "enabled = " + Me.Enabled.ToString )
		  If Me.Enabled = False Then
		    Return
		  Else
		  End If
		  
		  code.Add( kClass + "Simpleanalyticsdotcom = " + Simpleanalyticsdotcom.ToString )
		  If Simpleanalyticsdotcom = True Then
		    teccSA = "https://scripts.simpleanalyticscdn.com/latest.js"
		  Else
		    teccSA = ""
		  End If
		  
		  Var cssStr As String
		  Var css() As String
		  Var borderStyleStr As String
		  
		  Var buttonHoverAnimationStr As String
		  Select Case ButtonHoverAnimation
		  Case ButtonHoverAnimations.Enlarge
		    code.Add( kClass + "ButtonHoverAnimation = teccCSS.ButtonHoverAnimations.Enlarge" )
		    buttonHoverAnimationStr = ".XojoButton .btn:hover{ -webkit-transform: scale(1.1) !important; }"
		  Case ButtonHoverAnimations.ThinShadow
		    code.Add( kClass + "ButtonHoverAnimation = teccCSS.ButtonHoverAnimations.ThinShadow" )
		    buttonHoverAnimationStr = ".XojoButton .btn:hover{ transition: box-shadow .4s cubic-bezier(.25, .8, .25, 1) !important; transform .4s cubic-bezier(.25, .8, .25, 1) !important; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .26) !important;}"
		  Case ButtonHoverAnimations.LargeShadow
		    code.Add( kClass + "ButtonHoverAnimation = teccCSS.ButtonHoverAnimations.LargeShadow" )
		    ButtonHoverAnimationStr = ".XojoButton .btn:hover{ transform: translateY(-3px) !important; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2) !important;}"
		  End Select
		  
		  Select Case HeaderBottomStyle
		  Case BorderStyles.dashed
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.dashed" )
		    borderStyleStr = "dashed"
		  Case BorderStyles.dotted
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.dotted" )
		    borderStyleStr = "dotted"
		  Case BorderStyles.Double
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.double" )
		    borderStyleStr = "double"
		  Case BorderStyles.groove
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.groove" )
		    borderStyleStr = "groove"
		  Case BorderStyles.inset
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.inset" )
		    borderStyleStr = "inset"
		  Case BorderStyles.outset
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.outset" )
		    borderStyleStr = "outset"
		  Case BorderStyles.ridge
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.ridge" )
		    borderStyleStr = "ridge"
		  Case BorderStyles.solid
		    code.Add( kClass + "HeaderBottomStyle = teccCSS.BorderStyles.solid" )
		    borderStyleStr = "solid"
		  End Select
		  
		  Var TooltipBorderStyleStr As String
		  Select Case TooltipBorderstyle
		  Case BorderStyles.dashed
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.dashed" )
		    TooltipBorderStyleStr = "dashed"
		  Case BorderStyles.dotted
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.dotted" )
		    TooltipBorderStyleStr = "dotted"
		  Case BorderStyles.Double
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.double" )
		    TooltipBorderStyleStr = "double"
		  Case BorderStyles.groove
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.groove" )
		    TooltipBorderStyleStr = "groove"
		  Case BorderStyles.inset
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.inset" )
		    TooltipBorderStyleStr = "inset"
		  Case BorderStyles.outset
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.outset" )
		    TooltipBorderStyleStr = "outset"
		  Case BorderStyles.ridge
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.ridge" )
		    TooltipBorderStyleStr = "ridge"
		  Case BorderStyles.solid
		    code.Add( kClass + "TooltipBorderstyle = teccCSS.BorderStyles.solid" )
		    TooltipBorderStyleStr = "solid"
		  End Select
		  
		  code.Add( kClass + "ControlsWithoutBorder = " + ControlsWithoutBorder.ToString )
		  If ControlsWithoutBorder Then
		    css.AddRow( "iframe { " )
		    css.AddRow( "border: 0; " )
		    css.AddRow( "} ")
		  End If
		  
		  code.Add( kClass + "CustomizeScrollMore = " + CustomizeScrollMore.ToString )
		  If CustomizeScrollMore = True Then
		    code.Add( kClass + "ScrollMore = &c" + ScrollMore.toString.Right(6) )
		    css.AddRow( "div.dts div.dataTables_scrollBody {")
		    css.AddRow( "background: #" + ScrollMore.toString.Right(6) + " !important;")
		    css.AddRow( "}")
		  End If
		  
		  code.Add( kClass + "CustomizeWebListbox = " + CustomizeWebListbox.ToString )
		  If CustomizeWebListbox = True Then
		    code.Add( kClass + "rowOdd = &c" + rowOdd.ToString.Right(6) )
		    css.AddRow( ".table-striped tbody tr:nth-Of-type(odd) {" )
		    css.AddRow( "background-Color: #" + rowOdd.ToString.Right(6) + ";" )
		    css.AddRow( "}")
		    
		    code.Add( kClass + "rowEven = &c" + rowEven.ToString.Right(6) )
		    css.AddRow( ".table-striped tbody tr:nth-Of-type(even) { ")
		    css.AddRow( "background-Color: #" + RowEven.ToString.Right(6) + ";" ) 
		    css.AddRow( "}")
		    
		    code.Add( kClass + "HeaderBackground = &c" + HeaderBackground.ToString.Right(6) )
		    code.Add( kClass + "HeaderText = &c" + HeaderText.ToString.Right(6) )
		    css.AddRow( ".table th { ")
		    css.AddRow( "background-Color: #" + HeaderBackground.ToString.Right(6) + ";" ) 
		    css.AddRow( "color: #" + HeaderText.ToString.Right(6) + ";" ) 
		    css.AddRow( "}")
		    
		    code.Add( kClass + "HeaderBottomLinePixelSize = " + HeaderBottomLinePixelSize.ToString )
		    code.Add( kClass + "HeaderRowHeight = " + HeaderRowHeight.toString )
		    code.Add( kClass + "HeaderFontSize = " + HeaderFontSize.toString )
		    css.AddRow( ".table thead th { ")
		    css.AddRow( "border-bottom: " + HeaderBottomLinePixelSize.ToString + "px "+ borderStyleStr + " #" + HeaderBottomLine.ToString.Right(6) + ";" ) 
		    css.AddRow( "line-height: " + HeaderRowHeight.toString + "px;" )
		    css.AddRow( "font-size: " + HeaderFontSize.toString + "px;" )
		    css.AddRow( "}")
		  End If
		  
		  code.Add( kClass + "MinimalRowHeight = " + MinimalRowHeight.ToString )
		  If MinimalRowHeight Then
		    css.AddRow( ".table-striped tbody { ")
		    css.AddRow( "line-height: 0.1 !important; ")
		    css.AddRow( "} ")
		  End If
		  
		  code.Add( kClass + "CustomizeWebTooltip = " + CustomizeWebTooltip.ToString )
		  If CustomizeWebTooltip Then
		    code.Add( kClass + "TooltipColor = &c" + TooltipColor.ToString.Right(6) )
		    code.Add( kClass + "TooltipBackground = &c" + TooltipBackground.ToString.Right(6) )
		    code.Add( kClass + "TooltipBorderSize = " + TooltipBorderSize.ToString )
		    css.AddRow( ".tooltip-inner {")
		    css.AddRow( "color: #" + TooltipColor.ToString.Right(6) + ";")
		    css.AddRow( "background-Color: #" + TooltipBackground.ToString.Right(6) + "!important;")
		    css.AddRow( "border: " + TooltipBorderSize.ToString + "px " +  TooltipBorderStyleStr + " #" + TooltipColor.ToString.Right(6) + ";")
		    css.AddRow( "}")
		    
		    code.Add( kClass + "TooltipArrow = &c" + TooltipArrow.ToString.Right(6) )
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
		  
		  code.Add( kClass + "CustomizeWebtoolbar = " + CustomizeWebtoolbar.ToString )
		  If CustomizeWebtoolbar Then
		    code.Add( kClass + "WebtoolbarBackground = &c" + WebtoolbarBackground.toString.Right(6) )
		    css.AddRow( ".bg-light { ")
		    css.AddRow( "background-Color: #" + WebtoolbarBackground.toString.Right(6) + " !important; ")  
		    css.AddRow( "}" )
		    code.Add( kClass + "WebtoolbarBrand = &c" + WebtoolbarBrand.toString.Right(6) )
		    code.Add( kClass + "WebtoolbarBrandFontSize = " + WebtoolbarBrandFontSize.toString )
		    code.Add( kClass + "WebtoolbarBrandFontWeight = " + WebtoolbarBrandFontWeight.toString )
		    code.Add( kClass + "WebtoolbarBrandPaddingTop = " + WebtoolbarBrandPaddingTop.toString )
		    code.Add( kClass + "WebtoolbarBrandPaddingBottom = " + WebtoolbarBrandPaddingBottom.toString )
		    code.Add( kClass + "WebtoolbarBrandPaddingRight = " + WebtoolbarBrandPaddingRight.toString )
		    code.Add( kClass + "WebtoolbarBrandPaddingLeft = " + WebtoolbarBrandPaddingLeft.toString )
		    css.AddRow( ".navbar-brand { ")
		    css.AddRow( "Color: #" + WebtoolbarBrand.toString.Right(6) + " !important; ") 
		    css.AddRow( "Font-size: " + WebtoolbarBrandFontSize.toString + "px !important; ")
		    css.AddRow( "Font-weight: " + WebtoolbarBrandFontWeight.toString + "px !important; ")
		    css.AddRow( "padding-Top: " + WebtoolbarBrandPaddingTop.toString + "px !important; ")
		    css.AddRow( "padding-Bottom: " + WebtoolbarBrandPaddingBottom.toString + "px !important; ")
		    css.AddRow( "padding-Left: " + WebtoolbarBrandPaddingLeft.toString + "px !important; ")
		    css.AddRow( "padding-Right: " + WebtoolbarBrandPaddingRight.toString + "px !important; ")
		    css.AddRow( "}" ) 
		    code.Add( kClass + "WebtoolbarBrandHover = &c" + WebtoolbarBrandHover.toString.Right(6) )
		    css.AddRow( ".navbar-light .navbar-brand:hover { ")
		    css.AddRow( "Color: #" + WebtoolbarBrandHover.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    code.Add( kClass + "WebtoolbarLinks = &c" + WebtoolbarLinks.toString.Right(6) )
		    css.AddRow( ".nav-link { ")
		    css.AddRow( "Color: #" + WebtoolbarLinks.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" )
		    code.Add( kClass + "WebtoolbarHover = &c" + WebtoolbarHover.toString.Right(6) )
		    css.AddRow( ".nav-link:hover { ")
		    css.AddRow( "Color: #" + WebtoolbarHover.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    code.Add( kClass + "WebtoolbarLabel = &c" + WebtoolbarLabel.toString.Right(6) )
		    css.AddRow( ".navbar-text { ")
		    css.AddRow( "Color: #" + WebtoolbarLabel.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    code.Add( kClass + "WebtoolbarArrow = &c" + WebtoolbarArrow.toString.Right(6) )
		    css.AddRow( ".navbar .dropdown-toggle::after{ " )
		    css.AddRow( "border-top-Color: #" + WebtoolbarArrow.toString.Right(6) + " !important; ") 
		    css.AddRow( "}" ) 
		    code.Add( kClass + "SubmenuBackground = &c" + SubmenuBackground.toString.Right(6) )
		    css.AddRow( ".navbar .dropdown-menu { ") 
		    css.AddRow( "background-Color: #" + SubmenuBackground.toString.Right(6) + " !important; ")  
		    css.AddRow( "}" ) 
		    code.Add( kClass + "SubmenuText = &c" + SubmenuText.toString.Right(6) )
		    css.AddRow( ".navbar li.dropdown-item a  { ") 
		    css.AddRow( "Color: #" + SubmenuText.toString.Right(6) + " !important; ")
		    css.AddRow( "}" ) 
		    code.Add( kClass + "SubmenuHover = &c" + SubmenuHover.toString.Right(6) )
		    css.AddRow( ".navbar li.dropdown-item:hover  { ")  
		    css.AddRow( "background: #" + SubmenuHover.toString.Right(6) + " !important; ")
		    css.AddRow( "}" ) 
		    code.Add( kClass + "SubmenuArrow = &c" + SubmenuArrow.toString.Right(6) )
		    css.AddRow( ".navbar .dropdown-submenu>a:after { ")  
		    css.AddRow( "border-left-color: #" + SubmenuArrow.toString.Right(6) + " !important; ")
		    css.AddRow( "}" ) 
		  End If
		  
		  code.Add( kClass + "CustomizeWebtoolbarBrandLogo = " + CustomizeWebtoolbarBrandLogo.ToString )
		  If CustomizeWebtoolbarBrandLogo Then
		    code.Add( kClass + "WebtoolbarBrandLogoWidth = " + WebtoolbarBrandLogoWidth.toString + "px !important;")
		    code.Add( kClass + "WebtoolbarBrandLogoHeight = " + WebtoolbarBrandLogoHeight.toString + "px !important;")
		    code.Add( kClass + "WebtoolbarBrandLogoPaddingTop = " + WebtoolbarBrandLogoPaddingTop.toString + "px !important;")
		    code.Add( kClass + "WebtoolbarBrandLogoPaddingBottom = " + WebtoolbarBrandLogoPaddingBottom.toString + "px !important;")
		    code.Add( kClass + "WebtoolbarBrandLogoPaddingRight = " + WebtoolbarBrandLogoPaddingRight.toString + "px !important;")
		    code.Add( kClass + "WebtoolbarBrandLogoPaddingLeft = " + WebtoolbarBrandLogoPaddingLeft.toString + "px !important;")
		    css.AddRow( ".navbar-brand img.d-inline-block.align-top {  ")
		    css.AddRow( "width: " + WebtoolbarBrandLogoWidth.toString + "px !important; ")
		    css.AddRow( "height: " + WebtoolbarBrandLogoHeight.toString + "px !important; ")
		    css.AddRow( "padding-Top: " + WebtoolbarBrandLogoPaddingTop.toString + "px !important; ")
		    css.AddRow( "padding-Bottom: " + WebtoolbarBrandLogoPaddingBottom.toString + "px !important; ")
		    css.AddRow( "padding-Right: " + WebtoolbarBrandLogoPaddingRight.toString + "px !important; ")
		    css.AddRow( "padding-Left: " + WebtoolbarBrandLogoPaddingLeft.toString + "px !important; ")
		    css.AddRow( "}" ) 
		  End If
		  
		  code.Add( kClass + "CustomizeWebComboBox = " + CustomizeWebComboBox.ToString )
		  If CustomizeWebComboBox = True Then
		    code.Add( kClass + "ComboboxBackground = &c" + ComboboxBackground.toString.Right(6) )
		    css.AddRow( ".XojoCombobox .btn .dropdown-menu { ")   
		    css.AddRow( "background-Color: #" + ComboboxBackground.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    code.Add( kClass + "ComboboxText = &c" + ComboboxText.toString.Right(6) )
		    css.AddRow( ".XojoCombobox .btn li.dropdown-item a  { ")   
		    css.AddRow( "Color: #" + ComboboxText.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    code.Add( kClass + "ComboboxHover = &c" + ComboboxHover.toString.Right(6) )
		    css.AddRow( ".XojoCombobox .btn li.dropdown-item:hover  { ")   
		    css.AddRow( "background: #" + ComboboxHover.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		  End If
		  
		  code.Add( kClass + "CustomizeWebPopupmenu = " + CustomizeWebPopupmenu.ToString )
		  If CustomizeWebPopupmenu = True Then
		    code.Add( kClass + "PopupmenuBackground = &c" + PopupmenuBackground.toString.Right(6) )
		    css.AddRow( ".XojoPopupMenu .dropdown-menu { ")   
		    css.AddRow( "background-Color: #" + PopupmenuBackground.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    code.Add( kClass + "PopupmenuText = &c" + PopupmenuText.toString.Right(6) )
		    css.AddRow( ".XojoPopupMenu li.dropdown-item a  { ")   
		    css.AddRow( "Color: #" + PopupmenuText.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		    code.Add( kClass + "PopupmenuHover = &c" + PopupmenuHover.toString.Right(6) )
		    css.AddRow( ".XojoPopupMenu li.dropdown-item:hover  { ")   
		    css.AddRow( "background: #" + PopupmenuHover.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		  End If
		  
		  code.Add( kClass + "CustomizeWebButtonAnimation = " + CustomizeWebButtonAnimation.ToString )
		  If CustomizeWebButtonAnimation Then
		    css.addRow( buttonHoverAnimationStr )
		  End If
		  
		  code.Add( kClass + "RoundedCorners = " + RoundedCorners.ToString )
		  If RoundedCorners Then
		    css.AddRow( ".XojoButton .btn { border-radius: 30px; !important;}" )
		  End If
		  
		  code.Add( kClass + "CustomizeDatepicker = " + CustomizeDatepicker.ToString )
		  If CustomizeDatepicker Then
		    calendar = New webfile
		    Var calcolor As Color = CalendarColor
		    calendar = WebPicture.BootstrapIcon( CalendarBootstrapIcon, calColor)
		    code.Add( kClass + "CalendarBootstrapIcon = " + chr(34) + CalendarBootstrapIcon +chr(34) )
		    code.Add( kClass + "CalendarColor = &c" + CalendarColor.ToString.Right(6) )
		    code.Add( kClass + "DisabledDates = &c" + DisabledDates.ToString.Right(6) )
		    css.AddRow( ".datepicker table tr td.disabled, .datepicker table tr td.disabled:hover {" ) 
		    css.AddRow( "Color: #" + DisabledDates.toString.Right(6) + " !important; ")   
		    css.AddRow( "}" ) 
		  End If
		  
		  css.AddRow( ".XojoDatePicker .form-control { ")
		  css.AddRow( "background-image: url(" + calendar.URL + ") !important;" )
		  css.AddRow( "background-repeat: no-repeat;" )
		  css.AddRow( "background-size: 30px 30px;" )
		  css.AddRow( "background-position: 97% 50%; ")
		  css.AddRow( "}" ) 
		  
		  code.Sort
		  
		  cssStr = String.FromArray( css, "" )
		  
		  mcodeXojo = String.FromArray( code, EndOfLine )
		  mCodeMinifiedCSS = cssStr
		  mCodeFullCSS = String.FromArray( css, EndOfLine )
		  
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


	#tag Method, Flags = &h0
		Function WebtoolbarBrandPaddingTop() As Integer
		  return mWebtoolbarBrandPaddingTop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WebtoolbarBrandPaddingTop(assigns value as Integer)
		  mWebtoolbarBrandPaddingTop = value
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mButtonHoverAnimation
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mButtonHoverAnimation = value
			  UpdateControl
			End Set
		#tag EndSetter
		ButtonHoverAnimation As ButtonHoverAnimations
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		calendar As webfile
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCalendarBootstrapIcon
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCalendarBootstrapIcon = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		CalendarBootstrapIcon As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCalendarColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCalendarColor = value
			  UpdateControl
			End Set
		#tag EndSetter
		CalendarColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mcodeFullCSS
			End Get
		#tag EndGetter
		codeFullCSS As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mcodeMinifiedCSS
			End Get
		#tag EndGetter
		codeMinifiedCSS As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mcodeXojo
			End Get
		#tag EndGetter
		codeXojo As string
	#tag EndComputedProperty

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
			  Return mCustomizeDatepicker
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeDatepicker = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		CustomizeDatepicker As boolean
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
			  Return mCustomizeWebButtonAnimation
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebButtonAnimation = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		CustomizeWebButtonAnimation As Boolean
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
			  Return mCustomizeWebtoolbarBrandLogo
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCustomizeWebtoolbarBrandLogo = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		CustomizeWebtoolbarBrandLogo As boolean
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
			  Return mDisabledDates
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDisabledDates = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		DisabledDates As color
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
		Private mButtonHoverAnimation As ButtonHoverAnimations
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCalendarBootstrapIcon As string = "calendar-month-fill"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCalendarColor As color = &c797979
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mcodeFullCSS As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mcodeMinifiedCSS As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mcodeXojo As string
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
		Private mCustomizeDatepicker As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeScrollMore As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebButtonAnimation As Boolean = false
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
		Private mCustomizeWebtoolbarBrandLogo As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCustomizeWebTooltip As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisabledDates As color = &cd69696
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
		Private mHeaderFontWeight As Integer = 700
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderPaddingRight As Integer = 100
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
		Private mRoundedCorners As boolean = false
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
		Private mWebtoolbarBrandFontSize As Integer = 24
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandFontWeight As Integer = 400
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandHover As color = &c011993
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandLogoHeight As Integer = 55
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandLogoPaddingBottom As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandLogoPaddingLeft As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandLogoPaddingRight As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandLogoPaddingTop As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandLogoWidth As Integer = 150
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandPaddingBottom As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandPaddingLeft As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandPaddingRight As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWebtoolbarBrandPaddingTop As Integer = 5
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
			  Return mRoundedCorners
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRoundedCorners = value
			  UpdateControl
			  
			End Set
		#tag EndSetter
		RoundedCorners As boolean
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
			  Return mWebtoolbarBrandFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandFontSize = value
			End Set
		#tag EndSetter
		WebtoolbarBrandFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandFontWeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandFontWeight = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandFontWeight As Integer
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
			  Return mWebtoolbarBrandLogoHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandLogoHeight = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandLogoHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandLogoPaddingBottom
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandLogoPaddingBottom = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandLogoPaddingBottom As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandLogoPaddingLeft
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandLogoPaddingLeft = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandLogoPaddingLeft As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandLogoPaddingRight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandLogoPaddingRight = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandLogoPaddingRight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandLogoPaddingTop
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandLogoPaddingTop = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandLogoPaddingTop As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandLogoWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandLogoWidth = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandLogoWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandPaddingBottom
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandPaddingBottom = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandPaddingBottom As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandPaddingLeft
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandPaddingLeft = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandPaddingLeft As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandPaddingRight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandPaddingRight = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandPaddingRight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mWebtoolbarBrandPaddingTop
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWebtoolbarBrandPaddingTop = value
			  UpdateControl
			End Set
		#tag EndSetter
		WebtoolbarBrandPaddingTop As Integer
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


	#tag Constant, Name = kClass, Type = String, Dynamic = False, Default = \"teccCSS1.", Scope = Public
	#tag EndConstant

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

	#tag Enum, Name = ButtonHoverAnimations, Type = Integer, Flags = &h0
		Enlarge
		  ThinShadow
		LargeShadow
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
			Name="codeFullCSS"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="codeMinifiedCSS"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="codeXojo"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="WebtoolbarBrandFontSize"
			Visible=true
			Group="WebToolbar"
			InitialValue="24"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandFontWeight"
			Visible=true
			Group="WebToolbar"
			InitialValue="400"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandPaddingTop"
			Visible=true
			Group="WebToolbar"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandPaddingLeft"
			Visible=true
			Group="WebToolbar"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandPaddingRight"
			Visible=true
			Group="WebToolbar"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandPaddingBottom"
			Visible=true
			Group="WebToolbar"
			InitialValue="5"
			Type="Integer"
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
			Name="CustomizeWebtoolbarBrandLogo"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandLogoWidth"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="150"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandLogoHeight"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="55"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandLogoPaddingTop"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandLogoPaddingRight"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="30"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandLogoPaddingLeft"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebtoolbarBrandLogoPaddingBottom"
			Visible=true
			Group="WebToolbarBrandLogo"
			InitialValue="0"
			Type="Integer"
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
			Name="RoundedCorners"
			Visible=true
			Group="WebButton"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeWebButtonAnimation"
			Visible=true
			Group="WebButton"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonHoverAnimation"
			Visible=true
			Group="WebButton"
			InitialValue="0"
			Type="ButtonHoverAnimations"
			EditorType="Enum"
			#tag EnumValues
				"0 - Enlarge"
				"1 - ThinShadow"
				"2 - LargeShadow"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomizeDatepicker"
			Visible=true
			Group="WebDatepicker"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisabledDates"
			Visible=true
			Group="WebDatepicker"
			InitialValue="&cd69696"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalendarBootstrapIcon"
			Visible=true
			Group="WebDatepicker"
			InitialValue="calendar-month-fill"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CalendarColor"
			Visible=true
			Group="WebDatepicker"
			InitialValue="&c797979"
			Type="color"
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
