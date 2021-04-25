Imports System.Data.SqlClient
Imports System.Data

Partial Public Class _BarcodeEntry
    Inherits System.Web.UI.Page
    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString2").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Contents("sesIsBarcodeEntry") = "True" Then
            Session.Contents("LoginStatus") = "Working"
            txtBarCode.Focus()
        Else
            If Session.Contents("sesUserID") = Nothing Then
                Response.Redirect("login.aspx")
            Else
                Response.Redirect("InsufficientPermission.aspx")
            End If
        End If
    End Sub
    Protected Sub btn_save_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btn_save.Click

        Dim combarcode As New SqlCommand("select Barcode from Tracking where Barcode=@Barcode", conn)
        combarcode.CommandType = CommandType.Text
        combarcode.Parameters.AddWithValue("@Barcode", txtBarCode.Text)
        conn.Open()
        Dim sqlar As Boolean = combarcode.ExecuteScalar()
        conn.Close()

        If sqlar = True Then
            Dim myScript As String
            myScript = "alert('رقم الباركود موجود في النظام');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
        Else
            Dim combarcod As New SqlCommand("usp_Tracking_InsertBarcode", conn)
            combarcod.CommandType = CommandType.StoredProcedure
            combarcod.Parameters.AddWithValue("@Barcode", txtBarCode.Text)
            combarcod.Parameters.AddWithValue("@BarcodeEntryUserId", Session.Contents("sesUserID"))
            combarcod.Parameters.AddWithValue("@FormStatus", 9)
            combarcod.Parameters.AddWithValue("@FormStatusUserId", Session.Contents("sesUserID"))

            conn.Open()
            Dim Barcode As Boolean = combarcod.ExecuteNonQuery()
            conn.Close()

            If Barcode = True Then
                Dim myScript As String
                myScript = "alert('تم الخزن بنجاح');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

                txtBarCode.Text = ""
                txtBarCode.Focus()
            Else
                Dim myScript As String
                myScript = "alert('لم يتم الخزن');"
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
            End If

        End If

        

        'GV_Tracking.Visible = True
        'GV_Tracking.DataBind()
        'Select Case GV_Tracking.Rows.Count
        '    Case 0

        '        'Update Tracking
        '        Dim ArchiveDate As System.DateTime
        '        Session("sesTrackingID") = GV_Tracking.DataKeys(0).Values(0)
        '        ArchiveDate = Date.Now
        '        Session("sesArchiveDate") = ArchiveDate
        '        SDS_Tracking.Update()

        '        Dim myScript As String
        '        myScript = "alert('تم الخزن في الارشيف.');"
        '        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
        '        End If

        '    Case 1
        '        ' Non Existinbg Barcode
        '        Dim myScript As String
        '        myScript = "alert('رقم الباركود موجود في النظام');"
        '        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)


        '    Case Is > 1
        '        'Then duplicate on tracking
        '        Dim myScript As String
        '        myScript = "alert('لايمكن خزن الاستمارة لانها مكررة قم باستدعاء المشرف.');"
        '        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

        'End Select
        'GV_Tracking.Visible = False
    End Sub
End Class