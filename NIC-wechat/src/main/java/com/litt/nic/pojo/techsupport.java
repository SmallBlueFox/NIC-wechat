package com.litt.nic.pojo;

public class techsupport {
	private Integer techsupportId;

	private Integer userId;

	private String techsupportDepartment;

	private String techsupportDevicename;

	private String techsupportLocation;

	private String techsupportDescribe;

	private String techsupportPicture;

	private String techsupportFeedback;

	private String techsupportUptime;

	private String techsupportEndtime;

	private Integer statusId;

	private Integer managerId;

	public Integer getTechsupportId() {
		return techsupportId;
	}

	public void setTechsupportId(Integer techsupportId) {
		this.techsupportId = techsupportId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTechsupportDepartment() {
		return techsupportDepartment;
	}

	public void setTechsupportDepartment(String techsupportDepartment) {
		this.techsupportDepartment = techsupportDepartment == null ? null
				: techsupportDepartment.trim();
	}

	public String getTechsupportDevicename() {
		return techsupportDevicename;
	}

	public void setTechsupportDevicename(String techsupportDevicename) {
		this.techsupportDevicename = techsupportDevicename == null ? null
				: techsupportDevicename.trim();
	}

	public String getTechsupportLocation() {
		return techsupportLocation;
	}

	public void setTechsupportLocation(String techsupportLocation) {
		this.techsupportLocation = techsupportLocation == null ? null
				: techsupportLocation.trim();
	}

	public String getTechsupportDescribe() {
		return techsupportDescribe;
	}

	public void setTechsupportDescribe(String techsupportDescribe) {
		this.techsupportDescribe = techsupportDescribe == null ? null
				: techsupportDescribe.trim();
	}

	public String getTechsupportPicture() {
		return techsupportPicture;
	}

	public void setTechsupportPicture(String techsupportPicture) {
		this.techsupportPicture = techsupportPicture == null ? null
				: techsupportPicture.trim();
	}

	public String getTechsupportFeedback() {
		return techsupportFeedback;
	}

	public void setTechsupportFeedback(String techsupportFeedback) {
		this.techsupportFeedback = techsupportFeedback == null ? null
				: techsupportFeedback.trim();
	}

	public Integer getStatusId() {
		return statusId;
	}

	public String getTechsupportUptime() {
		return techsupportUptime;
	}

	public void setTechsupportUptime(String techsupportUptime) {
		this.techsupportUptime = techsupportUptime;
	}

	public String getTechsupportEndtime() {
		return techsupportEndtime;
	}

	public void setTechsupportEndtime(String techsupportEndtime) {
		this.techsupportEndtime = techsupportEndtime;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public Integer getManagerId() {
		return managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}

	// public techsupport(Integer techsupportId, Integer userId,
	// String techsupportDepartment, String techsupportDevicename,
	// String techsupportLocation, String techsupportDescribe,
	// String techsupportPicture, String techsupportFeedback,
	// String techsupportUptime, String techsupportEndtime,
	// Integer statusId, Integer managerId) {
	// super();
	// this.techsupportId = techsupportId;
	// this.userId = userId;
	// this.techsupportDepartment = techsupportDepartment;
	// this.techsupportDevicename = techsupportDevicename;
	// this.techsupportLocation = techsupportLocation;
	// this.techsupportDescribe = techsupportDescribe;
	// this.techsupportPicture = techsupportPicture;
	// this.techsupportFeedback = techsupportFeedback;
	// this.techsupportUptime = techsupportUptime;
	// this.techsupportEndtime = techsupportEndtime;
	// this.statusId = statusId;
	// this.managerId = managerId;
	// }

}