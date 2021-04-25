Partial Public Class _changePass
    Inherits System.Web.UI.Page
    Dim MyConnection As New System.Data.SqlClient.SqlConnection
    Dim MyCommand, UpdateCommend As New System.Data.SqlClient.SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load 
        If Session.Contents("sesUserName") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        PageStatus.Text = String.Empty
    End Sub

    Protected Sub Userlogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Userlogin.Click
        'Setting up the command and connection object
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString").ConnectionString
        MyCommand.Connection = Me.MyConnection
        UpdateCommend.Connection = Me.MyConnection

        Dim myQuery, UpdateQuery As String
        myQuery = "SELECT UserName, Password FROM Users"
        MyCommand.CommandText = myQuery
        Dim RetreivedData As System.Data.SqlClient.SqlDataReader
        MyConnection.Open()
        RetreivedData = MyCommand.ExecuteReader()
        PageStatus.Text = ""
        Dim RowsEffected As Integer
        Dim UserName, Password As String
        While RetreivedData.Read()
            UserName = Trim(RetreivedData.GetString(0))
            Password = Trim(RetreivedData.GetString(1))

            If UserName = Replace(txtUserName.Text.ToLower, " ", "") And Password = Replace(txtPassword.Text.ToLower, " ", "") Then
                RetreivedData.Close()
               
                UpdateQuery = "Update Users SET Password = '" & txtPasswordNew.Text & "' Where UserName = '" & UserName & "'"
                MyCommand.CommandText = UpdateQuery
                RowsEffected = MyCommand.ExecuteNonQuery()
                UpdateQuery = ""
                MyConnection.Close()

                LinkButton1.Visible = True
                PageStatus.Text = "تم التغيير بنجاح"
                txtUserName.Text = ""
                Exit Sub
            End If
        End While
        RetreivedData.Close()
        MyConnection.Close()
        PageStatus.Text = "لم يتم التغيير تأكد من كلمة السر القديمة"
    End Sub
End Class