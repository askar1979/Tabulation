<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FormStatus.aspx.vb" Inherits="VRUTracking._FormStatus" %>

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
<body bgcolor="#fffff2" onload="return window_onload()">
    <form id="form1" runat="server" onsubmit="return form1_onsubmit()">
    <asp:SqlDataSource ID="SDS_GVFormStatus" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
        
        
        SelectCommand="SELECT TrackingId, Barcode, ScanUserId, ScanDate, Entry1UserId, Entry1Date, Entry2UserId, Entry2Date, CorrectionUserId, CorrectionDate, AuditUserId, AuditDate, ArchiveUserId, ArchiveDate, RandomCheckUserId, RandomCheckDate, AuditConsideredUserId, AuditOpenReEntry, AuditRemark, VRValidationCaseId, FormStatus, FormStatusUserId, FormStatusReasonId, IsLocked, LockingUserId, ScanFileURL, CancelReason, CancelUserId, CancelDate, IsMatched, RemoveCount, AuditBarcodUserId, AuditBarcodDate, BarcodeEntryUserId, BarcodeEntryDate FROM Tracking WHERE (Barcode = @Barcode)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBarCode" Name="Barcode" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GV_Tracking" runat="server" AutoGenerateColumns="False" DataKeyNames="TrackingId,FormStatus,RandomCheckUserId"
        DataSourceID="SDS_GVFormStatus" Style="position: absolute; top: 0px; right: 1000px"
        Visible="False">
        <Columns>
            <asp:BoundField DataField="TrackingId" HeaderText="TrackingId" InsertVisible="False"
                ReadOnly="True" SortExpression="TrackingId" />
            <asp:BoundField DataField="Barcode" HeaderText="Barcode" 
                SortExpression="Barcode" />
            <asp:BoundField DataField="ScanUserId" HeaderText="ScanUserId" 
                SortExpression="ScanUserId" />
            <asp:BoundField DataField="ScanDate" HeaderText="ScanDate" 
                SortExpression="ScanDate" />
            <asp:BoundField DataField="Entry1UserId" HeaderText="Entry1UserId" 
                SortExpression="Entry1UserId" />
            <asp:BoundField DataField="Entry1Date" HeaderText="Entry1Date" 
                SortExpression="Entry1Date" />
            <asp:BoundField DataField="Entry2UserId" HeaderText="Entry2UserId" 
                SortExpression="Entry2UserId" />
            <asp:BoundField DataField="Entry2Date" HeaderText="Entry2Date" 
                SortExpression="Entry2Date" />
            <asp:BoundField DataField="CorrectionUserId" HeaderText="CorrectionUserId" 
                SortExpression="CorrectionUserId" />
            <asp:BoundField DataField="CorrectionDate" HeaderText="CorrectionDate" 
                SortExpression="CorrectionDate" />
            <asp:BoundField DataField="AuditUserId" HeaderText="AuditUserId" 
                SortExpression="AuditUserId" />
            <asp:BoundField DataField="AuditDate" HeaderText="AuditDate" 
                SortExpression="AuditDate" />
            <asp:BoundField DataField="ArchiveUserId" HeaderText="ArchiveUserId" 
                SortExpression="ArchiveUserId" />
            <asp:BoundField DataField="ArchiveDate" HeaderText="ArchiveDate" 
                SortExpression="ArchiveDate" />
            <asp:BoundField DataField="RandomCheckUserId" HeaderText="RandomCheckUserId" 
                SortExpression="RandomCheckUserId" />
            <asp:BoundField DataField="RandomCheckDate" HeaderText="RandomCheckDate" 
                SortExpression="RandomCheckDate" />
            <asp:BoundField DataField="AuditConsideredUserId" 
                HeaderText="AuditConsideredUserId" SortExpression="AuditConsideredUserId" />
            <asp:CheckBoxField DataField="AuditOpenReEntry" HeaderText="AuditOpenReEntry" 
                SortExpression="AuditOpenReEntry" />
            <asp:BoundField DataField="AuditRemark" HeaderText="AuditRemark"
                SortExpression="AuditRemark" />
            <asp:BoundField DataField="VRValidationCaseId" HeaderText="VRValidationCaseId" 
                SortExpression="VRValidationCaseId" />
            <asp:BoundField DataField="FormStatus" HeaderText="FormStatus" 
                SortExpression="FormStatus" />
            <asp:BoundField DataField="FormStatusUserId" HeaderText="FormStatusUserId" 
                SortExpression="FormStatusUserId" />
            <asp:BoundField DataField="FormStatusReasonId" HeaderText="FormStatusReasonId" 
                SortExpression="FormStatusReasonId" />
            <asp:CheckBoxField DataField="IsLocked" HeaderText="IsLocked" 
                SortExpression="IsLocked" />
            <asp:BoundField DataField="LockingUserId" HeaderText="LockingUserId" 
                SortExpression="LockingUserId" />
            <asp:BoundField DataField="ScanFileURL" HeaderText="ScanFileURL" 
                SortExpression="ScanFileURL" />
            <asp:BoundField DataField="CancelReason" HeaderText="CancelReason" 
                SortExpression="CancelReason" />
            <asp:BoundField DataField="CancelUserId" HeaderText="CancelUserId" 
                SortExpression="CancelUserId" />
            <asp:BoundField DataField="CancelDate" HeaderText="CancelDate" 
                SortExpression="CancelDate" />
            <asp:CheckBoxField DataField="IsMatched" HeaderText="IsMatched" 
                SortExpression="IsMatched" />
            <asp:BoundField DataField="RemoveCount" HeaderText="RemoveCount" 
                SortExpression="RemoveCount" />
            <asp:BoundField DataField="AuditBarcodUserId" HeaderText="AuditBarcodUserId" 
                SortExpression="AuditBarcodUserId" />
            <asp:BoundField DataField="AuditBarcodDate" HeaderText="AuditBarcodDate" 
                SortExpression="AuditBarcodDate" />
            <asp:BoundField DataField="BarcodeEntryUserId" HeaderText="BarcodeEntryUserId" 
                SortExpression="BarcodeEntryUserId" />
            <asp:BoundField DataField="BarcodeEntryDate" HeaderText="BarcodeEntryDate" 
                SortExpression="BarcodeEntryDate" />
        </Columns>
    </asp:GridView>
    <div class="divimage">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
    </div>
    <div>
        <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
            font-family: Arial; font-size: Medium; font-weight: bold;" align="center">
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
                            <asp:MenuItem NavigateUrl="~/intake.aspx" Text="الاستلام" Value="ادارة الملفات">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/BarcodeEntry.aspx" Text="ادخال الباركود" Value="ادخال الباركود">
                            </asp:MenuItem>
                            <asp:MenuItem Text="ادخال الاستمارة" Value="ادخال الاستمارة">
                                <asp:MenuItem NavigateUrl="~/StartEntryA.aspx" Text="الادخال الاول" Value="الادخال الاول">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/StartEntryB.aspx" Text="الادخال الثاني" Value="الادخال الثاني">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ListUnMatch.aspx" Text="التصحيح" Value="التصحيح"></asp:MenuItem>
                            <asp:MenuItem Text="واجهة المشرف" Value="واجهة المشرف">
                                <asp:MenuItem Text="مشرف الادخال الاول" Value="مشرف الادخال الاول" NavigateUrl="~/SupervisorA.aspx">
                                </asp:MenuItem>
                                <asp:MenuItem Text="مشرف الادخال الثاني" Value="مشرف الادخال الثاني" NavigateUrl="~/SupervisorB.aspx">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Super_Correction.aspx" Text="مشرف التصحيح" Value="مشرف التصحيح">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="حالة الاستمارة" Value="Scan" NavigateUrl="~/FormStatus.aspx">
                            </asp:MenuItem>
                            <asp:MenuItem Text="عرض الاستمارة" Value="عرض الاستمارة" NavigateUrl="~/view-form222.aspx">
                            </asp:MenuItem>
                            <asp:MenuItem Text="التدقيق" Value="التدقيق" NavigateUrl="~/ListAudit.aspx">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Archive.aspx" Text="الارشيف" Value="Archive"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ManageUser.aspx" Text="ادارة المستخدم" Value="Manage User">
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
        <asp:Label ID="lblFormName" runat="server" Text="واجهة حالة الاستمارة "></asp:Label>
    </div>
    <div>
        <%--<div class="PageStatus">
            <asp:Label ID="OperationStatus" runat="server" EnableViewState="False"></asp:Label><br />
        </div>--%>
        <div class="barcode-container">
            <asp:Label ID="lbBarCode" runat="server" Text="رقم الباركود"></asp:Label>
            <asp:TextBox ID="txtBarCode" runat="server" MaxLength="8" AutoCompleteType="Disabled"
                TabIndex="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFV_BarCodeNo" runat="server" ControlToValidate="txtBarCode"
                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="REV_BarCode" runat="server" ControlToValidate="txtBarCode"
                ErrorMessage="ارقام فقط - ثمانية مراتب" ValidationExpression="[0-9]{8,8}" Font-Bold="True"
                Font-Names="Arial" Font-Size="Large"></asp:RegularExpressionValidator>
            <div class="buttons">
                <asp:Button ID="btn_checkStatus" runat="server" Text="عرض حالة الاستمارة" TabIndex="2"
                    CssClass="save" />
            </div>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_Scan" runat="server" Enabled="False" 
                            Text="ادخال الباركود" EnableViewState="False"
                            CssClass="chexkbox" />
                    </td>
                    <td>
                        <asp:Label ID="lblScanBy" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_FirstEntered" runat="server" Enabled="False" Text="ادخال A"
                            EnableViewState="False" CssClass="chexkbox" />
                    </td>
                    <td>
                        <asp:Label ID="lblFirstEntryBy" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_SecondEntered" runat="server" Enabled="False" Text="ادخال B" EnableViewState="False"
                            CssClass="chexkbox" />
                    </td>
                    <td>
                        <asp:Label ID="lblSecondEntryBy" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chk_IsMatched" runat="server" Enabled="False" Text="متطابقة" EnableViewState="False"
                            CssClass="chexkbox" />
                    </td>
                </tr>
                <tr>
                <td>
                      <asp:CheckBox ID="chk_Modified" runat="server" Enabled="False" Text="تصحيح الاستمارة C" EnableViewState="False"
                CssClass="chexkbox" />
                </td>
                <td>
                 <asp:Label ID="lblModifiedBy" runat="server" Text=""></asp:Label>
                </td>
                <td>
                 <asp:CheckBox ID="chk_RondomChecked" runat="server" Enabled="False" Text="التدقيق العشوائي"
                EnableViewState="False"  CssClass="chexkbox" />
                </td>
                <td>
                <asp:Label ID="lblRondomCheckedBy" runat="server" Text=""></asp:Label>
                </td>
                <td>
                <asp:CheckBox ID="chk_Archive" runat="server" Enabled="False" Text="الارشيف" EnableViewState="False"
                CssClass="chexkbox" />
                </td>
                <td>
                 <asp:Label ID="lblArchiveBy" runat="server" Text=""></asp:Label>
                </td>
                </tr>
            </table>
                   
           
        </div>
    </div>
    <%-- <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <table cellspacing="2" cellpadding="3" rules="all" border="1" id="Entry1" style="border: 1px None #C0C0C0;
            background-color: #808080; font-family: Arial; font-size: Medium; font-weight: bold;">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Header-Leena-3D-PRIVATE.jpg"
                        Width="900" />
                </td>
            </tr>
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td>
                    <asp:Menu ID="MainMenu" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
                        Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Orientation="Horizontal"
                        StaticSubMenuIndent="10px">
                        <StaticSelectedStyle BackColor="#507CD1" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                        <DynamicMenuStyle BackColor="#B5C7DE" />
                        <DynamicSelectedStyle BackColor="#507CD1" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                        <Items>
                            <asp:MenuItem NavigateUrl="~/intake.aspx" Text="الاستلام" Value="ادارة الملفات">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/BarcodeEntry.aspx" Text="ادخال الباركود" Value="ادخال الباركود">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/AuditBarcode.aspx" Text="تدقيق الباركود" Value="تدقيق الباركود">
                            </asp:MenuItem>
                            <asp:MenuItem Text="ادخال الاستمارة" Value="ادخال الاستمارة">
                                <asp:MenuItem NavigateUrl="~/StartEntryA.aspx" Text="الادخال الاول" Value="الادخال الاول">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/StartEntryB.aspx" Text="الادخال الثاني" Value="الادخال الثاني">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ListUnMatch.aspx" Text="التصحيح" Value="التصحيح"></asp:MenuItem>
                            <asp:MenuItem Text="واجهة المشرف" Value="واجهة المشرف">
                                <asp:MenuItem Text="مشرف الادخال الاول" Value="مشرف الادخال الاول"></asp:MenuItem>
                                <asp:MenuItem Text="مشرف الادخال الثاني" Value="مشرف الادخال الثاني"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Super_Correction.aspx" Text="مشرف التصحيح" Value="مشرف التصحيح">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FormStatus.aspx" Text="حالة الاستمارة" Value="Scan">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/view-form222.aspx" Text="عرض الاستمارة" Value="عرض الاستمارة">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Archive.aspx" Text="الارشيف" Value="Archive"></asp:MenuItem>
                            <asp:MenuItem Selectable="False" Text="التدقيق" Value="التدقيق">
                                <asp:MenuItem NavigateUrl="~/ViewDataVR.aspx" Text="التدقيق" Value="التدقيق"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/AdvanseSearch.aspx" Text="بحث متقدم" Value="بحث متقدم">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/RecieveAudit.aspx" Text="استلام استمارات التدقيق" Value="استلام استمارات التدقيق">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/listAuditCase.aspx" Text="عرض حالات التدقيق" Value="المحطات التي فيها مشاكل">
                                </asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ManageUser.aspx" Text="ادارة المستخدم" Value="Manage User">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/changePass.aspx" Text="تغيير كلمة السر" Value="Change Password">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/logout.aspx" Text="الخروج" Value="Log out"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </td>
            </tr>
            <tr style="background-color: #F1EFED; font-weight: bold;">
                <td align="center">
                    <br />
                    <asp:Label ID="OperationStatus" runat="server" EnableViewState="False" Font-Bold="True"
                        Font-Names="Arabic Transparent" Font-Size="XX-Large" ForeColor="#2B2A8E"></asp:Label><br />
                    <br />
                </td>
            </tr>
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td>
                    <br />
                    <br />
                    <table cellspacing="2" cellpadding="3" border="0" id="Child" style="font-family: Arial;
                        font-size: Medium; font-weight: bold;">
                        <tr style="background-color: #D4D0C8; font-weight: bold;">
                            <td>
                                <asp:Label ID="lbBarCode" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                    Style="text-align: left;" Text="رقم الباركود" ForeColor="Black" Width="220px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBarCode" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                    MaxLength="8" Columns="20" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RFV_BarCodeNo" runat="server" ControlToValidate="txtBarCode"
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
                                <asp:Button ID="btn_checkStatus" runat="server" Font-Bold="True" Font-Names="Arial"
                                    Font-Size="Large" Text="عرض حالة الاستمارة" TabIndex="2" Width="174px" BackColor="#8872A9"
                                    ForeColor="#E8F9FF" />
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
                <td align="right">
                    <br />
                    <asp:CheckBox ID="chk_Scan" runat="server" Enabled="False" Font-Bold="True" Font-Names="Arial"
                        Font-Size="X-Large" ForeColor="#990033" Text="المسح الضوئي" EnableViewState="False"
                        BackColor="#D9D9EC" CssClass="chexkbox" />
                    <asp:Label ID="lblScanBy" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:CheckBox ID="chk_FirstEntered" runat="server" Enabled="False" Font-Bold="True"
                        Font-Names="Arial" Font-Size="X-Large" ForeColor="#990033" Text="ادخال A" EnableViewState="False"
                        BackColor="#D9D9EC" CssClass="chexkbox" />
                    <asp:Label ID="lblFirstEntryBy" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:CheckBox ID="chk_SecondEntered" runat="server" Enabled="False" Font-Bold="True"
                        Font-Names="Arial" Font-Size="X-Large" ForeColor="#990033" Text="ادخال B" EnableViewState="False"
                        BackColor="#D9D9EC" CssClass="chexkbox" />
                    <asp:Label ID="lblSecondEntryBy" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:CheckBox ID="chk_IsMatched" runat="server" Enabled="False" Font-Bold="True"
                        Font-Names="Arial" Font-Size="X-Large" ForeColor="#990033" Text="متطابقة" EnableViewState="False"
                        BackColor="#D9D9EC" CssClass="chexkbox" />
                    <br />
                    <asp:CheckBox ID="chk_Modified" runat="server" Enabled="False" Font-Bold="True" Font-Names="Arial"
                        Font-Size="X-Large" ForeColor="#990033" Text="تصحيح الاستمارة C" EnableViewState="False"
                        BackColor="#D9D9EC" CssClass="chexkbox" />
                    <asp:Label ID="lblModifiedBy" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:CheckBox ID="chk_RondomChecked" runat="server" Enabled="False" Font-Bold="True"
                        Font-Names="Arial" Font-Size="X-Large" ForeColor="#990033" Text="التدقيق العشوائي"
                        EnableViewState="False" BackColor="#D9D9EC" CssClass="chexkbox" />
                    <asp:Label ID="lblRondomCheckedBy" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:CheckBox ID="chk_Archive" runat="server" Enabled="False" Font-Bold="True" Font-Names="Arial"
                        Font-Size="X-Large" ForeColor="#990033" Text="الارشيف" EnableViewState="False"
                        BackColor="#D9D9EC" CssClass="chexkbox" />
                    <asp:Label ID="lblArchiveBy" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>--%>
    <div id="divTop" style="position: absolute; right: 0px; top: 0px; background-color: #000000;
        z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center;
        color: #FFFFFF; width: 100%; height: 1px;">
    </div>
    </form>
</body>
</html>
