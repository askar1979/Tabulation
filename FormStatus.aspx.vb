Imports System.Data.SqlClient
Imports System.Data
Partial Public Class _FormStatus
    Inherits System.Web.UI.Page
    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString2").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Session.Contents("sesUserName") <> Nothing Then
        '    Session.Contents("LoginStatus") = "Working"
        'Else
        '    Response.Redirect("login.aspx")
        'End If
    End Sub

    Protected Sub btn_CheckStatus_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btn_CheckStatus.Click
        GV_Tracking.Visible = True
        GV_Tracking.DataBind()

        Select Case GV_Tracking.Rows.Count
            Case 0
                ' Non Existinbg Barcode
                Dim myScript As String
                myScript = "alert('هذه الاستمارة اما غير مدخلة ادخال كامل او رقم الباركود خطأ.');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
            Case 1
                Select Case GV_Tracking.DataKeys(0).Values(1)
                    Case "9"
                        chk_Scan.Checked = True
                    Case "1"
                        chk_Scan.Checked = True
                        chk_FirstEntered.Checked = True
                    Case "2"
                        chk_Scan.Checked = True
                        chk_FirstEntered.Checked = True
                        chk_SecondEntered.Checked = True
                        ismached()

                    Case "3"
                        chk_Scan.Checked = True
                        chk_FirstEntered.Checked = True
                        chk_SecondEntered.Checked = True
                        chk_Modified.Checked = True
                    Case "4"
                        chk_Scan.Checked = True
                        chk_FirstEntered.Checked = True
                        chk_SecondEntered.Checked = True
                        ismached()
                        If chk_IsMatched.Checked = False Then
                            chk_Modified.Checked = True
                        Else
                            chk_Modified.Checked = False
                        End If
                        'If GV_Tracking.DataKeys(0).Values(2) <> Nothing Then
                        '    chk_RondomChecked.Checked = True
                        'End If
                    Case "5"
                        chk_Scan.Checked = True
                        chk_FirstEntered.Checked = True
                        chk_SecondEntered.Checked = True
                        ismached()
                        If chk_IsMatched.Checked = False Then
                            chk_Modified.Checked = True
                        Else
                            chk_Modified.Checked = False
                        End If
                        chk_Archive.Checked = True
                        If GV_Tracking.DataKeys(0).Values(2) <> Nothing Then
                            chk_RondomChecked.Checked = True
                        End If
                    Case "7"

                        Dim myScript As String
                        myScript = "alert('هذه الاستمارة مرفوضة.');"
                        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)


                End Select
            Case Is > 1
                'Then duplicate on tracking
                Dim myScript As String
                myScript = "alert('لايمكن خزن الاستمارة لانها مكررة قم باستدعاء المشرف.');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
        End Select
        GV_Tracking.Visible = False
        GV_Tracking.Dispose()
    End Sub

    Private Sub ismached()
        Dim compare As New SqlCommand("usp_Form222_Compare", conn)
        compare.CommandType = CommandType.StoredProcedure
        compare.Parameters.AddWithValue("@barcode", Convert.ToInt32(Trim(txtBarCode.Text)))
        conn.Open()
        Dim sqlar As String = compare.ExecuteScalar
        conn.Close()
        If sqlar = Nothing Then
            chk_IsMatched.Checked = True
        Else
            chk_IsMatched.Checked = False
        End If
    End Sub
End Class