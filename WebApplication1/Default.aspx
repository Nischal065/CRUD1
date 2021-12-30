<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Student Details"></asp:Label>

   <!DOCTYPE html>

<html>
<head>
    <title></title>
</head>
<body>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" ForeColor="#CC00FF" Text="CRUD "></asp:Label>
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <div>
        <div>
            <div class="text-center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="228px" ShowFooter="True" Width="1081px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="StudentId">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("StudentId") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                &nbsp;&nbsp;
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("StudentId") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="sName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("sName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("sName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Section") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Contact") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Contact") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Operations">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="UPDATE" ForeColor="#9900CC">UPDATE</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="CANCEL" ForeColor="#9900CC">CANCEL</asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#9966FF" OnClick="LinkButton6_Click">Insert</asp:LinkButton>
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                                  
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="False" ForeColor="Black" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>
        </div>
        <br />
        <asp:Label ID="Label10" runat="server"></asp:Label>
    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRUDdbConnectionString %>" DeleteCommand="DELETE FROM [Student_Detail] WHERE [StudentId] = @StudentId" InsertCommand="INSERT INTO [Student_Detail] ([sName], [Section], [Address], [Contact]) VALUES (@sName, @Section, @Address, @Contact)" SelectCommand="SELECT * FROM [Student_Detail]" UpdateCommand="UPDATE [Student_Detail] SET [sName] = @sName, [Section] = @Section, [Address] = @Address, [Contact] = @Contact WHERE [StudentId] = @StudentId">
        <DeleteParameters>
            <asp:Parameter Name="StudentId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="sName" Type="String" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Contact" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="sName" Type="String" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Contact" Type="Int32" />
            <asp:Parameter Name="StudentId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <form id="form1">
        <div>
        </div>
    </form>
</body>
</html>
</asp:Content>
