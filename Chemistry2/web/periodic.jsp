<!DOCTYPE html>
<html>
	<head>
		<title>Periodic table</title>
		<meta charset="utf-8">

		<link rel="stylesheet" href="index.css">
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<style>
			html, body {
				height: 100%;
			}
			body {
				background-color: #000000;
				margin: 0;
				font-family: Helvetica, sans-serif;;
				overflow: hidden;
			}
			a {
				color: #ffffff;
			}
		</style>
	</head>
	<body>
		<script src="js/three.js"></script>
		<script src="js/tween.min.js"></script>
		<script src="js/TrackballControls.js"></script>
		<script src="js/CSS3DRenderer.js"></script>
                <script src="js/atom.js"></script>
                <div id="menu">
			<button id="table">CREATE TABLE</button>
                        <button id="atom">ATOM VIEW</button>

			
		</div>

                 <!-- The Modal -->
                <div id="myModal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    Select Atom View :<br><br>
                    <input type="radio" name="option" onclick="setAtomView(3)"> Full view<br>
                    <input type="radio" name="option" onclick="setAtomView(1)"> Electron view<br>
                    <input type="radio" name="option" onclick="setAtomView(2)"> Valence shell view                   
                  </div>
                </div>
                <span id="tooltip"></span>


                <div id="container">

                </div>
		
		
		<script>
		
			var camera, scene, renderer;
			var controls;
			var objects = [];
			var targets = { table: [] };
                        var objectCount=0;
                        var atomView=-1;
                        var ca={an:1,k:1,l:0,m:0,n:0,o:0,p:0,q:0};//current atom
                        var modal = document.getElementById('myModal');
                        var span = document.getElementsByClassName("close")[0];
			//initTable(1);
			//animate1();
                        function setAtomView(val)
                        {
                            atomView=val;
                            closeModal();
                        }
                        function showTooltip(element) {
                        document.getElementById("tooltip").innerHTML=element.name+" ("+element.symbol+")<br>";
                        document.getElementById("tooltip").innerHTML+= "Group:  "+element.group+"<br>";
                        document.getElementById("tooltip").innerHTML+= "Period: "+element.period+"<br>";
                        document.getElementById("tooltip").innerHTML+= "Mass:   "+element.mass+"<br>";
                        document.getElementById("tooltip").innerHTML+= "Type:   "+element.type+"<br>";
                        document.getElementById("tooltip").innerHTML+= "Electronic configuration: <br>";
                        document.getElementById("tooltip").innerHTML+= element.k+","+element.l+","+element.m+","+element.n+","+element.o+","+element.p+","+element.q+"<br>";
                        document.getElementById("tooltip").style.display="block";
                       }
                       function hideTooltip() {
                        document.getElementById("tooltip").style.display="none";
                       }
                        function getElementsReady(){
                        camera.position.z = 3000;
                        i=1;
                                
               <c:forEach items="${elements}" var="element">
                        {
                        var element = document.createElement( 'div' );
                        element.className = 'element tooltip';
                        element.k="${element.getK()}";
                        element.l="${element.getL()}";
                        element.m="${element.getM()}";
                        element.n="${element.getN()}";
                        element.o="${element.getO()}";
                        element.p="${element.getP()}";
                        element.q="${element.getQ()}";
                        element.an="${element.getAtomicNumber()}";
                        element.type="${element.getType()}";
                        element.group="${element.getGroup()}"
                        element.period="${element.getPeriod()}";
                        element.mass="${element.getMolarMass()}";
                        element.name="${element.getName()}";
                        element.symbol="${element.getSymbol()}";
                        //element.style.backgroundColor = 'rgba(127,127,0,' + ( Math.random() * 0.5 + 0.25 ) + ')';
                        element.style.backgroundColor = 'rgba(' + (parseInt(250/(19-element.group)) ) + ',' + (  (18-element.group)*15 ) + ',' + (parseInt((18-element.group)*(18-element.group)/0.9)) + ',' + ( 0.75) + ')';
                        var number = document.createElement( 'div' );
                        number.className = 'number';
                        number.textContent =i;
                        element.appendChild( number );
                        var symbol = document.createElement( 'div' );
                        symbol.className = 'symbol';
                        symbol.textContent = "${element.getSymbol()}";
                        element.appendChild( symbol );
                        var details = document.createElement( 'div' );
                        details.className = 'details';
                        details.innerHTML = "${element.getName()}" + '<br>' + "${element.getMolarMass()}";
                        element.appendChild( details );
                        
                        element.setAttribute("onMouseOver","showTooltip(this)");
                        element.setAttribute("onMouseOut","hideTooltip()");
                        element.setAttribute("onclick", "addAtom("+element.an+","+element.k+","+element.l+","+element.m+","+element.n+","+element.n+","+element.o+","+element.p+","+element.q+",2)");
                        ++objectCount;
                        var object = new THREE.CSS3DObject( element );
                        object.position.x = Math.random() * 4000 - 2000;
                        object.position.y = Math.random() * 4000 - 2000;
                        object.position.z = Math.random() * 4000 - 2000;
                        object.name=objectCount;
                        scene.add( object );
                        objects.push( object );
                        var object = new THREE.Object3D();
                        object.position.x = ( "${element.getTableGroup()}" * 140 ) - 1330;
                        object.position.y = - ( "${element.getTablePeriod()}" * 180 ) + 990;
                        targets.table.push( object );
                        i++;
                    }
                </c:forEach>
                
                        }
                function initTable(val) {
                camera = new THREE.PerspectiveCamera( 35, window.innerWidth / window.innerHeight, 1, 10000 );
                scene = new THREE.Scene();
               // getElementsReady();	
                if(val==1)
                renderer = new THREE.CSS3DRenderer();
                else
                renderer = new THREE.WebGLRenderer();   
                renderer.setSize( window.innerWidth, window.innerHeight );
                renderer.domElement.style.position = 'absolute';
                document.getElementById( 'container' ).innerHTML='';
                document.getElementById( 'container' ).appendChild( renderer.domElement );
                controls = new THREE.TrackballControls( camera, renderer.domElement );
                controls.rotateSpeed = 0.5;
                //controls.minDistance = 500;
                //controls.maxDistance = 6000;
                controls.addEventListener( 'change', renderTable );
                window.addEventListener('resize', onWindowResize, false);
                onWindowResize();
                var light = new THREE.AmbientLight( 0xffffff ); // white light
                scene.add( light );	
                var directionalLight = new THREE.DirectionalLight( 0xffffff );
                directionalLight.position.set( 0, 10, 10 ).normalize();
                scene.add(directionalLight);
        }
			function transform( targets, duration ) {
				TWEEN.removeAll();
				for ( var i = 0; i < objects.length; i ++ ) {
					var object = objects[ i ];
					var target = targets[ i ];
					new TWEEN.Tween( object.position )
						.to( { x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();
					new TWEEN.Tween( object.rotation )
						.to( { x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();
				}
				new TWEEN.Tween( this )
					.to( {}, duration * 2 )
					.onUpdate( renderTable )
					.start();
			}
			function onWindowResize() {
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderTable();
			}
			function animate1() {
				requestAnimationFrame( animate1 );
				TWEEN.update();
				controls.update();
			}
                        function animate2() {
			controls.update();
                        //scene.getObjectByName(objectCount).rotation.z+=0.01;  
                        //renderer.render(scene, camera);
                        requestAnimationFrame( animate2 );                                
			}
			function renderTable() {
				renderer.render( scene, camera );
			}
                        function addAtom(atomicNumber, k, l, m, n, o, p, q) {
                        ca.an=atomicNumber;
                        ca.k=k;
                        ca.l=l;
                        ca.m=m;
                        ca.n=n;
                        ca.o=o;
                        ca.p=p;
                        ca.q=q;
                        
                        
                        callAtom();
                        
                }
                function callAtom()
                {
                        deleteObjects() ;
                        initTable(2);
                        camera.position.z = 8;  
                        var ob = new Atom(ca.an, ca.k, ca.l, ca.m, ca.n, ca.o, ca.p, ca.q, atomView) ;
                        var shape ;
                        if(atomView == 1) {
                                shape = ob.firstModel() ;
                        } else if(atomView == 2) {
                                shape = ob.thirdModel() ;
                        } else {
                                shape = ob.secondModel() ;
                        }
                        ++objectCount ;
                        shape.name = objectCount ;                    
                        //console.log("Object count ",objectCount);
                        scene.add(shape) ;
                        function atom_rotation() {
                        shape.rotation.z += 0.01 ;
                        requestAnimationFrame(atom_rotation) ;
                        renderer.render(scene,camera) ;
                         }
                        atom_rotation() ;
                        animate2();                        
                        
                        document.getElementById( 'table' ).visibility="visible";
                }
                
                function deleteObjects() {
	while(objectCount > 0) {
		scene.remove(scene.getObjectByName(objectCount)) ;
		--objectCount ;
	}
    }
     
    var button = document.getElementById( 'table' );
    button.addEventListener( 'click', function ( event ) {
            deleteObjects();
            document.getElementById('tooltip').innerHTML='';
            initTable(1);
            animate1();
            getElementsReady();
            transform( targets.table, 2000 );
    button.visibility="hidden";
    }, false );
    var viewButton = document.getElementById( 'atom' );
    viewButton.addEventListener( 'click', function ( event ) {
        openModal();
    }, false );
                                
                                
     span.onclick = function () {
            modal.style.display = "none";
            callAtom();
        };
        function closeModal() {
            modal.style.display = "none";
            deleteObjects();
            callAtom();
            button.visibility="visible";
            
        };
            function openModal(val) {
            modal.style.display = "block";
          }
		</script>
	</body>
</html>