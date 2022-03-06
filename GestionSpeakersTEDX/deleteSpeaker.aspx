<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteSpeaker.aspx.cs" Inherits="GestionSpeakersTEDX.deleteSpeaker" %>

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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #formDeleteSpeaker{
            
            width: 50%;
            background-color: white;
            
        }
        #container{
            border: 1px solid #c3bfbf;
        }
        .img{
            vertical-align: middle;
            width: 200px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="formDeleteSpeaker" runat="server">
         <!-------------------------------BEGIN Alerts----------------------------------------------->
            <!--Alert Delete-->
            <div  id="alertSupConfitmation" runat="server" class="alert alert-danger text-center">
                <strong class="h4 ">Are you sure you want to delete this?</strong> 
            </div>

            <!-------------------------------END Alerts----------------------------------------------->
         <div class="rounded " id="container">
            

            <h3 class="p-2 bg-info text-center text-white">DELETE SPEAKER</h3>
            <!----------------------------------- START Main Form ---------------------------------------------->
            <div id="mainForm" class=" p-3">
                <!--First Row [ name ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Name</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <p id="showName" runat="server"></p>           
                    </div>                
                </div>     
                <!--First Row [ Qualification ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Qualification</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <p id="showQualif" runat="server"></p>           
                    </div>                
                </div>  
                <!--First Row [ Experience ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Experience</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <p id="showExp" runat="server"></p>          
                    </div>                
                </div>  
                <!--First Row [ Date ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Date</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <p id="showDate" runat="server"></p>             
                    </div>                
                </div> 
                <!--First Row [ Time ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Time</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <p id="showTime" runat="server"></p>             
                    </div>                
                </div> 
                <!--First Row [ Venue ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Venue</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <p id="showVenue" runat="server"></p>            
                    </div>                
                </div> 
                <!--First Row [ Image ] -->
                <div class="row ">
                    <div class="col-sm-2">                  
                        <p><strong>Image</strong></p>                
                    </div>
                    <div class="col-sm-6">                  
                        <asp:Image CssClass="img" ID="showImage" runat="server" />
                    </div>                
                </div> 
                <!--Boutons Delete + Back to list -->
                <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                <asp:Button ID="btnBack" class="btn btn-primary" runat="server" Text="Back To List" OnClick="btnBack_Click"  />
            </div>
            
            <!-------------------------------END Main Form------------------------------->

             <!-------------------------------BEGIN Alerts----------------------------------------------->
            <!--Alert Delete-->
            <div style="display:none" id="alertSuccessDelete" runat="server" class="alert alert-success text-center">
                <strong class="h4 ">Le speaker a ete supprime avec success!</strong> 
            </div>

            <!-------------------------------END Alerts----------------------------------------------->
            

            



        </div>
    </form>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>