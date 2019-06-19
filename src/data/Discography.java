package data;

public class Discography {
	private Integer id;
	private String name;
	private String date;

	public Discography(Integer id, String name, String date) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
	}

	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDate() {
		return date;
	}

}
