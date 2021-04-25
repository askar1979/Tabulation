Public Partial Class AuditBarcode
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Session.Contents("sesAuditBarcode") <> Nothing Then
        '    Session.Contents("LoginStatus") = "Working"
        'Else
        '    Response.Redirect("login.aspx")
        'End If
    End Sub
    Private Sub btnSearch1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch1.Click
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub
    Private Sub btnSearch2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch2.Click
        Dim path As String
        If txtBarcodeNo1.Text <> txtBarcodeNo2.Text Then

            lblMessage.Text = "رقم الباركود غير مطابق"
        Else
            GridView1.Visible = True
            If GridView1.Rows.Count = 1 Then
                path = GridView1.Rows(0).Cells(26).Text
                Image1.ImageUrl = path

            Else
                lblMessage.Text = "الاستمارة غير موجودة في النظام"
            End If

        End If
        GridView1.Visible = False
    End Sub
End Class