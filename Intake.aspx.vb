Imports System.Data.SqlClient
Imports System.Data
Partial Public Class _Intake
    Inherits System.Web.UI.Page
    Dim MyCommand As New System.Data.SqlClient.SqlCommand
    Dim ReturnDate As System.DateTime
    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString").ConnectionString)
 
   
    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Contents("sesIsIntake") = "True" Then
            Session.Contents("LoginStatus") = "Working"
        Else
            If Session.Contents("sesUserID") = Nothing Then
                Response.Redirect("login.aspx")
            Else
                Response.Redirect("InsufficientPermission.aspx")
            End If
        End If
    End Sub
    Protected Sub EmptyTXT()
        txtGovID.Text = String.Empty
        txtVRC.Text = String.Empty
        txtShipmentNo.Text = String.Empty
        txtShipmentDate.Text = String.Empty
        txtNoForms.Text = String.Empty
        txtNoAddition.Text = String.Empty
        txtNoChange.Text = String.Empty
        txtNoCorrection.Text = String.Empty
        txtNoDeletion.Text = String.Empty
    End Sub

    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim comvrc As New SqlCommand("SELECT VRC_NAME_AR FROM dbo.VRC_NEW WHERE (VRC_GOVID = @VRC_GOVID) AND (VRC_ID = @VRC_ID)", conn)
        comvrc.CommandType = CommandType.Text
        comvrc.Parameters.AddWithValue("@VRC_ID", Trim(txtVRC.Text))
        comvrc.Parameters.AddWithValue("@VRC_GOVID", Trim(txtGovID.Text))
        conn.Open()
        Dim sqlvrc As String = comvrc.ExecuteScalar
        conn.Close()
        If sqlvrc = Nothing Then
            Dim myScript As String
            myScript = "alert('خطأ في رقم المحافظة او رقم مركز التسجيل غير تابع للمحافظة');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
            Exit Sub
        End If
        If Convert.ToInt32(Trim(txtNoAddition.Text)) + Convert.ToInt32(Trim(txtNoChange.Text)) + Convert.ToInt32(Trim(txtNoCorrection.Text)) + Convert.ToInt32(Trim(txtNoDeletion.Text)) <> Convert.ToInt32(Trim(txtNoForms.Text)) Then
            Dim myScript As String
            myScript = "alert('يوجد خطأ في مجموع الاستمارات لهذه الشحنة');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
            Exit Sub
        End If

        Dim comintake As New SqlCommand("Select IntakeId From Intake Where (VRCId = @VRC_ID )and(ShipmentNumber = @ShipmentNumber)", conn)
        comintake.CommandType = CommandType.Text
        comintake.Parameters.AddWithValue("@VRC_ID", Trim(txtVRC.Text))
        comintake.Parameters.AddWithValue("@ShipmentNumber", Trim(txtShipmentNo.Text))
        conn.Open()
        Dim intIntakeID As String = comintake.ExecuteScalar()
        conn.Close()
        If intIntakeID <> Nothing Then
            Dim myScript As String
            myScript = "alert('رقم الشحنة لهذا المركز موجود مسبقاً');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
            Exit Sub
        End If

        If Page.IsValid Then
            Dim cominsert As New SqlCommand("usp_Intake_Insert", conn)
            cominsert.CommandType = CommandType.StoredProcedure
            cominsert.Parameters.AddWithValue("@GovernorateId", Convert.ToInt32(Trim(txtGovID.Text)))
            cominsert.Parameters.AddWithValue("@VRCId", Convert.ToInt32(Trim(txtVRC.Text)))
            cominsert.Parameters.AddWithValue("@ShipmentNumber", Convert.ToInt32(Trim(txtShipmentNo.Text)))
            cominsert.Parameters.AddWithValue("@ShipmentDate", Convert.ToDateTime(Trim(txtShipmentDate.Text)))
            cominsert.Parameters.AddWithValue("@IntakeUserId", Session.Contents("sesUserID"))
            cominsert.Parameters.AddWithValue("@NumberOfForms", Convert.ToInt32(Trim(txtNoForms.Text)))
            cominsert.Parameters.AddWithValue("@NumberOfAdditionForms", Convert.ToInt32(Trim(txtNoAddition.Text)))
            cominsert.Parameters.AddWithValue("@NumberOfChangeForms", Convert.ToInt32(Trim(txtNoChange.Text)))
            cominsert.Parameters.AddWithValue("@NumberOfCorrectionForms", Convert.ToInt32(Trim(txtNoCorrection.Text)))
            cominsert.Parameters.AddWithValue("@NumberOfDeletionForms", Convert.ToInt32(Trim(txtNoDeletion.Text)))
            conn.Open()
            Dim sqlintake As Boolean = cominsert.ExecuteNonQuery
            conn.Close()

            EmptyTXT()

            Dim myScript1 As String
            myScript1 = "alert('تم الخزن بنجاح');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript1, True)
            Exit Sub
        Else
            Dim myScript1 As String
            myScript1 = "alert('لم يتم الخزن');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript1, True)
        End If

    End Sub

   
End Class







'Imports System.Data.SqlClient
'Imports System.Data
'Partial Public Class _Intake
'    Inherits System.Web.UI.Page
'    Dim MyConnection As New System.Data.SqlClient.SqlConnection
'    Dim MyCommand As New System.Data.SqlClient.SqlCommand
'    Dim ReturnDate As System.DateTime
'    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString2").ConnectionString)
'    Private Sub DV_Intake_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DV_Intake.ItemInserting
'        Dim myQuery, strGovNo, strVRCID, strShipmentNO As String
'        Dim intIntakeID, intTotalForm, intTotalAddition, intTotalChange, intTotalCorrection, intTotalDeletion, intTotalIDP As Integer
'        Dim intakeDate As Date = Date.Now
'        Dim isValidVRC As Boolean
'        DDL_ListGovVRC.Visible = True
'        Session("sesIntakeDate") = intakeDate
'        strVRCID = CType(DV_Intake.FindControl("txtVRC"), TextBox).Text
'        strGovNo = CType(DV_Intake.FindControl("txtGovID"), TextBox).Text
'        strShipmentNO = CType(DV_Intake.FindControl("txtShipmentNo"), TextBox).Text
'        intTotalForm = CType(DV_Intake.FindControl("txtNoForms"), TextBox).Text
'        intTotalAddition = CType(DV_Intake.FindControl("txtNoAddition"), TextBox).Text
'        intTotalChange = CType(DV_Intake.FindControl("txtNoChange"), TextBox).Text
'        intTotalCorrection = CType(DV_Intake.FindControl("txtNoCorrection"), TextBox).Text
'        intTotalDeletion = CType(DV_Intake.FindControl("txtNoDeletion"), TextBox).Text
'        intTotalIDP = CType(DV_Intake.FindControl("txtNoIDP"), TextBox).Text

'        Dim comvrc As New SqlCommand("SELECT VRC_NAME_AR FROM VRC_NEW where VRC_ID =@VRC_ID and VRC_GOVID =@VRC_GOVID", conn)
'        comvrc.CommandType = CommandType.Text
'        comvrc.Parameters.AddWithValue("@VRC_ID", Trim(strVRCID))
'        comvrc.Parameters.AddWithValue("@VRC_GOVID", Trim(strGovNo))
'        conn.Open()
'        Dim sqlvrc As String = comvrc.ExecuteScalar
'        conn.Close()
'        If sqlvrc = Nothing Then

'            Dim myScript As String
'            myScript = "alert('رقم مركز التسجيل غير تابع للمحافظة');"
'            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
'            Exit Sub
'        End If

'        If intTotalAddition + intTotalChange + intTotalCorrection + intTotalDeletion + intTotalIDP <> intTotalForm Then
'            Dim myScript As String
'            myScript = "alert('يوجد خطأ في مجموع الاستمارات لهذه الشحنة');"
'            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
'            e.Cancel = True
'        End If

'        'For i As Integer = 0 To DDL_ListGovVRC.Items.Count - 1
'        '    DDL_ListGovVRC.SelectedIndex = i
'        '    If strGovNo = DDL_ListGovVRC.SelectedItem.Text And strVRCID = DDL_ListGovVRC.SelectedValue Then
'        '        DDL_ListGovVRC.SelectedIndex = 0
'        '        isValidVRC = True
'        '        Exit For
'        '    End If
'        'Next

'        'If isValidVRC = False Then
'        '    Dim myScript As String
'        '    myScript = "alert('خطأ في رقم المحافظة او رقم مركز التسجيل');"
'        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
'        '    e.Cancel = True
'        'End If

'        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("IHEC_VRUConnectionString").ConnectionString
'        MyCommand.Connection = Me.MyConnection

'        myQuery = "Select IntakeId From Intake Where VRCId = " & CType(strVRCID, Integer) & " And ShipmentNumber = " & CType(strShipmentNO, Integer)
'        MyCommand.CommandText = myQuery
'        MyConnection.Open()
'        intIntakeID = MyCommand.ExecuteScalar()
'        MyConnection.Close()
'        Dim myScript1 As String
'        myScript1 = "alert('تم الخزن بنجاح');"
'        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript1, True)
'        DDL_ListGovVRC.Visible = False


'        If intIntakeID <> Nothing Then
'            e.Cancel = True
'            Dim myScript As String
'            myScript = "alert('رقم الشحنة لهذا المركز موجود مسبقاً');"
'            Page.ClientScript.RegisterStartupScript(Me.GetType(), "myScript", myScript, True)
'        End If

'    End Sub

'    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
'        If Session.Contents("sesIsIntake") = "True" Then
'            Session.Contents("LoginStatus") = "Working"
'        Else
'            If Session.Contents("sesUserID") = Nothing Then
'                Response.Redirect("login.aspx")
'            Else
'                Response.Redirect("InsufficientPermission.aspx")
'            End If
'        End If
'    End Sub
'End Class