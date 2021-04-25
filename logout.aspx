<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="logout.aspx.vb" Inherits="VRUTracking._logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>VRU Software</title>

    <script language="javascript" type="text/javascript">
// <!CDATA[
function window_onload() {
javascript:history.go(1)
}

function ButtonCloseIE_onclick() {
window.close();
}

// ]]>
    </script>

    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />
   </head>
<body onload="return window_onload()">
    <form id="form1" runat="server">
     <div class="divimage">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/VRU_Header.jpg" 
             ForeColor="#6B558C" />
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
    <asp:Label ID="lblFormName" runat="server" Text="واجهة الخروج من النظام "></asp:Label>
    <div class="PageStatus">
        <asp:Label ID="PageStatus" runat="server" EnableViewState="False"></asp:Label>
        
    </div>
    
    
    <div class="formName">
        <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Names="Arial"
            Font-Size="Large" PostBackUrl="~/login.aspx">اضغط هنا للعودة الى الصفحة 
        المستخدمة</asp:LinkButton>
        <br />
    </div>
    <%-- <table cellspacing="2" cellpadding="3" border="1" id="Entry1"  
            
            style="border: 1px None #D6C8A7; background-color:#D6C8A7; font-family:Arial; font-size:Medium; font-weight:bold;" 
            align="center">
	        <tr style="background-color:#D4D0C8; font-weight:bold;">
	            <td class="style1"> 
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/LogoIHEC.jpg" 
            Height="208px" Width="643px"/>
	            </td>
	        </tr>
	        <tr style="background-color:#D4D0C8; font-weight:bold;">
	            <td align="right">
                    &nbsp;</td> 
	        </tr>
	        <tr style="background-color:#F1EFED; font-weight:bold;">
	            <td align="center">
	                <br /><br />
                    <asp:Label ID="PageStatus" runat="server" 
                        EnableViewState="False" Font-Bold="True" Font-Names="Arial" Font-Size="Large" 
                        ForeColor="Maroon"></asp:Label><br /> <br /><br />
	            </td>
	        </tr>
	        <tr style="background-color:#D6C8A7; font-weight:bold;">    
	            <td align="center"><br /><br />
	                 <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Child" style="font-family:Arial; font-size:Medium; font-weight:bold; background-color: #D6C8A7;">
	                    	                    
	                    <tr style="font-weight:bold;">
	                        <td align="center">
	                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" 
                                    Font-Names="Arial" Font-Size="Large" PostBackUrl="~/login.aspx">اضغط هنا للعودة الى الصفحة المستخدمة</asp:LinkButton>
	                            <br />
	                            <br />
	                            <br />
	                        </td>
	                        
	                    </tr>
	                    
	                 </table><br /><br />
	            </td>
	        </tr>
	        <tr style="background-color:#F1EFED; font-weight:bold;">
	            <td align="center"><br />
                    <br /><br /><br /><br /><br />
	            </td>
	        </tr>
	    </table>
  --%>
    <div id="divTop" style="position: absolute; right: 375px; top: 0px; background-color: #afa29a;
        z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center;
        color: #FFFFFF; width: 100%; height: 0px;">
    </div>
    </form>
</body>
</html>
