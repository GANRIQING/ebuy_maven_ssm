package com.lcvc.ebuy_maven_ssm.model.other;

import java.util.List;

/*
 * 分页类
 * @author ljy
 */
public class PageObject<T> {
	private int pageSize;//每页显示的记录数
	private int maxPage;//显示的最大页数
	private int currentPage;//显示当前页数
	private int totalRecords;//总记录数
	private int nextPage;//下一页的页数
	private int previousPage;//上一页的页数
	private List<T> list;//分页中包含的记录数
	
	public int getPageSize() {
		return pageSize;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPreviousPage() {
		return previousPage;
	}
	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}
	
	
}
