 xquery version "3.0";

let $typeText := for $typeText in collection("/db/apps/acceso/questions")/questions/question[type="text"]
order by util:random()
    return <question id="{$typeText/@id}">{$typeText/node()[not(name(.)='answer')]}</question>
    
let $typeCheck :=for  $typeCheck in collection("/db/apps/acceso/questions")/questions/question[type="checkbox"]
order by util:random()
    return <question id="{$typeCheck/@id}">{$typeCheck/node()[not(name(.)='answer')]}</question>
    
let $typeRadio := for $typeRadio in collection("/db/apps/acceso/questions")/questions/question[type="radio"]
order by util:random()
    return <question id="{$typeRadio/@id}">{$typeRadio/node()[not(name(.)='answer')]}</question>
  
let $typeSelect := for $typeSelect in collection("/db/apps/acceso/questions")/questions/question[type="select"]
order by util:random()
    return <question id="{$typeSelect/@id}">{$typeSelect/node()[not(name(.)='answer')]}</question>
 
let $typeMultiple :=for  $typeMultiple in collection("/db/apps/acceso/questions")/questions/question[type="multiple"]
order by util:random()
    return <question id="{$typeMultiple/@id}">{$typeMultiple/node()[not(name(.)='answer')]}</question>
   
let $questions := <questions>
                    {$typeText[position()<3]}
                    {$typeCheck[position()<3]}
                    {$typeRadio[position()<3]}
                    {$typeSelect[position()<3]}
                    {$typeMultiple[position()<3]}
                 </questions>
    return $questions