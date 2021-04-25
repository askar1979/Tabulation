Public Partial Class AdvanseSearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCancel.Click
        Response.Redirect("AditBarcodSearch.aspx")
    End Sub

    Protected Sub btnNewSearch_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnNewSearch.Click
        txtPerId.Text = ""
        txtVrc.Text = ""
        txtFamNo.Text = ""
        txtFirstName.Text = ""
        txtFatherName.Text = ""
        txtGrandName.Text = ""
    End Sub
End Class