<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdvanseSearch.aspx.vb" Inherits="VRUTracking.AdvanseSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir = "rtl">
<head runat="server">
    <title>VRU Software</title>
</head>
<body>
    <form id="form1" runat="server">
      <div>
     <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
    <table>
      <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Header-Leena-3D-PRIVATE.jpg" 
                         />
                </td>
            </tr>
             <tr>
             <td>
             <asp:Menu ID="MainMenu" runat="server" 
                        DynamicHorizontalOffset="2" Font-Bold="True" Font-Names="Arial" 
                        Font-Size="Medium" ForeColor="#000066" Orientation="Horizontal" 
                        StaticSubMenuIndent="10px">
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
             </td>
             </tr>
   </Table>
       <table  align="center" width="100%" 
             style="margin-top: 0px; font-family: Arial; font-size: medium; font-weight: bold;">
<tr>
<td >ادخل رقم الناخب</td>
<td >
    <asp:TextBox ID="txtPerId" runat="server" MaxLength="8"></asp:TextBox><asp:CompareValidator ID="cvPerId" runat="server" 
        ErrorMessage="ادخل ارقام فقط" ControlToValidate="txtPerId" 
        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator></td>
</tr>
<tr>
<td>ادخل رقم مركز التسجيل
   </td>
<td>
    <asp:TextBox ID="txtVrc" runat="server" MaxLength="4"></asp:TextBox> <asp:CompareValidator ID="cvVrc" runat="server" ErrorMessage="ادخل ارقام فقط" 
        ControlToValidate="txtVrc" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator></td>
</tr>
<tr>
<td>ادخل رقم العائلة  
  </td>
<td>
    <asp:TextBox ID="txtFamNo" runat="server" MaxLength="7"></asp:TextBox><asp:CompareValidator ID="cvFamNo" runat="server" ErrorMessage="ادخل ارقام فقط" 
        ControlToValidate="txtFamNo" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator></td>

</tr>
<tr>
<td>الاسم الاول 
  </td>
<td>
    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox> <asp:CompareValidator ID="cvFirstName" runat="server" ErrorMessage="احرف فقط" 
        ControlToValidate="txtFirstName" Operator="DataTypeCheck"></asp:CompareValidator></td>
</tr>
<tr>
<td>اسم الاب
  </td>
<td>
    <asp:TextBox ID="txtFatherName" runat="server"></asp:TextBox>  <asp:CompareValidator ID="cvFatherName" runat="server" ErrorMessage="احرف فقط" 
        ControlToValidate="txtFatherName" Operator="DataTypeCheck"></asp:CompareValidator></td>

</tr>
<tr>
<td>اسم الجد
   </td>
<td >
    <asp:TextBox ID="txtGrandName" runat="server"></asp:TextBox> <asp:CompareValidator ID="cvGrandFather" runat="server" ErrorMessage="احرف فقط" 
        ControlToValidate="txtGrandName" Operator="DataTypeCheck"></asp:CompareValidator></td>
</tr>
<tr>
<td>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>" 
        SelectCommand="AdvanceSearchVoters" SelectCommandType="StoredProcedure" 
        CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtVrc" Name="VRCID" PropertyName="Text" 
                Type="Int16" />
            <asp:ControlParameter ControlID="txtFamNo" Name="FamNo" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="txtPerId" Name="PER_ID" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="txtFirstName" Name="PER_FIRST" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtFatherName" Name="PER_FATHER" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtGrandName" Name="PER_GRAND" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
<td>
    <asp:Button ID="btnSearch" runat="server" Text="بحث" Font-Bold="True" 
        Font-Names="Arial" Font-Size="Medium" />  
    <asp:Button ID="btnNewSearch" runat="server" Text="بحث جديد" Font-Bold="True" 
        Font-Names="Arial" Font-Size="Medium" />  
    <asp:Button ID="btnCancel" runat="server" Text="عودة الى صفحة  البحث" 
        Font-Bold="True" Font-Names="Arial" Font-Size="Medium" />
    </td>
</tr>
<tr><td align="right" colspan="2">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="PER_ID" DataSourceID="SqlDataSource1" BackColor="White" 
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal" style="margin-bottom: 0px">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:BoundField DataField="PER_ID" HeaderText="رقم الناخب" ReadOnly="True" 
                SortExpression="PER_ID" />
            <asp:BoundField DataField="PER_FULLNAME" HeaderText="الاسم الثلاثي" 
                SortExpression="PER_FULLNAME" />
            <asp:BoundField DataField="PER_FAMNO" HeaderText="رقم البطاقة التموينية" 
                SortExpression="PER_FAMNO" />
            <asp:BoundField DataField="VRC_ID" HeaderText="رقم مركز التسجيل" 
                ReadOnly="True" SortExpression="VRC_ID" />
            <asp:BoundField DataField="VRC_OID" HeaderText="رقم مركز التموين" 
                SortExpression="VRC_OID" />
            <asp:BoundField DataField="PC_ID" HeaderText="رقم مركز الاقتراع" 
                SortExpression="PC_ID" ReadOnly="True" />
            <asp:BoundField DataField="PC_NAME" HeaderText="اسم مركز الاقتراع" 
                SortExpression="PC_NAME" />
            <asp:BoundField DataField="PER_PUID" HeaderText="رقم الوكيل" 
                SortExpression="PER_PUID" />
            <asp:BoundField DataField="PER_DOB" HeaderText="تاريخ الميلاد" 
                SortExpression="PER_DOB" />
            <asp:BoundField DataField="PER_STATUS" HeaderText="حالة الناخب" 
                SortExpression="PER_STATUS" />
            <asp:BoundField DataField="GOV_NAME_AR" HeaderText="المحافظة" 
                SortExpression="GOV_NAME_AR" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" BorderStyle="Solid" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
</td></tr>

</table>
      </table>
    </asp:Panel> 
    </div>
    </form>
</body>
</html>
