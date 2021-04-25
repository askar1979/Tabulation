<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BarcodeEntry.aspx.vb"
    Inherits="VRUTracking._BarcodeEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>VRU Software</title>

    <script language="javascript" type="text/javascript">
// <!CDATA[

function window_onload() {
javascript:history.go(1)
}

function form1_onsubmit() {
function enableDIV() {
         document.getElementById("divTop").style.zIndex=999
         document.getElementById("divTop").style.height=1000
         document.getElementById("divTop").innerHTML = 'الرجاء الانتظار بينما ينفذ طلبك'
        }
enableDIV();
}

// ]]>
    </script>

    <style type="text/css">
        </style>
    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />
</head>
<body onload="return window_onload()">
    <form id="form1" runat="server" onsubmit="return form1_onsubmit()">
    <div class="divimage">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
    </div>
    <div class="divMenu">
        <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
            font-family: Arial; font-size: Medium; font-weight: bold;" align="right">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td align="right">
                    <asp:Menu ID="MainMenu" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
                        Font-Names="Tahoma" Font-Size="Small" ForeColor="#000066" Orientation="Horizontal"
                        StaticSubMenuIndent="15px" BackColor="#FFFFC6">
                        <StaticSelectedStyle BackColor="#507CD1" />
                        <StaticMenuItemStyle HorizontalPadding="9px" VerticalPadding="10px" />
                        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                        <DynamicMenuStyle BackColor="#B5C7DE" />
                        <DynamicSelectedStyle BackColor="#507CD1" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" />
                        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                        <Items>
                            <asp:MenuItem NavigateUrl="~/BarcodeEntry.aspx" Text="ادخال الباركود" Value="ادخال الباركود">
                            </asp:MenuItem>
                            <asp:MenuItem Text="حالة الاستمارة" Value="Scan" NavigateUrl="~/FormStatus.aspx">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/changePass.aspx" Text="تغيير كلمة السر" Value="Change Password">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/logout.aspx" Text="الخروج" Value="Log out"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </td>
            </tr>
        </table>
    </div>
    <div id="FormName" class="formName">
    <asp:Label ID="lblFormName" runat="server" Text="واجهة ادخال الباركود "></asp:Label>
    </div>
    <div class="barcode-container">
        <asp:Label ID="lbBarCode" runat="server" Text="رقم الباركود" ></asp:Label>
        <asp:TextBox ID="txtBarCode" runat="server" 
            MaxLength="8" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFV_BarCodeNo" runat="server" ControlToValidate="txtBarCode"
            ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBarCode"
            ErrorMessage="ارقام فقط - ثمانية مراتب" ValidationExpression="[0-9]{8,8}" Font-Bold="True"
            Font-Names="Arial" Font-Size="Large"></asp:RegularExpressionValidator>
    <div class="buttons">
        <asp:Button ID="btn_save" runat="server" Text="خــزن" TabIndex="2" CssClass="ok" />
    </div>
    </div>
    
    <%-- <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <table cellspacing="2" cellpadding="3" border="1" id="Entry1" style="border: 1px None #C0C0C0;
            background-color: #808080; font-family: Arial; font-size: Medium; font-weight: bold;"
            align="center">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td>
                    <br />
                    <br />
                    <table cellspacing="2" cellpadding="3" border="0" id="Child" style="font-family: Arial;
                        font-size: Medium; font-weight: bold;">
                        <tr style="background-color: #D4D0C8; font-weight: bold;">
                            <td>
                                <asp:Label ID="lbBarCode1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                    Style="text-align: left;" Text="رقم الباركود" ForeColor="Black" Width="220px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBarCode1" runat="server" Font-Bold="True" Font-Names="Arial"
                                    Font-Size="Large" MaxLength="8" Columns="20" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RFV_BarCodeNo1" runat="server" ControlToValidate="txtBarCode"
                                    ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="REV_BarCode" runat="server" ControlToValidate="txtBarCode"
                                    ErrorMessage="ارقام فقط - ثمانية مراتب" ValidationExpression="[0-9]{8,8}" Font-Bold="True"
                                    Font-Names="Arial" Font-Size="Large"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="border-style: none; background-color: #D4D0C8; font-weight: bold;">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="background-color: #D4D0C8; font-weight: bold;">
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td colspan="2" align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="background-color: #D4D0C8; font-weight: bold;">
                            <td colspan="4" align="center">
                                <asp:Button ID="btn_save" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                    Text="خــزن" TabIndex="2" Width="134" BackColor="#8872A9" ForeColor="#E8F9FF" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </td>
            </tr>
            <tr style="background-color: #F1EFED; font-weight: bold;">
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        
    </asp:Panel>--%>
    
    <asp:SqlDataSource ID="SDS_Tracking" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
            SelectCommand="SELECT * FROM [Tracking] WHERE ([Barcode] = @Barcode)" UpdateCommand="Update Tracking Set FormStatusId = 5, ArchiveUserId = @ArchiveUserId, ArchiveDate = @ArchiveDate Where TrackingID = @TrackingID">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBarCode" Name="Barcode" PropertyName="Text" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="ArchiveUserId" SessionField="sesUserID" Type="Int32" />
                <asp:SessionParameter Name="ArchiveDate" SessionField="sesArchiveDate" Type="DateTime" />
                <asp:SessionParameter Name="TrackingID" SessionField="sesTrackingID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:GridView ID="GV_Tracking" runat="server" AutoGenerateColumns="False" DataKeyNames="TrackingId,FormStatusId,IsMatched"
        DataSourceID="SDS_Tracking" Visible="False">
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
            <asp:BoundField DataField="AuditOpenReEntry" HeaderText="AuditOpenReEntry" SortExpression="AuditOpenReEntry" />
            <asp:BoundField DataField="AuditRemark" HeaderText="AuditRemark" SortExpression="AuditRemark" />
            <asp:BoundField DataField="VRValidationCaseId" HeaderText="VRValidationCaseId" SortExpression="VRValidationCaseId" />
            <asp:BoundField DataField="FormStatusId" HeaderText="FormStatusId" SortExpression="FormStatusId" />
            <asp:BoundField DataField="IsLocked" HeaderText="IsLocked" SortExpression="IsLocked" />
            <asp:BoundField DataField="LockingUserId" HeaderText="LockingUserId" SortExpression="LockingUserId" />
            <asp:BoundField DataField="ScanFileURL" HeaderText="ScanFileURL" SortExpression="ScanFileURL" />
            <asp:BoundField DataField="CancelReason" HeaderText="CancelReason" SortExpression="CancelReason" />
            <asp:BoundField DataField="CancelUserId" HeaderText="CancelUserId" SortExpression="CancelUserId" />
            <asp:BoundField DataField="CancelDate" HeaderText="CancelDate" SortExpression="CancelDate" />
            <asp:BoundField DataField="IsMatched" HeaderText="IsMatched" SortExpression="IsMatched" />
        </Columns>
    </asp:GridView>
    <div id="divTop" style="position: absolute; right: 0px; top: 0px; background-color: #000000;
        z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center;
        color: #FFFFFF; width: 100%; height: 1px;">
    </div>
    </form>
</body>
</html>
