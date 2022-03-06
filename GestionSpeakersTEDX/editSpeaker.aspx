<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editSpeaker.aspx.cs" Inherits="GestionSpeakersTEDX.editSpeaker" %>

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
        #formEditSpeaker{
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
        .img{
            margin: 10px 0px;
            vertical-align: middle;
            width: 136px;
            height: 77px;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="formEditSpeaker"  runat="server">
        <div class="rounded " id="container">
            <h3 class="p-2 bg-secondary text-center text-white">EDIT SPEAKER</h3>
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
                        <asp:Image CssClass="img" ID="showImage" runat="server"  />
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
                <asp:Button ID="btnUpdate" class="btn btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnBack" class="btn btn-primary" runat="server" Text="Back To List" OnClick="btnBack_Click" />
            </div>
            
            <!-------------------------------END Main Form------------------------------->


            <!-------------------------------BEGIN Alerts----------------------------------------------->
            <!--Alert Update Success-->
            <div style="display:none" id="alertUpdateSuccess" runat="server" class="alert alert-success">
                <strong>Update Success!</strong> Les informations sont mises a jour!
            </div>
            <!-------------------------------END Alerts----------------------------------------------->

            



        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>