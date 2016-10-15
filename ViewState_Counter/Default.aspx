<%@ Page Language="C#" %>

<!DOCTYPE html>
<script lang="C#" runat="server">
    /*http://stackoverflow.com/questions/733482/what-is-the-difference-between-sessionstate-and-viewstate
     * Session State contains information that is pertaining to a specific session (by a particular client/browser/machine) with the server. It's a way to track what the user is doing on the site.. across multiple pages...amid the statelessness of the Web. e.g. the contents of a particular user's shopping cart is session data. Cookies can be used for session state.
View State on the other hand is information specific to particular web page. It is stored in a hidden field so that it isn't visible to the user. It is used to maintain the user's illusion that the page remembers what he did on it the last time - dont give him a clean page every time he posts back

 Session state is saved on the server, ViewState is saved in the page.

 Session state is usually cleared after a period of inactivity from the user (no request happened containing the session id in the request cookies).

The view state is posted on subsequent post back in a hidden field.*/


    protected void Page_Load(Object s, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState.Add("Counter", 0);//data type os name-value pair is 'Object'
        }
    }
    protected void Click(Object s, EventArgs e)
    {
        int counter = (int)ViewState["Counter"];//cast obj type to int
        counter = counter + 1;
        lblCounter.Text = "Count=" + counter.ToString();
        ViewState.Add("Counter", counter);//overwrite 'counter'
        if (counter == 4)
        {
            lblCounter.Text = "No more atempts";
            btnCounter.Enabled = false;
        }
        else if (nameTextBox.Text == "name" && pwdTextBox.Text == "123")
        {
            lblCounter.Text = "Authentication successful";
            btnCounter.Enabled = false;
        }
        else
        {
            lblCounter.Text = "Name or Password wrong. " + (4 - counter) + " attempts left.";

        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter Name as "name" and Pwd as "123".<br>
            You have 4 attempts at hand.<br>
            Name:
            <asp:TextBox ID="nameTextBox" runat="server" /><br>
            Pwd:
            <asp:TextBox TextMode="Password" ID="pwdTextBox" runat="server" /><br>

            <asp:Label ID="lblCounter" runat="server">
            </asp:Label>
            <br />
            <asp:Button ID="btnCounter" runat="server" Text="Click" OnClick="Click" />
        </div>
    </form>
</body>
</html>
