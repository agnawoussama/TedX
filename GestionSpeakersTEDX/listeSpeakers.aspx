<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listeSpeakers.aspx.cs" Inherits="GestionSpeakersTEDX.listeSpeakers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
        *{
            box-sizing: border-box;
        }
        body{
            background-image: url(/img/tedx-logo.png);
            background-repeat: no-repeat;
            background-size: cover;
        }
        #formListeSpeaker{
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
            vertical-align: middle;
            width: 136px;
            height: 77px;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="formListeSpeaker" runat="server">
        <div class="rounded" id="container">
            <h3 class="p-2 bg-danger text-center text-white">LIST OF SPEAKERS</h3>
            <!-- START Main Form-->
            <div id="mainForm" class=" p-1">
                <!-- Start Header -->
                <div class="row mb-3">
                    <div class="col-sm-6">                  
                        <asp:Button ID="btnAddNew" class="btn btn-success mb-2" runat="server" Text="Add New" OnClick="btnAddNew_Click" />
                    </div>
                    <div class="col-sm-6">    
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text" id="">Rechercher Par Nom</span>
                          </div>
                         <asp:TextBox class=" form-control" ID="txtbxSearch" runat="server" AutoPostBack="True" OnTextChanged="txtbxSearch_TextChanged"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!-- End Header -->
                <asp:GridView ID="GridView1" class="table table-bordered table-condensed table-responsive table-hover align-baseline text-center table-responsive " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" >
                    <Columns>
                        <asp:TemplateField HeaderText="Image" >
                            <ItemTemplate>
                                <asp:Image CssClass="img" ID="ShowImage" runat="server" ImageUrl='<%# Eval("imgPath") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nom" HeaderText="Nom" SortExpression="nom" />
                        <asp:BoundField DataField="qualification" HeaderText="Qualification" SortExpression="qualification" />
                        <asp:BoundField DataField="experience" HeaderText="Experience" SortExpression="experience" />
                        <asp:BoundField DataField="datee" HeaderText="Date" SortExpression="datee" ApplyFormatInEditMode="True" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="timee" HeaderText="Time" SortExpression="timee" ApplyFormatInEditMode="True" />
                        <asp:BoundField DataField="venue" HeaderText="Venue" SortExpression="venue" />

                        <asp:TemplateField HeaderText="Edit" >
                            <ItemTemplate>
                                <asp:Button class="btn btn-primary" runat="server" ID="btnEdit"  CommandArgument="<%# Container.DisplayIndex %>" CommandName="IsEdit" Text="Edit" ></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button class="btn btn-danger" runat="server" ID="btnDelete"  CommandArgument="<%# Container.DisplayIndex %>" CommandName="IsDelete" Text="Delete" ></asp:Button>
                                <%--<button type="button" ID="btnDelete" CommandName="Delete" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" runat="server" class="btn btn-default btn-sm">
                                    <span class="btn btn-danger" >Delete</span> 
                                </button>--%>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestionTedxConnectionString %>" SelectCommand="SELECT * FROM [speakers]"></asp:SqlDataSource>
            </div>
            <!-- END Main Form -->

            <!-------------------------------BEGIN Alerts----------------------------------------------->
            <!--Supprimé avec succes-->
            <div style="display:none" id="alertSup" runat="server" class="alert alert-success">
                <strong>Supprimé avec succes!</strong> Le speaker a ete supprimé avec succes
            </div>
            <!--Modifié avec succes-->
            <div style="display:none" id="alertMdf" runat="server" class="alert alert-success">
                <strong>Modifié avec succes!</strong> Le speaker a ete Modifié avec succes
            </div>

            <!-------------------------------END Alerts----------------------------------------------->



        </div>
    </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
