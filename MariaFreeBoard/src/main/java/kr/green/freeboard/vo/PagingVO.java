package kr.green.freeboard.vo;

import java.util.List;

public class PagingVO<T> {
	private int currentPage;
	private int pageSize;
	private int blockSize;
	private int totalCount;

	private int totalPage;
	private int startNo;
	private int endNo;
	private int startPage;
	private int endPage;
	
	private List<T> list;
	
	public PagingVO(int currentPage, int pageSize, int blockSize, int totalCount) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.totalCount = totalCount;
		calc();
	}

	private void calc() {
		if(currentPage<=0) currentPage = 1;
		if(pageSize<2) pageSize = 10;
		if(blockSize<2) blockSize = 10;
		
		if(totalCount>0) {
			totalPage = (totalCount-1)/pageSize + 1;
			if(currentPage>totalPage) currentPage = 1;
			
			startNo = (currentPage-1)*pageSize;
			endNo = startNo + pageSize - 1;
			if(endNo>=totalCount) endNo = totalCount - 1;
			
			startPage = (currentPage-1)/blockSize * blockSize + 1;
			endPage = startPage + blockSize - 1;
			if(endPage>totalPage) endPage = totalPage;
		}
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	@Override
	public String toString() {
		return "PagingVO [currentPage=" + currentPage + ", pageSize=" + pageSize + ", blockSize=" + blockSize
				+ ", totalCount=" + totalCount + ", totalPage=" + totalPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + ", list=" + list + "]";
	}
	// 상단 표시
	public String getPageInfo() {
		String result = "전체 : " + totalCount + "개";
		if(totalCount>0) result += "(" + currentPage + "/" + totalPage + "Page)";
		return result;
	}
	// 하단 표시
	public String getPageList() {
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination pagination-sm justify-content-center'>");
		// 이전
		if(startPage>1) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='?p=" +(startPage-1)+ "&s="+pageSize+"&b="+blockSize+"' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
		// 페이지 번호
		for(int i=startPage;i<=endPage;i++) {
			if(i!=currentPage) {
				sb.append("<li class='page-item'><a class='page-link' href='?p=" +(i)+ "&s=" + pageSize + "&b=" + blockSize + "'>" + i + "</a></li>");
			}else {
				sb.append("<li class='page-item active' aria-current='page'><a class='page-link' href='#'>" + i + "</a></li>");
			}
		}
		// 다음
		if(endPage<totalPage) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='?p=" +(endPage+1)+ "&s="+pageSize+"&b="+blockSize+"' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");
		return sb.toString();
	}
}
