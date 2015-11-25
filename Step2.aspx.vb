
Partial Class Step2
    Inherits System.Web.UI.Page

    Sub services_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("header") = "Part Allergens Project - Step2"
    End Sub

    Protected Sub btnCheckStep2_Click(sender As Object, e As EventArgs) Handles btnCheckStep2.Click

        '----------------------------------------------------
        'Check the Database.
        Dim CanWeAddThisToTheDatabase As Boolean = True

        Dim tmpSQL As String = "SELECT * "
        tmpSQL = tmpSQL + "FROM Part_Allergen "
        tmpSQL = tmpSQL + "WHERE Part_Number = '" + DDLAllergenPartNumber.SelectedValue + "' "
        tmpSQL = tmpSQL + " AND Allergen_Code = '" + DDLAllergen_Code.SelectedValue + "';"

        'create a New SqlConnection object with the appropriate connection string 
        Dim sqlConn As New Data.SqlClient.SqlConnection("server=newbury-sql;uid=test;pwd=test;database=testing;")
        ' open the connection 
        sqlConn.Open()

        Dim sqlComm As New Data.SqlClient.SqlCommand(tmpSQL, sqlConn)
        sqlComm.CommandTimeout = 0
        Dim r As Data.SqlClient.SqlDataReader = sqlComm.ExecuteReader()

        While r.Read()
            'set boolean to doesn't exist:
            CanWeAddThisToTheDatabase = False
        End While
        r.Close()
        sqlConn.Close()

        '-----------------------------------------------------
        'btnCheckStep2 checks to see if the coffee has milk and adds it if not.
        If CanWeAddThisToTheDatabase = True Then
            lblDoIExistStep2.Text = "Allergen doesn't exist. "
            'Keeps the btnAdd3 Button working.
            btnAddAllergen.Enabled = True
        Else
            lblDoIExistStep2.Text = "Allergen does exist. "
            'Stops the Add Button working.
            btnAddAllergen.Enabled = False
        End If
        '-----------------------------------------------------
    End Sub

    '===============================================================

    'if doesnt exist add it, check if in other raw materials first, then add to part allergens if dont already exist.

    Protected Sub btnAddAllergen_Click(sender As Object, e As EventArgs) Handles btnAddAllergen.Click
        ' Insert statement here!
        finishedPartAllergens("")
    End Sub

    Private Sub finishedPartAllergens(finishedPart As String)

        ''Add to the Database. 
        'Dim tmpSQL1 As String = "INSERT INTO Part_Details"
        'tmpSQL1 = tmpSQL1 + "(Part_Number,"
        'tmpSQL1 = tmpSQL1 + "Description,"
        'tmpSQL1 = tmpSQL1 + "Shelf_Life,"
        'tmpSQL1 = tmpSQL1 + "Units_Per_Case)"
        'tmpSQL1 = tmpSQL1 + "Values('" + txtBoxPartNumber.Text + "',"
        'tmpSQL1 = tmpSQL1 + "'" + txtBoxDescription.Text + "',"
        'tmpSQL1 = tmpSQL1 + "'" + txtBoxShelfLife.Text + "',"
        'tmpSQL1 = tmpSQL1 + "'" + txtBoxUnitsPerCase.Text + "');"



    End Sub
    '===============================================================

End Class
