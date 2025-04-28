<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="com.demo.Candidate" %>
<%
    if (request.getAttribute("candidates") == null) {
        response.sendRedirect("viewCandidates");
        return;
    }
%>
    
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Employer Profile </title>
    <link rel="shortcut icon" href="./Employeeimages/titlebar-logo.png" type="image/x-icon">
    <link rel="stylesheet" href="Employer.css">
    <script src="./Employer.js"></script>
</head>
<body>
  

    <div class="sidebar">
        <div class="logo">
          <img src="./Employeeimages/jobi-logo.png" alt="logo" />
        </div>
        <div class="profile">
          <div class="profile-name"> <p> Welcome </p><h1>  <%= session.getAttribute("userName") %> 🖖 </h1></div>
        </div>
    
        <ul class="menu">

            <li class="active" id="guide" onclick="guide()" ><img src="./Employeeimages/guide.png" alt=""> Start Guide </li>




          <li  id="CompleteProfile" onclick="completeprofile()"><img src="./Employeeimages/profile.png" alt=""> Build Profile</li>




          <li id="ViewProfile" onclick="viewprofile()"><img src="./Employeeimages/profile.png" alt=""> View Profile</li>




          <li id="jobpost" onclick="Jobpost()"><img src="./Employeeimages/jobs.png" alt="" > Post Jobs</li>



          <li id="canlist" onclick="candidatelist() "><img src="./Employeeimages/candidate.png" alt=""> Candidates</li>




          <li id="delete" onclick="Delete()"> <img src="./Employeeimages/Delete.png"  alt=""> Delete Account</li>



          <li id="logout" onclick="logout()"><img src="./Employeeimages/logout.png" alt=""> Log Out</li>


        </ul>
      </div>





      <div class="guide-container" id="Guide">
        <div class="header">
          <h1>Employer Start Guide</h1>
          <p>Everything you need to manage your hiring efficiently</p>
        </div>
    
        <div class="progress-bar">
          <div class="progress-bar-inner"></div>
        </div>
    
        <div class="steps">
    
          <div class="step-card">
            <div class="step-number">1</div>
            <div class="step-icon">🏢</div>
            <div class="step-title">Complete Profile</div>
            <div class="step-desc">
              Add your company’s details to gain credibility and attract top talent.
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">2</div>
            <div class="step-icon">🔎</div>
            <div class="step-title">Review Details</div>
            <div class="step-desc">
              Double-check your profile to ensure accuracy and professionalism.
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">3</div>
            <div class="step-icon">📄</div>
            <div class="step-title">Post Job</div>
            <div class="step-desc">
              Create engaging job listings with roles, responsibilities, and benefits.
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">4</div>
            <div class="step-icon">👥</div>
            <div class="step-title">Search Candidates</div>
            <div class="step-desc">
                Browse available candidates and connect with the best fit for your company.
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">5</div>
            <div class="step-icon">⚙️</div>
            <div class="step-title">Manage Account</div>
            <div class="step-desc">
              Log out securely or delete your account anytime at your convenience.
            </div>
          </div>
    
        </div>
      </div>






      <div class="ee-container" id="completeprofile">
        <h2 class="ee-title">Complete Your Profile</h2>

       <form action="EmployeeDetails" method="post" > 
            <!-- Basic Details -->
        <h3 class="ee-section-title">Basic Information</h3>
        <div class="ee-row">
          <div class="ee-group">
            <label for="ee-id" class="ee-label">Employee ID</label>
            <input type="text" id="ee-id" class="ee-input"  name=" EmployeeId" placeholder="EMP12345" required >
          </div>
          <div class="ee-group">
            <label for="ee-name" class="ee-label">Full Name</label>
            <input type="text" id="ee-name" class="ee-input"  name="FullName"  placeholder="John Doe" required >
          </div>
        </div>
    
        <div class="ee-row">
          <div class="ee-group">
            <label for="ee-email" class="ee-label">Email</label>
            <input type="email" id="ee-email" class="ee-input" name="Email"  placeholder="john@example.com" required >
          </div>
          <div class="ee-group">
            <label for="ee-phone" class="ee-label">Phone Number</label>
            <input type="text" id="ee-phone" class="ee-input"  name="Phnum"  placeholder="9876543210" required >
          </div>
        </div>
    
        <!-- Employee Type & Shift -->
       
        <div class="ee-divider"></div>
    
        <!-- Department & Role -->
        <h3 class="ee-section-title">Department & Role</h3>
        <div class="ee-row">
          <div class="ee-group">
            <label for="ee-department" class="ee-label">Department</label>
            <input type="text" id="ee-department" class="ee-input"  name="Department" placeholder="e.g., IT, HR, Finance" required >
          </div>
          <div class="ee-group">
            <label for="ee-role" class="ee-label">Role</label>
            <input type="text" id="ee-role" class="ee-input" name="Role"   placeholder="e.g., Senior Developer" required >
          </div>
        </div>
    
        <div class="ee-row">
          <div class="ee-group">
            <label for="ee-supervisor" class="ee-label">Reporting Manager</label>
            <input type="text" id="ee-supervisor" class="ee-input"  name="Manager"  placeholder="Manager Name" required >
          </div>
          <div class="ee-group">
            <label for="ee-work-location" class="ee-label">Work Location</label>
            <input type="text" id="ee-work-location" class="ee-input"  name="Location" placeholder="e.g., Bangalore" required >
          </div>
        </div>
    
        <div class="ee-divider"></div>
    
        <!-- Salary Details -->
        <h3 class="ee-section-title">Salary Information</h3>
        <div class="ee-row">
          <div class="ee-group">
            <label for="ee-salary" class="ee-label">Current Salary (CTC)</label>
            <input type="text" id="ee-salary" class="ee-input" name="Salary"  placeholder="e.g., ₹6,00,000" required >
          </div>
          <div class="ee-group">
            <label for="ee-bonus" class="ee-label">Bonus/Perks</label>
            <input type="text" id="ee-bonus" class="ee-input"  name="Bonus" placeholder="Optional" required >
          </div>
        </div>
    
        <div class="ee-divider"></div>
    
        <!-- Notes -->
        <h3 class="ee-section-title">Additional Notes</h3>
        <div class="ee-row">
          <div class="ee-group" style="flex: 1 1 100%;">
            <label for="ee-notes" class="ee-label">Notes</label>
            <textarea id="ee-notes" rows="4" class="ee-textarea"  name="Notes" placeholder="Any important remarks or notes" required></textarea>
          </div>
        </div>
    
        <!-- Submit -->
        <div class="ee-actions">
          <button type="submit" class="ee-button">Sumbit Changes</button>
        </div>
        </form>
      </div>
      
      
      
     <div class="emp-view-container" id="viewprofile">
  <h2 class="emp-view-title">Employee Profile</h2>

  <!-- Basic Information -->
  <h3 class="emp-view-section">Basic Information</h3>
  <div class="emp-view-row">
    <div class="emp-view-field">
      <span class="emp-view-label">Employee ID</span>
      <div class="emp-view-value" id="view-emp-id">  <%= session.getAttribute("empid") %> </div>
    </div>
    <div class="emp-view-field">
      <span class="emp-view-label">Full Name</span>
      <div class="emp-view-value" id="view-emp-name">  <%= session.getAttribute("name") %> </div>
    </div>
  </div>

  <div class="emp-view-row">
    <div class="emp-view-field">
      <span class="emp-view-label">Email</span>
      <div class="emp-view-value" id="view-emp-email">  <%= session.getAttribute("email") %> </div>
    </div>
    <div class="emp-view-field">
      <span class="emp-view-label">Phone Number</span>
      <div class="emp-view-value" id="view-emp-phone">  <%= session.getAttribute("Phonenum") %> </div>
    </div>
  </div>

  <!-- Department & Role -->
  <div class="emp-view-divider"></div>

  <h3 class="emp-view-section">Department & Role</h3>
  <div class="emp-view-row">
    <div class="emp-view-field">
      <span class="emp-view-label">Department</span>
      <div class="emp-view-value" id="view-emp-dept">  <%= session.getAttribute("department") %> </div>
    </div>
    <div class="emp-view-field">
      <span class="emp-view-label">Role</span>
      <div class="emp-view-value" id="view-emp-role">  <%= session.getAttribute("role") %> </div>
    </div>
  </div>

  <div class="emp-view-row">
    <div class="emp-view-field">
      <span class="emp-view-label">Reporting Manager</span>
      <div class="emp-view-value" id="view-emp-manager">  <%= session.getAttribute("reporting") %> </div>
    </div>
    <div class="emp-view-field">
      <span class="emp-view-label">Work Location</span>
      <div class="emp-view-value" id="view-emp-location">  <%= session.getAttribute("location") %> </div>
    </div>
  </div>

  <!-- Salary Information -->
  <div class="emp-view-divider"></div>

  <h3 class="emp-view-section">Salary Information</h3>
  <div class="emp-view-row">
    <div class="emp-view-field">
      <span class="emp-view-label">Current Salary (CTC)</span>
      <div class="emp-view-value" id="view-emp-salary">  <%= session.getAttribute("salary") %> </div>
    </div>
    <div class="emp-view-field">
      <span class="emp-view-label">Bonus/Perks</span>
      <div class="emp-view-value" id="view-emp-bonus">  <%= session.getAttribute("bonus") %> </div>
    </div>
  </div>

  <!-- Additional Notes -->
  <div class="emp-view-divider"></div>

  <h3 class="emp-view-section">Additional Notes</h3>
  <div class="emp-view-row">
    <div class="emp-view-field full-width">
      <span class="emp-view-label">Notes</span>
      <div class="emp-view-value" id="view-emp-notes">  <%= session.getAttribute("notes") %> </div>
    </div>
  </div>

  <!-- Action Buttons -->
  <div class="emp-view-actions">
    <a href="completeprofile.jsp" class="emp-view-edit-btn">Edit Profile</a>
    <button class="emp-view-download-btn">Download Profile</button>
  </div>
</div> 
      
      
      
 
      <div class="jobpost-container" id="JobPost">
        <h2>Post a New Job</h2>
        <form class="jobpost-grid"  action="jobPost"  method="post">
          <div class="jobpost-section">Job Information</div>
    
          <div class="jobpost-field">
            <label for="jobtitle" class="jobpost-label">Job Title</label>
            <input type="text" id="jobtitle" class="jobpost-input"  name="jobTiltle"  placeholder="e.g., Software Engineer" />
          </div>
    
          <div class="jobpost-field">
            <label for="department" class="jobpost-label">Department</label>
            <input type="text" id="department" class="jobpost-input"  name="Department"   placeholder="e.g., IT, Marketing" />
          </div>
    
          <div class="jobpost-field">
            <label for="location" class="jobpost-label">Location</label>
            <input type="text" id="location" class="jobpost-input" name="Location"   placeholder="e.g., New York, Remote" />
          </div>
    
          <div class="jobpost-field">
            <label for="salary" class="jobpost-label">Salary Range</label>
            <input type="text" id="salary" class="jobpost-input"  name="SalaryRange"   placeholder="e.g., $60,000 - $80,000" />
          </div>
    
          <div class="jobpost-field">
            <label for="jobtype" class="jobpost-label">Job Type</label>
            <select id="jobtype" class="jobpost-select" name="jobtype"  >
              <option>Select Job Type</option>
              <option>Full Time</option>
              <option>Part Time</option>
              <option>Internship</option>
              <option>Contract</option>
            </select>
          </div>
    
          <div class="jobpost-field">
            <label for="experience" class="jobpost-label">Experience Required</label>
            <input type="text" id="experience" class="jobpost-input" name="Experience"   placeholder="e.g., 2+ years" />
          </div>
    
          <div class="jobpost-field">
            <label for="qualification" class="jobpost-label">Qualification</label>
            <input type="text" id="qualification" class="jobpost-input" name="Qualification"   placeholder="e.g., B.Tech, MBA" />
          </div>
    
          <div class="jobpost-field">
            <label for="skills" class="jobpost-label">Skills Required</label>
            <input type="text" id="skills" class="jobpost-input"  name="Skills"  placeholder="e.g., Java, Communication, SQL" />
          </div>
    
          <div class="jobpost-section">Contact Information</div>
    
          <div class="jobpost-field">
            <label for="email" class="jobpost-label">Contact Email</label>
            <input type="email" id="email" class="jobpost-input" name="Contact"   placeholder="e.g., hr@company.com" />
          </div>
    
          <div class="jobpost-field">
            <label for="contact" class="jobpost-label">Contact Number</label>
            <input type="text" id="contact" class="jobpost-input" name="contactnum"   placeholder="e.g., +1 234 567 8901" />
          </div>
    
          <div class="jobpost-field jobpost-full">
            <label for="description" class="jobpost-label">Job Description</label>
            <textarea id="description" class="jobpost-textarea"  name="jobDescription"   placeholder="Provide a detailed job description..."></textarea>
          </div>
    
          <button type="submit" class="jobpost-btn">Post Job</button>
    
        </form>
      </div>



    <div class="overall-candidate-listing"  id="candidatelist">   
    <div class="candidate-container">
    <h2 class="candidate-heading">Candidate Profiles</h2>
    <table class="candidate-table">
        <tr>
            <th>Full Name</th>
            <th>Location</th>
            <th>Degree</th>
            <th>Institution</th>
            <th>YOG</th>
            <th>Skills</th>
             <th>Summary</th>
            <th>Contact</th>
        </tr>
        
   

        <%
            List<Candidate> candidates = (List<Candidate>) request.getAttribute("candidates");
            if (candidates == null || candidates.isEmpty()) {
        %>
        <tr><td colspan="18">No candidate profiles available</td></tr>
        <%
            } else {
                for (Candidate c : candidates) {
        %>
        <tr>
            <td><%= c.getFullName() %></td>    
            <td><%= c.getLocation() %></td>
            <td><%= c.getDegree() %></td>
            <td><%= c.getInstitution() %></td>
            <td><%= c.getYearOfGraduation() %></td>
            <td><%= c.getSkills() %></td>
             <td><%= c.getSummary()%></td>
             <td>
              <button>    <a href= "https://mail.google.com/mail/?view=cm&fs=1&to=<%= c.getEmailId()%>&su=Job%20Enquiry"  target=_blank>Contact</a>
              </button>
             </td>
    
            
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
    </div>




        <!--                Delete            -->

        <div id="Delete" class="overall-delete">
            <div class="delete-content">
              <h1>Are you sure you want to delete?</h1>
              <form action="deleteemp" method="post">
               <button class="delete-button">Yes</button>
               <button class="delete-button-1">Cancel</button>
               </form>
            </div>
          </div>     
    
         <!--                log out               -->
    
          <div id="Logout" class="overall-logout">
            <div class="logout-content">
              <h1>Are you sure you want to Logout?</h1>
              <form action="logoutemp" method="get">
               <button class="logout-button">Logout</button>
               <button class="logout-button-1"> Cancel </button>
               </form>
            </div>
          </div>     

</body>
</html>