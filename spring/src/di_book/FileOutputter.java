package di_book;

import java.io.FileWriter;
import java.io.IOException;

public class FileOutputter implements Outputter{
	
	private String filePath;
	
	@Override
	public void output(String message) {
		FileWriter out;
		try {
			out = new FileWriter(filePath);
			out.write(message);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
}
