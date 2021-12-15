' 						    Settings
'========================================================================
customOutDir = ""
' eg: "C:\Program Files (x86)\Steam\userdata\UserID\760\remote\GameID\screenshots"
' Replace UserID and GameID relevant to your needs. 
'
automateSteamRelaunch = False
' True or False
' Should the script try to gracefully and automatically tell Steam to exit 
' and relaunch so that it can pickup the screenshots we copied there via customOutDir?
'
steamExeDir = "C:\Program Files (x86)\Steam"
' Your steam installation. Typically "C:\Program Files (x86)\Steam"
'
'=========================================================================
' 						End of settings
'=========================================================================
'			Batch Rename for Steam Screenshots (VBS)
'						Author: Zafpyr
'=========================================================================
' 						  Usage info
'=========================================================================
' Manual Conversion of images to jpg is still required and should be done before running them through this. 
' Select and drop screenshot(s) onto the script that you want uploaded to steam. Copy renamed screenshots from 
' "Batch renamed" on the desktop to folder where they need to go 
' (eg: "C:\Program Files (x86)\Steam\userdata\UserID\760\remote\GameID\screenshots") 
' The script can do this for you, but requires telling it where first (Line 3 in the script). 
' Now relaunch Steam so that it will rescan it's screenshot folders, this can be automated too, 
' just set line 7 to True if it doesn't work you may have to tell the script where your 
' steam installation is located (Line 12).
'=========================================================================




' Declare API Objects.
Dim f
Set fso = CreateObject("Scripting.FileSystemObject")
Set ShellApp = CreateObject("Shell.Application")
Set WshShell = CreateObject("WScript.Shell")

Set args = WScript.Arguments

If (args.Count = 0) Then'--- Checks if user supplied screenshots where supplied.
 MsgBox "Manual Conversion of images to jpg is still required and should be done before running them through this. Select and drop screenshot(s) onto the script that you want uploaded to steam. Copy renamed screenshots from ""Batch renamed"" to folder where they need to go (eg: ""C:\Program Files (x86)\Steam\userdata\UserID\760\remote\GameID\screenshots"") The script can do this for you, but requires telling it where first (Line 3 in the script). Now relaunch Steam so that it will rescan it's screenshot folders, this can be automated too, just set line 7 to ""True"" if it doesn't work you may have to tell the script where your steam installation is located (Line 12)."
 DropIt
End If

If Not customOutDir = "" Then
	outDir = customOutDir
Else'--- Checks if customOutDir is set, if not then uses the default.
	outDir = fso.BuildPath(WshShell.SpecialFolders("Desktop"), "Batch renamed")
	If Not fso.FolderExists(outDir) Then
		fso.CreateFolder(outDir)
	End If
End If


Function getDateCreated(filespec)'--- Gets date & time created info from file properties.
	Dim sFol
	Set f = fso.GetFile(filespec)
	fileName = fso.GetFileName(filespec)
	s = Second(f.DateCreated)
	Set sFol = ShellApp.NameSpace(fso.GetParentFolderName(filespec))
	Set FIs = sFol.Items

	items = FIs.Item
	For Each item In FIs
		If item.Name = fileName Then
			DateCreated = sFol.GetDetailsOf(item, 4)
			getDateCreated = DateAdd("s", s, DateCreated)
		Exit For
		End If
	Next
End Function


Function steamSCDateTimeFormat(myDateTime)

    s = Right("00" & Second(myDateTime), 2)
    j = Right("00" & Minute(myDateTime), 2)
    h = Right("00" & Hour(myDateTime), 2)
    d = Right("00" & Day(myDateTime), 2)
    m = Right("00" & Month(myDateTime), 2)
    y = Year(myDateTime)

    steamSCDateTimeFormat = y & m & d & h & j & s
End Function


Function getNewFileName(dateTime, i)
	ext = fso.GetExtensionName(f)
	nonIncrementedNewFileName = dateTime & "_" & i & "." & ext
	If(fso.FileExists(fso.BuildPath(outDir, nonIncrementedNewFileName))) Then
		i = i + 1
		getNewFileName = getNewFileName(dateTime, i)
	Else
		getNewFileName = nonIncrementedNewFileName
	End If
End Function


Function steamRunning()'--- Checks if steam is running.
	sComputerName = "."
	Set objWMIService = GetObject("winmgmts:\\" & sComputerName & "\root\cimv2")
	sQuery = "SELECT * FROM Win32_Process WHERE Name LIKE '%steam.exe%'"
	Set objItems = objWMIService.ExecQuery(sQuery)
	If objItems.Count = 1 Then
		steamRunning = True
	Else
		steamRunning = False
	End If
End Function


Function exitSteam()
	If steamRunning() Then
		ShellApp.ShellExecute "steam://ExitSteam", vShow=1
		For i=1 To 15
			WScript.Sleep(500)
			If steamRunning() And i = 15 Then
				ShellApp.ShellExecute steamExeDir&"\steam.exe", "-shutdown"
			ElseIf steamRunning() Then
				
			Else
				exitSteam = True
				Exit For
			End If
		Next
		exitSteam = True
	Else 
		exitSteam = False
	End If
End Function


Function waitForSteamToExit()
	waitForSteamToExit = False
	waitMultiplier = 35
	For i=1 To waitMultiplier
		WScript.Sleep(100)
		If steamRunning() And i = waitMultiplier Then
			Exit For
		ElseIf steamRunning() Then
			
		Else
			waitForSteamToExit = True
			Exit For
		End If
	Next
	MsgBox i
End Function


Function restartSteam()
	exitSteam()
	If waitForSteamToExit Then '--- Did steam exit?
		ShellApp.ShellExecute "steam://open/screenshots", vShow=1'---- Restart steam and open screenshots UI.
	Else
		MsgBox "Timed out while waiting for steam to exit."
	End If
End Function


Function copy(sd, dd, file)'------- Construct RoboCopy command
	Dim copyArgs, copyArgsStr
	copyArgs = Array(""""&sd&"""", """"&dd&"""", """"&file&"""")
	copyArgsStr = Join(copyArgs, " ")
	WshShell.Run "RoboCopy.exe " & copyArgsStr, 0, 1 
End Function


For Each arg in args
	intFileDateTime = steamSCDateTimeFormat(getDateCreated(arg))'---- Get DateCreated in steam screenshot Date Time Format.
	newFileName = getNewFileName(intFileDateTime, 1)'---------------- Increment trailing number if file already exists.
	copy fso.GetParentFolderName(arg), outDir, fso.GetFileName(arg)'- Copy screenshot file.
	fso.MoveFile fso.BuildPath(outDir, fso.GetFileName(arg)), fso.BuildPath(outDir, newFileName)'--- Rename file to steam's screenshot naming scheme.
Next

If automateSteamRelaunch Then
	restartSteam'---- Restart steam if configured.
End If