package com.emp.model;

import java.sql.Timestamp;

public class ProTypeVO implements java.io.Serializable {
	private Integer productTypeId;
	private String typeName;
	private String createdBy;
	private Timestamp dateCreated;
	private String lastUpdatedBy;
	private Timestamp lastUpdated;

	public ProTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProTypeVO(Integer productTypeId, String typeName, String createdBy, Timestamp dateCreated,
			String lastUpdatedBy, Timestamp lastUpdated) {
		super();
		this.productTypeId = productTypeId;
		this.typeName = typeName;
		this.createdBy = createdBy;
		this.dateCreated = dateCreated;
		this.lastUpdatedBy = lastUpdatedBy;
		this.lastUpdated = lastUpdated;
	}

	public Integer getProductTypeId() {
		return productTypeId;
	}

	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public Timestamp getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

}
