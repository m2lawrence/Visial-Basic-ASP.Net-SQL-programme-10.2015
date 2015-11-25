Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    'Page H1 Title:
    Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load
        LblHeader.Text = Session("header")
    End Sub

End Class


