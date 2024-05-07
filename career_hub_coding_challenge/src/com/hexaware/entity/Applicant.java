package com.hexaware.entity;

import java.util.ArrayList;
import java.util.List;

public class Applicant {
    // Attributes
    private int applicantID;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String resume;
    private static List<Applicant> jobApplicants;

    // Constructor
    public Applicant(int applicantID) {
        this.applicantID = applicantID;
    }

    public Applicant(int applicantID, String firstName, String lastName, String email, String phone, String resume) {
        this.applicantID = applicantID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.resume = resume;
    }

    public Applicant(String firstName, String lastName, String email, String phone, String resume) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.resume = resume;
    }

    public int getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(int applicantID) {
        this.applicantID = applicantID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public void applyForJob(int jobID, String coverLetter) {
          if (jobApplicants == null) {
              jobApplicants = new ArrayList<>();
          }
          jobApplicants.add(this);
    }

    public static List<Applicant> getJobApplicants() {
        return jobApplicants;
    }


    public void createProfile(String email, String firstName, String lastName, String phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "[" + applicantID + ", " + firstName +", " + lastName + ", " + email + ", " + phone +
        "]";
    }
}
