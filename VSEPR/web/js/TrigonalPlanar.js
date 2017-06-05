function TrigonalPlanar() {
	this.type = "Linear" ;
	var group = new THREE.Group() ;
	
	var centeral = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),new THREE.MeshBasicMaterial({color : 0xFF1493}));

	var cylinder = new THREE.Mesh(new THREE.CylinderGeometry( 0.1, 0.1, 0.5, 32 ), new THREE.MeshBasicMaterial( {color: 0xFF1493} ));
	cylinder.position.y += 0.5; 
	cylinder.rotation.z = Math.PI ;
	
	
	var edge_cylinder1 = new THREE.Mesh(new THREE.CylinderGeometry( 0.1, 0.1, 0.3, 32 ), new THREE.MeshBasicMaterial( {color: 0xffffff} ));
	
	edge_cylinder1.position.y += 0.6 ;

	var edge_cylinder2 = new THREE.Mesh(new THREE.CylinderGeometry( 0.1, 0.1, 0.3, 32 ), new THREE.MeshBasicMaterial( {color: 0xffffff} ));
	
	edge_cylinder2.position.y -= 0.6 ;
	
	var edge1 = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),new THREE.MeshBasicMaterial({color : 0xffffff}));
	edge1.position.y += 0.9 ;
	
	var edge2 = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),new THREE.MeshBasicMaterial({color : 0xffffff}));
	
	edge2.position.y -= 0.9 ;	
	
	var edge_cylinder22 = new THREE.Mesh(new THREE.CylinderGeometry(0.1, 0.1, 0.3, 32),new THREE.MeshBasicMaterial({color: 0xFF1493}));
	edge_cylinder22.position.x += 0.3 ;
	edge_cylinder22.position.y -= 0.2 ;
	edge_cylinder22.rotation.z += Math.PI/4 ;

	var edge_cylinder222 = new THREE.Mesh(new THREE.CylinderGeometry(0.1, 0.1, 0.2, 32),new THREE.MeshBasicMaterial({color: 0xFF1493}));
	edge_cylinder222.position.x -= 0.3 ;
	edge_cylinder222.position.y -= 0.15 ;
	edge_cylinder222.rotation.z += Math.PI/4 ;
	
	var side1 = new THREE.Group() ;
	side1.add(edge2) ;
	side1.add(edge_cylinder2) ;
	side1.position.x += 0.1 ;
	//side1.position.y -= 0.1 ;
	side1.rotation.z += Math.PI/4 ;

	var edge3 = new THREE.Mesh(new THREE.SphereBufferGeometry(0.3, 32, 32),new THREE.MeshBasicMaterial({color : 0xffffff}));
	
	edge3.position.y -= 0.9 ;

	var edge_cylinder3 = new THREE.Mesh(new THREE.CylinderGeometry( 0.1, 0.1, 0.3, 32 ), new THREE.MeshBasicMaterial( {color: 0xffffff} ));
	
	edge_cylinder3.position.y -= 0.6 ;

	var side2 = new THREE.Group() ;
	side2.add(edge3) ;
	side2.add(edge_cylinder3) ;
	side2.position.x -= 0.05 ;
	side2.position.y += 0.1 ;
	side2.rotation.z -= Math.PI/4 ;

	group.add(centeral) ;
	group.add(cylinder) ;
	group.add(edge_cylinder1) ;
	group.add(edge_cylinder22) ;
	group.add(edge_cylinder222) ;
	group.add(edge1) ;
	group.add(side1) ;
	group.add(side2) ;
	this.shape = group ;
}
