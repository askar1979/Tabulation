Imports System.Data.SqlClient
Imports System.Data
Partial Public Class _ListAudit
    Inherits System.Web.UI.Page
    Dim ReturnDate As System.DateTime
    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString2").ConnectionString)

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Contents("sesIsAuditor") = "True" Then
            Session.Contents("LoginStatus") = "Working"
        Else
            If Session.Contents("sesUserID") = Nothing Then
                Response.Redirect("login.aspx")
            Else
                Response.Redirect("InsufficientPermission.aspx")
            End If
        End If
        GV_LoadAudit.DataBind()
    End Sub
    Protected Sub btnExcel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnExcel.Click
        ' Clear the response
        GV_LoadAudit.AllowPaging = False
        Response.Clear()

        ' Set the type and filename   
        Response.AddHeader("content-disposition", "attachment;filename=ListAuditCases.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.xls"

        ' Add the HTML from the GridView to a StringWriter so we can write it out later   
        Dim sw As System.IO.StringWriter = New System.IO.StringWriter
        Dim hw As System.Web.UI.HtmlTextWriter = New HtmlTextWriter(sw)
        GV_LoadAudit.RenderControl(hw)

        ' Write out the data   
        Response.Write(sw.ToString)
        Response.End()
        GV_LoadAudit.AllowPaging = True
    End Sub
    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSearch.Click
        GV_LoadAudit.DataBind()
        Session.Contents("sessBarcode") = txtBarcode.Text
    End Sub
    Protected Sub btnSearchAll_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSearchAll.Click
        GV_LoadAudit.DataBind()
        txtBarcode.Text = ""
    End Sub
    Protected Sub GV_LoadAudit_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GV_LoadAudit.SelectedIndexChanged
        Dim index As Integer = GV_LoadAudit.SelectedIndex
        Dim row As GridViewRow = GV_LoadAudit.Rows(index)
        Session.Contents("sessBarcode") = row.Cells(2).Text
        Session.Contents("sessCancelReason") = row.Cells(3).Text
        Session.Contents("sessCancelUserId") = row.Cells(4).Text
        Session.Contents("sessCancelDate") = row.Cells(5).Text

        Dim aa As String = row.Cells(2).Text
        Dim cc As String = row.Cells(3).Text
        Dim dd As String = row.Cells(4).Text
        Dim ee As String = row.Cells(5).Text
        Session.Contents("sessTrackingid") = GV_LoadAudit.DataKeys(index).Value
        Dim bb As String = GV_LoadAudit.DataKeys(index).Value

        GV_LoadAudit.Rows(index).BackColor = Drawing.Color.Red
    End Sub
    Protected Sub btn_ReEntry_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btn_ReEntry.Click
        Dim comAudit As New SqlCommand("usp_Audit_reEntry", conn)
        comAudit.CommandType = CommandType.StoredProcedure
        comAudit.Parameters.AddWithValue("@trackingId", Session.Contents("sessTrackingid"))
        comAudit.Parameters.AddWithValue("@FormStatusUserId", Session.Contents("sesUserID"))
        comAudit.Parameters.AddWithValue("@AuditUserId", Session.Contents("sesUserID"))
        comAudit.Parameters.AddWithValue("@Barcode", Session.Contents("sessBarcode"))
        comAudit.Parameters.AddWithValue("@CancelReason", Session.Contents("sessCancelReason"))
        comAudit.Parameters.AddWithValue("@CancelUserId", Session.Contents("sessCancelUserId"))
        comAudit.Parameters.AddWithValue("@CancelDate", Session.Contents("sessCancelDate"))

        conn.Open()
        Dim sqlcom As Boolean = comAudit.ExecuteNonQuery()
        conn.Close()

        If sqlcom = True Then
            Dim myScript As String
            myScript = "alert('يجب ارسال الاستمارة الى الادخال مرة ثانية');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

            GV_LoadAudit.DataBind()

            Session.Contents("sessTrackingid") = Nothing
            Session.Contents("sessBarcode") = Nothing
            Session.Contents("sessCancelReason") = Nothing
            Session.Contents("sessCancelUserId") = Nothing
            Session.Contents("sessCancelDate") = Nothing
            Exit Sub
        Else
            Dim myScript As String
            myScript = "alert('لم يتم ارسال الاستمارة الى الادخال مرة ثانية');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
        End If


    End Sub
    Protected Sub btn_Reject_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btn_Reject.Click
        Dim comAudit As New SqlCommand("usp_Audit_Reject", conn)
        comAudit.CommandType = CommandType.StoredProcedure
        comAudit.Parameters.AddWithValue("@trackingId", Session.Contents("sessTrackingid"))
        comAudit.Parameters.AddWithValue("@FormStatusUserId", Session.Contents("sesUserID"))
        comAudit.Parameters.AddWithValue("@AuditUserId", Session.Contents("sesUserID"))
        comAudit.Parameters.AddWithValue("@Barcode", Session.Contents("sessBarcode"))
        comAudit.Parameters.AddWithValue("@CancelReason", Session.Contents("sessCancelReason"))
        comAudit.Parameters.AddWithValue("@CancelUserId", Session.Contents("sessCancelUserId"))
        comAudit.Parameters.AddWithValue("@CancelDate", Session.Contents("sessCancelDate"))

        conn.Open()
        Dim sqlcom As Boolean = comAudit.ExecuteNonQuery()
        conn.Close()

        If sqlcom = True Then
            Dim myScript As String
            myScript = "alert('تم رفض الاستمارة');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)

            GV_LoadAudit.DataBind()

            Session.Contents("sessTrackingid") = Nothing
            Session.Contents("sessBarcode") = Nothing
            Session.Contents("sessCancelReason") = Nothing
            Session.Contents("sessCancelUserId") = Nothing
            Session.Contents("sessCancelDate") = Nothing
            Exit Sub
        Else
            Dim myScript As String
            myScript = "alert('لم يتم رفض الاستمارة');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
        End If
    End Sub
End Class