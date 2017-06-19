/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 var modal = document.getElementById('myModal');
        var span = document.getElementsByClassName("close")[0];
        var modalc,crystal;
        span.onclick = function closeModal() {
            modal.style.display = "none";
        };
        
        var modal1 = document.getElementById('id01');
        var span1 = document.getElementsByClassName("close")[1];
        span1.onclick = function closeModal() {
            modal1.style.display = "none";
        };
        
        function excitation()
        {
            var l1=document.getElementById("l1").value;
            l1=parseInt(l1);
            var l2=document.getElementById("l2").value;
            l2=parseInt(l2);
            alert(l1+l2);
        }

        function getAtom(val)
        {
            var z=document.getElementById("Z").value;
            z=parseInt(z);
            addAtom(z,2,8,8,2,0,0,0,val-1);

        }
       function setShape(val)
        {
            crystal=val;
                document.getElementById("Simple").style.visibility="hidden";
                document.getElementById("FCC").style.visibility="hidden";
                document.getElementById("BCC").style.visibility="hidden";
                document.getElementById("SCC").style.visibility="hidden";
            if(val==1)
            {
                document.getElementById("Simple").style.visibility="visible";
                document.getElementById("BCC").style.visibility="visible";
                document.getElementById("FCC").style.visibility="visible";
            }
            else if(val==2)
            {
                document.getElementById("Simple").style.visibility="visible";
                document.getElementById("BCC").style.visibility="visible";
            }
            else if(val==3)
            {
                document.getElementById("Simple").style.visibility="visible";
                document.getElementById("FCC").style.visibility="visible";
                document.getElementById("BCC").style.visibility="visible";
                document.getElementById("SCC").style.visibility="visible";
            }
            else if(val==4)
            {
                document.getElementById("Simple").style.visibility="visible";
            }
                
            else if(val==5)
            {
                document.getElementById("Simple").style.visibility="visible";
                document.getElementById("SCC").style.visibility="visible";
            }            
        }
        
    
    function getLattice(val)
        {
            if(crystal==1)
               addCubicLattice(val);
             else if(crystal==2)
                 addTetragonalLattice(val);
             else if(crystal==3)
                 addOrthorhombicLattice(val);
             else if(crystal==4)
                 addHexagonalLattice(val);
             else if(crystal==5)
                 addMonoclinicLattice(val);
        }

        function createVSEPRShapes(val){
            
            var lonepairs=val%10;
            var value=parseInt(val/10); 
           if(value==1)
                addLinearGeometry();
            else if(value==2)
                addTrigonalPlanarGeometry(lonepairs);         
            else if(value==3)
                addTetrahedralGeometry(lonepairs);
            else if(value==4)
                addTrigonalBipyramidalGeometry(lonepairs);
            else if(value==5)
                addOctahedralGeometry(lonepairs);
            else if(value==6)
                addPentagonalBipyramidalGeometry(lonepairs);
        }
        function getParams()
        {
          central_radius=document.getElementById('central').value;
          bond_thickness=document.getElementById('bond').value;
          modal.style.display = "none"; 
          createShapes(value);
          }
        function openModal(val) {
            if(val==1)
            modal.style.display = "block";
            else if(val==2)
              document.getElementById('id01').style.display='block';
          }

    

