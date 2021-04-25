<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AuditBarcode.aspx.vb"
    Inherits="VRUTracking.AuditBarcode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="css/AuditBarcode.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="div">
        <asp:Panel ID="Panel1" runat="server">
            <table>
                <tr>
                    <td class="td">
                        رقم الباركود
                        <asp:TextBox ID="txtBarcodeNo1" runat="server" CssClass="text"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch1" runat="server" Text="موافق" CssClass="btn" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBarcodeNo1"
                            ErrorMessage="الرجاء ادخال رقم الباركود" CssClass="validation"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBarcodeNo1"
                            ErrorMessage="ارقام فقط - ثمانية مراتب" ValidationExpression="[0-9]{8,8}" CssClass="validation"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div class="div">
        <asp:Panel ID="Panel2" runat="server" Visible="False">
            <table>
                <tr>
                    <td class="td">
                        رقم الباركود
                        <asp:TextBox ID="txtBarcodeNo2" runat="server" CssClass="text"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch2" runat="server" Text="بحث" CssClass="btn" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBarcodeNo1"
                            ErrorMessage="الرجاء ادخال رقم الباركود" CssClass="validation"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBarcodeNo1"
                            ErrorMessage="ارقام فقط - ثمانية مراتب" ValidationExpression="[0-9]{8,8}" CssClass="validation"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
    
    <div class="divimage">
        <table>
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnEnter" runat="server" Text="ok" CssClass="btn" />
                </td>
            </tr>
        </table>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TrackingId"
        DataSourceID="SDSAuditBarcode" Visible="False">
        <Columns>
            <asp:BoundField DataField="TrackingId" HeaderText="TrackingId" InsertVisible="False"
                ReadOnly="True" SortExpression="TrackingId" />
            <asp:BoundField DataField="IntakeId" HeaderText="IntakeId" SortExpression="IntakeId" />
            <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" />
            <asp:BoundField DataField="ScanUserId" HeaderText="ScanUserId" SortExpression="ScanUserId" />
            <asp:BoundField DataField="ScanDate" HeaderText="ScanDate" SortExpression="ScanDate" />
            <asp:BoundField DataField="Entry1UserId" HeaderText="Entry1UserId" SortExpression="Entry1UserId" />
            <asp:BoundField DataField="Entry1Date" HeaderText="Entry1Date" SortExpression="Entry1Date" />
            <asp:BoundField DataField="Entry2UserId" HeaderText="Entry2UserId" SortExpression="Entry2UserId" />
            <asp:BoundField DataField="Entry2Date" HeaderText="Entry2Date" SortExpression="Entry2Date" />
            <asp:BoundField DataField="CorrectionUserId" HeaderText="CorrectionUserId" SortExpression="CorrectionUserId" />
            <asp:BoundField DataField="CorrectionDate" HeaderText="CorrectionDate" SortExpression="CorrectionDate" />
            <asp:BoundField DataField="AuditUserId" HeaderText="AuditUserId" SortExpression="AuditUserId" />
            <asp:BoundField DataField="AuditDate" HeaderText="AuditDate" SortExpression="AuditDate" />
            <asp:BoundField DataField="ArchiveUserId" HeaderText="ArchiveUserId" SortExpression="ArchiveUserId" />
            <asp:BoundField DataField="ArchiveDate" HeaderText="ArchiveDate" SortExpression="ArchiveDate" />
            <asp:BoundField DataField="RandomCheckUserId" HeaderText="RandomCheckUserId" SortExpression="RandomCheckUserId" />
            <asp:BoundField DataField="RandomCheckDate" HeaderText="RandomCheckDate" SortExpression="RandomCheckDate" />
            <asp:BoundField DataField="AuditConsideredUserId" HeaderText="AuditConsideredUserId"
                SortExpression="AuditConsideredUserId" />
            <asp:CheckBoxField DataField="AuditOpenReEntry" HeaderText="AuditOpenReEntry" SortExpression="AuditOpenReEntry" />
            <asp:BoundField DataField="AuditRemark" HeaderText="AuditRemark" SortExpression="AuditRemark" />
            <asp:BoundField DataField="VRValidationCaseId" HeaderText="VRValidationCaseId" SortExpression="VRValidationCaseId" />
            <asp:BoundField DataField="FormStatusId" HeaderText="FormStatusId" SortExpression="FormStatusId" />
            <asp:BoundField DataField="FormStatusUserId" HeaderText="FormStatusUserId" SortExpression="FormStatusUserId" />
            <asp:BoundField DataField="FormStatusReasonId" HeaderText="FormStatusReasonId" SortExpression="FormStatusReasonId" />
            <asp:CheckBoxField DataField="IsLocked" HeaderText="IsLocked" SortExpression="IsLocked" />
            <asp:BoundField DataField="LockingUserId" HeaderText="LockingUserId" SortExpression="LockingUserId" />
            <asp:BoundField DataField="ScanFileURL" HeaderText="ScanFileURL" SortExpression="ScanFileURL" />
            <asp:BoundField DataField="CancelReason" HeaderText="CancelReason" SortExpression="CancelReason" />
            <asp:BoundField DataField="CancelUserId" HeaderText="CancelUserId" SortExpression="CancelUserId" />
            <asp:BoundField DataField="CancelDate" HeaderText="CancelDate" SortExpression="CancelDate" />
            <asp:CheckBoxField DataField="IsMatched" HeaderText="IsMatched" SortExpression="IsMatched" />
            <asp:BoundField DataField="RemoveCount" HeaderText="RemoveCount" SortExpression="RemoveCount" />
            <asp:BoundField DataField="AuditBarcodUserId" HeaderText="AuditBarcodUserId" SortExpression="AuditBarcodUserId" />
            <asp:BoundField DataField="AuditBarcodDate" HeaderText="AuditBarcodDate" SortExpression="AuditBarcodDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SDSAuditBarcode" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString2 %>"
        DeleteCommand="DELETE FROM [Tracking] WHERE [TrackingId] = @TrackingId" InsertCommand="INSERT INTO [Tracking] ([IntakeId], [Barcode], [ScanUserId], [ScanDate], [Entry1UserId], [Entry1Date], [Entry2UserId], [Entry2Date], [CorrectionUserId], [CorrectionDate], [AuditUserId], [AuditDate], [ArchiveUserId], [ArchiveDate], [RandomCheckUserId], [RandomCheckDate], [AuditConsideredUserId], [AuditOpenReEntry], [AuditRemark], [VRValidationCaseId], [FormStatusId], [FormStatusUserId], [FormStatusReasonId], [IsLocked], [LockingUserId], [ScanFileURL], [CancelReason], [CancelUserId], [CancelDate], [IsMatched], [RemoveCount], [AuditBarcodUserId], [AuditBarcodDate]) VALUES (@IntakeId, @Barcode, @ScanUserId, @ScanDate, @Entry1UserId, @Entry1Date, @Entry2UserId, @Entry2Date, @CorrectionUserId, @CorrectionDate, @AuditUserId, @AuditDate, @ArchiveUserId, @ArchiveDate, @RandomCheckUserId, @RandomCheckDate, @AuditConsideredUserId, @AuditOpenReEntry, @AuditRemark, @VRValidationCaseId, @FormStatusId, @FormStatusUserId, @FormStatusReasonId, @IsLocked, @LockingUserId, @ScanFileURL, @CancelReason, @CancelUserId, @CancelDate, @IsMatched, @RemoveCount, @AuditBarcodUserId, @AuditBarcodDate)"
        SelectCommand="SELECT * FROM [Tracking] WHERE ([Barcode] = @Barcode)" UpdateCommand="UPDATE [Tracking] SET [IntakeId] = @IntakeId, [Barcode] = @Barcode, [ScanUserId] = @ScanUserId, [ScanDate] = @ScanDate, [Entry1UserId] = @Entry1UserId, [Entry1Date] = @Entry1Date, [Entry2UserId] = @Entry2UserId, [Entry2Date] = @Entry2Date, [CorrectionUserId] = @CorrectionUserId, [CorrectionDate] = @CorrectionDate, [AuditUserId] = @AuditUserId, [AuditDate] = @AuditDate, [ArchiveUserId] = @ArchiveUserId, [ArchiveDate] = @ArchiveDate, [RandomCheckUserId] = @RandomCheckUserId, [RandomCheckDate] = @RandomCheckDate, [AuditConsideredUserId] = @AuditConsideredUserId, [AuditOpenReEntry] = @AuditOpenReEntry, [AuditRemark] = @AuditRemark, [VRValidationCaseId] = @VRValidationCaseId, [FormStatusId] = @FormStatusId, [FormStatusUserId] = @FormStatusUserId, [FormStatusReasonId] = @FormStatusReasonId, [IsLocked] = @IsLocked, [LockingUserId] = @LockingUserId, [ScanFileURL] = @ScanFileURL, [CancelReason] = @CancelReason, [CancelUserId] = @CancelUserId, [CancelDate] = @CancelDate, [IsMatched] = @IsMatched, [RemoveCount] = @RemoveCount, [AuditBarcodUserId] = @AuditBarcodUserId, [AuditBarcodDate] = @AuditBarcodDate WHERE [TrackingId] = @TrackingId">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBarcodeNo1" Name="Barcode" PropertyName="Text"
                Type="Int64" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="TrackingId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="IntakeId" Type="Int32" />
            <asp:Parameter Name="Barcode" Type="Int64" />
            <asp:Parameter Name="ScanUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="ScanDate" />
            <asp:Parameter Name="Entry1UserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Entry1Date" />
            <asp:Parameter Name="Entry2UserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Entry2Date" />
            <asp:Parameter Name="CorrectionUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="CorrectionDate" />
            <asp:Parameter Name="AuditUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="AuditDate" />
            <asp:Parameter Name="ArchiveUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="ArchiveDate" />
            <asp:Parameter Name="RandomCheckUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="RandomCheckDate" />
            <asp:Parameter Name="AuditConsideredUserId" Type="Int32" />
            <asp:Parameter Name="AuditOpenReEntry" Type="Boolean" />
            <asp:Parameter Name="AuditRemark" Type="String" />
            <asp:Parameter Name="VRValidationCaseId" Type="Int32" />
            <asp:Parameter Name="FormStatusId" Type="Int32" />
            <asp:Parameter Name="FormStatusUserId" Type="Int32" />
            <asp:Parameter Name="FormStatusReasonId" Type="Int32" />
            <asp:Parameter Name="IsLocked" Type="Boolean" />
            <asp:Parameter Name="LockingUserId" Type="Int32" />
            <asp:Parameter Name="ScanFileURL" Type="String" />
            <asp:Parameter Name="CancelReason" Type="String" />
            <asp:Parameter Name="CancelUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="CancelDate" />
            <asp:Parameter Name="IsMatched" Type="Boolean" />
            <asp:Parameter Name="RemoveCount" Type="Int32" />
            <asp:Parameter Name="AuditBarcodUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="AuditBarcodDate" />
            <asp:Parameter Name="TrackingId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="IntakeId" Type="Int32" />
            <asp:Parameter Name="Barcode" Type="Int64" />
            <asp:Parameter Name="ScanUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="ScanDate" />
            <asp:Parameter Name="Entry1UserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Entry1Date" />
            <asp:Parameter Name="Entry2UserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Entry2Date" />
            <asp:Parameter Name="CorrectionUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="CorrectionDate" />
            <asp:Parameter Name="AuditUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="AuditDate" />
            <asp:Parameter Name="ArchiveUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="ArchiveDate" />
            <asp:Parameter Name="RandomCheckUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="RandomCheckDate" />
            <asp:Parameter Name="AuditConsideredUserId" Type="Int32" />
            <asp:Parameter Name="AuditOpenReEntry" Type="Boolean" />
            <asp:Parameter Name="AuditRemark" Type="String" />
            <asp:Parameter Name="VRValidationCaseId" Type="Int32" />
            <asp:Parameter Name="FormStatusId" Type="Int32" />
            <asp:Parameter Name="FormStatusUserId" Type="Int32" />
            <asp:Parameter Name="FormStatusReasonId" Type="Int32" />
            <asp:Parameter Name="IsLocked" Type="Boolean" />
            <asp:Parameter Name="LockingUserId" Type="Int32" />
            <asp:Parameter Name="ScanFileURL" Type="String" />
            <asp:Parameter Name="CancelReason" Type="String" />
            <asp:Parameter Name="CancelUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="CancelDate" />
            <asp:Parameter Name="IsMatched" Type="Boolean" />
            <asp:Parameter Name="RemoveCount" Type="Int32" />
            <asp:Parameter Name="AuditBarcodUserId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="AuditBarcodDate" />
        </InsertParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
