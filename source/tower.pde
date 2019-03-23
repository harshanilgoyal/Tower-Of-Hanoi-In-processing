int noofdiscs=5;
discs a=new discs(noofdiscs);
TowersOfHanoi t=new TowersOfHanoi();
PImage bg;
int count=-1;
ArrayList<String> ans;
int maxcount;
ArrayList<disc> rod1=new ArrayList<disc>();
ArrayList<disc> rod2=new ArrayList<disc>();
ArrayList<disc> rod3=new ArrayList<disc>();
Score score = new Score();
total tot = new total();
end end = new end();

void setup() {
  fullScreen();
  bg = loadImage("C:/Users/Harsh/Desktop/processing-3.4/sketch_190105a/a.png");
  frameRate(4);
}

void draw() { 
  //initialize();
  
  
    delay(100);
    if(count==-1){
     t.solveTowersOfHanoi(noofdiscs,1,2,3); 
     ans=t.returnans();
     for(String st:ans){System.out.println(st);}
     maxcount=ans.size();
     a.initializerods();
     a.initializediscs();
    System.out.println("iam here 2");
     ArrayList<disc> temp=a.returnarray();
    for(int i=0;i<temp.size();i++){
      rod1.add(temp.get(i));
    }
    System.out.println("iam here 1");
  count++;
   }
   else if(count<maxcount)
   {
   System.out.println("iam here 4");
   clear();
   
   System.out.println("iam here 3");
   a.initializerods();
   String s=ans.get(count);
   String[] arrs=s.split(",",0);
   int rodfrom=Integer.valueOf(arrs[0]);
   int rodto=Integer.valueOf(arrs[1]);
   if(rodfrom==1){
   if(rodto==1){rod1.add(rod1.get(rod1.size()-1));rod1.get(rod1.size()-1).setx(1,(220-rod1.get(rod1.size()-1).widthr)/20);rod1.get(rod1.size()-1).sety(1,rod1.size()-1);}
   else if(rodto==2){rod2.add(rod1.get(rod1.size()-1));rod2.get(rod2.size()-1).setx(2,(220-rod2.get(rod2.size()-1).widthr)/20);rod2.get(rod2.size()-1).sety(2,rod2.size()-1);}
   else if(rodto==3){rod3.add(rod1.get(rod1.size()-1));rod3.get(rod3.size()-1).setx(3,(220-rod3.get(rod3.size()-1).widthr)/20);rod3.get(rod3.size()-1).sety(3,rod3.size()-1);}
   rod1.remove(rod1.size()-1);  
       }
   if(rodfrom==2){
   if(rodto==1){rod1.add(rod2.get(rod2.size()-1));rod1.get(rod1.size()-1).setx(1,(220-rod1.get(rod1.size()-1).widthr)/20);rod1.get(rod1.size()-1).sety(1,rod1.size()-1);}
   else if(rodto==2){rod2.add(rod2.get(rod2.size()-1));rod2.get(rod2.size()-1).setx(2,(220-rod2.get(rod2.size()-1).widthr)/20);rod2.get(rod2.size()-1).sety(2,rod2.size()-1);}
   else if(rodto==3){rod3.add(rod2.get(rod2.size()-1));rod3.get(rod3.size()-1).setx(3,(220-rod3.get(rod3.size()-1).widthr)/20);rod3.get(rod3.size()-1).sety(3,rod3.size()-1);}
   rod2.remove(rod2.size()-1);  
       }
   if(rodfrom==3){
   if(rodto==1){rod1.add(rod3.get(rod3.size()-1));rod1.get(rod1.size()-1).setx(1,(220-rod1.get(rod1.size()-1).widthr)/20);rod1.get(rod1.size()-1).sety(1,rod1.size()-1);}
   else if(rodto==2){rod2.add(rod3.get(rod3.size()-1));rod2.get(rod2.size()-1).setx(2,(220-rod2.get(rod2.size()-1).widthr)/20);rod2.get(rod2.size()-1).sety(2,rod2.size()-1);}
   else if(rodto==3){rod3.add(rod3.get(rod3.size()-1));rod3.get(rod3.size()-1).setx(3,(220-rod3.get(rod3.size()-1).widthr)/20);rod3.get(rod3.size()-1).sety(3,rod3.size()-1);}
   rod3.remove(rod3.size()-1);  
       } 
   
   drawdiscsfromarray(rod1);
   drawdiscsfromarray(rod2);
   drawdiscsfromarray(rod3);
   count++;  
   //delay(1000);
   //mousePressed();
 }
   else if(count == maxcount)
    {
    clear();  
    end.initialize();
    end.showScore();
    count++;  
  }
    else {
    exit();}

}

void mousePressed() {
    
}


 void drawdiscsfromarray(ArrayList<disc> a){
   fill(265, 165, 0);
     for(disc d:a)
      {rect(d.xcor,d.ycor,d.widthr,d.heightr);
    }
 }

class discs{
ArrayList<disc> arrayd=new ArrayList<disc>(); 

  discs(int n){
    for(int i=0;i<n;i++){
    disc d=new disc(i);
    d.setx(1,i);
    d.sety(1,i);
    arrayd.add(d);
    }
    
  }

void initializerods(){
  background(bg); 
  fill(265, 0, 0);
  rect(330, 20, 20, 1000);
  fill(0, 265, 0);
  rect(990, 20, 20, 1000);
  fill(0, 0, 265);
  rect(1650,20, 20, 1000);  
  score.initialize();
  score.score=count+1;
  score.showScore();
  tot.initialize();
  tot.score=maxcount;
  tot.showScore();

}

  void initializediscs(){
  for(int i=0;i<arrayd.size();i++){
    fill(265, 165, 0);
    drawdiscs(arrayd.get(i));
  }
}
  
  void drawdiscs(disc d){
      rect(d.xcor,d.ycor,d.widthr,d.heightr);
    }

  ArrayList returnarray(){
  return arrayd;
  }
}

class disc{
int xcor=230,ycor=230,widthr=220,heightr=20;
  disc(int discno){
  this.widthr=220-(20*discno);
  }
void setx(int rodno,int discno)
  {if(rodno==1){ 
    xcor=230+10*discno;
    }
    else if(rodno==2){
    xcor=890+10*discno;
    }
    else{
    xcor=1550+10*discno;
    }
  }
void sety(int rodno,int discno){
  if(rodno==1){ 
    ycor=1000-20*discno;
    }
    else if(rodno==2){
    ycor=1000-20*discno;;
    }
    else{
    ycor=1000-20*discno;;
    }
  }
}



class TowersOfHanoi {
  ArrayList<String> ans=new ArrayList<String>();
    
  public void solveTowersOfHanoi(int n, int source, int aux, int dest)
  {       
    if(n==1)
    {
      ans.add(source+","+dest);
      return;
    }
    
    
    solveTowersOfHanoi(n-1, source, dest, aux);
    
    ans.add(source+","+dest);
    
    
    solveTowersOfHanoi(n-1, aux, source, dest);
    
  }
  
  ArrayList returnans(){
    return ans;
  }
  
  
}




class Score{
  PFont font;
  int score;
  int fontSize;
  float x;
  float y;
  
  Score() {
    score = 0;
    fontSize = 24;
    x = 1600;
    y = 40;
  }
  
  void showScore() {
    textFont(font, fontSize);
    fill(255);
    text("Your State: " + score, x, y);
  }
  
  void initialize() {
    font = createFont("Arial Bold", fontSize, true);
  }
}


class total{
  PFont font;
  int score;
  int fontSize;
  float x;
  float y;
  
  total() {
    score = 0;
    fontSize = 24;
    x = 700;
    y = 40;
  }
  
  void showScore() {
    textFont(font, fontSize);
    fill(255);
    text("Total Steps/States: " + score, x, y);
  }
  
  void initialize() {
    font = createFont("Arial Bold", fontSize, true);
  }
}


class end{
  PFont font;
  int score;
  int fontSize;
  float x;
  float y;
  
  end() {
    score = 0;
    fontSize = 30;
    x = 700;
    y = 540;
  }
  
  void showScore() {
    textFont(font, fontSize);
    fill(255);
    text(".............The END (left click again to exit).........",x,y);
  }
  
  void initialize() {
    font = createFont("Arial Bold", fontSize, true);
  }
}
