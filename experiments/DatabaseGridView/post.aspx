<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script runat="server">
        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            var ownerUsername = Request["ownerUsername"];
            Response.Redirect("wall.aspx?ownerUsername=" + ownerUsername);
        }
    </script>
    <title>Add Comments</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script>
      $(function() {
          $(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });
      });
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Add your comments!!</h1>
        <p>

            <asp:DetailsView OnItemInserted="DetailsView1_ItemInserted" cssClass="table" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:TemplateField HeaderText="content" SortExpression="content">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("content") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="date" ControlStyle-CssClass="datepicker" HeaderText="date" SortExpression="date" >
<ControlStyle CssClass="datepicker"></ControlStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:aswin90ConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Post] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Post] ([title], [content], [date], [ownerUsername], [authorUsername]) VALUES (@title, @content, @date, @ownerUsername, @authorUsername)" 
                ProviderName="<%$ ConnectionStrings:aswin90ConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [Id], [title], [content], [date], [ownerUsername], [authorUsername] FROM [Post]" 
                UpdateCommand="UPDATE [Post] SET [title] = @title, [content] = @content, [date] = @date, [ownerUsername] = @ownerUsername, [authorUsername] = @authorUsername WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:QueryStringParameter Name="ownerUsername" Type="String" QueryStringField="ownerUsername" />
                    <asp:SessionParameter Name="authorUsername" Type="String" SessionField="loggedInUsername" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="ownerUsername" Type="String" />
                    <asp:Parameter Name="authorUsername" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </p>
    </div>
    </form>
</body>
</html>
