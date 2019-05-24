<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NumberConveterWEB.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>This is Number Convertion Page</title>
   <%-- <link href="reset.css" rel="stylesheet" />--%>
    <link type ="text/css" rel="stylesheet" href="Style.css" />
    <style type="text/css">
        #Reset1 {
            width: 85px;
            margin-left: 607px;
        }
        #Reset {
            width: 85px;
            margin-left: 185px;
        }
        .auto-style1 {
            width: 193px;
        }
        .auto-style4 {
            width: 193px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 193px;
            height: 9px;
        }
        .auto-style7 {
            height: 9px;
        }
        .auto-style8 {
            width: 193px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
    </style>
</head>

<body class="body">
<form id="form1" runat="server">
    <div class="container">
        <div class="header">
            
        </div>
        <div class="title">
            <h1>Number Conversion</h1>

        </div>
        <div class="content">
            <div class="mainContent">

                     <table class="table">
                         <tr >
                             <td class="auto-style4"><asp:Label ID="Label1" runat="server" Text="Select Input Type"></asp:Label></td>
                            <td class="auto-style5"><asp:DropDownList ID="inputDropDownList" runat="server" Height="24px"  Width="200px" AutoPostBack="True" Font-Bold="True" Font-Size="Medium" OnTextChanged="inputDropDownList_TextChanged" TabIndex="1">
                                <asp:ListItem>< Select ></asp:ListItem>
                                <asp:ListItem>Binary</asp:ListItem>
                                <asp:ListItem>Decimal</asp:ListItem>
                                <asp:ListItem>Octal</asp:ListItem>
                                <asp:ListItem>Hexadecimal</asp:ListItem>
                             </asp:DropDownList></td>
                         </tr>
                         <tr>
                             <td class="auto-style6"><asp:Label ID="BinaryLabel" runat="server" Text="Binary"></asp:Label></td>
                             <td class="auto-style7"><asp:TextBox ID="BinaryTextBox" runat="server" placeholder="0 or 1 Ex : 1111101000"  Width="200px" style="margin-top: 3px"></asp:TextBox><sub>2</sub>
                                 <%--<asp:RegularExpressionValidator ID="BinaryRegularExpressionValidator" runat="server" ControlToValidate="BinaryTextBox" ErrorMessage="Binary Number is only 0 or 1" Font-Size="Small" ValidationExpression="^[0-1]*$" Width="300px" ForeColor="#FF3300" style="margin-left: 10px"></asp:RegularExpressionValidator>--%>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style1"><asp:Label ID="DecimalLabel" runat="server" Text="Decimal"></asp:Label></td>
                             <td><asp:TextBox ID="DecimalTextBox" runat="server" placeholder="0 to 9 Ex : 1000" Width="200px" ></asp:TextBox><sub>10</sub>
                                 <%--<asp:RegularExpressionValidator ID="DecimalRegularExpressionValidator" runat="server" ControlToValidate="DecimalTextBox" ErrorMessage="Decimal Number is only 0 to 9" Font-Size="Small" ValidationExpression="^[0-9]*$" Width="300px" ForeColor="#FF3300" style="margin-left: 10px"></asp:RegularExpressionValidator>--%>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style8"><asp:Label ID="OctalLabel" runat="server" Text="Octal"></asp:Label></td>
                             <td class="auto-style9"><asp:TextBox ID="OctalTextBox" runat="server" placeholder="0 to 7 Ex : 1750" Width="200px"></asp:TextBox><sub>8</sub>
                                 <%--<asp:RegularExpressionValidator ID="OctalRegularExpressionValidator" runat="server" ControlToValidate="OctalTextBox" ErrorMessage="Octal Number is only 0 to 7" Font-Size="Small" ValidationExpression="^[0-7]*$" Width="300px" ForeColor="#FF3300" style="margin-left: 10px"></asp:RegularExpressionValidator>--%>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style1"><asp:Label ID="HexadecimalLabel" runat="server" Text="Hexadecimal"></asp:Label></td>
                             <td><asp:TextBox ID="HexadecimalTextBox" runat="server" placeholder="0 to 9 and ABCDEF Ex : 3EB" Width="200px"></asp:TextBox><sub>16</sub>
                                 <%--<asp:RegularExpressionValidator ID="HexadecimalRegularExpressionValidator" runat="server" ControlToValidate="HexaDecimalTextBox" ErrorMessage="Hexadecimal Number is only 0 to 9 and A to F" Font-Size="Small" ValidationExpression="^[0-9a-fA-F]*$" Width="300px " ForeColor="#FF3300" style="margin-left: 10px"></asp:RegularExpressionValidator>--%>
                             </td>
                         </tr>
                         
                     </table>

                     <asp:Button ID="resetButton" runat="server" type="reset" Text="Reset" OnClick="resetButton_Click" style="margin-left: 159px" Width="85px" TabIndex="3" />
                    <asp:Button ID="SaveButton" runat="server" type="submit" Text="Calculate" style="margin-left: 15px" Width="85px" OnClick="SaveButton_Click" TabIndex="2" />
               
                
            </div> 
        </div>
        <div class="history">
            <asp:Button ID="historyButton" runat="server" Text="Show History" OnClick="historyButton_Click" />
           
            <div class="Data">
                 <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" Height="203px" Width="670px" HorizontalAlign="Center" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                     <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="22px" Font-Names="Arial Narrow" Height="30px" Wrap="False" VerticalAlign="Middle" />
                     <AlternatingRowStyle BackColor="#CCCCCC" />
 				            <Columns>
					            <asp:BoundField DataField="Binary" HeaderText="Binary" />
					            <asp:BoundField DataField="Decimal" HeaderText="Decimal" />
					            <asp:BoundField DataField="Octal" HeaderText="Octal" />
					            <asp:BoundField DataField="HexaDecimal" HeaderText="Hexadecimal" />
				            </Columns>
                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#808080" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#383838" />
                 </asp:GridView>
             </div>

       </div>
        <div class="footer">
                &copy Number conversion , Contract :  <a href="https://www.fb.com/sharisroy" target="_blank">Haris Chandra Roy</a>
          </div>
    </div>
    </form>
</body>
</html>


