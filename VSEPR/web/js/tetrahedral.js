function Tetrahedral(central_radius,bond_thickness,atom_radius) {
	this.type = "Tetrahedral" ;
	var group = new THREE.Group() ;

	
	var central = new THREE.Mesh(new THREE.SphereBufferGeometry(central_radius, 32, 32),new THREE.MeshBasicMaterial({color : 'red'}));
	
	var edge_cylinder1 = new THREE.Mesh(new THREE.CylinderGeometry( bond_thickness, bond_thickness, 3*central_radius, 32 ), new THREE.MeshBasicMaterial( {color: 0x336699} ));
	
	edge_cylinder1.applyMatrix( new THREE.Matrix4().makeTranslation( 0, 3*central_radius/2, 0 ) );


	var edge_cylinder2 = new THREE.Mesh(new THREE.CylinderGeometry( bond_thickness, bond_thickness, 3*central_radius, 32 ), new THREE.MeshBasicMaterial( {color: 0x336699} ));
	
		edge_cylinder2.applyMatrix( new THREE.Matrix4().makeTranslation( 0, -3*central_radius/2, 0 ) );


	var edge_cylinder3 = new THREE.Mesh(new THREE.CylinderGeometry( bond_thickness, bond_thickness, 3*central_radius, 32 ), new THREE.MeshBasicMaterial( {color: 0x336699} ));
	
	edge_cylinder3.applyMatrix( new THREE.Matrix4().makeTranslation(  3*central_radius/2,0,0) );

	//edge_cylinder3.rotation.z =Math.PI/2 ;



	var edge_cylinder4 = new THREE.Mesh(new THREE.CylinderGeometry( bond_thickness, bond_thickness, 3*central_radius, 32 ), new THREE.MeshBasicMaterial( {color: 0x336699} ));
	
	edge_cylinder4.applyMatrix( new THREE.Matrix4().makeTranslation(  -3*central_radius/2,0,0) );

	//edge_cylinder4.rotation.z =-Math.PI/2 ;

	
	var edge1 = new THREE.Mesh(new THREE.SphereBufferGeometry(atom_radius, 32, 32),new THREE.MeshBasicMaterial({color :0xffffff }));
	edge1.position.y += 3*central_radius;
	var edge2 = new THREE.Mesh(new THREE.SphereBufferGeometry(atom_radius, 32, 32),new THREE.MeshBasicMaterial({color : 0xffffff}));
	edge2.position.y -= 3*central_radius;
	var edge3 = new THREE.Mesh(new THREE.SphereBufferGeometry(atom_radius, 32, 32),new THREE.MeshBasicMaterial({color :0xffffff }));
	edge3.position.x += 3*central_radius;
	var edge4= new THREE.Mesh(new THREE.SphereBufferGeometry(atom_radius, 32, 32),new THREE.MeshBasicMaterial({color : 0xffffff}));
	edge4.position.x -= 3*central_radius;	
	console.log(edge_cylinder1.position);
	console.log(edge_cylinder2.position);
	console.log(edge_cylinder3.position);
	console.log(edge_cylinder4.position);
	//edge_cylinder1.position.set( 0,2*central_radius,0);
	//edge_cylinder2.position.set( 0,-2*central_radius,0);
	//edge_cylinder3.position.set( 2*central_radius,0,0);
	//edge_cylinder4.position.set( -2*central_radius,0,0);
	/*console.log(edge_cylinder1.position);
	console.log(edge_cylinder2.position);
	console.log(edge_cylinder3.position);
	console.log(edge_cylinder4.position);*/

	edge_cylinder1.rotation.set( Math.PI/2, 0, -Math.PI / 4);
	edge_cylinder2.rotation.set( -Math.PI/2, 0, -Math.PI / 4);
	edge_cylinder3.rotation.set( 0, Math.PI/2, Math.PI / 4);
	edge_cylinder4.rotation.set( 0, -Math.PI/2, Math.PI / 4);
	group.add(central) ;
	//group.add(cylinder) ;
	group.add(edge_cylinder1) ;
	group.add(edge_cylinder2) ;
	group.add(edge_cylinder3) ;
	group.add(edge_cylinder4) ;
	//group.add(edge1) ;
//	group.add(edge2) ;
//	group.add(edge3) ;
//	group.add(edge4) ;
	this.shape = group ;
	/*
var geometry1 = new THREE.Geometry();
			var geometry2 = new THREE.Geometry();
			var geometry3 = new THREE.Geometry();
			var geometry4 = new THREE.Geometry();
			geometry1.vertices.push(new THREE.Vector3(0,0,0));
			geometry1.vertices.push(new THREE.Vector3(30,0,0));
			geometry2.vertices.push(new THREE.Vector3(0,0,0));
			geometry2.vertices.push(new THREE.Vector3(-30,0,0));
			geometry3.vertices.push(new THREE.Vector3(0,0,0));
			geometry3.vertices.push(new THREE.Vector3(0,30,0));
			geometry4.vertices.push(new THREE.Vector3(0,0,0));
			geometry4.vertices.push(new THREE.Vector3(0,-30,0));
			var material = new THREE.MeshBasicMaterial( {color: 0xffff00,transparent:true, opacity:0.7} );
			var cylinder1 = new THREE.Line(geometry1, new THREE.LineBasicMaterial({}));
			var cylinder2 = new THREE.Line(geometry2, new THREE.LineBasicMaterial({}));
			var cylinder3 = new THREE.Line(geometry3, new THREE.LineBasicMaterial({}));
			var cylinder4 = new THREE.Line(geometry4, new THREE.LineBasicMaterial({}));
			console.log(cylinder1);
			
			var sphereGeom =  new THREE.SphereGeometry( 1,32,32);
			var texture =new THREE.TextureLoader().load("images/texture.jpg");
			var blueMaterial = new THREE.MeshBasicMaterial( {map:texture,transparent:true, opacity:0.75} );
			var sphere = new THREE.Mesh( sphereGeom, blueMaterial );
			sphere.position.set(0,0,0);
			//console.log(cylinder);
			cylinder1.rotation.set( Math.PI/2, 0, -Math.PI / 4);
			cylinder2.rotation.set( -Math.PI/2, 0, -Math.PI / 4);
			cylinder3.rotation.set( 0, Math.PI/2, Math.PI / 4);
			cylinder4.rotation.set( 0, -Math.PI/2, Math.PI / 4);
			sphere.add( cylinder1 );
			sphere.add( cylinder2 );
			sphere.add( cylinder3 );
			sphere.add( cylinder4 );
			scene.add( sphere );
	*/
}
