
Partial Class Default3
    Inherits System.Web.UI.Page

    Sub services_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("header") = "Part Allergens Project - Default3"
    End Sub

    Protected Sub btnCheck3_Click(sender As Object, e As EventArgs) Handles btnCheck3.Click

        '----------------------------------------------------
        'Check the Database.
        Dim CanWeAddThisToTheDatabase As Boolean = True

        Dim tmpSQL As String = "SELECT Part_Details.Part_Number, Part_Allergen.Part_Number "
        tmpSQL = tmpSQL + "FROM Part_Details INNER JOIN Part_Allergen "
        tmpSQL = tmpSQL + "On Part_Details.Part_Number = Part_Allergen.Part_Number "
        tmpSQL = tmpSQL + "WHERE Part_Details.Part_Number = '" + DDLRawMaterialID.SelectedValue + "' "
        tmpSQL = tmpSQL + " and Part_Allergen.Part_Number = '" + DDLFinishedParts.SelectedValue + "';"

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
        'btnOK1 is used to add the new code to the txtBoxPartNumber SQL btnAddToDB  
        If CanWeAddThisToTheDatabase = True Then
            lblDoIExist3.Text = "Raw Material doesn't exist. "
            'Keeps the OK1 Button working.
            btnCheck3.Enabled = True
        Else
            lblDoIExist3.Text = "Raw Material does exist. "
            'Stops the Add Button working.
            btnCheck3.Enabled = False
        End If
        '-----------------------------------------------------
    End Sub

    Protected Sub btnAdd3_Click(sender As Object, e As EventArgs) Handles btnAdd3.Click
        ' Insert statement here!
        finishedPartAllergens("")
    End Sub

    Private Sub finishedPartAllergens(finishedPart As String)

    End Sub

End Class
