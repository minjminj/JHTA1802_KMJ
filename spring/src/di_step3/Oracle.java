package di_step3;

public class Oracle implements DB{
	String irum = "오라클";
	
	@Override
	public String getName() {
		return irum;
	}
}
