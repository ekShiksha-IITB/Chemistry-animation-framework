function Linear(central_radius,bond_thickness,atom_radius) {
	this.type = "Linear" ;
	var group = new THREE.Group() ;

	
	var central = new THREE.Mesh(new THREE.SphereBufferGeometry(central_radius, 32, 32),new THREE.MeshBasicMaterial({color : 'red'}));
	var edge_cylinder1 = new THREE.Mesh(new THREE.CylinderGeometry( bond_thickness, bond_thickness, 3*central_radius, 32 ), new THREE.MeshBasicMaterial( {color: 0x336699} ));
	edge_cylinder1.position.y += central_radius;
	var edge_cylinder2 = new THREE.Mesh(new THREE.CylinderGeometry( bond_thickness, bond_thickness, 3*central_radius, 32 ), new THREE.MeshBasicMaterial( {color: 0x336699} ));
	edge_cylinder2.position.y -=central_radius ;
	var edge1 = new THREE.Mesh(new THREE.SphereBufferGeometry(atom_radius, 32, 32),new THREE.MeshBasicMaterial({color :0xffffff }));
	edge1.position.y += 3*central_radius;
	var edge2 = new THREE.Mesh(new THREE.SphereBufferGeometry(atom_radius, 32, 32),new THREE.MeshBasicMaterial({color : 0xffffff}));
	edge2.position.y -= 3*central_radius;	
	group.add(central) ;
	//group.add(cylinder) ;
	group.add(edge_cylinder1) ;
	group.add(edge_cylinder2) ;
	group.add(edge1) ;
	group.add(edge2) ;
	this.shape = group ;
}
