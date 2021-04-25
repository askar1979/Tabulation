<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListAudit.aspx.vb" Inherits="VRUTracking._ListAudit" %>

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
    <form id="form1" runat="server">
    <div class="divimage">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
    </div>
    <div class="divMenu">
        <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
            font-family: Arial; font-size: Medium; font-weight: bold;" align="right">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td align="right">
                    <asp:Menu ID="MainMenu0" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
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
                            <asp:MenuItem Text="حالة الاستمارة" Value="Scan" NavigateUrl="~/FormStatus.aspx">
                            </asp:MenuItem>
                            <asp:MenuItem Text="عرض الاستمارة" Value="عرض الاستمارة" NavigateUrl="~/view-form222.aspx">
                            </asp:MenuItem>
                            <asp:MenuItem Text="التدقيق" Value="التدقيق" Selectable="False">
                                <asp:MenuItem Text="التدقيق" Value="التدقيق" NavigateUrl="~/ViewDataVR.aspx"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/AdvanseSearch.aspx" Text="بحث متقدم" Value="بحث متقدم">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/RecieveAudit.aspx" Text="استلام استمارات التدقيق" Value="استلام استمارات التدقيق">
                                </asp:MenuItem>
                                <asp:MenuItem Text="عرض حالات التدقيق" Value="المحطات التي فيها مشاكل" NavigateUrl="~/listAuditCase.aspx">
                                </asp:MenuItem>
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
        <asp:Label ID="lblFormName" runat="server" Text="واجهة التدقيق"></asp:Label>
    </div>
    <div class="divMenu">
    <table cellspacing="2" cellpadding="3" border="0" id="Entry1" style="border: 0px None #D6C8A7;
        background-color: #D6C8A7; font-family: Arial; font-size: Medium; font-weight: bold;" >
       
                    
            <tr>
                <td>
                    رقم الباركود
                </td>
                <td>
                    <asp:TextBox ID="txtBarcode" runat="server" MaxLength="8"></asp:TextBox>
                    <asp:CompareValidator ID="cvPerId" runat="server" ErrorMessage="ادخل ارقام فقط" ControlToValidate="txtBarcode"
                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="بحث" Font-Bold="True" Font-Names="Arial"
                        Font-Size="Medium" />
                    <asp:Button ID="btnSearchAll" runat="server" Text="عرض الكل" Font-Bold="True" Font-Names="Arial"
                        Font-Size="Medium" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="6" style="background-color: #F1EFED; font-weight: bold;">
                    <asp:GridView ID="GV_LoadAudit" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="TrackingId" DataSourceID="SDS_LoadTracking" PageSize="15" AllowSorting="True">
                        <Columns>
                            <asp:CommandField SelectText="اختيار" ShowSelectButton="True" />
                            <asp:BoundField DataField="TrackingId" HeaderText="TrackingId" InsertVisible="False"
                                ReadOnly="True" SortExpression="TrackingId" Visible="False" />
                            <asp:BoundField DataField="Barcode" HeaderText="رقم الباركود" SortExpression="Barcode" />
                            <asp:BoundField DataField="CancelReason" HeaderText="سبب الالغاء" SortExpression="CancelReason" />
                            <asp:BoundField DataField="CancelUserId" HeaderText="الشخص الذي قام بإلغاءه" SortExpression="CancelUserId" />
                            <asp:BoundField DataField="CancelDate" HeaderText="تاريخ الالغاء" SortExpression="CancelDate" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="buttons">
                        <asp:Button ID="btn_ReEntry" runat="server" CssClass="ok" Text="اعادة ادخال" CausesValidation="False" />
                        <asp:Button ID="btn_Reject" runat="server" CssClass="Reject" Text="الاستمارة مرفوضة"
                            CausesValidation="False" />
                    </div>
                </td>
                <td dir="ltr">
                    <asp:Button ID="btnExcel" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                        Text="Excel" />
                </td>
            </tr>
    </table>
    </div>
    
    <div id="divTop" style="position: absolute; right: 0px; top: 0px; background-color: #afa29a;
        z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center;
        color: #FFFFFF; width: 100%; height: 1px;">
    </div>
    <br />
    <asp:SqlDataSource ID="SDS_ListReasons" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
        SelectCommand="SELECT * FROM [ListReason] where Reasonid &gt; 3"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_LoadTracking" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
        SelectCommand="usp_listAudit" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:IHEC_VRUConnectionString.ProviderName %>"
        CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBarcode" Name="Barcode" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
