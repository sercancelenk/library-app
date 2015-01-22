package sr.api.persistence.domain;

import org.codehaus.jackson.annotate.JsonProperty;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="libBook")
public class Book extends Base {
	
	@JsonProperty("bookName")
	private String bookName;
	@JsonProperty("bookAuthor")
	private String bookAuthor;
	@JsonProperty("cost")
	private int cost;
	
	public Book(){}
	
	public Book(String bookName, String bookAuthor, int cost){
		this.bookAuthor=bookAuthor;
		this.bookName=bookName;
		this.cost=cost;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}


	
	
}
