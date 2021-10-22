package vo;

public class FriendVO {
	//VO( ValueObject) : DB에서 가져온 정보를 하나로 묶어서 관리할 수 있도록 하는 클래스
	private String name, tel;
	private int age;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
