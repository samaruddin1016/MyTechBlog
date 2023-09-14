<%-- 
    Document   : register_page
    Created on : 31-Aug-2023, 11:23:45 pm
    Author     : samar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 95%, 67% 98%, 32% 95%, 0 99%, 0 0, 20% 0);
            }
        </style>
    </head>
    <body>
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp"%>
        
        
        <main class="primary-background" style="padding: 30px;">
            
            <div class="container">
                
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        
                        <div class="card-header primary-background text-white fa-2x text-center">
                           <span class="fa fa-user-circle"></span>
                           <br>
                           Register Here
                        </div>
                        
                        <div class="card-body">
                            
                            <form  id="reg-form" action="RegisterServlet" method="POST">
                                    
                                <div class="form-group">
                                      <label for="exampleInputEmail1">User Name</label>
                                      <input type="name" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                 </div>
                                
                                <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   
                                    </div>
                                
                                
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Select Gender</label>
                                      <br>
                                      <input type="radio"  name="user_gender" value="Male">Male
                                      <input type="radio"  name="user_gender" value="Female">Female
                                      
                                    </div>
                                
                                
                                <div class="form-group">
                                    
                                    <textarea name="about" rows="5" class="form-control" placeholder="Enter something here..."></textarea>
                                </div>
                                
                                    <div class="form-check">
                                      <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                    </div>
                                
                                <br>
                                        
                                <div class="container text-center"  id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please Wait....</h4>
                                </div>
                                
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                            
                        </div>
                        
                    </div>
                    
                    
                    
                    
                </div>
                    
                    
            
            
            
            
        </main>
        
        
        
        
         <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


        <script>
            
            $(document).ready(function(){
                console.log("Loaded.......");
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    
                    $('#submit-btn').hide();
                    $('#loader').show();
                    
                    
                    $.ajax({
                        url:"RegisterServlet",
                        type: 'POST',
                        data:form,
                        success: function(data,textStatus,jqXHR){
                            console.log(data);
                             $('#loader').hide();
                            $('#submit-btn').show();
                            
                            if(data.trim()==="Done")
                            {
                                swal("Bahut Badhiya,Ho gya...chalo ab login kr lo....")
                                        .then((value) => {
                                          window.location="login_page.jsp";
                                        });
                            }
                            else
                            {
                                swal(data);

                            }
                        },
                        error: function(jqXHR,textStatus,errorThrown){
                            console.log(jqXHR);
                             $('#loader').hide();
                            $('#submit-btn').show();
                             swal("Bhkkkk,kar diye ghalat ,ab fir se karo...");
                        },
                        processData:false,
                        contentType:false
                        
                    });
                    
                });
            });
            
            
            
            
            
            </script>   
    </body>
</html>
