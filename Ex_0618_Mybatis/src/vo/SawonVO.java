package vo;

public class SawonVO {
	
	//mybatis를 사용하려면 vo에서 관리하는 변수명과
	//실제 DB의 컬럼명이 완전히 일치해야 한다
	private int sabun, sapay, deptno;
	private String saname, sagen, sajob, sahire;
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public int getSapay() {
		return sapay;
	}
	public void setSapay(int sapay) {
		this.sapay = sapay;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getSaname() {
		return saname;
	}
	public void setSaname(String saname) {
		this.saname = saname;
	}
	public String getSagen() {
		return sagen;
	}
	public void setSagen(String sagen) {
		this.sagen = sagen;
	}
	public String getSajob() {
		return sajob;
	}
	public void setSajob(String sajob) {
		this.sajob = sajob;
	}
	public String getSahire() {
		return sahire;
	}
	public void setSahire(String sahire) {
		this.sahire = sahire;
	}
	
	
}
