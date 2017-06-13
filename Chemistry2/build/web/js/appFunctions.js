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
            var lonepairs=1;
            if(val==1)
                addLinearGeometry();
            else if(val==2)
                addTrigonalPlanarGeometry(lonepairs);         
            else if(val==3)
                addTetrahedralGeometry(lonepairs);
            else if(val==4)
                addTrigonalBipyramidalGeometry(lonepairs);
            else if(val==5)
                addOctahedralGeometry(lonepairs);
            else if(val==6)
                addPenatagonalBipyramidalGeometry(lonepairs);
        }
        function getParams()
        {
          central_radius=document.getElementById('central').value;
          bond_thickness=document.getElementById('bond').value;
          modal.style.display = "none"; 
          createShapes(value);
          }
        function openModal(val) {
            modal.style.display = "block";
          }

    


