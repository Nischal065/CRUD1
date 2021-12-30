
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI. Page
    {
        String connstring = WebConfigurationManager.ConnectionStrings["std_ConnectionString"].ConnectionString;

        public object WebconfigurationManager { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
                                                            }
        

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label10.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label10.Text = "";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(connstring);
            Label StudentId = GridView1.Rows[e.RowIndex].FindControl("Label9") as Label;
            TextBox sName = GridView1.Rows[e.RowIndex].FindControl("Textbox1") as TextBox;
            TextBox Section = GridView1.Rows[e.RowIndex].FindControl("Textbox2") as TextBox;
            TextBox Address = GridView1.Rows[e.RowIndex].FindControl("Textbox3") as TextBox;
            TextBox Contact = GridView1.Rows[e.RowIndex].FindControl("Textbox4") as TextBox;
            string updatedata = "Update [Student_Detail] set sName = '" + sName.Text + "', Section = '" + Section.Text + "', Address = '" + Address.Text + "', Contact = '" + Contact.Text + "' Where StudentId = '" + int.Parse(StudentId.Text) + "' ";

            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            Label10.Text = "Row has been Updated Successfully";
            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connstring);
            TextBox StudentId = GridView1.FooterRow.FindControl("Textbox5") as TextBox;
            TextBox sName = GridView1.FooterRow.FindControl("Textbox7") as TextBox;
            TextBox Section = GridView1.FooterRow.FindControl("Textbox8") as TextBox;
            TextBox Address = GridView1.FooterRow.FindControl("Textbox9") as TextBox;
            TextBox Contact = GridView1.FooterRow.FindControl("Textbox10") as TextBox;

            string query = "Insert into [Student_Detail] values ( '" + sName.Text + "', '" + Section.Text + "', '" + Address.Text + "', '" + Contact.Text + "')";
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            Label10.Text = "New Row Inserted Successfully";
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            conn.Close();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(connstring);
            Label StudentId = GridView1.Rows[e.RowIndex].FindControl("Label11") as Label;
            string updatedata = " delete from [Student_Detail] where StudentId = '" + int.Parse( StudentId.Text) + "'  ";
            conn.Open();
            SqlCommand cmd = new  SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            Label10.Text = "Row Data has been Deleated Successfully";
            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            conn.Close();
        }
    }
}