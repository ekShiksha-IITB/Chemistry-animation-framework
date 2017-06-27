var m1, m2, m3, m4, c_flag = 1;
function Combination() {
	var geometry = new THREE.SphereGeometry( 0.4, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'green', specular: 0x555555, shininess: 30 } );
	m1 = new THREE.Mesh(geometry, material) ;
	m1.position.x -= 2 ;
	m1.name = ++objectCount ;
	scene.add(m1) ;
	m2 = new THREE.Mesh(geometry, material) ;
	m2.position.x -= 2 ;
	m2.position.y -= 0.5 ;
	m2.name = ++objectCount ;
	scene.add(m2) ;
	
	var geometry = new THREE.SphereGeometry( 0.2, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'red', specular: 0x555555, shininess: 30 } );	
	m3 = new THREE.Mesh(geometry, material) ;
	m3.name = ++objectCount ;
	scene.add(m3) ;
	m3.position.x += 2 ;
	m3.position.y -= 0.1 ;
	m4 = new THREE.Mesh(geometry, material) ;
	m4.name = ++objectCount ;
	m4.position.x += 2 ;
	m4.position.y -= 0.4 ;
	scene.add(m4) ;
	animateCombinationReaction() ;
}
function animateCombinationReaction() {
	if(m1.position.x <= -0.25 && c_flag) {
		m1.position.x += 0.01 ;
		m2.position.x += 0.01 ;
		m3.position.x -= 0.01 ;
		m4.position.x -= 0.01 ;
	} else if(m1.position.x > -2){
		m1.position.x -= 0.01 ;
		m3.position.x -= 0.01 ;
		m2.position.x += 0.01 ;
		m4.position.x += 0.01 ;
		c_flag = 0 ;
	}
	requestAnimationFrame(animateCombinationReaction) ;
}
var a1, a2, a3, a4, a5, d_flag = 1, cnt = 0;
function Decomposition() {
	var geometry = new THREE.SphereGeometry( 0.5, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'red', specular: 0x555555, shininess: 30 } );
	a1 = new THREE.Mesh(geometry, material) ;
	a1.name = ++objectCount ;
	scene.add(a1) ;
	var geometry = new THREE.SphereGeometry( 0.4, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'green', specular: 0x555555, shininess: 30 } );
	a2 = new THREE.Mesh(geometry, material) ;
	a2.position.x += 0.7 ;
	a2.name = ++objectCount ;
	scene.add(a2) ;
	
	var geometry = new THREE.SphereGeometry( 0.3, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'yellow', specular: 0x555555, shininess: 30 } );	
	a3 = new THREE.Mesh(geometry, material) ;
	a3.name = ++objectCount ;
	a3.position.x += a2.position.x+0.5 ;
	scene.add(a3) ;
	
	a4 = new THREE.Mesh(geometry, material) ;
	a4.name = ++objectCount ;
	a4.position.x += 0.7 ;
	a4.position.y += 0.5 ;
	scene.add(a4) ;
	a5 = new THREE.Mesh(geometry, material) ;
	a5.name = ++objectCount ;
	a5.position.x += 0.7 ;
	a5.position.y -= 0.5 ;
	scene.add(a5) ;
	animateDecompositionReaction() ;
}
function animateDecompositionReaction() {

	if(d_flag && cnt > 50) {
		d_flag = 0 ;
		a5.position.x -= 0.5 ;
		a5.position.y -= 0.1 ;
		a3.position.x = a4.position.x ;
		a3.position.y = -a4.position.y ;
	} else if(flag == 0){
		if(a1.position.x > -2) {
			a1.position.x -= 0.01 ;
			a5.position.x -= 0.01 ;
			a2.position.x += 0.01 ;
			a3.position.x += 0.01 ;
			a4.position.x += 0.01 ;
		}
	}
	cnt++ ;
	requestAnimationFrame(animateDecompositionReaction) ;

}
var c1, c2, c3, c4, c5, c6, c7, cnt = 0, flag = 0;
function DoubleDisplacement() {
	var geometry = new THREE.SphereGeometry( 0.5, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'red', specular: 0x555555, shininess: 30 } );
	c1 = new THREE.Mesh(geometry, material) ;
	c1.name = ++objectCount ;
	scene.add(c1) ;
	
	var geometry = new THREE.SphereGeometry( 0.3, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'blue', specular: 0x555555, shininess: 30 } );	
	c2 = new THREE.Mesh(geometry, material) ;
	c2.name = ++objectCount ;
	c2.position.x += 0.7 ;
	scene.add(c2) ;
	
	var geometry = new THREE.SphereGeometry( 0.25, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'steelblue', specular: 0x555555, shininess: 30 } );
	c3 = new THREE.Mesh(geometry, material) ;
	c3.name = ++objectCount ;
	c3.position.x += 1.1 ;
	scene.add(c3) ;
	c4 = new THREE.Mesh(geometry, material) ;
	c4.name = ++objectCount ;
	c4.position.x += 0.7 ;
	c4.position.y += 0.5 ;
	scene.add(c4) ;
	c5 = new THREE.Mesh(geometry, material) ;
	c5.name = ++objectCount ;
	c5.position.x += 0.7 ;
	c5.position.y -= 0.5 ;
	scene.add(c5) ;
	
	var geometry = new THREE.SphereGeometry( 0.3, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 'cyan', specular: 0x555555, shininess: 30 } );
	c6 = new THREE.Mesh(geometry, material) ;
	c6.name = ++objectCount ;
	c6.position.x -= 2 ;
	scene.add(c6) ;
	
	var geometry = new THREE.SphereGeometry( 0.5, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );	
	c7 = new THREE.Mesh(geometry, material) ;
	c7.name = ++objectCount ;
	c7.position.x -= 2.8 ;
	scene.add(c7) ;
	
	animateDoubleDisplacement() ; 
}
function animateDoubleDisplacement() {
	if(c6.position.x <= -1.3) {
		c6.position.x += 0.01 ;
		c7.position.x += 0.01 ;
		c1.position.x -= 0.01 ;
		c2.position.x -= 0.01 ;
		c3.position.x -= 0.01 ;
		c4.position.x -= 0.01 ;
		c5.position.x -= 0.01 ;
	} else {
		if(c1.position.y < 2) {
			if(c1.position.y > 1) flag = 1 ;
			c6.position.y += 0.02 ;
			c1.position.y += 0.02 ;
		}
		if(flag && c7.position.x < -1.4) {
			c7.position.x += 0.01 ;
			c2.position.x -= 0.01 ;
			c3.position.x -= 0.01 ;
			c4.position.x -= 0.01 ;
			c5.position.x -= 0.01 ;
		}
	}
	requestAnimationFrame(animateDoubleDisplacement) ;

}
var d1, d2, d3, d4, d5, d6, d7;
function SingleDisplacement() {
	var geometry = new THREE.SphereGeometry( 0.5, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0x1874cd, specular: 0x555555, shininess: 30 } );
	d1 = new THREE.Mesh(geometry, material) ;
	d1.name = ++objectCount ;
	scene.add(d1) ;
	var geometry = new THREE.SphereGeometry( 0.3, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xfa8072, specular: 0x555555, shininess: 30 } );	
	d2 = new THREE.Mesh(geometry, material) ;
	d2.name = ++objectCount ;
	d2.position.x += 0.7 ;
	scene.add(d2) ;
	
	d3 = new THREE.Mesh(geometry, material) ;
	d3.name = ++objectCount ;
	d3.position.x -= 0.7 ;
	scene.add(d3) ;
	
	d4 = new THREE.Mesh(geometry, material) ;
	d4.name = ++objectCount ;
	d4.position.y += 0.7 ;
	scene.add(d4) ;
	
	d5 = new THREE.Mesh(geometry, material) ;
	d5.name = ++objectCount ;
	d5.position.y -= 0.7 ;
	scene.add(d5) ;
	
	var geometry = new THREE.SphereGeometry( 0.4, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xfe2e2e, specular: 0x555555, shininess: 30 } );	
	d6 = new THREE.Mesh(geometry, material) ;
	d6.name = ++objectCount ;
	d6.position.x -= 3 ;
	scene.add(d6) ;
	
	var geometry = new THREE.SphereGeometry( 0.4, 32, 32 );
	var material = new THREE.MeshPhongMaterial( { ambient: 0x050505, color: 0xFF1493, specular: 0x555555, shininess: 30 } );	
	d7 = new THREE.Mesh(geometry, material) ;
	d7.name = ++objectCount ;
	d7.position.x += 1.3 ;
	scene.add(d7) ;	
	
	animateSingleDisplacement() ;
}
function animateSingleDisplacement() {
	if(d6.position.x <= -1.3) {
		d6.position.x += 0.01 ;
	} else {
		if(d7.position.x <= 3) {
			d7.position.x += 0.01 ;
		}
	}
	requestAnimationFrame(animateSingleDisplacement) ;

}
