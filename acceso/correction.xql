xquery version "3.0";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes";
let $unused := ""

let $typeText := for $typeText  in collection('/db/apps/acceso/questions')/questions/question[type="text"] 
 for $pregunta in request:get-parameter-names()
 return
    if($pregunta = $typeText/@id) then
    <question id="{$typeText/@id}">{$typeText/type}{$typeText/title}{$typeText/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
        if($typeText/answer = request:get-parameter($pregunta, ''))then 
    	    <puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
    else
    $unused

let $typeCheck :=for  $typeCheck in collection('/db/apps/acceso/questions')/questions/question[type="checkbox"] 
 for $pregunta in request:get-parameter-names()
 return
    if($pregunta = $typeCheck/@id) then
    <question id="{$typeCheck/@id}">{$typeCheck/type}{$typeCheck/title}{$typeCheck/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
    	if($typeCheck/answer = request:get-parameter($pregunta, ''))then 
    		<puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
    else
     $unused
     
let $typeRadio := for $typeRadio in collection('/db/apps/acceso/questions')/questions/question[type="radio"] 
 for $pregunta in request:get-parameter-names()
 return
    if($pregunta = $typeRadio/@id) then
    <question id="{$typeRadio/@id}">{$typeRadio/type}{$typeRadio/title}{$typeRadio/answer}<respuesta>{request:get-parameter($pregunta, '')}</respuesta>{
    	if($typeRadio/answer = request:get-parameter($pregunta, ''))then 
    	    <puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
     else
    $unused
  
let $typeSelect := for $typeSelect in collection('/db/apps/acceso/questions')/questions/question[type="select"] 
  for $pregunta in request:get-parameter-names()
  return
    if($pregunta = $typeSelect/@id) then
    <question id="{$typeSelect/@id}">{$typeSelect/type}{$typeSelect/title}{$typeSelect/answer}<respuesta>{request:get-parameter($pregunta, '')}            </respuesta>{
    	if($typeSelect/answer = request:get-parameter($pregunta, ''))then 
    		<puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
    else
    $unused

let $typeMultiple :=for  $typeMultiple in collection('/db/apps/acceso/questions')/questions/question[type="multiple"] 
 for $pregunta in request:get-parameter-names()
 return
    if($pregunta = $typeMultiple/@id) then
    <question id="{$typeMultiple/@id}">{$typeMultiple/type}{$typeMultiple/title}{$typeMultiple/answer}<respuesta>{request:get-parameter($pregunta, '')}     </respuesta>{
    	if($typeMultiple/answer = request:get-parameter($pregunta, ''))then 
    		<puntos>1</puntos>
    	else
    		<puntos>0</puntos>
    	}
    </question>
     else
    $unused
   
let $questions := <questions>
                    {$typeText}
                    {$typeCheck}
                    {$typeRadio}
                    {$typeSelect}
                    {$typeMultiple}
                  </questions>
let  $questions :=  $questions 

return transform:transform($questions, doc("/db/apps/acceso/presentacion.xsl"), ())