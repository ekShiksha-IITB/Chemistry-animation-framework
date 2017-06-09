function Shell(r, noOfElectrons) {
	/*radius of shell*/
	this.radius = r ;
	/*# of electrons in shell*/
	this.noOfElectrons = noOfElectrons ;
	
	var orbit = new THREE.Group();
	var geometry = new THREE.CircleGeometry(this.radius, 100);
	var angle = (2*Math.PI)/noOfElectrons ;
	geometry.vertices.shift();
	
	/*circle geometry which holds the electrons*/
	var circle = new THREE.Line(
		geometry,
		new THREE.LineDashedMaterial({color: 'grey'})
	);
	circle.rotation.x = Math.PI;
	/*positioning the electrons*/
	for(var i = 0; i < 2*Math.PI; i += angle) {
		var electron = new THREE.Mesh(
			new THREE.SphereBufferGeometry(0.05, 32, 32),
			new THREE.MeshBasicMaterial({color: 'grey'})
		);
		var x = r*(Math.cos(i)), y = r*(Math.sin(i));
		electron.position.set(x, y, 0);
		orbit.add(electron) ;	
	}
	orbit.add(circle);
	this.orbit = orbit ;
}
