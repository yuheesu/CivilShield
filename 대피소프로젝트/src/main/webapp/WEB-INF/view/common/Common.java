

import java.io.Serializable;

public class Common implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -898779936776610027L;
	String dir;
	int start;
	int amount;
	int echo;
	int col;
	String searchTerm;

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getEcho() {
		return echo;
	}

	public void setEcho(int echo) {
		this.echo = echo;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public String getSearchTerm() {
		return searchTerm;
	}

	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

}
