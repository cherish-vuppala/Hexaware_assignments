package com.hexaware.dao;

import com.hexaware.date.utils.DateUtil;
import com.hexaware.entity.Applicant;
import com.hexaware.entity.Company;
import com.hexaware.entity.JobApplication;
import com.hexaware.entity.JobListing;
import com.hexaware.exception.DatabaseConnectionException;
import com.hexaware.exception.FileUploadException;
import com.hexaware.exception.InvalidEmailFormatException;
import com.hexaware.exception.SalaryCalculationException;
import com.hexaware.util.DBConnectionUtil;
import com.hexaware.validation.Validation;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseManagerImpl implements DatabaseManager{


    private final String INSERT_INTO_APPLICANT = "INSERT INTO " +
            "APPLICANT(first_name, last_name, email, phone, resume_or_cv) " +
            "VALUES(?, ?, ?, ?, ?)";
    private final String INSERT_INTO_COMPANY = "INSERT INTO " +
            "COMPANY(company_name, location) VALUES(?, ?)";

    private final String INSERT_INTO_JOB_LISTING = "INSERT INTO " +
            "JOB_LISTING (company_id, job_title, job_description, job_location, " +
        "salary, job_type, posted_date)" +
            "VALUES(?, ?, ?, ? ,? ,?, ?)";
    private final String INSERT_INTO_JOB_APPLICATION = "INSERT INTO JOB_APPLICATION" +
            "(job_id, applicant_id, application_date, cover_letter)" +
                                                   "VALUES(?, ?, ?, ?)";

    private final String SELECT_COMPANIES = "SELECT * FROM COMPANY";
    private final String SELECT_APPLICANTS = "SELECT * FROM APPLICANT";
    private final String SELECT_JOBS = "SELECT * FROM JOB_APPLICATION WHERE job_id = ?";
    private final String SELECT_JOB_LISTINGS = "SELECT * FROM JOB_LISTING";

    @Override
    public void insertJobListing(JobListing job) {
          try(Connection con = DBConnectionUtil.getConnection()) {

             PreparedStatement preparedStatement = con.prepareStatement(INSERT_INTO_JOB_LISTING);

             preparedStatement.setInt(1, job.getCompanyID());
             preparedStatement.setString(2, job.getJobTitle());
             preparedStatement.setString(3, job.getJobDescription());
             preparedStatement.setString(4, job.getJobLocation());
             if (Validation.isSalaryValid(job.getSalary()))
                preparedStatement.setDouble(5, job.getSalary());
             else
                 throw new SalaryCalculationException("Salary Calculation Exception");
             preparedStatement.setString(6, job.getJobType());
             var date = DateUtil.utilToSqlDate(job.getPostedDate());
             preparedStatement.setDate(7, date);

             if (preparedStatement.execute()) System.out.println("Inserted successfully");
          }catch (SQLException | DatabaseConnectionException | SalaryCalculationException ex) {
              System.out.println(ex);
              ex.printStackTrace();
          }
    }

    @Override
    public void insertCompany(Company company) {
        try(Connection con = DBConnectionUtil.getConnection()) {

            PreparedStatement preparedStatement = con.prepareStatement(INSERT_INTO_COMPANY);
            preparedStatement.setString(1, company.getCompanyName());
            preparedStatement.setString(2, company.getLocation());
            boolean success = preparedStatement.execute();
            if (success) System.out.println("Inserted successfully");
        } catch (SQLException | DatabaseConnectionException ex) {
            System.out.println(ex);
            ex.printStackTrace();
        }
    }

    @Override
    public void insertApplicant(Applicant applicant) {
        try(Connection con = DBConnectionUtil.getConnection()) {

            PreparedStatement preparedStatement = con.prepareStatement(INSERT_INTO_APPLICANT);
            preparedStatement.setString(1, applicant.getFirstName());
            preparedStatement.setString(2, applicant.getLastName());
            if (Validation.isValid(applicant.getEmail()))
                preparedStatement.setString(3, applicant.getEmail());
            else
                throw new InvalidEmailFormatException("Invalid email format exception");
            preparedStatement.setString(4, applicant.getPhone());
            if (Validation.isResumeValid(applicant.getResume()))
                preparedStatement.setString(5, applicant.getResume());
            else
                throw new FileUploadException("File upload exception: file is empty");

            if (preparedStatement.execute()) System.out.println("Inserted successfully");
        } catch (SQLException | DatabaseConnectionException | InvalidEmailFormatException |
                 FileUploadException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void insertJobApplication(JobApplication application) {
        try(Connection con = DBConnectionUtil.getConnection()) {
            System.out.println(application);
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_INTO_JOB_APPLICATION);

              preparedStatement.setInt(1, application.getJobID());
              preparedStatement.setInt(2, application.getApplicantID());
              preparedStatement.setDate(3, DateUtil.utilToSqlDate(application.getApplicationDate()));
              preparedStatement.setString(4, application.getCoverLetter());
              int rowsEffected = preparedStatement.executeUpdate();
            if (rowsEffected != 0) System.out.println("Inserted successfully");
        } catch (SQLException | DatabaseConnectionException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<JobListing> getJobListings() {
        try (Connection con = DBConnectionUtil.getConnection()){
            var preparedStatement = con.prepareStatement(SELECT_JOB_LISTINGS);
            ResultSet rs = preparedStatement.executeQuery();
            List<JobListing> jobListings = new ArrayList<>();
            while (rs.next()) {
                int jobID = rs.getInt("job_id");
                int companyID = rs.getInt("company_id");
                String jobTitle = rs.getString("job_title");
                String jobDescription = rs.getString("job_description");
                String jobLocation = rs.getString("job_Location");
                double salary = rs.getDouble("salary");
                String jobType = rs.getNString("job_type");
                var date = rs.getDate("posted_date");
                var postedDate = DateUtil.sqlToUtilDate(date);
                var job = new JobListing(jobID, companyID, jobTitle, jobDescription, jobLocation,
                        salary, jobType, postedDate);
                jobListings.add(job);
            }

            return jobListings;

        } catch (SQLException | DatabaseConnectionException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Company> getCompanies() {
        try (Connection con = DBConnectionUtil.getConnection()){
            var preparedStatement = con.prepareStatement(SELECT_COMPANIES);
            ResultSet rs = preparedStatement.executeQuery();
            List<Company> companiesList = new ArrayList<>();

            while (rs.next()) {
                int companyID = rs.getInt("company_id");
                String companyName = rs.getString("company_Name");
                String companyLocation = rs.getString("location");
                var company = new Company(companyID, companyName, companyLocation);
                companiesList.add(company);
            }
            return companiesList;

        } catch (SQLException | DatabaseConnectionException e) {
             throw new RuntimeException(e);
        }
    }

    @Override
    public List<Applicant> getApplicants() {
        try (Connection con = DBConnectionUtil.getConnection()){
            var preparedStatement = con.prepareStatement(SELECT_APPLICANTS);
            ResultSet rs = preparedStatement.executeQuery();
            List<Applicant> applicantsList = new ArrayList<>();
            while (rs.next()) {
                int applicantID = rs.getInt("applicant_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phone");
                String resume = rs.getString("resume_or_cv");
                var applicant = new Applicant(applicantID, firstName, lastName, email,
                        phoneNumber, resume);
                applicantsList.add(applicant);
            }
            return applicantsList;

        } catch (SQLException | DatabaseConnectionException e) {
//            throw new RuntimeException(e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<JobApplication> getApplicationsForJob(int jobID) {
        try (Connection con = DBConnectionUtil.getConnection()){
            var preparedStatement = con.prepareStatement(SELECT_JOBS);
            preparedStatement.setInt(1, jobID);
            ResultSet rs = preparedStatement.executeQuery();
            List<JobApplication> jobApplications = new ArrayList<>();
            while (rs.next()) {
                int applicationID = rs.getInt("application_id");
                int applicantID = rs.getInt("applicant_id");
                var date = rs.getDate("application_date");
                var date2 = DateUtil.sqlToUtilDate(date);
                String coverLetter = rs.getString("cover_Letter");
                var jobApplication = new JobApplication(applicationID, jobID, applicantID, date2,
                        coverLetter);
                jobApplications.add(jobApplication);
            }
            return jobApplications;

        } catch (SQLException | DatabaseConnectionException e) {
            throw new RuntimeException(e);
        }
    }
}
