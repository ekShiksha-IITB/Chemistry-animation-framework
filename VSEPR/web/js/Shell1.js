function Shell(r, noOfElectrons) {
	this.radius = r ;
	this.noOfElectrons = noOfElectrons ;
	var orbitDir = new THREE.Group() ;
	
	for(var i = 0; i < noOfElectrons; i++) {
		var orbit = new THREE.Group();
		var geometry = new THREE.CircleGeometry(this.radius, 100);
		geometry.vertices.shift();

		var circle = new THREE.Line(
			geometry,
			new THREE.LineDashedMaterial({color: 'grey'})
		);
		circle.rotation.x = Math.PI;
	
		var electron = new THREE.Mesh(
			new THREE.SphereBufferGeometry(0.05, 32, 32),
			new THREE.MeshBasicMaterial({color: 'grey'})
		);
		var x = Math.random() * this.radius;
		//alert(x) ;
		var y = Math.sqrt(this.radius*this.radius-x*x) ;
		if(i%4 == 1) {
			x = -x ;
		} else if(i%4 == 2) {
			x = -x ;
			y = -y ;
		} else if(i%4 == 3) {
			y = -y ;
		}
		electron.position.set(x, y, 0);
		orbit.add(circle);
		orbit.add(electron) ;
		orbit.name = 'orbit'+i ;	
		orbit.rotation.x = Math.PI*Math.random() ;
		orbitDir.add(orbit) ;
	}	
	this.orbit = orbitDir ;
}
