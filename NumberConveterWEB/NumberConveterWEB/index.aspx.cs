using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace NumberConveterWEB
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
        SqlDataAdapter sqlDataAdepter = new SqlDataAdapter();
        DataSet dataSet = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {


            try
            {
                if (BinaryTextBox.Text.Equals("") && DecimalTextBox.Text.Equals("") && OctalTextBox.Text.Equals("") && HexadecimalTextBox.Text.Equals(""))
                {

                    string display = "Please Provide an input !";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                    inputDropDownList_TextChanged(null, null);
                }
                else
                {
                    if (inputDropDownList.Text.Equals("Binary"))
                    {
                        long input_value = Convert.ToInt64(BinaryTextBox.Text);
                        long reminder, decimal_value = 0, i = 0;
                        while (input_value > 0)
                        {
                            reminder = input_value % 10;
                            decimal_value = decimal_value + reminder * Convert.ToInt32(Math.Pow(2, i));
                            input_value = input_value / 10;
                            ++i;

                        }
                        converter(decimal_value);
                    }
                    else if (inputDropDownList.Text.Equals("Octal"))
                    {
                        long input_value = Convert.ToInt64(OctalTextBox.Text);
                        long reminder, decimal_value = 0, i = 0;
                        while (input_value > 0)
                        {
                            reminder = input_value % 10;
                            decimal_value = decimal_value + reminder * Convert.ToInt32(Math.Pow(8, i));
                            input_value = input_value / 10;
                            ++i;
                        }
                        converter(decimal_value);
                    }
                    else if (inputDropDownList.Text.Equals("Decimal"))
                    {
                        long input_value = Convert.ToInt64(DecimalTextBox.Text);
                        converter(input_value);
                    }
                    else if (inputDropDownList.Text.Equals("Hexadecimal"))
                    {

                        string inputString = HexadecimalTextBox.Text;
                        char[] ch = inputString.ToCharArray();
                        long value = 0, decimal_value = 0;
                        long len = ch.Length;
                        len--;

                        for (int i = 0; len != -1; i++)
                        {
                            if (ch[i] >= '0' && ch[i] <= '9')
                            {
                                value = ch[i] - 48;
                            }
                            else if (ch[i] >= 'a' && ch[i] <= 'f')
                            {
                                value = ch[i] - 97 + 10;
                            }
                            else if (ch[i] >= 'A' && ch[i] <= 'F')
                            {
                                value = ch[i] - 65 + 10;
                            }

                            decimal_value = decimal_value + value * Convert.ToInt32(Math.Pow(16, len));
                            len--;
                        }
                        converter(decimal_value);
                    }
                    else
                    {
                        string display = "Please Select Input type !";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                    }
                    saveToDatabase();
                    inputDropDownList_TextChanged(null, null);

                }
            }

            catch (Exception ex)
            {
                string display = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                resetButton_Click(null, null);
            }


        }

        void hidden()
        {

            DecimalTextBox.Enabled = false;
            BinaryTextBox.Enabled = false;
            OctalTextBox.Enabled = false;
            HexadecimalTextBox.Enabled = false;

        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            DecimalTextBox.Text = null;
            BinaryTextBox.Text = null;
            OctalTextBox.Text = null;
            HexadecimalTextBox.Text = null;

        }

        protected void inputDropDownList_TextChanged(object sender, EventArgs e)
        {

            if (inputDropDownList.Text.Equals("Binary"))
            {
                DecimalTextBox.Enabled = false;
                BinaryTextBox.Enabled = true;
                OctalTextBox.Enabled = false;
                HexadecimalTextBox.Enabled = false;

            }
            else if (inputDropDownList.Text.Equals("Decimal"))
            {
                DecimalTextBox.Enabled = true;
                BinaryTextBox.Enabled = false;
                OctalTextBox.Enabled = false;
                HexadecimalTextBox.Enabled = false;

            }
            else if (inputDropDownList.Text.Equals("Octal"))
            {
                DecimalTextBox.Enabled = false;
                BinaryTextBox.Enabled = false;
                OctalTextBox.Enabled = true;
                HexadecimalTextBox.Enabled = false;

            }
            else if (inputDropDownList.Text.Equals("Hexadecimal"))
            {
                DecimalTextBox.Enabled = false;
                BinaryTextBox.Enabled = false;
                OctalTextBox.Enabled = false;
                HexadecimalTextBox.Enabled = true;
            }

        }

        void converter(long num)
        {


            long bNumber = num;
            long oNumber = num;
            long hNumber = num;

            List<long> binary = new List<long>();
            List<long> octal = new List<long>();
            List<char> hexadecimal = new List<char>();
            if (num == 0)
            {
                BinaryTextBox.Text = num.ToString();
                DecimalTextBox.Text = num.ToString();
                OctalTextBox.Text = num.ToString();
                HexadecimalTextBox.Text = num.ToString();
            }
            else
            {
                for (int i = 0; bNumber > 0; i++)
                {
                    binary.Add(bNumber % 2);
                    bNumber = bNumber / 2;
                }

                for (int i = 0; oNumber > 0; i++)
                {
                    octal.Add(oNumber % 8);
                    oNumber = oNumber / 8;
                }

                for (int i = 0; hNumber > 0; i++)
                {
                    long temp = hNumber % 16;
                    if (temp < 10)
                    {
                        temp = temp + 48;
                    }
                    else
                    {
                        temp = temp + 55;
                    }
                    hexadecimal.Add(Convert.ToChar(temp));
                    hNumber = hNumber / 16;
                }

                binary.Reverse();
                octal.Reverse();
                hexadecimal.Reverse();

                BinaryTextBox.Text = string.Join(null, binary);
                DecimalTextBox.Text = num.ToString();
                OctalTextBox.Text = string.Join(null, octal);
                HexadecimalTextBox.Text = string.Join(null, hexadecimal);



            }



        }

        void saveToDatabase()
        {
            try
            {

                string sqlQuary = "insert into History (ID,Binary,Decimal,Octal,HexaDecimal) Values (11,@binary,@Decimal,@Octal,@HexaDecimal)";
                SqlCommand cmd = new SqlCommand(sqlQuary, connection);
                connection.Open();
                cmd.Parameters.AddWithValue("@binary", BinaryTextBox.Text);
                cmd.Parameters.AddWithValue("@Decimal", DecimalTextBox.Text);
                cmd.Parameters.AddWithValue("@Octal", OctalTextBox.Text);
                cmd.Parameters.AddWithValue("@HexaDecimal", HexadecimalTextBox.Text);
                cmd.ExecuteNonQuery();
               // connection.Close();
                updateDatabase();

            }
            catch (Exception ex)
            {
                string display = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

            }
        }

        void updateDatabase()
        {
            try
            {
                string s1 = "Delete From History Where ID=1";
                string s2 = "UPDATE History SET ID = 1 WHERE ID = 2";
                string s3 = "UPDATE History SET ID = 2 WHERE ID = 3";
                string s4 = "UPDATE History SET ID = 3 WHERE ID = 4";
                string s5 = "UPDATE History SET ID = 4 WHERE ID = 5";
                string s6 = "UPDATE History SET ID = 5 WHERE ID = 6";
                string s7 = "UPDATE History SET ID = 6 WHERE ID = 7";
                string s8 = "UPDATE History SET ID = 7 WHERE ID = 8";
                string s9 = "UPDATE History SET ID = 8 WHERE ID = 9";
                string s10 = "UPDATE History SET ID = 9 WHERE ID = 10";
                string s11 = "UPDATE History SET ID = 10 WHERE ID = 11";

                SqlCommand cmd1 = new SqlCommand(s1, connection);
                SqlCommand cmd2 = new SqlCommand(s2, connection);
                SqlCommand cmd3 = new SqlCommand(s3, connection);
                SqlCommand cmd4 = new SqlCommand(s4, connection);
                SqlCommand cmd5 = new SqlCommand(s5, connection);
                SqlCommand cmd6 = new SqlCommand(s6, connection);
                SqlCommand cmd7 = new SqlCommand(s7, connection);
                SqlCommand cmd8 = new SqlCommand(s8, connection);
                SqlCommand cmd9 = new SqlCommand(s9, connection);
                SqlCommand cmd10 = new SqlCommand(s10, connection);
                SqlCommand cmd11 = new SqlCommand(s11, connection);

               // connection.Open();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
                cmd4.ExecuteNonQuery();
                cmd5.ExecuteNonQuery();
                cmd6.ExecuteNonQuery();
                cmd7.ExecuteNonQuery();
                cmd8.ExecuteNonQuery();
                cmd9.ExecuteNonQuery();
                cmd10.ExecuteNonQuery();
                cmd11.ExecuteNonQuery();

                connection.Close();

            }
            catch (Exception ex)
            {
                string display = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

            }
        }

        protected void historyButton_Click(object sender, EventArgs e)
        {

            if (historyButton.Text.Equals("Show History"))
            {
                try
                {
                    string sqlQurey = "Select ID ,Binary,Decimal,Octal,HexaDecimal from History ORDER BY ID DESC";
                    SqlCommand cmd = new SqlCommand(sqlQurey, connection);
                    sqlDataAdepter.SelectCommand = cmd;
                    sqlDataAdepter.Fill(dataSet);
                    GridView.DataSource = dataSet;
                    GridView.DataBind();
                    sqlDataAdepter.Dispose();
                    GridView.Visible = true;
                    historyButton.Text = "Hide History";
                }
                catch (Exception ex)
                {
                    string display = ex.Message;
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                }
            }
            else
            {
                GridView.Visible = false;
                historyButton.Text = "Show History";
            }
            
            


        }
        

    }
}