function Octahedral(central_radius,bond_thickness,atom_radius) {
	var shape = new THREE.Group() ;
	var ob = new Linear(central_radius,bond_thickness,atom_radius) ;
	shape.add(ob.shape) ;
				
	var ob1 = new Linear(central_radius,bond_thickness,atom_radius) ;
	var ob1instance = ob1.shape ;
	ob1instance.rotation.z = Math.PI/2 ;
	shape.add(ob1instance) ;

	var ob2 = new Linear(central_radius,bond_thickness,atom_radius) ;
	var ob2instance = ob2.shape ;
	ob2instance.rotation.x = Math.PI/2 ;
	shape.add(ob2instance) ;
	this.shape = shape ;
}
