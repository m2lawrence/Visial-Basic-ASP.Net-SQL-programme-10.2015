
Partial Class Default2
    Inherits System.Web.UI.Page

    Sub services_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("header") = "Finished Products"
    End Sub

    Protected Sub btnCheck_Click(sender As Object, e As EventArgs) Handles btnCheck2.Click

        Dim numbers2 As String

        numbers2 = txtBoxNumbers2.Text + DDLFinPrtNos.SelectedValue

        '-- Alert the user to enter in numbers.
        If txtBoxNumbers2.Text = "" Then
            lblErrorMes.Text = "No item is selected."
            Exit Sub
        Else
            lblErrorMes.Text = ""
        End If

        '---------------------------------------------
        If IsNumeric(txtBoxNumbers2.Text) Then
            txtBoxResult2.Text = numbers2
        Else
            lblErrorMes.Text = "Enter numbers only."
            txtBoxResult2.Text = "" 'making Results box blank.
            Exit Sub
        End If

        If txtBoxNumbers2.Text.Length > 8 Then
            'Greater than 8 numbers
            lblErrorMes.Text = "Greater than 8 numbers"
            txtBoxResult2.Text = "" 'making Results box blank.
            Exit Sub
        ElseIf txtBoxNumbers2.Text.Length < 8 Then
            'Less than 8 numbers
            lblErrorMes.Text = "Less than 8 numbers"
            txtBoxResult2.Text = "" 'making Results box blank.
            Exit Sub
        End If

        '----------------------------------------------------
        'Check the Database.
        Dim CanWeAddThisToTheDatabase As Boolean = True
        Dim tmpSQL As String = "SELECT Part_Number FROM Part_Details WHERE Part_Number = '" + txtBoxResult2.Text + "' "
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
        'btnOK2 is used to add the new code to the txtBoxPartNumber2 SQL btnAddToDB  
        If CanWeAddThisToTheDatabase = True Then
            lblDoIExist.Text = "Yes, we can add this Part Number. "
            'Keeps the OK2 Button working.
            btnOK2.Enabled = True
        Else
            lblDoIExist.Text = "No, this Part Number already exists in the table so please try again."
            'Stops the OK2 Button working.
            btnOK2.Enabled = False
        End If
        '----------
    End Sub

    Protected Sub btnAdd2_Click(sender As Object, e As EventArgs) Handles btnAdd2.Click

        '=====================================================
        ' txtBoxResult2 is read only. 
        '=====================================================

        'Test for blank.
        If txtBoxPartNumber2.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Part Number."
            'stop Add function. 
            Exit Sub
        End If
        '=====================================================

        'Test for blank.
        If txtBoxPartNumber2.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Part Number."
            'stop Add function. 
            Exit Sub
        End If
        '=====================================================

        'Test for blank.
        If txtBoxDescription2.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Description."
            'stop Add function. 
            Exit Sub
        End If

        '------------------------------------------
        'Test for blank.
        If txtBoxShelfLife2.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Shelf Life."
            'stop Add function. 
            Exit Sub
        ElseIf IsNumeric(txtBoxShelfLife2.Text) Then
            'programme keeps going if numbers used.
        Else lblDoIExist.Text = "Enter numbers only."
            'stop Add function. 
            Exit Sub
        End If

        '------------------------------------------
        'Test for blank.
        If txtBoxUnitsPerCase2.Text = "" Then
            'alert the user to enter field.
            lblDoIExist.Text = "You must enter: Units Per Case."
            'stop Add function. 
            Exit Sub
        ElseIf IsNumeric(txtBoxUnitsPerCase2.Text) Then
            'programme keeps going if numbers used.
        Else lblDoIExist.Text = "Enter numbers only."
            'stop Add function. 
            Exit Sub
        End If
        '---------------------------------------------


        'Check the Database.
        Dim CanWeAddThisToTheDatabase As Boolean = True

        'Add to the Database. 
        Dim tmpSQL1 As String = "INSERT INTO Part_Details"
        tmpSQL1 = tmpSQL1 + "(Part_Number,"
        tmpSQL1 = tmpSQL1 + "Description,"
        tmpSQL1 = tmpSQL1 + "Shelf_Life,"
        tmpSQL1 = tmpSQL1 + "Units_Per_Case)"
        tmpSQL1 = tmpSQL1 + "Values('" + txtBoxResult2.Text + "',"
        tmpSQL1 = tmpSQL1 + "'" + txtBoxDescription2.Text + "',"
        tmpSQL1 = tmpSQL1 + "'" + txtBoxShelfLife2.Text + "',"
        tmpSQL1 = tmpSQL1 + "'" + txtBoxUnitsPerCase2.Text + "');"

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
        Response.Redirect("Default2.aspx")
        Exit Sub

    End Sub

    '==============================================================================================
    Protected Sub btnOK2_Click(sender As Object, e As EventArgs) Handles btnOK2.Click
        'moves the results Number to the Part Number text box.
        txtBoxPartNumber2.Text = txtBoxResult2.Text
    End Sub

    Protected Sub btnClear2_Click(sender As Object, e As EventArgs) Handles btnClear2.Click

        'Blank all to clear all.
        ' not: txtBoxNumbers2.Text = ""
        txtBoxResult2.Text = ""
        txtBoxPartNumber2.Text = ""
        txtBoxDescription2.Text = ""
        txtBoxShelfLife2.Text = ""
        txtBoxUnitsPerCase2.Text = ""

    End Sub
End Class
