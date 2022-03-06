<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newSpeaker.aspx.cs" Inherits="GestionSpeakersTEDX.newSpeaker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title></title>
    <style type="text/css">
        *{
            box-sizing: border-box;
        }
        body{
            background-image: url(/img/tedx-logo.png);
            background-repeat: no-repeat;
            background-size: cover;
        }
        #formNewSpeaker{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            
        }
        #container{
            border: 1px solid gray;
            width: 50%;
            background-color: white;
        }
    </style>
</head>
<body>
    <form id="formNewSpeaker"  runat="server">
        <div class="rounded " id="container">
            <h3 class="p-2 bg-danger text-center text-white">NEW SPEAKER</h3>
            <!----------------------------------- START Main Form ---------------------------------------------->
            <div id="mainForm" class=" p-3">
                <!--First Row [ name + image ] -->
                <div class="row mb-3">
                    <div class="col-sm-6">                  
                        <asp:Label class="form-label" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox class="w-100 form-control" ID="txtbxName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">                  
                        <asp:Label class="form-label" runat="server" Text="Image"></asp:Label>
                        <asp:FileUpload class="w-100 form-control " type="image" ID="FileUploadImage" accept="image/png, image/jpeg" runat="server" />
                    </div>
                </div>
                <!--Second Row [ Qualification + Experience ] -->
                <div class="row mb-3">
                    <div class="col-sm-6">                  
                        <asp:Label class="form-label" runat="server" Text="Qualification"></asp:Label>
                         <asp:TextBox class="w-100 form-control" ID="txtbxQualif" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">                  
                        <asp:Label class="form-label" runat="server" Text="Experience"></asp:Label>
                        <asp:TextBox class="w-100 form-control" ID="txtbxExpr"  runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            ControlToValidate="txtbxExpr" ForeColor="red" runat="server"
                            ErrorMessage="Only Numbers allowed"
                            ValidationExpression="\d+" Display="Dynamic">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <!--Third Row [ Date + Time ] -->
                <div class="row mb-3">
                    <div class="col-sm-6">                  
                        <asp:Label class="form-label " runat="server" Text="Date"></asp:Label>
                        <input class="w-100 form-control" id="date" type="date" runat="server" />
                    </div>
                    <div class="col-sm-6">                  
                        <asp:Label class="form-label" runat="server" Text="Time"></asp:Label>
                        <input class="w-100 form-control" id="time" type="time" runat="server" />
                    </div>
                </div>
                <!--Fourth Row [ Venue ] -->
                <div class="row mb-3">
                    <div class="col-sm-12">                  
                        <asp:Label class="form-label " runat="server" Text="Venue"></asp:Label>
                        <textarea class="w-100 form-control" id="txtareaVenue" cols="20" rows="2" runat="server"></textarea>
                    </div>
                </div>
                <!--Boutons Create + Back to list -->
                <asp:Button ID="btnCreate" class="btn btn-danger" runat="server" Text="Create" OnClick="btnCreate_Click" />
                <asp:Button ID="btnBack" class="btn btn-danger" runat="server" Text="Back To List" OnClick="btnBack_Click" />
            </div>
            
            <!-------------------------------END Main Form------------------------------->


            <!-------------------------------BEGIN Alerts----------------------------------------------->
            <!--Alert Champs Vide-->
            <div style="display:none" id="alertChampVide" runat="server" class="alert alert-danger">
                <strong>Champ(s) Vides!</strong> Veuillez Remplir les champs s'il vous plait
            </div>
            <!--Alerts Check File-->
            <div style="display:none" id="alertCheckFile" runat="server" class="alert alert-danger">
                <strong>Aucun image choisie!</strong> Veuillez Choisier une image s'il vous plait
            </div>
            <!--Alerts Speak ajout Reussi -->
            <div style="display:none" id="alertSpeakerAjoute" runat="server" class="alert alert-success">
                <strong>Reussi!</strong> Le Speaker a ete ajoute!
            </div>
            <!-------------------------------END Alerts----------------------------------------------->

            



        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
