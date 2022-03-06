using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionSpeakersTEDX
{
    public partial class deleteSpeaker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Si le variable de session n'est pas null
                if (Session["name"] != null)
                {
                    AdoClass ado = new AdoClass();
                    try
                    {
                        //On select le speaker chosie a l'aide de variable de session
                        ado.command = new System.Data.SqlClient.SqlCommand("Select * from speakers where nom = @nom", ado.connection);
                        ado.command.Parameters.AddWithValue("@nom", Session["name"].ToString());
                        ado.Connecter();
                        ado.reader = ado.command.ExecuteReader();
                        ado.reader.Read();
                        //On remplie tous les details de speaker
                        showName.InnerText = ado.reader[0].ToString();
                        showQualif.InnerText = ado.reader[1].ToString();
                        showExp.InnerText = ado.reader[2].ToString();
                        showDate.InnerText = Convert.ToDateTime(ado.reader[3].ToString()).ToShortDateString();
                        showTime.InnerText = Convert.ToDateTime(ado.reader[4].ToString()).ToString("HH:mm");
                        showVenue.InnerText = ado.reader[5].ToString();
                        showImage.ImageUrl = ado.reader[7].ToString();
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
                else
                {
                    Response.Redirect("~/listeSpeakers.aspx");
                }
            }
        }

        //Bouton Back List
        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Vers la page Liste Speakers
            Response.Redirect("~/listeSpeakers.aspx");
        }

        //Bouton Delete
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            AdoClass ado = new AdoClass();
            try
            {
                ado.command = new System.Data.SqlClient.SqlCommand("DELETE FROM speakers WHERE nom = @nom", ado.connection);
                ado.command.Parameters.AddWithValue("@nom", Session["name"].ToString());
                ado.Connecter();
                ado.command.ExecuteNonQuery();
                alertSuccessDelete.Attributes.CssStyle.Add("display", "block");
                alertSupConfitmation.Attributes.CssStyle.Add("display", "none");
                btnDelete.Attributes.CssStyle.Add("display", "none");
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
    }
}