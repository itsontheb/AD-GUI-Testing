
Add-Type -AssemblyName System.Windows.Forms | Out-Null
Add-Type -AssemblyName System.Drawing | Out-Null

# Form Setup
$form1        = New-Object System.Windows.Forms.Form
$TabControl   = New-object System.Windows.Forms.TabControl
$ADQueryPage  = New-Object System.Windows.Forms.TabPage
$ADLookupPage = New-Object System.Windows.Forms.TabPage
    $ADLookup_userListRichTextBox   = New-Object System.Windows.Forms.RichTextBox
    $ADLookup_userListLabel         = New-Object System.Windows.Forms.Label
    $ADLookup_runButton             = New-Object System.Windows.Forms.Button
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

# Form Setup
$form1.Text = "My PowerShell Form"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 500
$System_Drawing_Size.Height = 425
$form1.ClientSize = $System_Drawing_Size

# Tab Control
$tabControl.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 10
$System_Drawing_Point.Y = 10
$tabControl.Location = $System_Drawing_Point
$tabControl.Name = "tabControl"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 475
$System_Drawing_Size.Height = 400
$tabControl.Size = $System_Drawing_Size
$form1.Controls.Add($tabControl)

# ADQuery Page
$ADQueryPage.DataBindings.DefaultDataSourceUpdateMode = 0
$ADQueryPage.UseVisualStyleBackColor = $True
$ADQueryPage.Name = "ADQuery"
$ADQueryPage.Text = "AD Query"
$TabControl.Controls.Add($ADQueryPage)

# ADLookup Page
$ADLookupPage.DataBindings.DefaultDataSourceUpdateMode = 0
$ADLookupPage.UseVisualStyleBackColor = $True
$ADLookupPage.Name = "ADLookup"
$ADLookupPage.Text = "AD Lookup"
$TabControl.Controls.Add($ADLookupPage)

# ADLookup Page - RichTextbox Label
$System_Drawing_Point       = New-Object System.Drawing.Point
$System_Drawing_Point.X     = 10
$System_Drawing_Point.Y     = 10
$ADLookup_userListLabel.Location = $System_Drawing_Point
$System_Drawing_Size        = New-Object System.Drawing.Size
$System_Drawing_Size.Width  = 200
$System_Drawing_Size.Height = 25
$ADLookup_userListLabel.Size = $System_Drawing_Size
$ADLookup_userListLabel.Text = "Provide list of usernames:"
$ADLookupPage.Controls.Add($ADLookup_userListLabel)

# ADLookup Page - RichTextbox
$System_Drawing_Point       = New-Object System.Drawing.Point
$System_Drawing_Point.X     = 10
$System_Drawing_Point.Y     = 35
$ADLookup_userListRichTextBox.Location = $System_Drawing_Point
$System_Drawing_Size        = New-Object System.Drawing.Size
$System_Drawing_Size.Width  = 200
$System_Drawing_Size.Height = 325
$ADLookup_userListRichTextBox.Size = $System_Drawing_Size
$ADLookup_userListRichTextBox.Multiline = $True
$ADLookup_userListRichTextBox.Text = "Waiting for Info"
$ADLookup_userListRichTextBox.ForeColor = "LightGray"
$ADLookup_userListRichTextBox.ScrollBars = "Vertical"
$ADLookup_userListRichTextBox.Add_Click({
    $ADLookup_userListRichTextBox.Text = ''
})
$ADLookupPage.Controls.Add($ADLookup_userListRichTextBox)

# ADLookup Page - Run Button
$System_Drawing_Point        = New-Object System.Drawing.Point
$System_Drawing_Point.X      = 375
$System_Drawing_Point.Y      = 325
$ADLookup_runButton.Location = $System_Drawing_Point
$System_Drawing_Size         = New-Object System.Drawing.Size
$System_Drawing_Size.Width   = 75
$System_Drawing_Size.Height  = 35
$ADLookup_runButton.Size     = $System_Drawing_Size
$ADLookup_runButton.Text     = '&Run'
$ADLookupPage.Controls.Add($ADLookup_runButton)


#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null