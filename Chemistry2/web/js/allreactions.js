var AtomList = new Array(1000) ;
var colorArray = [ 'red',  'blue', 'yellow', 'steelblue', 'green', 'cyan', 0x9966FF, 0x00FFFF, 0x33FF66, 0x0000FF ] ;
var colorcnt = 0 ;

function start(reaction) {
	var ballSpeed = [ 0, 0.01, -0.01, 0.02, -0.02, 0.025, -0.025, 0.3, -0.3, 0.035, -0.035] ;
	camera.position.z = 5 ;
	colorcnt = 0 ;
	AtomList.length = 0 ;
	deleteObjects() ;
	var gene_reac_flag = 1 ;
	//window.addEventListener("click",even);
	var reactantsObjects = new Array(1000) ;
	var productsObjects = new Array(1000) ;
  	var reactantsObjectsLength = 0 , productsObjectsLength = 0;
  	var l=reaction.length;
  	var i=0,j=0,c,nr=0,np=0;
  	var matrix=[];
  	var coeff_flag=0,start_flag=0, symbol_flag=0, reaction_flag=0;
   	matrix[0]="";
   	function notSameElement(c) {
     	if((c>='A'&& c<='Z')||c==' '||c=='('||c=='-'||c=='+'||c=='[')
             	return true;
       	else false;
	}
   	while(i<l) {
    	c=reaction[i];
		if(c==' ') {
   			if(i+1<l) {
   				while((reaction[i+1]==' ')&& (i+1<l)) {
   					i++;
             	}
           	}
      		if(start_flag==0) coeff_flag=0;//check for coefficient
         	else start_flag=0;//new compound has to begin
     	} else if(c>=0 && c<=9) {
                  matrix[j]+=c;
                  coeff_flag=1;//coefficient is done
                  if(i+1<l)
                   { while((reaction[i+1]==' ')&& (i+1<l))
                       {i++;
                          // console.log("Ignoring space ");
                       }
                   }
      	} else if(c>='A' && c<='Z') {
			if(coeff_flag==0) {
          		matrix[j]+='1'; //add coefficient 
         		coeff_flag=1;
            	start_flag=1;//the compound has to begin
          	}

        	matrix[j]+=c;
         	if(notSameElement(reaction[i+1]) && i+1<l)
              	matrix[j]+='1';
          	else if(i+1==l)
          		matrix[j]+='1';
        	symbol_flag=0;//check for next symbol
     	} else if(c>='a'&& c<='z') {
         	if(symbol_flag==0) {
             	matrix[j]+=c;
        		symbol_flag=1;
        	}
  			if(notSameElement(reaction[i+1]) && i+1<l) matrix[j]+='1';
       		else if(i+1==l) matrix[j]+='1';
                       
      	}
     	else if(c=='{') {
     		i++;
         	while(reaction[i]!='}') {
          		matrix[j]+=reaction[i];
           		i++;
    		}
     	} else if(c=='[') {//all superscript data ignored
        	i++;
      		while(reaction[i]!=']') {
                       i++;
           	}
     	}
      	else if(c=='+') {
    		matrix[j]+='\0';
      		j++;//next string in the array
       		matrix[j]="";
		} else if(c=='-'||c=='>') {
                   if(reaction_flag==0)
                   {
                       j++;//next row with product
                       matrix[j]="";
                       nr=j;//number of reactants
                       reaction_flag=1;
                   }
                   if(c=='>')
                   {
                       if(i+1<l)
                   { while((reaction[i+1]==' ')&& (i+1<l))
                       {i++;
                           //console.log("Ignoring space ");
                       }
                   }
                   start_flag=0;
                   coeff_flag=0;
		               }
		} else if(c=='(') {
       		matrix[j]+=c;
      	} else if(c==')') {                   
   			matrix[j]+=c;
			if(notSameElement(reaction[i+1]) && i+1<l) matrix[j]+='1';
    		else if(i+1==l) matrix[j]+='1';               
    	}   
   		i++;
	}	
	np=j-nr+1;
  	var reactionMatrix = [] ;
  	for(var i = 0; i < np+nr; i++) {
  		var tempList = [] ;
  		var str = "" ;
  		for(var j = 0; j < matrix[i].length; ) {
  			var prevj = j ;
  			str = "" ;
  			while('0' <= matrix[i][j] && matrix[i][j] <= '9' && !isNaN(matrix[i][j]))
  				str += matrix[i][j], j++ ;
  			if(str != "") tempList.push(str) ;
  			//console.log(str) ;
  			//
  			str = "" ;
  			
  			while( ('a' <= matrix[i][j] && matrix[i][j] <= 'z' ) || ('A' <= matrix[i][j] && matrix[i][j] <= 'Z')) {
  				str += matrix[i][j] ;
  				j++ ;
  			}
  			if(str != "") tempList.push(str) ;
  			if(str != "") {
  				var found = false ;
  				for(var k = 0; k < AtomList.length; k++) {
  					if(AtomList[k] == str) {
  						found = true ;
  					}
  				}
  				if(!found) {
  					AtomList.push(str) ;
  					AtomList.push(colorArray[colorcnt++]) ;
  					//console.log(str + " "+ colorArray[colorcnt++]) ;
  				}
  			}
  			
  			//console.log(str) ;
  			if(matrix[i][j] == '(') {
  				tempList.push('(') ;
  				j++ ;
  			}
  			if(matrix[i][j] == ')') {
  				tempList.push(')') ;
  				j++ ;
  			}
  			if(prevj == j) break ;
   		}
   		reactionMatrix.push(tempList) ;
  	}
	var i = 0, j = 0;
	while(i < nr) {
		if(isNaN(reactionMatrix[i][0])) coeff = 1 ;
		else var coeff = parseInt(reactionMatrix[i][0]) ;
		var ob = makeCompound(reactionMatrix[i]) ;
		//alert(coeff) ;
		for(var k = 0; k < coeff; k++) {
			reactantsObjects[j++] = ob.clone() ;
		}
		i++ ;
	}
	var i = 0 ;
	reactantsObjectsLength = j ;
	for(var i = 0, s = -reactantsObjectsLength/2; i < j; i++, s += 1) {
		reactantsObjects[i].position.set(-4, 2*s, 0) ;
		reactantsObjects[i].name = ++objectCount ;
		scene.add(reactantsObjects[i]) ;
	}
	var i = nr, j = 0;
	while(i < nr+np) {
		if(isNaN(reactionMatrix[i][0])) coeff = 1 ;
		else var coeff = parseInt(reactionMatrix[i][0]) ;
		//alert(coeff) ;
		var ob = makeCompound(reactionMatrix[i]) ;
		//alert("reactants" + reactionMatrix[i]) ;
		for(var k = 0; k < coeff; k++) {
			productsObjects[j++] = ob.clone() ;
		}
		i++;
	}
	productsObjectsLength = j ;
	//alert(productsObjectsLength) ;
	for(var i = 0, s = -productsObjectsLength/2; i < j; i++, s += 1) {
		productsObjects[i].position.set(0, 0, 1500/(i+1)) ;
		productsObjects[i].name = ++objectCount ;
		scene.add(productsObjects[i]) ;
	}
	var cnt = 0, baymax = -2;
	function animate() {
		if(baymax <= -1) {
			for(var i = 0, s = -reactantsObjectsLength/2; i < reactantsObjectsLength; i++, s += 1) {
				reactantsObjects[i].position.x += 0.01 ;
				if(s < 0) reactantsObjects[i].position.y += 0.01 ;
				else if(s > 0) reactantsObjects[i].position.y -= 0.01 ;
			}
		} else {
			if(gene_reac_flag == 1) {
				for(var i = 0; i < reactantsObjectsLength; i++) {
					reactantsObjects[i].position.z = 1500 ;
				}
				for(var i = 0; i < productsObjectsLength; i++) {
					productsObjects[i].position.z = 0 ;
				}
				gene_reac_flag = 0 ;
			}
 			if(baymax <= 1) {
 				for(var i = 0, s = -productsObjectsLength/2, k = 0; i < productsObjectsLength; i++, s += 1) {
 					productsObjects[i].position.x += 0.01 ; 
 					productsObjects[i].position.y += ballSpeed[i] ;
 				}
 			}
		}
		requestAnimationFrame(animate) ;
		//render() ;
		baymax += 0.01 ;
	}
	animate() ;
}
function makeCompound(desc) {
	var bracket_found = false ;
	for(var i = 0; i < desc.length; i++) {
		if(desc[i] == '(' || desc[i] == ')') {
			bracket_found = true ;
		}	
	}
	if(!bracket_found) {
		return makeHelper(desc) ;		
	} else {
		var main_ob = new THREE.Object3D() ;
		var first_index, last_index ;
		for(var i = 0; i < desc.length; i++) {
			if(desc[i] == '(') {
				first_index = i ;
			}
			if(desc[i] == ')') {
				last_index = i ;
			}
		}
		var tempList = [] ;
		for(var i = first_index+1; i < last_index; i++) {
			tempList.push(desc[i]) ;
		}
		var ob = makeHelper(tempList) ;
		var count = parseInt(desc[last_index+1]) ;
		
		var cnt = parseInt(desc[first_index-1]) ;
		var ballColor = getColor[desc[1]] ;
		for(var i = 0; i < cnt; i++) {
			var ball = new THREE.Mesh(
				new THREE.SphereBufferGeometry(0.4, 32, 32),
				new THREE.MeshPhongMaterial( { ambient: 0x050505, color: ballColor, specular: 0x555555, shininess: 30 } )
			);		
			ball.position.x = i*0.4 ;
			main_ob.add(ball) ;	
		}
		if(count == 1) {
			ob.position.x += main_ob.position.x+0.6 ;
			main_ob.add(ob) ;
		} else if(count == 2) {
			//alert('here') ;
			var cpy = ob.clone() ;
			cpy.position.x += main_ob.position.x + 0.35 ;
			main_ob.add(cpy) ;
			var cpy = ob.clone() ;
			cpy.rotation.z -= Math.PI ;
			cpy.position.x -= main_ob.position.x;
			main_ob.add(cpy) ;
		} else if(count == 3) {
			var cpy = ob.clone() ;
			cpy.position.x += main_ob.position.x + 0.6 ;
			main_ob.add(cpy) ;
			var cpy = ob.clone() ;
			cpy.rotation.z -= Math.PI ;
			cpy.position.x -= main_ob.position.x;
			main_ob.add(cpy) ;
			var cpy = ob.clone() ;
			cpy.rotation.y += Math.PI/2 ;
			cpy.position.y += main_ob.position.y + 0.5 ;
			main_ob.add(cpy) ;			
		}
		return main_ob ;
	}
	animate() ;
}
function makeHelper(desc) {
	var prevx = 0 ;
	var prevy = 0 ;
	var prevr = 0 ;
	var coeff = parseInt(desc[0])
		
	var ob = new THREE.Object3D() ;
		
	for(var j = 1; j < desc.length; j++) {
		
		if(isNaN(desc[j])) {
			//text
		} else {
			//number of balls
			var n = parseInt(desc[j]) ;
			//radius of balls
			var currr = Math.min(1-n/10, 0.4) ;
			var ballColor = getColor(desc[j-1]) ;
			//very first ball
			var ball = new THREE.Mesh(
				new THREE.SphereBufferGeometry(currr, 32, 32),
				new THREE.MeshPhongMaterial( { ambient: 0x050505, color: ballColor, specular: 0x555555, shininess: 30 } )
			);
			ball.position.set(prevr+currr, 0, 0) ;
			ball.name = desc[j-1] ;
			var spritey = makeTextSprite(desc[j-1], 10);
			spritey.position.set(prevr+currr+3, -1.5, 0.5)
    		//ob.add(spritey) ;
			ob.add(ball) ;
			//remainig balls
			for(var k = 1, shiftX = 0, shiftY = 0.6; k < n; k++) {
				
				if(k&1) {
					shiftX += 0.5 ;
					var ball = new THREE.Mesh(
						new THREE.SphereBufferGeometry(currr, 32, 32),
						new THREE.MeshPhongMaterial( { ambient: 0x050505, color: ballColor, specular: 0x555555, shininess: 30 } )
					);
					ball.position.set(prevr+currr-shiftX, shiftY, 0) ;
					ball.name = desc[j-1] ;
						var spritey = makeTextSprite(desc[j-1], 10);
						spritey.position.set(prevr+currr+3, -1.5, 0.5) ;
    					//ob.add(spritey) ;					
					ob.add(ball) ; 						
 				} else {
					var ball = new THREE.Mesh(
						new THREE.SphereBufferGeometry(currr, 32, 32),
						new THREE.MeshPhongMaterial( { ambient: 0x050505, color: ballColor, specular: 0x555555, shininess: 30 } )
					);
					ball.position.set(prevr+currr-shiftX, -shiftY, 0) ;
					ball.name = desc[j-1] ;
					var spritey = makeTextSprite(desc[j-1], 10) ;
					spritey.position.set(prevr+currr+3, -1.5, 0.5)
    				//ob.add(spritey) ;		
					ob.add(ball) ; 						
 				}
			}
			prevr += currr*1.5;
		}
	}
	return ob ;
}
function getColor(type) {
	
	for(var i = 0; i < AtomList.length; i++) {
		if(type == AtomList[i]) {
			return AtomList[i+1] ;
		}
	}
}
function makeTextSprite( message, parameters ) {
        if ( parameters === undefined ) parameters = {};
        var fontface = parameters.hasOwnProperty("fontface") ? parameters["fontface"] : "Arial";
        var fontsize = parameters.hasOwnProperty("fontsize") ? parameters["fontsize"] : 13;
        var borderThickness = parameters.hasOwnProperty("borderThickness") ? parameters["borderThickness"] : 4;
        var borderColor = parameters.hasOwnProperty("borderColor") ?parameters["borderColor"] : { r:100, g:120, b:220, a:1.0 };
        var backgroundColor = parameters.hasOwnProperty("backgroundColor") ?parameters["backgroundColor"] : { r:255, g:255, b:255, a:1.0 };
        var textColor = parameters.hasOwnProperty("textColor") ?parameters["textColor"] : { r:0, g:0, b:0, a:1.0 };

        var canvas = document.createElement('canvas');
        var context = canvas.getContext('2d');
        context.font = "Bold " + fontsize + "px " + fontface;
        var metrics = context.measureText( message );
        var textWidth = metrics.width;

        context.fillStyle   = "rgba(" + backgroundColor.r + "," + backgroundColor.g + "," + backgroundColor.b + "," + backgroundColor.a + ")";
        context.strokeStyle = "rgba(" + borderColor.r + "," + borderColor.g + "," + borderColor.b + "," + borderColor.a + ")";

        context.lineWidth = borderThickness;
        roundRect(context, borderThickness/2, borderThickness/2, (textWidth + borderThickness) * 1.1, fontsize * 1.4 + borderThickness, 8);

        context.fillStyle = "rgba("+textColor.r+", "+textColor.g+", "+textColor.b+", 1.0)";
        context.fillText( message, borderThickness, fontsize + borderThickness);

        var texture = new THREE.Texture(canvas) 
        texture.needsUpdate = true;

        var spriteMaterial = new THREE.SpriteMaterial( { map: texture, useScreenCoordinates: false } );
        var sprite = new THREE.Sprite( spriteMaterial );
        //sprite.scale.set(10, 10, 10) ;
        sprite.scale.set(0.5 * fontsize, 0.25 * fontsize, 0.75 * fontsize);
        return sprite;  
}
function roundRect(ctx, x, y, w, h, r) 
{
    ctx.beginPath();
    ctx.moveTo(x+r, y);
    ctx.lineTo(x+w-r, y);
    ctx.quadraticCurveTo(x+w, y, x+w, y+r);
    ctx.lineTo(x+w, y+h-r);
    ctx.quadraticCurveTo(x+w, y+h, x+w-r, y+h);
    ctx.lineTo(x+r, y+h);
    ctx.quadraticCurveTo(x, y+h, x, y+h-r);
    ctx.lineTo(x, y+r);
    ctx.quadraticCurveTo(x, y, x+r, y);
    ctx.closePath();
    ctx.fill();
	ctx.stroke();   
}