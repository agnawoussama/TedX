using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace GestionSpeakersTEDX
{
    public partial class listeSpeakers : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    ViewState["name"] = "";
            //}
            //if (!IsPostBack)
            //{
            //    AdoClass ado = new AdoClass();
            //    ado.command = new System.Data.SqlClient.SqlCommand("Select * from speakers", ado.connection);
            //    ado.Connecter();
            //    ado.reader = ado.command.ExecuteReader();
            //    if (ado.reader.HasRows)
            //    {
            //        GridView1.DataSource = ado.reader;  
            //        GridView1.DataBind();
            //    }
            //    ado.Deconnecter();
            //}
        }


        //Bouton Add New
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/newSpeaker.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void ActualiserGridView()
        {
            AdoClass ado = new AdoClass();  
            try
            {
                //On ajoute le nouveau speaker
                ado.command = new System.Data.SqlClient.SqlCommand("Select * from speakers", ado.connection);
                ado.Connecter();
                ado.reader = ado.command.ExecuteReader();
                if (ado.reader.HasRows)
                {
                    GridView1.DataSource = ado.reader;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                ado.Deconnecter();
            }
        }




        //Les deux Commands de bouton Edit + Delete
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            

            //Command Delete
            if (e.CommandName == "IsDelete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["name"] = GridView1.Rows[index].Cells[1].Text;
                Session["image"] = GridView1.Rows[index].Cells[0].Text; 
                Response.Redirect("~/deleteSpeaker.aspx");
            }

            //Command Edit
            if (e.CommandName == "IsEdit")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["name"] = GridView1.Rows[index].Cells[1].Text;
                Response.Redirect("~/speakerDetails.aspx");
                
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void txtbxSearch_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}