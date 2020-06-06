package BBS;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class BBSList {
    private ArrayList<Integer> idList = new ArrayList<Integer>();
    private ArrayList<String> nameList = new ArrayList<String>();
    private ArrayList<String> writerList = new ArrayList<String>();
    private ArrayList<Integer> priceList = new ArrayList<Integer>();
    private ArrayList<Boolean> rentList = new ArrayList<Boolean>();
    private ArrayList<Integer> rentNumList = new ArrayList<Integer>();
    private ArrayList<Integer> page = new ArrayList<Integer>();

    public BBSList(){}
    public void setId(int index, Integer id){ this.idList.add(index, id); }
    public void setName(int index, String name){this.nameList.add(index, name);}
    public void setWriter(int index, String writer){this.writerList.add(index, writer);}
    public void setPrice(int index, Integer price){this.priceList.add(index, price);}
    public void setRent(int index, Boolean rent){this.rentList.add(index, rent);}
    public void setRentNum(int index, Integer rentNum){this.rentNumList.add(index, rentNum);}
    public void setPage(int index, Integer page){this.page.add(index, page);}
    public Integer[] getId(){return idList.toArray(new Integer[idList.size()]);}
    public String[]  getName(){return nameList.toArray(new String[nameList.size()]);}
    public String[] getWriter(){return writerList.toArray(new String[writerList.size()]);}
    public Integer[] getPrice(){return priceList.toArray(new Integer[priceList.size()]);}
    public Boolean[] getRent(){return rentList.toArray(new Boolean[rentList.size()]);}
    public Integer[] getRentNum(){return rentNumList.toArray(new Integer[rentNumList.size()]);}
    public Integer[] getPage(){return page.toArray(new Integer[page.size()]);}
    public int getListSize(){return idList.size();}
}
