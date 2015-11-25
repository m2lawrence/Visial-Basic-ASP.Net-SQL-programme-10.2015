Partial Class [Default]
    Inherits System.Web.UI.Page

    Sub services_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("header") = "Raw Materials"
    End Sub

    Protected Sub btnCheck_Click(sender As Object, e As EventArgs) Handles btnCheck.Click

        Dim numbers As String

        numbers = "RM" + txtBoxNumbers.Text + DDLLK.SelectedValue

        '-- Alert the user to enter in numbers.
        If txtBoxNumbers.Text = "" Then
            lblErrorMes.Text = "No item is selected."
            Exit Sub
        Else
            lblErrorMes.Text = ""
        End If

        '---------------------------------------------
        If IsNumeric(txtBoxNumbers.Text) Then
            txtBoxResult.Text = numbers
        Else
            lblErrorMes.Text = "Enter numbers only."
            txtBoxResult.Text = "" 'making Results box blank.
            Exit Sub
        End If

        If txtBoxNumbers.Text.Length > 6 Then
            'Greater than 6 numbers
            lblErrorMes.Text = "Greater than 6 numbers"
            txtBoxResult.Text = "" 'making Results box blank.
            Exit Sub
        ElseIf txtBoxNumbers.Text.Length < 6 Then
            'Less than 6 numbers
            lblErrorMes.Text = "Less than 6 numbers"
            txtBoxResult.Text = "" 'making Results box blank.
            Exit Sub
        End If
        '----------------------------------------------------
        'Check the Database.
        Dim CanWeAddThisToTheDatabase As Boolean = True
        Dim tmpSQL As String = "SELECT Part_Number FROM Part_Details WHERE Part_Number = '" + txtBoxResult.Text + "' "
        ' create a new SqlConnection object with the appropriate connection string 
        Dim sqlConn As New Data.SqlClient.SqlConnection("server=newbury-sql;uid=test;pwd=test;database=testing;")
        ' open the connection 
        sqlConn.Open()

        Dim sqlComm As New Data.SqlClient.SqlCommand(tmpSQL, sqlConn)
        'sqlComm.CommandTimeout = 0
        Dim r As Data.SqlClient.SqlDataReader = sqlComm.ExecuteReader()

        While r.Read()
            CanWeAddThisToTheDatabase = False
        End While

        r.Close()

        sqlConn.Close()

        '-----------------------------------------------------
        'btnOK3 is used to add the new code to the txtBoxPartNumber SQL btnAddToDB  
        If CanWeAddThisToTheDatabase = True Then
            lblDoIExist.Text = "Yes, we can add this Part Number. "
            'Keeps the OK1 Button working.
            btnOK1.Enabled = True
        Else
            lblDoIExist.Text = "No, this Part Number already exists in the table so please try again."
            'Stops the Add Button working.
            btnOK1.Enabled = False
        End If
        '-----------------------------------------------------

    End Sub

    Protected Sub btnAddToDB_Click(sender As Object, e As EventArgs) Handles btnAddToDB.Click

        '=====================================================
        ' txtBoxResult is read only. 
        '=====================================================

        '=====================================================
        'Test for blank.
        If txtBoxPartNumber.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Part Number."
            'stop Add function. 
            Exit Sub
        End If
        '=====================================================

        'Test for blank.
        If txtBoxDescription.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Description."
            'stop Add function. 
            Exit Sub
        End If

        'Test for blank.
        If txtBoxShelfLife.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Shelf Life."
            'stop Add function. 
            Exit Sub
        ElseIf IsNumeric(txtBoxShelfLife.Text) Then
            'programme keeps going if numbers used.
        Else lblDoIExist.Text = "Enter numbers only."
            'stop Add function. 
            Exit Sub
        End If

        '---------------------------------------
        ' txtBoxUnitsPerCase NOT mandatory here.
        If IsNumeric(txtBoxUnitsPerCase.Text) Then
            'programme keeps going if numbers used.
        Else lblDoIExist.Text = "Enter numbers only."
            'stop Add function. 
            Exit Sub
        End If
        '---------------------------------------


        '--------------------------------------------------------- 
        'Check the Database.
        Dim CanWeAddThisToTheDatabase As Boolean = True

        'Add to the Database. 
        Dim tmpSQL1 As String = "INSERT INTO Part_Details"
        tmpSQL1 = tmpSQL1 + "(Part_Number,"
        tmpSQL1 = tmpSQL1 + "Description,"
        tmpSQL1 = tmpSQL1 + "Shelf_Life,"
        tmpSQL1 = tmpSQL1 + "Units_Per_Case)"
        tmpSQL1 = tmpSQL1 + "Values('" + txtBoxPartNumber.Text + "',"
        tmpSQL1 = tmpSQL1 + "'" + txtBoxDescription.Text + "',"
        tmpSQL1 = tmpSQL1 + "'" + txtBoxShelfLife.Text + "',"
        tmpSQL1 = tmpSQL1 + "'" + txtBoxUnitsPerCase.Text + "');"

        ' create a new SqlConnection object with the appropriate connection string 

        Dim sqlConn As New Data.SqlClient.SqlConnection("server=newbury-sql;uid=test;pwd=test;database=testing;")
        ' open the connection 
        sqlConn.Open()

        Dim sqlComm As New Data.SqlClient.SqlCommand(tmpSQL1, sqlConn)
        'sqlComm.CommandTimeout = 0
        Dim r As Data.SqlClient.SqlDataReader = sqlComm.ExecuteReader()

        While r.Read()
            CanWeAddThisToTheDatabase = False
        End While

        r.Close()

        sqlConn.Close()

        lblDoIExist.Text = "Added Part Number. "

        'refresh the page here:
        Response.Redirect("Default.aspx")
        Exit Sub

    End Sub

    '==============================================================================================
    Protected Sub btnOK1_Click(sender As Object, e As EventArgs) Handles btnOK1.Click
        'moves the Part Number to the read only box below, by moving the Result to the txtBoxPartNumber.
        txtBoxPartNumber.Text = txtBoxResult.Text
    End Sub

    Protected Sub btnClear1_Click(sender As Object, e As EventArgs) Handles btnClear1.Click

        'Blank all to clear all.
        ' not: txtBoxNumbers.Text = ""
        txtBoxResult.Text = ""
        txtBoxPartNumber.Text = ""
        txtBoxDescription.Text = ""
        txtBoxShelfLife.Text = ""
        txtBoxUnitsPerCase.Text = ""

    End Sub
End Class
