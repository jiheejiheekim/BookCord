package com.book.cord;

import lombok.Data;
import java.util.List;

public class BookVO {
    
    @Data
    public static class NewBooks {
        private List<Book> item;
        private String errorCode;
    }
    
    @Data
    public static class BestSeller {
    	private List<Book> item;
    	private String errorCode;
    }

    @Data
    public static class Book {
        private String title;
        private String author;
        private String publisher;
        private String cover;
    }
}