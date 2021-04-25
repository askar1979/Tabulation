<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="VRUTracking._login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>VRU Software</title>

    <script language="javascript" type="text/javascript">
// <!CDATA[
function CheckBrowser()
{
     // Check Browser Close [X] , Alt+F4 , File -> Close  
     if(window.event.clientX < 0 && window.event.clientY <0)
    {
          //alert('hi')
          
          
          window.open("CleanObjects.aspx");

    }
}

function window_onload() {
javascript:history.go(1)
}

function form1_onsubmit() {
function enableDIV() {
         document.getElementById("divTop").style.zIndex=999
         document.getElementById("divTop").style.height=1000
         document.getElementById("divTop").style.backgroundColor=DEDBD5
         document.getElementById("divTop").innerHTML = 'الرجاء الانتظار بينما ينفذ طلبك'
        }
enableDIV();
}

function window_onunload() {
CheckBrowser();
}

// ]]>
    </script>

    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />
</head>
<body onload="return window_onload()" onunload="return window_onunload()">
    <form id="form1" runat="server" visible="True">
    <div class="divimage">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
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
                            <asp:MenuItem Text="التدقيق" Value="التدقيق" NavigateUrl="~/ListAudit.aspx"></asp:MenuItem>
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
        <asp:Label ID="lblFormName" runat="server" Text="واجهة دخول النظام "></asp:Label>
    </div>
    <div id="signinContainer" runat="server" class="signin">
        <div>
            <asp:Label ID="LB_PS_No" runat="server" Visible="False" ForeColor="#CE8639"></asp:Label>
            <asp:Label ID="lbl_PC_NameAndNo" runat="server" Visible="False" ForeColor="#F00000"></asp:Label>
            <asp:Label ID="PageStatus" runat="server" EnableViewState="False" ForeColor="#F00000"></asp:Label>
        </div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblusername" runat="server" Text="اسم المستخدم: "></asp:Label>&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="كلمة السر:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </td>
            </tr>
        </table>
        <br />
        <div class="buttons">
            <asp:Button ID="btnSignIn" runat="server" Text="دخــول" TabIndex="4" CssClass="login" />
        </div>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPassword"
            ErrorMessage="حروف انكليزية فقط وعلى الاقل خمسة احرف ورقم واحد ولا تزيد عن 30 حرف"
            Font-Bold="True" Font-Names="Arial" Font-Size="Small" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,30})$"></asp:RegularExpressionValidator>
    </div>
    <div id="divTop" style="position: absolute; right: 0px; top: 0px; background-color: #afa29a;
        z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center;
        color: #FFFFFF; width: 100%; height: 1px;">
    </div>
    <br />
    <asp:GridView ID="GV_LoadUser" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId"
        DataSourceID="SDS_LoadUser">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" ReadOnly="True"
                SortExpression="UserId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
            <asp:BoundField DataField="DataEntryGroup" HeaderText="DataEntryGroup" SortExpression="DataEntryGroup" />
            <asp:BoundField DataField="IsIntake" HeaderText="IsIntake" SortExpression="IsIntake" />
            <asp:BoundField DataField="IsEntry" HeaderText="IsEntry" SortExpression="IsEntry" />
            <asp:BoundField DataField="IsSupervisor" HeaderText="IsSupervisor" SortExpression="IsSupervisor" />
            <asp:BoundField DataField="IsScanner" HeaderText="IsScanner" SortExpression="IsScanner" />
            <asp:BoundField DataField="IsArchiver" HeaderText="IsArchiver" SortExpression="IsArchiver" />
            <asp:BoundField DataField="IsAuditor" HeaderText="IsAuditor" SortExpression="IsAuditor" />
            <asp:BoundField DataField="IsManager" HeaderText="IsManager" SortExpression="IsManager" />
            <asp:BoundField DataField="IsController" HeaderText="IsController" SortExpression="IsController" />
            <asp:BoundField DataField="IsCorrector" HeaderText="IsCorrector" SortExpression="IsCorrector" />
            <asp:BoundField DataField="IsAuditReEntry" HeaderText="IsAuditReEntry" SortExpression="IsAuditReEntry" />
            <asp:BoundField DataField="IsAuditManager" HeaderText="IsAuditManager" SortExpression="IsAuditManager" />
            <asp:BoundField DataField="IsLocked" HeaderText="IsLocked" SortExpression="IsLocked" />
            <asp:BoundField DataField="IsAuditBarcod" HeaderText="IsAuditBarcod" SortExpression="IsAuditBarcod" />
            <asp:BoundField DataField="IsBarcodeEntry" HeaderText="IsBarcodeEntry" SortExpression="IsBarcodeEntry" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SDS_LoadUser" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
        ProviderName="<%$ ConnectionStrings:IHEC_VRUConnectionString.ProviderName %>"
        SelectCommand="SELECT UserId, UserName, Password, FullName, DataEntryGroup, IsIntake, IsEntry, IsSupervisor, IsScanner, IsArchiver, IsAuditor, IsManager, IsController, IsCorrector, IsAuditReEntry, IsAuditManager, IsLocked, IsAuditBarcod,IsBarcodeEntry FROM Users WHERE (UserName = @UserName) AND (Password = @Password)"
        UpdateCommand="Update Users Set IsLocked = 1  Where UserName = @UserName ">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUserName" Name="UserName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="UserName" SessionField="sesUserName" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
