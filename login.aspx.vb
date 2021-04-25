Partial Public Class _login
    Inherits System.Web.UI.Page
   
    'Protected Sub Userlogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Userlogin.Click
    '   GV_LoadUser.Visible = True
    '    GV_LoadUser.DataBind()
    '    If GV_LoadUser.Rows.Count = 1 Then

    '        Dim UserID, UserPassword As String
    '        UserID = GV_LoadUser.Rows(0).Cells(1).Text.ToString
    '        UserPassword = GV_LoadUser.Rows(0).Cells(2).Text.ToString

    '        Dim aa As String = GV_LoadUser.Rows(0).Cells(16).Text.ToString

    '        If UserID = txtUserName.Text And UserPassword = txtPassword.Text Then
    '            If Trim(GV_LoadUser.Rows(0).Cells(16).Text.ToString) = "True" Then

    '                Dim myScript1 As String
    '                myScript1 = "alert('انت داخل مسبقاً الى النظام');"
    '                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript1", myScript1, True)
    '                GV_LoadUser.Visible = False
    '                Exit Sub
    '            Else
    '                Session.Contents("sesUserID") = GV_LoadUser.Rows(0).Cells(0).Text.ToString
    '                Session.Contents("sesUserName") = GV_LoadUser.Rows(0).Cells(1).Text.ToString
    '                Session.Contents("sesFullName") = GV_LoadUser.Rows(0).Cells(3).Text.ToString
    '                Session.Contents("sesDataEntryGroup") = GV_LoadUser.Rows(0).Cells(4).Text.ToString
    '                Session.Contents("loginStatus") = "Login"

    '                Session.Contents("sesIsIntake") = GV_LoadUser.Rows(0).Cells(5).Text.ToString
    '                Session.Contents("sesIsEntry") = GV_LoadUser.Rows(0).Cells(6).Text.ToString
    '                Session.Contents("sesIsSuperviser") = GV_LoadUser.Rows(0).Cells(7).Text.ToString
    '                Session.Contents("sesIsScanner") = GV_LoadUser.Rows(0).Cells(8).Text.ToString
    '                Session.Contents("sesIsArchiver") = GV_LoadUser.Rows(0).Cells(9).Text.ToString
    '                Session.Contents("sesIsAuditor") = GV_LoadUser.Rows(0).Cells(10).Text.ToString
    '                Session.Contents("sesIsManager") = GV_LoadUser.Rows(0).Cells(11).Text.ToString
    '                Session.Contents("sesIsController") = GV_LoadUser.Rows(0).Cells(12).Text.ToString
    '                Session.Contents("sesIsCorrector") = GV_LoadUser.Rows(0).Cells(13).Text.ToString
    '                Session.Contents("sesIsAuditReEntry") = GV_LoadUser.Rows(0).Cells(14).Text.ToString
    '                Session.Contents("sesIsAuditManager") = GV_LoadUser.Rows(0).Cells(15).Text.ToString
    '                Session.Contents("sesIsLocked") = GV_LoadUser.Rows(0).Cells(16).Text.ToString
    '                Session.Contents("sesAuditBarcode") = GV_LoadUser.Rows(0).Cells(17).Text.ToString
    '                Session.Contents("sesIsBarcodeEntry") = GV_LoadUser.Rows(0).Cells(18).Text.ToString



    '                SDS_LoadUser.Update()



    '                PageStatus.Text = "مرحبــا '" & Session.Contents("sesUserName") & "'  تــم دخولك بنجاح الى النظـــام."
    '                txtUserName.Text = ""
    '                GV_LoadUser.Visible = False

    '                Userlogin.Visible = False
    '                txtUserName.Visible = False
    '                txtPassword.Visible = False
    '                LB_PS_No.Visible = False
    '                lbl_PC_NameAndNo.Visible = False
    '                Exit Sub
    '            End If
    '        End If
    '    End If
    '    GV_LoadUser.Visible = False
    '    Dim myScript As String
    '    myScript = "alert('اسم مستخدم وكلمة سر غير صحيحة، الرجاء التأكد من صحتها.وحاول مرة اخرى');"
    '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
    'End Sub

    'Private Sub Userlogin_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Userlogin.Load
    '    If Session.Contents("sesUsername") = Nothing Then
    '        btnSignIn.Visible = True
    '        txtUserName.Visible = True
    '        txtPassword.Visible = True
    '        LB_PS_No.Visible = True
    '        lbl_PC_NameAndNo.Visible = True
    '        txtUserName.Focus()
    '    Else
    '        btnSignIn.Visible = False
    '        txtUserName.Visible = False
    '        txtPassword.Visible = False
    '        LB_PS_No.Visible = False
    '        lbl_PC_NameAndNo.Visible = False
    '    End If
    'End Sub

    Private Sub btnSignIn_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignIn.Load
        If Session.Contents("sesUsername") = Nothing Then
            btnSignIn.Visible = True
            txtUserName.Visible = True
            txtPassword.Visible = True
            LB_PS_No.Visible = True
            lbl_PC_NameAndNo.Visible = True
            txtUserName.Focus()
        Else
            btnSignIn.Visible = False
            txtUserName.Visible = False
            txtPassword.Visible = False
            LB_PS_No.Visible = False
            lbl_PC_NameAndNo.Visible = False
        End If
    End Sub

    Private Sub btnSignIn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignIn.Click
        GV_LoadUser.Visible = True
        GV_LoadUser.DataBind()
        If GV_LoadUser.Rows.Count = 1 Then

            Dim UserID, UserPassword As String
            UserID = GV_LoadUser.Rows(0).Cells(1).Text.ToString
            UserPassword = GV_LoadUser.Rows(0).Cells(2).Text.ToString

            Dim aa As String = GV_LoadUser.Rows(0).Cells(16).Text.ToString

            If UserID = txtUserName.Text And UserPassword = txtPassword.Text Then
                If Trim(GV_LoadUser.Rows(0).Cells(16).Text.ToString) = "True" Then

                    Dim myScript1 As String
                    myScript1 = "alert('انت داخل مسبقاً الى النظام');"
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript1", myScript1, True)
                    GV_LoadUser.Visible = False
                    Exit Sub
                Else
                    Session.Contents("sesUserID") = GV_LoadUser.Rows(0).Cells(0).Text.ToString
                    Session.Contents("sesUserName") = GV_LoadUser.Rows(0).Cells(1).Text.ToString
                    Session.Contents("sesFullName") = GV_LoadUser.Rows(0).Cells(3).Text.ToString
                    Session.Contents("sesDataEntryGroup") = GV_LoadUser.Rows(0).Cells(4).Text.ToString
                    Session.Contents("loginStatus") = "Login"

                    Session.Contents("sesIsIntake") = GV_LoadUser.Rows(0).Cells(5).Text.ToString
                    Session.Contents("sesIsEntry") = GV_LoadUser.Rows(0).Cells(6).Text.ToString
                    Session.Contents("sesIsSuperviser") = GV_LoadUser.Rows(0).Cells(7).Text.ToString
                    Session.Contents("sesIsScanner") = GV_LoadUser.Rows(0).Cells(8).Text.ToString
                    Session.Contents("sesIsArchiver") = GV_LoadUser.Rows(0).Cells(9).Text.ToString
                    Session.Contents("sesIsAuditor") = GV_LoadUser.Rows(0).Cells(10).Text.ToString
                    Session.Contents("sesIsManager") = GV_LoadUser.Rows(0).Cells(11).Text.ToString
                    Session.Contents("sesIsController") = GV_LoadUser.Rows(0).Cells(12).Text.ToString
                    Session.Contents("sesIsCorrector") = GV_LoadUser.Rows(0).Cells(13).Text.ToString
                    Session.Contents("sesIsAuditReEntry") = GV_LoadUser.Rows(0).Cells(14).Text.ToString
                    Session.Contents("sesIsAuditManager") = GV_LoadUser.Rows(0).Cells(15).Text.ToString
                    Session.Contents("sesIsLocked") = GV_LoadUser.Rows(0).Cells(16).Text.ToString
                    Session.Contents("sesAuditBarcode") = GV_LoadUser.Rows(0).Cells(17).Text.ToString
                    Session.Contents("sesIsBarcodeEntry") = GV_LoadUser.Rows(0).Cells(18).Text.ToString

                    SDS_LoadUser.Update()

                    PageStatus.Text = "مرحبــا '" & Session.Contents("sesUserName") & "'  تــم دخولك بنجاح الى النظـــام."
                    txtUserName.Text = ""
                    GV_LoadUser.Visible = False

                    btnSignIn.Visible = False
                    txtUserName.Visible = False
                    txtPassword.Visible = False
                    LB_PS_No.Visible = False
                    lbl_PC_NameAndNo.Visible = False
                    lblPassword.Visible = False
                    lblusername.Visible = False

                    Exit Sub
                End If
            End If
        End If
        GV_LoadUser.Visible = False
        Dim myScript As String
        myScript = "alert('اسم مستخدم وكلمة سر غير صحيحة، الرجاء التأكد من صحتها.وحاول مرة اخرى');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
    End Sub

   
End Class