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
		  // Use this method to serialize the data your control needs for initial setup
		  
		  js.value("bgval") = "#" + bgColor.ToString.right(6)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  // Return anything that you needed added to the <head> of the web app
		  Return "<style id ='teccinject'>placeholder</style>"
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
		  
		  Dim urls() As String
		  urls.Add( JSFramework.URL )
		  
		  Return urls
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From WebSDKControl
		  // Constructor() -- From WebControl
		  Super.Constructor
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mbgColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbgColor = value
			  
			End Set
		#tag EndSetter
		bgColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared JSFramework As WebFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mbgColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared MyControlCSS As WebFile
	#tag EndProperty


	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar tecc;\n(function (tecc) {\n    class teccCSS extends XojoWeb.XojoControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n        }\n        updateControl(data) {\n            super.updateControl(data);\n            let js \x3D $.parseJSON(data);\n            //this.refresh();\n            this.bgval \x3D js.bgval;\n\t    var element \x3D document.getElementById(\'teccinject\');\n            element.innerHTML \x3D \'html body {Font-family: Lato\x2C sans-serif;background-color: \' + this.bgval + \';\';\n        }\n\n    }\n    tecc.teccCSS \x3D teccCSS;\n})(tecc || (tecc \x3D {}));\n\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LibraryIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABemlDQ1BJQ0MgUHJvZmlsZQAAKJF9kE0rRFEYx38zXkZesqBYWNwYVkOMmtgoMwlloUF529y55kWZcbv3CtlYKFtFiY23BZ+AjYWyVkqRkp0vQGyk6zkujZfy1HOe33nOc/6d8wd/SDfNmcJWyOYcK94b1UbHxrXAA0XUUEwjNbphm92DgwNIfNWf8XKNT9WrZqX19/zfKJtK2gb4SoS7DNNyhPuEG+YdU7HSq7bkUcLLitMebyhOeHz0MTMcjwmfCmtGRp8SvhMOGRkrC36lH0x8m0l/4+zMnPH5HvWT8mRuZEhqvWQdNnF6iaLRTw8xIrTRKWuEZsK0yA4nueCoy7FZc9GaTmccrVucSGr9OaMlpIVbwzKjfP3tV743uwsdz1Cwlu8lNuFkFWpv873gDlSuwPG5qVv6R6tA0p9KweMhVIxB1SWUTtip9rD3o/IoFN277lMjBNbhbc11X/dc921fLotHZznPo08tDm5geAkGLmBrG5pEu3LyHRS8ZyXU0R7+AAAAbGVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgAAwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAGAAAAABAAAAYAAAAAEAAqACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAAAn+t5WAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAFj0lEQVRoBdVabWgcRRh+5+72dsx99NQYYxU1rUiwVkGR+oWIYiuoIFKKIv7wIxC1IFgUQQUREQtW2j+Conj9UQWlon+EIin9cQELLbbE2CBWKFJNYw2b3F5yu5u79ZlNLju53N7t3m7u4sBkZ+fjned555mPnQujdRRynCcomdgESI8Ro8eJ2HVE9jTZdJKq9kFi7LRW1GdkyEx+6WY6l01dA8BDAPk8cFzdAEsZRL5D3K8Vi8dr5euCQC6b6YPH8wD1EGKiBq7B00beJFWrz2jF0ogo7zoBBzzRV0DyQAPAXll/U5WeIMs6Hveq0Yn8XDZ9PSTzOcALzwcJabTppzg7EgvSKsq6uVRKhQBehM0H27ArlLODbLatayPAe9Tb4f0PASTdBgHRBNjZZV0hkCNSiauHAGKwTfCLzRhd2h0JZdM7geDuUOAXG/d2fBXKZVKcYrFR9H9beAL2aOdHgLF7Afza8OBhwaYfmm0abfeRy6R3UIztgQHsqPYRqtA+TdfPOwYZDeCZatu42/AvJL+NdBJjcjKeTb8A8F/D+GbEK5B1F94HeTJ5tGyaOjfMceLJK5F/C8rbdWAF3j+IzexwpAR4T08vxWOfLALHXzcMYMns5wmloFlWESRGSE0qyBPzIOlW8506hZF9DQe7qWgJqGofvD0EGBiMFUHMta0o2wISPzokGPsJZJMgsQ1lQUZiiiqVJ3EWGhc9REtAURIA+RTsQiKrgljxbkD5VVxJFrS5+RmMxCjk1OdTThV4fYwWKo9qpfmxmvVICZQta46ryjS8ej866Kl1Ij0FiS0gsTGgnExo/gvEN0ifO1OWDEZKQNjlhnUGHyW/Eottx2sjEkHlNEGV6nMYpU+h+fMyeNFf5ATQgc1N63dSlQsYCbHmNyLRTE5b0UZH/BMe/4BMaxhyG8cKZiFvVRCGIgnODrt4tpnABCtjFicom3oaIyEObL0enSwg/0taqO7RSqWLaKPShvSzyJskwzymlU3No91ydmQjwLk6hCOCWEKLZcM8gZGoQk5jQeXktDXMifJCpV4ty6DlRGgCwvMOeMY+huEMZPMIV5NTPKn8opmWFUBOG7mqjoHAtAywVToUAUc2jA0D9PvoCB8oS4Gx+5AqgsQph4RhjWNOTLaYE7fiK2s7VrFC2bAu1Ey1eoYisOR5AT5T15EKsPcg72IAOQkTvWh3Odp8U2fP87UtAnWycT2/shtBIqichIU4NrjPMAGwcbUOgQng/uYSANuN+B7Me4F3ew4up581w8y7BpqnAhPgKj8A8K/AbL1svHoKJqeq/TLW/LNexurzfRPA/U0Gq8R+TLSXYCToCdJLTufgjM2wZyCexcb1Knbb7+tBNnv3tZEJ8DDyLsAP48mbGWxR9g/Z9i5tVj9Wq+dsXul0P/L/xWYmduBAwe8xdi/Aix0yDHgcMugwzjQnZYTYag3S9XNyXpB00xFY8rwALy6gwgRxMZvXZoth7azC4PlRL8lGeD5MEODFEeP1MEa82jaTUFSyyaPzt+H9oheIMPmrJPR/kI1MeIWEcFssrjveXJqwcr2g6TWVjQxmBQFo9WGA340KYVebPGysmWxkAssScn6fUhO/YZkbkCsETK/ZauOFwx0BJXZnBODXbLVpTYDFbvaq5Csf6zzqdUQ2Mh55GRXfp+2EjstGBulKqGIX5AKf6Y6tNl54XAKlEiYwTXlVbJjfJdnIWFwJpVIKCvxee3dVNo0JxNkunwR07BcHUHevbKhbaWcE8JmIGwH2VksQNh3Fr+TvUIxOaLOl+Zb1O1AhgQ/0Tbg9+wh93Yg4gX+q2AcPH8IHRhW78h24iL0JB/kZqrLC8q8sHQDmu4vchswIou08M6lB3w3XScUEvI0N2JHGEO40/1gnuHzD+A8PDfFUQp8rGAAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NavigatorIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABfGlDQ1BJQ0MgUHJvZmlsZQAAKJF9kDlLA0EUx3+JR8QDCwUtLBavKopGEG2EJEgMpAhRwavZrDmEJC6bFRUbC8FWUBBtvAr9BNpYCNaCICiC2PkFFG1E1jdGiQf44M37zZs3f2b+4Pbqppkp7YJszrZioYA2Nj6heR4oo4Fy2nHpRt70R6MRJL7qz3i5xqXqVYfS+nv+b1RNJ/IGuCqEBwzTsoWHhFvmbVOx0qu35FHCy4pTBd5QHC/w0cfMSCwofCqsGWl9WvhO2GukrSy4lX5r/NtM6htnM3PG53vUT6oTudFhqc2STeSJESKARphBgvTSTb+svXTgo1N22IkFW10OzpqL1kwqbWt+cSKhhXNGp1fzdflkRvn6269ib3YX+p6hZK3Yi2/CySo03hZ7rTtQuwLH56Zu6R+tEkl3MgmPh1AzDnWXUDmZT/b4Cj+qDkDZveM8tYFnHd7WHOd1z3He9uWyeHSWK3j0qcXBDYwsQeQCtrahXbRrp94B6fJnEOjpULwAAABsZVhJZk1NACoAAAAIAAQBGgAFAAAAAQAAAD4BGwAFAAAAAQAAAEYBKAADAAAAAQACAACHaQAEAAAAAQAAAE4AAAAAAAAAYAAAAAEAAABgAAAAAQACoAIABAAAAAEAAAAQoAMABAAAAAEAAAAQAAAAAMiYw6gAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAFkSURBVDgRlZIxSwNBEIVnLyKE5OKKiCCWgiAIdloFJFiJhdb+kGsUu2hh4d+wsFGxEmw0WAnaWQSxjCKnl0MIeOu3xMhtLtFz4B0zO/PezM6eyD9Mj/k1cAdewaH2S6OFvHwIq9SegWlQBEui1ITC+dN0uVSUgvdA4Uxf8cdI34ET0nVRjHmk0/oAsq1teg4jFeiKXyW8hXwlJmng36TS1k1AMFRAlHmi4BnMi/KOEdnC74m0mGwjfItOh+5AV8rLIiaGfAFxEtwjsklclcQchVG7zZkMnIC7B4zeoHgNUo06O8kC8TmiJz3yQAHI2yTqNonV+0RmRZTzEs4VWBwECbrc1NfICp2blhy+R9epjPw84y/kfUiX3yS72Kwx9i4wGVT8vWy1e6K0Xx4XT9klub+1Eds5ex2Xb1/BfHLm7EJykq2WR/eplEAHfydPZ0u2xhLVAX/VHF1fmKYTRnHcTeX7fgGX7XCKeEX2kgAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant


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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bgColor"
			Visible=true
			Group="teccCSS"
			InitialValue="&c000000"
			Type="color"
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
