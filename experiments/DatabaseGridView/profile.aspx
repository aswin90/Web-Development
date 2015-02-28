<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Profile</h1>
        <a href="wall.aspx?ownerUsername=<%= Request["username"] %>" class="btn btn-primary btn-block">Add a comment</a>
        <p>

            <asp:GridView cssClass="table" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    
                    <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:aswin90ConnectionString1 %>"
                DeleteCommand="DELETE FROM [user] WHERE [username] = @username" 
                InsertCommand="INSERT INTO [user] ([username], [password], [firstName], [lastName], [email], [dob], [sponsor], [sponsored]) VALUES (@username, @password, @firstName, @lastName, @email, @dob, @sponsor, @sponsored)" 
                ProviderName="<%$ ConnectionStrings:aswin90ConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [username], [password], [firstName], [lastName], [email], [dob], [sponsor], [sponsored] FROM [user] WHERE username=@username" UpdateCommand="UPDATE [user] SET [password] = @password, [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [dob] = @dob, [sponsor] = @sponsor, [sponsored] = @sponsored WHERE [username] = @username">
                <DeleteParameters>
                    <asp:Parameter Name="username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="dob" Type="DateTime" />
                    <asp:Parameter Name="sponsor" Type="Boolean" />
                    <asp:Parameter Name="sponsored" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="dob" Type="DateTime" />
                    <asp:Parameter Name="sponsor" Type="Boolean" />
                    <asp:Parameter Name="sponsored" Type="Boolean" />
                    <asp:Parameter Name="username" Type="String" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="username" QueryStringField="username" />
                </SelectParameters>
            </asp:SqlDataSource>

        </p>
    </div>
    </form>
</body>
</html>
