<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*, com.demo.Job" %>


<%
    if (request.getAttribute("jobs") == null) {
        response.sendRedirect("viewJobs");
        return;
    }
%>








<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Candidate Profile </title>
    <link rel="shortcut icon" href="./candidateimages/titlebar-logo.png" type="image/x-icon">
    <link rel="stylesheet" href="candidate.css">
    <script src="candidate.js" ></script>
</head>
<body>
  

    <div class="sidebar">
        <div class="logo">
          <img src="./candidateimages/jobi-logo.png" alt="logo" />
        </div>
        <div class="profile">
          <div class="profile-name"> <p> Welcome </p><h1> <%= session.getAttribute("userName") %> 🖖</h1> </div>
        </div>
    
        <ul class="menu">

          <li class="active" id="guide" onclick="guide()"><img src="./candidateimages/guide.png" alt="">Start Guide</li>

          <li  id="CompleteProfile" onclick="completeprofile()"><img src="./candidateimages/profile.png" alt="">Build Profile</li>

          <li  id="ViewProfile" onclick="viewprofile()"><img src="./candidateimages/view Profile.png" alt=""> View Profile</li>


          <li id="JobList"  onclick="joblist()"><img src="./candidateimages/job-alert.png" alt=""> Job Alert</li>

          <li id="delete" onclick="Delete()"> <img src="./candidateimages/Delete.png" alt=""> Delete Account</li>


          <li  id="logout" onclick="logout()"><img src="./candidateimages/logout.png" alt=""> Log Out</li>
        </ul>
      </div>











      <div class="guide-container" id="Guide">
        <div class="header">
        <h1><%= session.getAttribute("userName") %> Start Guide</h1>
          <p>Everything you need to find and apply for jobs easily, all in one place.</p>
        </div>
    
        <div class="progress-bar">
          <div class="progress-bar-inner"></div>
        </div>
    
        <div class="steps">
    
          <div class="step-card" id="success-1">
            <div class="step-number">1</div>
            <div class="step-icon">🏢</div>
            <div class="step-title">Complete Profile</div>
            <div class="step-desc">
              Fill out all your personal, educational, and professional details. 
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">2</div>
            <div class="step-icon">🔎</div>
            <div class="step-title">Review Details</div>
            <div class="step-desc">
              Double-check your details to ensure everything is correct, professional, and up-to-date.
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">3</div>
            <div class="step-icon">💼</div>
            <div class="step-title">Browse Available Jobs</div>
            <div class="step-desc">
              Explore jobs posted by various employers. Find roles that match your skills and career goals.
            </div>
          </div>
    
          <div class="step-card">
            <div class="step-number">4</div>
            <div class="step-icon">📤</div>
            <div class="step-title">Apply to Jobs & Stay Updated</div>
            <div class="step-desc">
              Apply to jobs matching your skills and stay updated
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



























        <!--                      Complete Profile               -->
  
      <div class="ep-container" id="completeprofile">
        <h2 class="ep-title">Complete your Profile</h2>
    
        <!-- Personal Information -->
          <form action="CandidateDetails"  method= "post">
        <h3 class="ep-section-title">Personal Information</h3>
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-name" class="ep-label">Full Name</label>
            <input type="text" id="ep-name"  name="FullName" class="ep-input" placeholder="Enter your full name" required />
          </div>
          <div class="ep-group">
            <label for="ep-email" class="ep-label">Email Address</label>
            <input type="email" id="ep-email" name="Email" class="ep-input" placeholder="Enter your email" required />
          </div>
        </div>
    
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-phone" class="ep-label">Contact Number</label>
            <input type="text" id="ep-phone" class="ep-input" name="phnum" placeholder="Enter contact number" required />
          </div>
          <div class="ep-group">
            <label for="ep-location" class="ep-label">Location</label>
            <input type="text" id="ep-location" class="ep-input" name="Address" placeholder="Enter your location" required />
          </div>
        </div>
    
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-linkedin" class="ep-label">LinkedIn Profile</label>
            <input type="text" id="ep-linkedin" class="ep-input"  name="LinkedIn" placeholder="LinkedIn URL (optional)" />
          </div>
          <div class="ep-group">
            <label for="ep-portfolio" class="ep-label">Portfolio/Website</label>
            <input type="text" id="ep-portfolio" class="ep-input" name="Profileinfo" placeholder="Portfolio URL (optional)" />
          </div>
        </div>
    
        <div class="ep-divider"></div>
    
        <!-- Professional Summary -->
        <h3 class="ep-section-title">Professional Summary</h3>
        <div class="ep-row">
          <div class="ep-group" style="flex: 1 1 100%;">
            <label for="ep-summary" class="ep-label">Summary</label>
            <textarea id="ep-summary" rows="4" class="ep-textarea" name="Summary" placeholder="Briefly describe your skills and goals"></textarea>
          </div>
        </div>
    
        <div class="ep-divider"></div>
    
        <!-- Education -->
        <h3 class="ep-section-title">Education</h3>
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-degree" class="ep-label">Degree</label>
            <input type="text" id="ep-degree" class="ep-input" name="Degree" placeholder="e.g., B.Tech in Computer Science" required />
          </div>
          <div class="ep-group">
            <label for="ep-institution" class="ep-label">Institution</label>
            <input type="text" id="ep-institution" class="ep-input" name="Institution" placeholder="Enter Institution Name" required />
          </div>
        </div>
    
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-grad-year" class="ep-label">Year of Graduation</label>
            <input type="text" id="ep-grad-year" class="ep-input"  name="Year passedout" placeholder="e.g., 2022" required />
          </div>
          <div class="ep-group">
            <label for="ep-grade" class="ep-label">Grade/Percentage</label>
            <input type="text" id="ep-grade" class="ep-input"  name="percentage" placeholder="e.g., 75%" required />
          </div>
        </div>
    
        <div class="ep-divider"></div>
    
        <!-- Work Experience -->
        <h3 class="ep-section-title">Work Experience</h3>
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-job-title" class="ep-label">Job Title</label>
            <input type="text" id="ep-job-title" name="jobTitle" class="ep-input" placeholder="e.g., Java Developer" required />
          </div>
          <div class="ep-group">
            <label for="ep-company" class="ep-label">Company Name</label>
            <input type="text" id="ep-company"  name="CompanyName" class="ep-input" placeholder="Enter Company Name" required />
          </div>
        </div>
    
        <div class="ep-row">
         
          <div class="ep-group">
            <label for="ep-responsibilities" class="ep-label">Key Responsibilities</label>
            <input type="text" id="ep-responsibilities" name="responsibilities" class="ep-input" placeholder="Briefly describe" required />
          </div>
        </div>
    
        <div class="ep-divider"></div>
    
        <!-- Skills & Certifications -->
        <h3 class="ep-section-title">Skills & Certifications</h3>
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-skills" class="ep-label">Skills</label>
            <input type="text" id="ep-skills" class="ep-input"  name="skills" placeholder="e.g., Java, SQL, Spring Boot" />
          </div>
          <div class="ep-group">
            <label for="ep-certifications" class="ep-label">Certifications</label>
            <input type="text" id="ep-certifications" class="ep-input"  name="Certification" placeholder="e.g., AWS Certified" />
          </div>
        </div>
    
        <div class="ep-divider"></div>
    
        <!-- Resume & Preferences -->
        <h3 class="ep-section-title">Resume & Preferences</h3>
        <div class="ep-row">
          <div class="ep-group">
            <label for="ep-resume" class="ep-label">Resume Upload</label>
            <input type="file" id="ep-resume" name="resume"  class="ep-input" required />
          </div>
          <div class="ep-group">
            <label for="ep-preferences" class="ep-label">Job Preferences</label>
            <input type="text" id="ep-preferences" name="jobpreferences" class="ep-input" placeholder="Preferred job title, location, etc." />
          </div>
        </div>
    
        <!-- Submit -->
        <div class="ep-actions">
          <button type="submit" class="ep-button">Sumbit Changes</button>
        </div>
        </form>
      </div>













<div class="profile-view-container" id="viewprofile">
  <h2 class="profile-view-title">Your Profile</h2>

  <!-- Personal Information -->
  <h3 class="profile-section-header">Personal Information</h3>
  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Full Name</label>
      <div class="profile-field-value" id="view-name"> <%= session.getAttribute("userName") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Email Address</label>
      <div class="profile-field-value" id="view-email"> <%= session.getAttribute("Email") %> </div>
    </div>
  </div>

  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Contact Number</label>
      <div class="profile-field-value" id="view-phone"> <%= session.getAttribute("Phonenum") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Location</label>
      <div class="profile-field-value" id="view-location"> <%= session.getAttribute("location") %> </div>
    </div>
  </div>

  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">LinkedIn Profile</label>
      <div class="profile-field-value" id="view-linkedin"> <%= session.getAttribute("linkedid") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Portfolio/Website</label>
      <div class="profile-field-value" id="view-portfolio"> <%= session.getAttribute("portfolio") %> </div>
    </div>
  </div>

  <div class="profile-section-divider"></div>

  <!-- Professional Summary -->
  <h3 class="profile-section-header">Professional Summary</h3>
  <div class="profile-row">
    <div class="profile-field-group" style="flex: 1 1 100%;">
      <label class="profile-field-label">Summary</label>
      <div class="profile-field-value" id="view-summary" style="min-height: 80px;">
       <%= session.getAttribute("professional") %> 
      </div>
    </div>
  </div>

  <div class="profile-section-divider"></div>

  <!-- Education -->
  <h3 class="profile-section-header">Education</h3>
  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Degree</label>
      <div class="profile-field-value" id="view-degree"> <%= session.getAttribute("degree") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Institution</label>
      <div class="profile-field-value" id="view-institution"> <%= session.getAttribute("institution") %> </div>
    </div>
  </div>

  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Year of Graduation</label>
      <div class="profile-field-value" id="view-grad-year"> <%= session.getAttribute("yog") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Grade/Percentage</label>
      <div class="profile-field-value" id="view-grade"> <%= session.getAttribute("percentage") %> </div>
    </div>
  </div>

  <div class="profile-section-divider"></div>

  <!-- Work Experience -->
  <h3 class="profile-section-header">Work Experience</h3>
  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Job Title</label>
      <div class="profile-field-value" id="view-job-title"> <%= session.getAttribute("jobTitle") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Company Name</label>
      <div class="profile-field-value" id="view-company"> <%= session.getAttribute("companyName") %> </div>
    </div>
  </div>

  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Key Responsibilities</label>
      <div class="profile-field-value" id="view-responsibilities">
        <%= session.getAttribute("key") %> 
      </div>
    </div>
  </div>

  <div class="profile-section-divider"></div>

  <!-- Skills & Certifications -->
  <h3 class="profile-section-header">Skills & Certifications</h3>
  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Skills</label>
      <div class="profile-field-value" id="view-skills"> <%= session.getAttribute("skills") %> </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Certifications</label>
      <div class="profile-field-value" id="view-certifications"> <%= session.getAttribute("certification") %> </div>
    </div>
  </div>

  <div class="profile-section-divider"></div>

  <!-- Resume & Preferences -->
  <h3 class="profile-section-header">Resume & Preferences</h3>
  <div class="profile-row">
    <div class="profile-field-group">
      <label class="profile-field-label">Resume</label>
      <div class="profile-field-value" id="view-resume">
        <a href="#" class="profile-resume-link"> <%= session.getAttribute("resume") %> </a>
      </div>
    </div>
    <div class="profile-field-group">
      <label class="profile-field-label">Job Preferences</label>
      <div class="profile-field-value" id="view-preferences">
       <%= session.getAttribute("preference") %> 
      </div>
    </div>
  </div>

  <!-- Edit Button -->
  <div class="profile-actions">
    <a href="completeprofile.jsp" class="profile-edit-button">Edit Profile</a>
  </div>
</div>






- <div class="overall-job-listing"  id="joblist">   
    <div class="job-listings-container">
        <h2 class="job-heading">Available Job</h2>
        <table class="job-table">
            <tr>
                <th>Title</th>
                <th>Dept</th>
                <th>Location</th>
                <th>Salary</th>
                <th>Type</th>
                <th>Qualification</th>
                <th>Skills</th>
                <th>Contact</th>
                <th>Description</th>
                <th>Apply</th>
            </tr>


  

        
           <%
                List<Job> jobs = (List<Job>) request.getAttribute("jobs");
                if (jobs == null || jobs.isEmpty()) {
            %>
                <tr><td colspan="11">No jobs available</td></tr>
            <%
                } else {
                    for (Job job : jobs) {
            %>
                <tr>
                    <td><%= job.getJobtitle() %></td>
                    <td><%= job.getDepartment() %></td>
                    <td><%= job.getLocation() %></td>
                    <td><%= job.getSalaryrange() %></td>
                    <td><%= job.getJobtype() %></td>
                    <td><%= job.getQualification() %></td>
                    <td><%= job.getSkills() %></td>
                    <td><%= job.getContact() %></td>
                    <td><%= job.getDescription() %></td>
                 <td>
              <button>    <a href= "https://mail.google.com/mail/?view=cm&fs=1&to=<%= job.getEmail()%>&su=Job%20Application"  target=_blank>Apply</a>
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
          <form action="DeleteCandidateServlet"  method="post">
           <button class="delete-button" >Yes</button>
        </div>
        </form>
      </div>     

     <!--                log out               -->

      <div id="Logout" class="overall-logout">
        <div class="logout-content">
          <h1>Are you sure you want to Logout?</h1>
           <form action="logoutcan"  method="get">
           <button class="logout-button">Logout</button>
           <button class="logout-button-1"> Cancel </button>
             </form>
        </div>
      </div>     
   
   
    


       



</body>
</html>