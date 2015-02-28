<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Comments</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .top-buffer { margin-top:20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container top-buffer">
    <a href="post.aspx?ownerUsername=<%= Request["ownerUsername"] %>" class="btn btn-primary btn-block">Post a Comment</a>
    <h1>Comments</h1>

        <p>
            <asp:GridView ID="GridView1" cssClass="table" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="ownerUsername" HeaderText="ownerUsername" SortExpression="ownerUsername" />
                    <asp:BoundField DataField="authorUsername" HeaderText="authorUsername" SortExpression="authorUsername" />
                    <asp:HyperLinkField DataNavigateUrlFields="authorUsername" DataNavigateUrlFormatString="profile.aspx?username={0}" DataTextField="authorUsername" DataTextFormatString="Author: {0}" HeaderText="Authors" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:aswin90ConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Post] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Post] ([title], [content], [date], [ownerUsername], [authorUsername]) VALUES (@title, @content, @date, @ownerUsername, @authorUsername)" 
                ProviderName="<%$ ConnectionStrings:aswin90ConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [Id], [title], [content], [date], [ownerUsername], [authorUsername] FROM [Post] where [ownerUsername]=@owner " UpdateCommand="UPDATE [Post] SET [title] = @title, [content] = @content, [date] = @date, [ownerUsername] = @ownerUsername, [authorUsername] = @authorUsername WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="ownerUsername" Type="String" />
                    <asp:Parameter Name="authorUsername" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="ownerUsername" Type="String" />
                    <asp:Parameter Name="authorUsername" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Type="String" Name="owner" QueryStringField="ownerUsername" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    </form>
</body>
</html>
