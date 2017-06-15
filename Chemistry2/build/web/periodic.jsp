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

                <div id="container">

                </div>
		
		<div id="menu">
			<button id="table">CREATE TABLE</button>
			
		</div>

		<script>
		

			var camera, scene, renderer;
			var controls;
			var objects = [];
			var targets = { table: [] };
			init();
			animate();
			function init() {
				camera = new THREE.PerspectiveCamera( 40, window.innerWidth / window.innerHeight, 1, 10000 );
				camera.position.z = 3000;
				scene = new THREE.Scene();
                                i=1;
               <c:forEach items="${elements}" var="element">
                        {
                   			var element = document.createElement( 'div' );
					element.className = 'element';
					//element.style.backgroundColor = 'rgba(127,127,0,' + ( Math.random() * 0.5 + 0.25 ) + ')';
					element.style.backgroundColor = 'rgba(255,127,0,0.75)';
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
					var object = new THREE.CSS3DObject( element );
					object.position.x = Math.random() * 4000 - 2000;
					object.position.y = Math.random() * 4000 - 2000;
					object.position.z = Math.random() * 4000 - 2000;
					scene.add( object );
					objects.push( object );
					var object = new THREE.Object3D();
					object.position.x = ( "${element.getTableGroup()}" * 140 ) - 1330;
					object.position.y = - ( "${element.getTablePeriod()}" * 180 ) + 990;
					targets.table.push( object );
                        i++;
                    }
                </c:forEach>
                


				
				renderer = new THREE.CSS3DRenderer();
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderer.domElement.style.position = 'absolute';
				document.getElementById( 'container' ).appendChild( renderer.domElement );
				
				controls = new THREE.TrackballControls( camera, renderer.domElement );
				controls.rotateSpeed = 0.5;
				controls.minDistance = 500;
				controls.maxDistance = 6000;
				controls.addEventListener( 'change', render );
				var button = document.getElementById( 'table' );
				button.addEventListener( 'click', function ( event ) {
					transform( targets.table, 2000 );
				}, false );
				
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
					.onUpdate( render )
					.start();
			}
			function onWindowResize() {
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
				render();
			}
			function animate() {
				requestAnimationFrame( animate );
				TWEEN.update();
				controls.update();
			}
			function render() {
				renderer.render( scene, camera );
			}
		</script>
	</body>
</html>
