<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="changePass.aspx.vb" Inherits="VRUTracking._changePass" %>

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
         document.getElementById("divTop").style.height=1200
         document.getElementById("divTop").innerHTML = 'الرجاء الانتظار بينما ينفذ طلبك'
        }
enableDIV();
}

// ]]>
    </script>

    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />
</head>
<body onload="return window_onload()">
    <form id="form1" runat="server" onsubmit="return form1_onsubmit()">
    <div class="divimage">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
    </div>
    <div>
        <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
            font-family: Arial; font-size: Medium; font-weight: bold;" align="center">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td align="right">
                    <asp:Menu ID="Menu2" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
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
        <asp:Label ID="lblFormName" runat="server" Text="واجهة تغيير كلمة السر"></asp:Label>
    </div>
    <div class="PageStatus">
        <asp:Label ID="PageStatus" runat="server" EnableViewState="False" 
            ForeColor="#F00000" Visible="False"></asp:Label>
    </div>
    <div class="changepassword">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblusername" runat="server" Text="اسم المستخدم"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="20" TabIndex="1" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="*" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="كلمة السر القديمة"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="20" TabIndex="2"
                        TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="*" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword"
                        ControlToValidate="txtPasswordNew" ErrorMessage="كلمة السر الجديدة والقديمة متطابقة"
                        Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Operator="NotEqual"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPasswordNew" runat="server" Text="كلمة السر الجديدة"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPasswordNew" runat="server"  MaxLength="20" TabIndex="3"
                        TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPasswordNew"
                        ErrorMessage="*" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPasswordNew"
        ErrorMessage="حروف انكليزية فقط وعلى الاقل خمسة احرف ورقم واحد ولا تزيد عن 30 حرف"
        Font-Bold="True" Font-Names="Arial" Font-Size="Small"  ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,30})$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPasswordConfirm" runat="server" 
                        Text="اعادة كلمة السر الجديدة"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPasswordConfirm" runat="server"  MaxLength="20" TabIndex="4"
                        TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPasswordConfirm"
                        ErrorMessage="*" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPasswordNew"
                        ControlToValidate="txtPasswordConfirm" ErrorMessage="كلمة السر الجديدة غير متطابقة"
                        Font-Bold="True" Font-Names="Arial" Font-Size="Medium"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <div class="buttons">
            <asp:Button ID="Userlogin" runat="server" TabIndex="5" Text="تغيير" 
                Font-Bold="True" CssClass="ok" />
        </div>
    </div>
    
    <div align="center">
     <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Arial"
        Font-Size="Large" PostBackUrl="~/login.aspx" CausesValidation="False" Visible="False">اضغط هنا للعودة الى الصفحة المستخدمة</asp:LinkButton>
    </div>
    <%--   
    <asp:Menu ID="Menu1" runat="server" 
                        DynamicHorizontalOffset="2" Font-Bold="True" Font-Names="Arial" 
                        Font-Size="Medium" ForeColor="#000066" Orientation="Horizontal" 
                        StaticSubMenuIndent="10px" 
           style="position: absolute; top: 80px; right: 26px">
                        <StaticSelectedStyle BackColor="#507CD1" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                        <DynamicMenuStyle BackColor="#B5C7DE" />
                        <DynamicSelectedStyle BackColor="#507CD1" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
        <Items>
            <asp:MenuItem NavigateUrl="~/intake.aspx" Text="الاستلام" 
                Value="ادارة الملفات">
            </asp:MenuItem>
            <asp:MenuItem Text="حالة الاستمارة" Value="Scan" 
                NavigateUrl="~/FormStatus.aspx">
            </asp:MenuItem>
            <asp:MenuItem Text="عرض الاستمارة" 
                Value="عرض الاستمارة" NavigateUrl="~/view-form222.aspx">
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Archive.aspx" Text="الارشيف" Value="Archive">
            </asp:MenuItem>
            <asp:MenuItem Text="التدقيق" Value="التدقيق" Selectable="False">
                <asp:MenuItem Text="التدقيق" Value="التدقيق" 
                    NavigateUrl="~/ViewDataVR.aspx"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/AdvanseSearch.aspx" Text="بحث متقدم" 
                    Value="بحث متقدم"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/RecieveAudit.aspx" Text="استلام استمارات التدقيق" 
                    Value="استلام استمارات التدقيق"></asp:MenuItem>
                <asp:MenuItem Text="عرض حالات التدقيق" Value="المحطات التي فيها مشاكل" 
                    NavigateUrl="~/listAuditCase.aspx"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/ManageUser.aspx" Text="ادارة المستخدم" 
                Value="Manage User"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/changePass.aspx" Text="تغيير كلمة السر" 
                Value="Change Password"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/logout.aspx" Text="الخروج" Value="Log out">
            </asp:MenuItem>
        </Items>
    </asp:Menu>
    
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Header-Leena-3D-PRIVATE.jpg" 
        style="position: absolute; right: 1px; top: 2px; width: 900px;" />--%>
   
    
    <%--<asp:Label ID="PageStatus" runat="server" Font-Bold="True" Font-Names="Arial" 
        Font-Size="Medium" ForeColor="Maroon" 
        style="position: absolute; right: 291px; top: 286px;"></asp:Label>--%>
    <div id="divTop" style="border: 1px solid #FFFFFF; background-color: #E7E7FF; height: 1px;
        z-index: -2; font-family: Arial; font-size: x-large; font-weight: bold; text-align: center;
        color: #006600; position: absolute; top: 0px; right: 0px; width: 1150px;">
    </div>
    </form>
</body>
</html>
