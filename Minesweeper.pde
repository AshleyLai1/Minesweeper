import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
 //ArrayList of just the minesweeper buttons that are mined
private ArrayList <MSButton> mines = new ArrayList(); 
public final static int NUM_ROWS = 5;
public final static int NUM_COLS = 5;


void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to initialize buttons goes here
    buttons = new MSButton[NUM_ROWS][NUM_COLS];  
    for(int r = 0;r<NUM_ROWS;r++){
        for(int c = 0;c<NUM_COLS;c++){
            buttons[r][c] = new MSButton(r , c);
        }
    }
    
    setMines();
}
public void setMines()
{
    //your code
    int r = (int)random(0,NUM_ROWS);
    int c = (int)random(0,NUM_COLS);
    if(mines.contains(buttons[r][c])){
        setMines();
    }
    else{
        mines.add(buttons[r][c]);
    }

}

public void draw ()
{
    background( 0 );
    if(isWon() == true)
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here

}
public void displayWinningMessage()
{
    //your code here
}
public boolean isValid(int r, int c)
{
    if(r>=5 || r<0){
       return false;
      }
    if(c>=5||c<0){
        return false;
      }
      return true;
}
public int countMines(int row, int col)
{
    //int numMines = 0;
    //your code here
    //for(int row =0; )
    //return numMines;

    int numMines=0;
  for(int r=row-1; r<=row+1;r++){
    for(int c=col-1; c<= col+1;c++){
      if(isValid(r,c) && buttons[r][c] == true){
        numMines++;
      }
    }
    return numMines;
    
  }
}
public class MSButton
{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;
    
    public MSButton ( int row, int col )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }

    // called by manager
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }
    public void draw () 
    {    
        if (flagged)
            fill(0);
        else if( clicked && mines.contains(this) ) 
        fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        myLabel = newLabel;
    }
    public void setLabel(int newLabel)
    {
        myLabel = ""+ newLabel;
    }
    public boolean isFlagged()
    {
        return flagged;
    }
}
