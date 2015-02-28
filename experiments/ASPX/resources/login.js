protected void Button1_Click(object sender, EventArgs e)

{
    if (txtUserName.Text == "guestlogin" && txtPassword.Text == "password")
    {
        Response.Redirect("../../Default.aspx");
    }
    else
    {
        errorMessage.Visible = true;
    }

}
