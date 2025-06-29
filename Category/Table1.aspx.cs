using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CTR_Table.Category
{
    public partial class Table1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            if (!IsPostBack)

            {

                LoadData();

            }

        }

        private void LoadData()

        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CTG_Table"].ConnectionString))

            {

                con.Open();

                using (SqlCommand cmd = new SqlCommand())

                {

                    cmd.Connection = con;

                    cmd.CommandText = "CategoryA";

                    cmd.CommandType = CommandType.StoredProcedure;

                    DataTable dt = new DataTable();

                    SqlDataReader reader = cmd.ExecuteReader();

                    dt.Load(reader);

                    ViewDataRepeater.DataSource = dt;

                    ViewDataRepeater.DataBind();

                    if (dt.Rows.Count == 0)

                    {

                        NoDataResultDeatils.Visible = true;

                    }

                    else

                    {

                        NoDataResultDeatils.Visible = false;

                    }

                }

            }

        }

        protected void ViewDataRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)

        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)

            {
                // هنا نضيف لل id سنتاكس

                Label lblInput1 = (Label)e.Item.FindControl("Input1");  //في هذا الجزء، يتم العثور على عناصر معينة داخل كل عنصر في القائمة أو الجدول. يتم البحث عن عناصر من نوع Label و TextBox باستخدام FindControl، والذي يعيد عنصر التحكم بناءً على الـ ID الذي يتم تمريره إليه.

                TextBox txtInput1 = (TextBox)e.Item.FindControl("userinput");

                Label lblInput2 = (Label)e.Item.FindControl("Input2");

                TextBox txtInput2 = (TextBox)e.Item.FindControl("userinput2");

                Label lblInput3 = (Label)e.Item.FindControl("Input3");

                TextBox txtInput3 = (TextBox)e.Item.FindControl("userinput3");

                Label lblInput4 = (Label)e.Item.FindControl("Input4");

                TextBox txtInput4 = (TextBox)e.Item.FindControl("userinput4");

                ToggleVisibility(lblInput1, txtInput1); //بعد العثور على هذه العناصر، يتم تمريرها إلى دالة ToggleVisibility التي تتحكم في إظهار أو إخفاء هذه العناصر بناءً على محتوى الـ Label.

                ToggleVisibility(lblInput2, txtInput2);

                ToggleVisibility(lblInput3, txtInput3);

                ToggleVisibility(lblInput4, txtInput4);

            }

        }

        private void ToggleVisibility(Label lbl, TextBox txt)
        {
            if (!string.IsNullOrEmpty(lbl.Text) && lbl.Text.Trim() != "0")
            {
                lbl.Visible = true;
                txt.Visible = false;
                txt.Text = lbl.Text; // **حفظ القيمة في الـ TextBox حتى لا تفقد عند إعادة التحميل**
            }
            else
            {
                lbl.Visible = false;
                txt.Visible = true;
            }
        }

        protected void Delete(object sender, EventArgs e)
        {
            Button Delete = (Button)sender;
            string id = Delete.Attributes["btnID"];


            using (SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTG_Table"].ConnectionString))
            {
                con1.Open();

                using (SqlCommand cmd = new SqlCommand(/*query, con1*/))
                {


                    cmd.Connection = con1;
                    cmd.CommandText = "DeleteA";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id); // IM SENDING THE ID TO THE PROCEDURE TO ONLY DELETE ONE RECORED 

                    SqlDataReader dr = cmd.ExecuteReader();
                }
            }
            LoadData(); // THIS IS THE SAME AS YOUR METHOD THAT IS FILLING UR TABLE ON THE WEBPAGE
        }


        protected void Save(object sender, EventArgs e)
        {
            Button Save = (Button)sender;
            RepeaterItem item = (RepeaterItem)Save.NamingContainer;

            // جلب العناصر
            Label lblId = (Label)item.FindControl("id");
            TextBox txtInput1 = (TextBox)item.FindControl("userinput");
            TextBox txtInput2 = (TextBox)item.FindControl("userinput2");
            TextBox txtInput3 = (TextBox)item.FindControl("userinput3");
            TextBox txtInput4 = (TextBox)item.FindControl("userinput4");

            // تحويل ID مباشرة لأنه مضمون
            int id = int.Parse(lblId.Text);

            using (SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["CTG_Table"].ConnectionString))
            {
                con1.Open();
                using (SqlCommand cmd = new SqlCommand("SaveCategoryA", con1))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@id", id);

                    // تمرير القيم مع تحديد نوع البيانات
                    cmd.Parameters.Add("@Input1", SqlDbType.NVarChar).Value = string.IsNullOrWhiteSpace(txtInput1?.Text) ? (object)DBNull.Value : txtInput1.Text.Trim();
                    cmd.Parameters.Add("@Input2", SqlDbType.NVarChar).Value = string.IsNullOrWhiteSpace(txtInput2?.Text) ? (object)DBNull.Value : txtInput2.Text.Trim();
                    cmd.Parameters.Add("@Input3", SqlDbType.NVarChar).Value = string.IsNullOrWhiteSpace(txtInput3?.Text) ? (object)DBNull.Value : txtInput3.Text.Trim();
                    cmd.Parameters.Add("@Input4", SqlDbType.NVarChar).Value = string.IsNullOrWhiteSpace(txtInput4?.Text) ? (object)DBNull.Value : txtInput4.Text.Trim();

                    cmd.ExecuteNonQuery();
                }
            }

            LoadData(); // تحديث البيانات بعد الحفظ
        }



    }
}