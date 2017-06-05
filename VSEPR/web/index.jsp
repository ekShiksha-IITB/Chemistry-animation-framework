<%-- 
    Document   : index
    Created on : 2 Jun, 2017, 2:55:23 PM
    Author     : abhi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Chemistry</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
          <script type = "text/javascript" src = "js/three.js"> </script>
        <script type = "text/javascript" src = "js/Linear.js"> </script>
        <script id="octahedralScript" type = "text/javascript" src = "js/Octahedral.js"> </script>
        <script type = "text/javascript" src = "js/tetrahedral.js"> </script>

        <script type = "text/javascript" src = "js/OrbitControls.js"> </script>
        <script type = "text/javascript" src = "js/TrackballControls.js"> </script>
  <style>
 

  .sidebar-nav .navbar ul {
    float: none;
    display: block;
  }
  .sidebar-nav .navbar li {
    float: none;
    display: block;
  }
  .sidebar-nav .navbar li a {
    padding-top: 12px;
    padding-bottom: 12px;
  }
.sidebar-nav .navbar li a:hover {
   background-color:green;
  }
 .sidebar-nav2{
width:200px;
 margin-left:160px;}
 
 .sidebar-nav2 .navbar li {
    float: none;
    display: block;
  }
  .sidebar-nav2 .navbar li {
    padding-top: 12px;
    padding-bottom: 12px;
  }
                      /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
 input[type="radio"]{
  margin: 0 10px 0 10px;
}

  </style>
  </head>
  <body>
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">ekshiksha</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active" ><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Join us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
 <div class="container">
 <div class="row">
  <div class="col-sm-2">
    <div class="sidebar-nav">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Choose your topic</span>
        </div>
        <div class="navbar-collapse collapse sidebar-navbar-collapse">
          <ul class="nav navbar-nav">
		  <h2>List of topics</h2>
           <!-- <li id="linear" onclick="getVal(1)">Linear</li>
            <li id="octahedral" onclick="getVal(2)">Octahedral</li>-->
           <li><a href='#'>Structure of an Atom</a></li>
           <li><a href='#'>Chemical bonding (VSEPR)</a></li>
           <li><a href='#'>Crystal Structure</a></li>
           <li><a href='#'>Chemical Reactions</a></li>

           
            
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
  <div width="700px" height="800px" style="border:1px solid black" id="animationCanvas">
         
  </div>
            <!-- The Modal -->
        <div id="myModal" class="modal">

          <!-- Modal content -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modalinnerContent">
            Central atom radius: <input type='number' id='central'><br><br>
            Bond thickness: <input type='number' id='bond'><br><br>
            Node radius: <input type='number' id='node'><br><br>
            <input type='submit' value='Create Shape' id='shapeCreate' onclick='getParams()'>"
            </p>
          </div>

        </div>
  </div>
  
   <div class="col-sm-3">
    <div class="sidebar-nav2">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Choose your method</span>
        </div>
        <div class="navbar-collapse collapse sidebar-navbar-collapse">

        <center>
            <label>Compounds<br><br></label>
        
        <select class="form-control" id="compound">
            <option value="-1">Choose compound</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Chemistry","root","shoot");
                    Statement mystmt=myConn.createStatement();
                    ResultSet myRs=mystmt.executeQuery("select * from VSEPR");
            while(myRs.next())
            {
            %>
            <option value="<%=myRs.getInt("compound_id")%>" ><%=myRs.getString("compound_name")%></option>
            
            <%
            }
                }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
            %>
        </select>
        <button onclick="showval()">Go!</button>
    </center>
          <div class="nav navbar-nav">
		  <h2>Shapes</h2>
                  <div id='options'>
                  <ul class=" navbar-nav">
            <p>List of topics</p>
            <li id="linear" onclick="getVal(1)"><a href='#'>Linear</a></li>
            <li id="octahedral" onclick="getVal(2)"><a href='#'>Octahedral</a></li>
            </ul>
                      
                  </div>
          
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
</div>
</div>
 <script type = "text/javascript">
      var scene, camera, renderer;
      var controls, cont,neededShape;
      //init();
      //animate();
       var modal = document.getElementById('myModal');
        var span = document.getElementsByClassName("close")[0];
        var modalc,central_radius,bond_thickness,atom_radius,value;
        span.onclick = function closeModal() {
            modal.style.display = "none";
        };
        function createShapes(val){
          if(val===1)
          {
           // alert("Linear!");
            //alert(central_radius+" "+bond_thickness+" "+atom_radius+" in linear");

           neededShape = new Linear(central_radius,bond_thickness,atom_radius) ;

          }
          else if(val===2)
          {
           // alert("Octahedral");
            neededShape= new Octahedral(central_radius,bond_thickness,atom_radius) ;

          }
          init();
          animate();
        }
        function getParams()
        {
          central_radius=document.getElementById('central').value;
          bond_thickness=document.getElementById('bond').value;
          atom_radius=document.getElementById('node').value;
          //alert(val);
          modal.style.display = "none"; 
          createShapes(value);
          }
        function openModal(val) {
            modal.style.display = "block";

          }
          function showval(p)
          {
             // console.log(p);
              var idElement = document.getElementById("compound");
                var selectedValue = idElement.options[idElement.selectedIndex].value;
                alert(selectedValue);
          }

        // When the user clicks anywhere outside of the modal, close it
     /*   window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };*/
      function getVal(val)
      {
        value=val;

        openModal();

      }

      function init() {
        scene = new THREE.Scene();
        scene.background = new THREE.Color('black');

        camera = new THREE.PerspectiveCamera(60, window.innerHeight / window.innerWidth, 0.1, 10000.0);
        camera.position.set(0, 0, 15);
        camera.lookAt(new THREE.Vector3(0, 0, 0));

        renderer = new THREE.WebGLRenderer({antialias: false});

        controls = new THREE.OrbitControls(camera, renderer.domElement);
        cont = new THREE.TrackballControls(camera, renderer.domElement);
        

        
        window.addEventListener('resize', onWindowResize, false);
        onWindowResize();
        var canvas=document.getElementById("animationCanvas");
        canvas.innerHTML='';
        canvas.appendChild(renderer.domElement);
        
        
        /*actual starts here*/
        scene.add(neededShape.shape) ;
        /*end*/
      }

      function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth/2, 3*window.innerHeight/4);
      }

      function animate(time) {
        
        controls.update() ;
        cont.update() ;
        renderer.render(scene, camera);
        requestAnimationFrame(animate);
      }
        </script> 
 
  </body>
</html>  
  