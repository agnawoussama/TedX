using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace GestionSpeakersTEDX
{
    public partial class editSpeaker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FileUploadImage.Attributes["onchange"] = "UploadFile";
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
                        txtbxName.Text = ado.reader[0].ToString();
                        txtbxQualif.Text = ado.reader[1].ToString();
                        txtbxExpr.Text = ado.reader[2].ToString();
                        date.Value = Convert.ToDateTime(ado.reader[3].ToString()).ToString("yyyy-MM-dd");
                        time.Value = ado.reader[4].ToString();
                        txtareaVenue.InnerText = ado.reader[5].ToString();
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

        //Bouton Update
        protected void btnUpdate_Click(object sender, EventArgs e)
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

            /*----------------------------------Begin - UPDATE Query----------------------------*/
            try
            {
                //On select le speaker chosie a l'aide de variable de session
                string pictureImgNameUpdate = "";
                string pictureImgPathUpdate =  "";
                string path = "";
                //Si l'image File Upload est plein
                if (FileUploadImage.HasFile)
                {
                    pictureImgNameUpdate = ", imgName = @picImgNameUpdate ";
                    pictureImgPathUpdate = ", imgPath = @picImgPathUpdate ";
                    FileUploadImage.SaveAs(Server.MapPath("~/Images/") + FileUploadImage.PostedFile.FileName);
                    path = Path.GetFileName(FileUploadImage.PostedFile.FileName);
                    ChangePicture("~/Images/" + path);
                }         
                //Command qui fait le mise a jour du speaker
                ado.command = new System.Data.SqlClient.SqlCommand("Update speakers Set nom = @nom, " +
                                                                                      " qualification = @qualif3," +
                                                                                      " experience = @exp," +
                                                                                      " datee = @date," +
                                                                                      " timee = @time," +
                                                                                      " venue = @venue" +
                                                                                      pictureImgNameUpdate +
                                                                                      pictureImgPathUpdate +
                                                                                      " where nom = @nomSession", ado.connection);
                ado.command.Parameters.AddWithValue("@nomSession", Session["name"].ToString());
                ado.command.Parameters.AddWithValue("@nom", txtbxName.Text);
                ado.command.Parameters.AddWithValue("@qualif3", txtbxQualif.Text);
                ado.command.Parameters.AddWithValue("@exp", txtbxExpr.Text);
                ado.command.Parameters.AddWithValue("@date", date.Value);
                ado.command.Parameters.AddWithValue("@time", time.Value);
                ado.command.Parameters.AddWithValue("@venue", txtareaVenue.Value);
                //Les deux parameters d'image [ name + path ]
                ado.command.Parameters.AddWithValue("@picImgNameUpdate", path);
                ado.command.Parameters.AddWithValue("@picImgPathUpdate", "~/Images/" + path);               
                ado.Connecter();
                ado.command.ExecuteNonQuery();
                //Alert Modifie Avec Success
                alertUpdateSuccess.Attributes.CssStyle.Add("display", "block");


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                ado.Deconnecter();
                
            }
            /*----------------------------------End - UPDATE Query----------------------------*/
        }

        private void ChangePicture(string path)
        {
            showImage.ImageUrl = path;
        }
    }
}