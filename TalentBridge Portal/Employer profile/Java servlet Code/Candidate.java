package com.demo;

public class Candidate {
    private String fullName, emailId, location, linkedIn, portfolio, summary,
                   degree, institution, percentage, jobTitle, companyName,
                   keyResponsibilities, skills, certification, jobPreference;
    private long contactNumber;
    private int yearOfGraduation;

    // Getters and setters
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmailId() { return emailId; }
    public void setEmailId(String emailId) { this.emailId = emailId; }

    public long getContactNumber() { return contactNumber; }
    public void setContactNumber(long contactNumber) { this.contactNumber = contactNumber; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getLinkedIn() { return linkedIn; }
    public void setLinkedIn(String linkedIn) { this.linkedIn = linkedIn; }

    public String getPortfolio() { return portfolio; }
    public void setPortfolio(String portfolio) { this.portfolio = portfolio; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }

    public String getDegree() { return degree; }
    public void setDegree(String degree) { this.degree = degree; }

    public String getInstitution() { return institution; }
    public void setInstitution(String institution) { this.institution = institution; }

    public int getYearOfGraduation() { return yearOfGraduation; }
    public void setYearOfGraduation(int yearOfGraduation) { this.yearOfGraduation = yearOfGraduation; }

    public String getPercentage() { return percentage; }
    public void setPercentage(String percentage) { this.percentage = percentage; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

 

    public String getKeyResponsibilities() { return keyResponsibilities; }
    public void setKeyResponsibilities(String keyResponsibilities) { this.keyResponsibilities = keyResponsibilities; }

    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }

    public String getCertification() { return certification; }
    public void setCertification(String certification) { this.certification = certification; }

    public String getJobPreference() { return jobPreference; }
    public void setJobPreference(String jobPreference) { this.jobPreference = jobPreference; }
}
