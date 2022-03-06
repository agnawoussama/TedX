using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace GestionSpeakersTEDX
{
    public partial class newSpeaker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

  

        //Fonction qui verifie si tous les champs sont remplis
        private bool checkChamps()
        {
            return txtbxName.Text != "" && txtbxExpr.Text != "" && txtbxQualif.Text != "" && date.Value != null && time.Value != null && txtareaVenue.Value != null;
        }

        //Fonction qui verifie si le file Uplaod et plein
        private bool checkFileUpload()
        {
            return FileUploadImage.HasFile;
        }

        //Bouton Create 
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            //Si l'un des champs est vide=>
            if (!checkChamps())
                alertChampVide.Attributes.CssStyle.Add("display", "block");
            else 
                alertChampVide.Attributes.CssStyle.Add("display", "none");

            //Si le File Upload est vide=>
            if (!checkFileUpload()) 
                alertCheckFile.Attributes.CssStyle.Add("display", "block");         
            else 
                alertCheckFile.Attributes.CssStyle.Add("display", "none");

            //Si les deux test sont vrais
            if (checkChamps() && checkFileUpload())
            {
                AdoClass ado = new AdoClass();
                /*----------------------------------Begin - Qualif Query----------------------------*/
                try
                {
                    //On cherche si il existe deja le qualification
                    ado.command = new System.Data.SqlClient.SqlCommand("Select count(*) from qualif where qualification = @qualif1", ado.connection);
                    ado.command.Parameters.AddWithValue("@qualif1", txtbxQualif.Text);
                    ado.Connecter();
                    int count = (int)ado.command.ExecuteScalar();
                    ado.Deconnecter();
                    //Si il n'existe pas on l'ajoute d'abord dans la table qualif
                    if (count != 1)
                    {                    
                        ado.command = new System.Data.SqlClient.SqlCommand("INSERT INTO qualif VALUES (@qualif2)", ado.connection);
                        ado.command.Parameters.AddWithValue("@qualif2", txtbxQualif.Text);
                        ado.Connecter();
                        ado.command.ExecuteNonQuery();
                        ado.Deconnecter();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                /*----------------------------------End - Qualif Query----------------------------*/

                /*----------------------------------Begin - Speakers Query----------------------------*/
                try
                {
                    //Image File
                    string imageFile = Path.GetFileName(FileUploadImage.PostedFile.FileName);
                    FileUploadImage.SaveAs(Server.MapPath("~/Images/") + imageFile);
                    //On ajoute le nouveau speaker
                    ado.command = new System.Data.SqlClient.SqlCommand("INSERT INTO speakers VALUES (@nom, @qualif3, @exp, @date, @time, @venue, @imgFile, @imgPath)", ado.connection);
                    ado.command.Parameters.AddWithValue("@nom", txtbxName.Text);
                    ado.command.Parameters.AddWithValue("@qualif3", txtbxQualif.Text);
                    ado.command.Parameters.AddWithValue("@exp", txtbxExpr.Text);
                    ado.command.Parameters.AddWithValue("@date", date.Value);
                    ado.command.Parameters.AddWithValue("@time", time.Value);
                    ado.command.Parameters.AddWithValue("@venue", txtareaVenue.Value);
                    ado.command.Parameters.AddWithValue("@imgFile", imageFile);
                    ado.command.Parameters.AddWithValue("@imgPath", "~/Images/" + imageFile);
                    ado.Connecter();
                    ado.command.ExecuteNonQuery();
                    alertSpeakerAjoute.Attributes.CssStyle.Add("display", "block");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    ado.Deconnecter();
                }
                /*----------------------------------End - Speakers Query----------------------------*/
            }
        }

        //Bouton Back list
        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Vers la page Liste Speakers
            Response.Redirect("~/listeSpeakers.aspx");
        }
    }
}