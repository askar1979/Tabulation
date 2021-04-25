Imports System.Data.SqlClient
Imports System.Data
Partial Public Class _Archive
    Inherits System.Web.UI.Page
    Dim ReturnDate As System.DateTime
    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString2").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Contents("sesIsArchiver") = "True" Then
            Session.Contents("LoginStatus") = "Working"
            txtBarCode.Focus()
        Else
            If Session.Contents("sesUserName") = Nothing Then
                Response.Redirect("login.aspx")
            Else
                Response.Redirect("InsufficientPermission.aspx")
            End If
        End If
    End Sub
    Protected Sub btn_save_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btn_save.Click

        GV_Tracking.Visible = True
        GV_Tracking.DataBind()
        Select Case GV_Tracking.Rows.Count
            Case 0
                ' Non Existinbg Barcode
                Dim myScript As String
                myScript = "alert('هذه الاستمارة اما غير مدخلة ادخال كامل او رقم الباركود خطأ. راجع صفحة حالة الاستمارة');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

            Case 1
                'read value and do stuff
                If GV_Tracking.DataKeys(0).Values(1) = "5" Then
                    Dim myScript As String
                    myScript = "alert('الاستمارة تم خزنها في الارشيف مسبقاً');"
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
                    Exit Sub
                End If

                Dim comArchive As New SqlCommand("usp_Archive_Matched_Corr", conn)
                comArchive.CommandType = CommandType.StoredProcedure
                comArchive.Parameters.AddWithValue("@barcode", Session.Contents("sessBarcode"))
                conn.Open()
                Dim sqlcom As SqlDataReader = comArchive.ExecuteReader

                While sqlcom.Read()
                    Session("sesTrackingID") = Convert.ToString(sqlcom.GetInt32(1))
                End While
                conn.Close()
                Dim ArchiveDate As System.DateTime
                ArchiveDate = Date.Now
                Session("sesArchiveDate") = ArchiveDate

                SDS_Tracking.Update()

                Dim myScript1 As String
                myScript1 = "alert('تم الخزن في الارشيف.');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript1", myScript1, True)


                'If GV_Tracking.DataKeys(0).Values(2) = "True" Or GV_Tracking.DataKeys(0).Values(1) = "3" Then
                '    'Update Tracking
                '    Dim ArchiveDate As System.DateTime
                '    Session("sesTrackingID") = GV_Tracking.DataKeys(0).Values(0)
                '    ArchiveDate = Date.Now
                '    Session("sesArchiveDate") = ArchiveDate
                '    SDS_Tracking.Update()

                '    Dim myScript As String
                '    myScript = "alert('تم الخزن في الارشيف.');"
                '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)


                'Else
                'Dim myScript As String
                'myScript = "alert('لم يتم خزن الاستمارة لانها غير داخلة في مرحلة التصحيح او غير متطابقة.');"
                'Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

                ' End If
            Case Is > 1
                'Then duplicate on tracking
                Dim myScript As String
                myScript = "alert('لايمكن خزن الاستمارة لانها مكررة قم باستدعاء المشرف.');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

        End Select
        GV_Tracking.Visible = False
    End Sub
End Class