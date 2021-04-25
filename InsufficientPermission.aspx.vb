Partial Public Class _InsufficientPermission
    Inherits System.Web.UI.Page
    Dim MyConnection As New System.Data.SqlClient.SqlConnection
    Dim MyCommand As New System.Data.SqlClient.SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString").ConnectionString
        MyCommand.Connection = Me.MyConnection
        Dim myQuery As String
        Dim RowsEffected As Integer

        myQuery = "Update Users Set IsLocked = 0 Where UserName = '" & Session.Contents("sesUserName") & "'"
        MyCommand.CommandText = myQuery
        MyConnection.Open()
        RowsEffected = MyCommand.ExecuteNonQuery()
        MyConnection.Close()
        Session.RemoveAll()
        PageStatus.Text = "تم الخروج من النظام"
    End Sub
End Class