package BBS;

import java.util.ArrayList;

public class InfoList {
    private ArrayList<String> id = new ArrayList<String>();
    private ArrayList<String> name = new ArrayList<String>();
    private ArrayList<String> stuNum = new ArrayList<String>();
    private ArrayList<String> phone = new ArrayList<String>();
    private ArrayList<String> mail = new ArrayList<String>();
    private int listSize = 0;

    public void setId(int index, String id){this.id.add(index, id);}
    public void setName(int index, String name){this.name.add(index, name);}
    public void setStuNum(int index, String stuNum){this.stuNum.add(index, stuNum);}
    public void setPhone(int index, String phone){this.phone.add(index, phone);}
    public void setMail(int index, String mail){this.mail.add(index, mail);}

    public String[] getId(){return id.toArray(new String[id.size()]);}
    public String[] getName(){return name.toArray(new String[name.size()]);}
    public String[] getStuNum(){return stuNum.toArray(new String[stuNum.size()]);}
    public String[] getPhone(){return phone.toArray(new String[phone.size()]);}
    public String[] getMail(){return mail.toArray(new String[mail.size()]);}
    public int getListSize(){return id.size();}
}
