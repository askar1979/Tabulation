<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsufficientPermission.aspx.vb" Inherits="VRUTracking._InsufficientPermission" %>

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

function window_onunload() {
CheckBrowser();
}

// ]]>
</script>
    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />
</head>
<body onload="return window_onload()" 
    onunload="return window_onunload()">
    <form id="form1" runat="server">
     <div class="divimage">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" 
             ForeColor="#6B558C" />
    </div>
    
    <div>
        <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
            font-family: Arial; font-size: Medium; font-weight: bold;" align="center">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td align="right">
                    <asp:Menu ID="Menu1" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
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
    <div class="divcenter">
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <table cellspacing="2" cellpadding="3" rules="all" border="1" id="Entry1" 
            style="border: 1px None #D8C898; background-color:#D8C898; font-family:Arial; font-size:Medium; font-weight:bold;">
	       
	        <tr style="background-color:#D4D0C8; font-weight:bold;">
	            <td align="right">
                    &nbsp;</td> 
	        </tr>
	        
	        <tr style="background-color:#F1EFED; font-weight:bold;">
	            <td align="right">
	                <br />
                    <asp:Label ID="Label1" runat="server" 
                        EnableViewState="False" Font-Bold="True" Font-Names="Arial" Font-Size="Large" 
                        ForeColor="Maroon">صلاحية محدودة، الدخول مرفوض</asp:Label><br />
                  
                    <ul>
                       
                      
                         <li>فقط المدخل A يمكنه ادخال الاستمارات اولاً</li>
                         <li>فقط المدخل B يمكنه ادخال الاستمارات ثانياً</li>
                         <li>فقط مشرفي التصحيح يمكنهم التصحيح في الواجهة من خلال الاختيار بين ادخال اول او ادخال ثاني</li>    
                         <li>فقط موظفي التدقيق يمكنهم الوصول الى واجهة التدقيق</li>
                         <li>فقط موظفي الأرشيف يمكنهم الوصول الى واجهة الأرشيف</li>
                        <li>فقط مدراء النظام يمكنهم الوصول الى واجهة ادارة المستخدم</li>
                    </ul> 
	            </td>
	        </tr>
	        <tr style="background-color:#F1EFED; font-weight:bold;">
	            <td align="left" dir="ltr">
	                <br />
                    <asp:Label ID="PageStatus" runat="server" 
                        EnableViewState="False" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" 
                        ForeColor="#FFA4A4">Insufficient Permission</asp:Label><br />
                  
                    <ul>
                        <li style="font-size: x-small; color: #B1B1B1;">Only Intake User can access the intake screen</li>
                        <li style="font-size: x-small; color: #B1B1B1;">Only Correction Team can correct the forms by selecting either entry A or B</li>
                         <li style="font-size: x-small; color: #B1B1B1;">Only Correction Team Supervisor can type the correction</li>
                         <li style="font-size: x-small; color: #B1B1B1;">Only Data Entry A can do the first entry</li>
                         <li style="font-size: x-small; color: #B1B1B1;">Only Data Entry B can do the second entry</li>
                         <li style="font-size: x-small; color: #B1B1B1;">Only Audit User can access the audit screens</li>
                         <li style="font-size: x-small; color: #B1B1B1;">Only Archive users can access the Archive screens</li>
                        <li style="font-size: x-small; color: #B1B1B1;">Only  Database Administrators can access the manage user screen</li>
                    </ul> 
	            </td>
	        </tr>
	    </table>
    </asp:Panel>
    </div>
      
   
   <div id="divTop"  
                
            
        
        style="position: absolute; right: 0px; top: 0px; background-color: #a7b593; z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center; color: #FFFFFF; width: 100%; height: 1px;">
           </div>   
    </form>
       
    </body>
</html>
