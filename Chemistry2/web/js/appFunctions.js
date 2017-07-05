/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 function closeModal(id)
 {
     document.getElementById(id).style.display="none";
     navControl();
 }
 function openModal(id) {
            document.getElementById(id).style.display = "block";navControl();

          }
function talk(description)//begin voice over
{
    responsiveVoice.speak( description, 'UK English Male',{rate: 0.85});
}
function stop()//stop voice over
{ 
      responsiveVoice.cancel();
}
            
       
         function getReaction(reaction)//to display reactions with proper formatting
            {
                var final=" ";
                var i=0;
                while(i<reaction.length)
                {
                   var j;
                   var str=" "
                   if(reaction.charAt(i)=='[')
                   {
                       j=i+1;
                       while(reaction.charAt(j)!=']')
                       {
                           str+=reaction.charAt(j);
                           j++;
                       }
                        i=j;
                        final+=str.sup();
                   }
                   else if(reaction.charAt(i)=='{')
                   {
                  	j=i+1;
                       while(reaction.charAt(j)!='}')
                       {
                           str+=reaction.charAt(j);
                           j++;
                       }
                        i=j;
                        final+=str.sub();
                   }
                   else
                     {
                     	var x=reaction.charAt(i);
                        final+=x;
                     	
                     }
                   i++;
               }
               return final;
    }
        function excitation()
        {
            var l1=document.getElementById("l1").value;
            l1=parseInt(l1);
            var l2=document.getElementById("l2").value;
            l2=parseInt(l2);
            var energy=(-13.6)*((1/l2)*(1/l2)-(1/l1)*(1/l1));
            var e=energy.toFixed(2);
            var message=" ";
            if(energy<0)
            {
                message="emitted";
                energy=-energy;
            }
            else if(energy>0)
                message="absorbed";
            document.getElementById("energy").innerHTML="Energy: "+e+"eV "+message;
            showExcitation(l1,l2);
        }


       function setShape(val,string1,string2)//to select the lattice shape
        {
            for(i=1;i<=7;i++)
            {
            var opt=document.getElementById("lattice"+i);
            opt.style.color="WHITE";
            }
            var option=document.getElementById("lattice"+val);
            option.style.color="RED";
            option.strong=true;
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
            else if(val==6)
            {
                document.getElementById("Simple").style.visibility="visible";
            }     
            else if(val==7)
            {
                document.getElementById("Simple").style.visibility="visible";
            }  
            document.getElementById("constraint").innerHTML="<br><br>"+string1+"<br>";
                        document.getElementById("constraint").innerHTML+=string2;

        }
        
    
    function getLattice(val)//to determine the basic lattice
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
            else if(crystal==6)
                 addTriclinicLattice();
             else if(crystal==7)
                 addRhombohedralLattice();
        }

        function createVSEPRShapes(val){//call to animmation.js
            
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
            var message;
            if(lonepairs==0)
            {
                switch(value)
                {
                    case 1: message="Linear";
                        break;
                    case 2: message="Trigonal Planar";
                        break;
                    case 3: message="Tetrahedral";
                        break;
                     case 4: message="Trigonal Bipyramidal";
                        break;
                     case 5: message="Octahedral";
                        break;
                     case 6: message="Pentagonal Bipyramidal";
                        break;
                }
            }
            else if(lonepairs==1)
            {
                switch(value)
                {
                case 2: message="Bent Shape";
                        break;
                    case 3: message="Pyramidal";
                        break;
                     case 4: message="SeeSaw Shape";
                        break;
                     case 5: message="Square Pyramidal";
                        break;
            }
        }
        else if(lonepairs==2)
            {
                switch(value)
                {
                
                    case 3: message="Bent Shape";
                        break;
                     case 4: message="T-Shape";
                        break;
                     case 5: message="Square Planar";
                        break;
            }
        }
        else if(lonepairs==3)
            {
                switch(value)
                {
                
                     case 4: message="Linear";
                        break;
 
            }
        }
        else message="Geometry";
            document.getElementById("help").innerHTML=message;
        }

        
          function compounddetails(val)
          {   
                var t=val%100;
                var value=parseInt(val/100);
                var b2=(value%100); 
                value=parseInt(value/100);
                var b1=value%100;
                value=parseInt(value/100);
                var h=value%100;
                value=parseInt(value/100);
                c=value%100;
                callHydrocarbon(c,h,b1,b2,t);
          }
          
          function showProperties(hydrocarbon) {
              
                        var hint= document.getElementById("hydrocarbonDetails");
                               hint.innerHTML= "<h3>Properties<h3>";
                               hint.innerHTML+= "<br><strong>Name: </strong> "+hydrocarbon.name+"<br>";
                               hint.innerHTML+= "<strong>Type: </strong> "+hydrocarbon.type+"<br>";
                               hint.innerHTML+= "<strong>Atomic Orbitals:  </strong>"+hydrocarbon.orbitals+"<br>";
                               hint.innerHTML+= "<strong>Number of S orbitals:  </strong>"+hydrocarbon.s_orbitals+"<br>";
                               hint.innerHTML+= "<strong>Number of P orbitals:  </strong>"+hydrocarbon.p_orbitals+"<br>";
                               hint.innerHTML+= "<strong>Number of Groups attached to carbon atom: </strong> "+hydrocarbon.groups+"<br>";
                               hint.innerHTML+= "<strong>Angle between each pair of orbitals(in Degrees): </strong> "+hydrocarbon.angle+"<br>";
                               hint.innerHTML+= "<strong>Spatial Arrangement: </strong> <br>"+hydrocarbon.arrangement+"<br>";
                               hint.innerHTML+= "<strong>Percent of S character:  </strong>"+hydrocarbon.s_character+"<br>";
                               hint.innerHTML+= "<strong>Percent of P character:  </strong>"+hydrocarbon.p_character+"<br>";
                               hint.innerHTML+= "<strong>Example: </strong> "+hydrocarbon.example+"<br>";
                               addHybridisation(hydrocarbon.value);
          }
                           
          function showsn1Groups(sn1) {
              console.log(sn1);
                        var hint= document.getElementById("sn1Details");
                               hint.innerHTML= "<strong>Reactants: </strong><br> "+sn1.re+"<br>";
                               hint.innerHTML+= "<strong>Products: </strong> <br>"+sn1.pr+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/olive1.png\'> "+sn1.g1+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/grey1.png\'>  "+sn1.g2+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/blue1.png\'> "+sn1.g3+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/cyan1.png\'>  "+sn1.ca+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/green1.png\'>  "+sn1.lg+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/white1.png\'> "+sn1.g4+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/red1.png\'> "+sn1.ag+"<br>";
                               callSN1();   
                           }
                           
          function showsn2Groups(sn2) {
                        var hint= document.getElementById("sn2Details");
                               hint.innerHTML= "<strong>Reactants: </strong> <br>"+sn2.re+"<br>";
                               hint.innerHTML+= "<strong>Products: </strong><br> "+sn2.pr+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/olive1.png\'>  "+sn2.g1+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/grey1.png\'>  "+sn2.g2+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/blue1.png\'>  "+sn2.g3+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/cyan1.png\'>  "+sn2.ca+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/green1.png\'>  "+sn2.lg+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/white1.png\'>  "+sn2.g4+"<br>";
                               hint.innerHTML+= "<br>'<img src=\'Images/red1.png\'> "+sn2.ag+"<br>";
                               callSN2();
                           }
var nav=0;
function navControl() {//controls the sidenav movement
    if(nav==0)
    {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("settings-icon").style.right="250px";
       document.getElementById("settings-icon").src="Images/right.png";

        nav=1;
    }
    else
    {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("settings-icon").style.right="0";
       document.getElementById("settings-icon").src="Images/left.png";

        nav=0;
    }
}
        function getAtom(val)//call to animation.js to initiate atom creation
        {
            var z=document.getElementById("Z").value;
            z=parseInt(z);
            if(z>=1 && z<=118)
            addAtom(z,2,8,8,2,0,0,0,val-1);
            else
                alert("Enter valid atomic number");

        }