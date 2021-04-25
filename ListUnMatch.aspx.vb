Imports System.Data.SqlClient
Imports System.Data
Partial Public Class ListUnMatch
    Inherits System.Web.UI.Page
    Dim ReturnDate As System.DateTime
    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString2").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Contents("sesIsEntry") = "True" And Session.Contents("sesDataEntryGroup") = "C" Then
            Session.Contents("LoginStatus") = "Working"
        Else
            If Session.Contents("sesUserID") = Nothing Then
                Response.Redirect("login.aspx")
            Else
                Response.Redirect("InsufficientPermission.aspx")
            End If
        End If
    End Sub
    Protected Sub btnSearchAll_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSearchAll.Click
        txtBarcode.Text = ""
        SqlDataSource1.DataBind()
        GridView1.DataBind()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSearch.Click

        GridView1.DataBind()
        Session.Contents("sessBarcode") = txtBarcode.Text

    End Sub
    Private Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim index As Integer = GridView1.SelectedIndex
        Dim row As GridViewRow = GridView1.Rows(index)
        Session.Contents("sessBarcode") = row.Cells(0).Text
        Dim aa As String = row.Cells(0).Text

        Session.Contents("sessTrackingid") = GridView1.DataKeys(index).Value
        Dim bb As String = GridView1.DataKeys(index).Value

        Response.Redirect("Correction.aspx")

    End Sub
End Class