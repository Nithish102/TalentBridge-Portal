menuItems.forEach(item => {
  item.addEventListener("click", () => {
    document.querySelector(".menu li.active").classList.remove("active");
    item.classList.add("active");
  
    const contentKey = item.getAttribute("data-content");
    contentArea.innerHTML = `<h2>${contentData[contentKey].title}</h2><p>${contentData[contentKey].text}</p>`;
  });
  });
  

  function guide()
  {


      let guidedisplay = document.getElementById("Guide");
      guidedisplay.style.display=("block");
 
  
      let completeprofiledisplay = document.getElementById("completeprofile");
      completeprofiledisplay.style.display=("none");
  
      let viewprofiledisplay = document.getElementById("viewprofile");
      viewprofiledisplay.style.display=("none");

      let Jobportaldisplay = document.getElementById("JobPost");
      Jobportaldisplay.style.display=("none");

      let candidatelistdisplay = document.getElementById("candidatelist");
      candidatelistdisplay.style.display=("none");
  
  
      let Deletedisplay = document.getElementById("Delete");
      Deletedisplay.style.display=("none");
  
  
      let Logoutdisplay = document.getElementById("Logout");
      Logoutdisplay.style.display=("none");
  
  
      let guideBackground =document.getElementById("guide")
      guideBackground.style.backgroundColor="rgb(2, 196, 2)";

      let completeprofileBackground =document.getElementById("CompleteProfile")
      completeprofileBackground.style.backgroundColor=("white");
	  
	  let viewprofileBackground =document.getElementById("ViewProfile")
	   viewprofileBackground.style.backgroundColor=("white");

      let JobPostBackground=document.getElementById("jobpost")
      JobPostBackground.style.backgroundColor=("white");
  
      
      let candidateBackground=document.getElementById("canlist")
      candidateBackground.style.backgroundColor=("white");
  
      let DeleteBackground = document.getElementById("delete");
      DeleteBackground.style.backgroundColor=("white");
  
  
      let LogoutBackground = document.getElementById("logout");
      LogoutBackground.style.backgroundColor=("white");
    }

  function completeprofile(){
 
      let completeprofiledisplay = document.getElementById("completeprofile");
      completeprofiledisplay.style.display=("block");

     let viewprofiledisplay = document.getElementById("viewprofile");
     viewprofiledisplay.style.display=("none");

      let guidedisplay = document.getElementById("Guide");
      guidedisplay.style.display=("none");
  

      
      let Jobportaldisplay = document.getElementById("JobPost");
      Jobportaldisplay.style.display=("none");


      let candidatelistdisplay = document.getElementById("candidatelist");
      candidatelistdisplay.style.display=("none");


      let Deletedisplay = document.getElementById("Delete");
      Deletedisplay.style.display=("none");
  
  
      let Logoutdisplay = document.getElementById("Logout");
      Logoutdisplay.style.display=("none");


      let guideBackground =document.getElementById("guide")
      guideBackground.style.backgroundColor=("white");
  
  
      let completeprofileBackground =document.getElementById("CompleteProfile")
      completeprofileBackground.style.backgroundColor="rgb(2, 196, 2)";

	  
	  let viewprofileBackground =document.getElementById("ViewProfile")
	  viewprofileBackground.style.backgroundColor=("white");
      
      let JobPostBackground=document.getElementById("jobpost")
      JobPostBackground.style.backgroundColor=("white");
  
  
      let candidateBackground=document.getElementById("canlist")
      candidateBackground.style.backgroundColor=("white");

  
      let DeleteBackground = document.getElementById("delete");
      DeleteBackground.style.backgroundColor=("white");
  
  
      let LogoutBackground = document.getElementById("logout");
      LogoutBackground.style.backgroundColor=("white");
    }



   
  
  function viewprofile()
  {
     let guidedisplay = document.getElementById("Guide");
     guidedisplay.style.display=("none");


     let completeprofiledisplay = document.getElementById("completeprofile");
     completeprofiledisplay.style.display=("none");

     let Editprofiledisplay = document.getElementById("viewprofile");
     Editprofiledisplay.style.display=("block");


     let Deletedisplay = document.getElementById("Delete");
     Deletedisplay.style.display=("none");
   
   
   let Jobportaldisplay = document.getElementById("JobPost");
            Jobportaldisplay.style.display=("none");


     let Logoutdisplay = document.getElementById("Logout");
     Logoutdisplay.style.display=("none");

     let candidatelistdisplay = document.getElementById("candidatelist");
      candidatelistdisplay.style.display=("none");

     let guideBackground =document.getElementById("guide")
     guideBackground.style.backgroundColor=("white");


     let completeprofileBackground=document.getElementById("CompleteProfile")
     completeprofileBackground.style.backgroundColor=("white");

     let viewprofileBackground =document.getElementById("ViewProfile")
      viewprofileBackground.style.backgroundColor="rgb(2, 196, 2)";
    
    let JobPostBackground=document.getElementById("jobpost")
              JobPostBackground.style.backgroundColor=("white");

              let candidateBackground=document.getElementById("canlist")
              candidateBackground.style.backgroundColor=("white");

     let DeleteBackground = document.getElementById("delete");
     DeleteBackground.style.backgroundColor=("white");

     let LogoutBackground=document.getElementById("logout")
     LogoutBackground.style.backgroundColor=("white");

  }
    
  function Jobpost()
     {
     
          let guidedisplay = document.getElementById("Guide");
          guidedisplay.style.display=("none");
      
     
     
          let completeprofiledisplay = document.getElementById("completeprofile");
          completeprofiledisplay.style.display=("none");
      
          let viewprofiledisplay = document.getElementById("viewprofile");
          viewprofiledisplay.style.display=("none");
     

          let Jobportaldisplay = document.getElementById("JobPost");
          Jobportaldisplay.style.display=("block");
     
     
     
          let Deletedisplay = document.getElementById("Delete");
          Deletedisplay.style.display=("none");
     
     
          let Logoutdisplay = document.getElementById("Logout");
          Logoutdisplay.style.display=("none");
          let candidatelistdisplay = document.getElementById("candidatelist");
          candidatelistdisplay.style.display=("none");
     
     
          let guideBackground =document.getElementById("guide")
          guideBackground.style.backgroundColor=("white");
     
     
          let completeprofileBackground=document.getElementById("CompleteProfile")
          completeprofileBackground.style.backgroundColor=("white");
     
  	 let viewprofileBackground =document.getElementById("ViewProfile")
  	         viewprofileBackground.style.backgroundColor=("white");
    
          let JobPostBackground=document.getElementById("jobpost")
          JobPostBackground.style.backgroundColor="rgb(2, 196, 2)";
  	 
  	 let candidateBackground=document.getElementById("canlist")
  	          candidateBackground.style.backgroundColor=("white");
          

          let  DeleteBackground = document.getElementById("delete");
          DeleteBackground.style.backgroundColor=("white");
     
      
     
     
          let LogoutBackground = document.getElementById("logout");
          LogoutBackground.style.backgroundColor=("white");
               
     }

    function candidatelist(){
      let guidedisplay = document.getElementById("Guide");
      guidedisplay.style.display=("none");
 
 
      let completeprofiledisplay = document.getElementById("completeprofile");
      completeprofiledisplay.style.display=("none");
 
      let Editprofiledisplay = document.getElementById("viewprofile");
      Editprofiledisplay.style.display=("none");

      let candidatelistdisplay = document.getElementById("candidatelist");
      candidatelistdisplay.style.display=("block");
 
 
      let Deletedisplay = document.getElementById("Delete");
      Deletedisplay.style.display=("none");
    
    
    let Jobportaldisplay = document.getElementById("JobPost");
             Jobportaldisplay.style.display=("none");

            
 
 
      let Logoutdisplay = document.getElementById("Logout");
      Logoutdisplay.style.display=("none");
 
      let guideBackground =document.getElementById("guide")
      guideBackground.style.backgroundColor=("white");
 
 
      let completeprofileBackground=document.getElementById("CompleteProfile")
      completeprofileBackground.style.backgroundColor=("white");
 
      let viewprofileBackground =document.getElementById("ViewProfile")
       viewprofileBackground.style.backgroundColor=("white");
     
     let JobPostBackground=document.getElementById("jobpost")
     JobPostBackground.style.backgroundColor=("white");


     let candidateBackground=document.getElementById("canlist")
     candidateBackground.style.backgroundColor="rgb(2 ,196, 2)";
 
      let DeleteBackground = document.getElementById("delete");
      DeleteBackground.style.backgroundColor=("white");
 
      let LogoutBackground=document.getElementById("logout")
      LogoutBackground.style.backgroundColor=("white");
    }








function Delete()
{

   let guidedisplay = document.getElementById("Guide");
   guidedisplay.style.display=("none");


   let completeprofiledisplay = document.getElementById("completeprofile");
   completeprofiledisplay.style.display=("none");


   let Jobportaldisplay = document.getElementById("JobPost");
   Jobportaldisplay.style.display=("none");
 
 let viewprofiledisplay = document.getElementById("viewprofile");
 viewprofiledisplay.style.display=("none");

 let candidatelistdisplay = document.getElementById("candidatelist");
 candidatelistdisplay.style.display=("none");


   let Deletedisplay = document.getElementById("Delete");
   Deletedisplay.style.display=("block");


   let Logoutdisplay = document.getElementById("Logout");
   Logoutdisplay.style.display=("none");


   let guideBackground =document.getElementById("guide")
   guideBackground.style.backgroundColor=("white");


   let completeprofileBackground=document.getElementById("CompleteProfile")
   completeprofileBackground.style.backgroundColor=("white");

   let viewprofileBackground =document.getElementById("ViewProfile")
   viewprofileBackground.style.backgroundColor=("white");

   let JobPostBackground=document.getElementById("jobpost")
   JobPostBackground.style.backgroundColor=("white");


   let candidateBackground=document.getElementById("canlist")
   candidateBackground.style.backgroundColor=("white");

  

 let  DeleteBackground = document.getElementById("delete");
    DeleteBackground.style.backgroundColor="rgb(2, 196, 2)";


   let LogoutBackground = document.getElementById("logout");
   LogoutBackground.style.backgroundColor=("white");
        
}


function logout()
{   
  
  let guidedisplay = document.getElementById("Guide");
  guidedisplay.style.display=("none");

   let completeprofiledisplay = document.getElementById("completeprofile");
   completeprofiledisplay.style.display=("none");


   let Jobportaldisplay = document.getElementById("JobPost");
   Jobportaldisplay.style.display=("none");

   let candidatelistdisplay = document.getElementById("candidatelist");
   candidatelistdisplay.style.display=("none");


   let Deletedisplay = document.getElementById("Delete");
   Deletedisplay.style.display=("none");

 
 
 let viewprofiledisplay = document.getElementById("viewprofile");
 viewprofiledisplay.style.display=("none");
 
 

   let Logoutdisplay = document.getElementById("Logout");
   Logoutdisplay.style.display=("block");


   let guideBackground =document.getElementById("guide")
   guideBackground.style.backgroundColor=("white");


   let completeprofileBackground=document.getElementById("CompleteProfile")
   completeprofileBackground.style.backgroundColor=("white");

 
 let viewprofileBackground =document.getElementById("ViewProfile")
    viewprofileBackground.style.backgroundColor=("white");
	
	let JobPostBackground=document.getElementById("jobpost")
	JobPostBackground.style.backgroundColor=("white");
	
	let candidateBackground=document.getElementById("canlist")
	   candidateBackground.style.backgroundColor=("white");

   let DeleteBackground = document.getElementById("delete");
   DeleteBackground.style.backgroundColor=("white");

   let LogoutBackground=document.getElementById("logout")
   LogoutBackground.style.backgroundColor="rgb(2, 196, 2)";


        
}