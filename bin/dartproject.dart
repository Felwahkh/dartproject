
           

  import 'dart:io';

       int? inputOfnumber;
       
     void main() {    // main start my project

        print("   ---------");

       stdout.write("  |"); stdout.write("  welcome ");stdout.write("|\n");
         print("   ---------");

      do {  // start do while of menu

    print("\n 1-Show All Books \n 2-Serch For The Book \n 3-Add New Book  \n 4-Delete a book  \n 5-Edit Book Information \n 6-Buy A Book\n 7-Exit");   // menu
     print("--Enter the number:--");
   inputOfnumber=int.parse(stdin.readLineSync()!);// user input 

      infoBook obj=infoBook();


     if(inputOfnumber == 1){
   
        obj.printall();

      } //end if 



     else if (inputOfnumber ==2){

      var inputOfsearch;
      do {
       print("* Chose One Of These * ");
      print("\n 1-Serch Form The Book Id \n 2-Serch Form The Author Name \n 3-Serch Form The Title \n 4-BACK <- ");
     inputOfsearch=int.parse(stdin.readLineSync()!);

       search(inputOfsearch);// call method 
     } 
     
       while (inputOfsearch!=4);
       }//end if 



       else if (inputOfnumber ==3){

     print("--please enter the Book id: ");
      var booked=stdin.readLineSync();
      print("--please enter the Book title: ");
      var booktitle=stdin.readLineSync();
     print("--please enter the Author name:");
     var Author=stdin.readLineSync();
     print("--please enter the price:");
     int price =int.parse(stdin.readLineSync()!);
    print("--please enter the Quantity:");
     int Quantity=int.parse(stdin.readLineSync()!);
    print("--what yu Enterd-- \n ---Book id : ${booked} \n ---Book title : ${booktitle} \n ---Author name: ${Author}\n ---price: ${price}\n ---Quantity: ${Quantity}");
    infoBook.thelist.add({"Book id":booked,"Book title":booktitle!.toUpperCase(),"Author":Author!.toUpperCase(),"Price":price,"Quantity":Quantity});
  
      }//end if 
   

          else if (inputOfnumber ==4){

          print(" Enter the ID of the BOOK you want to Delet:");
           var input=stdin.readLineSync();

           for(int i=0 ; i<infoBook.thelist.length ; i++){
            if(infoBook.thelist[i]["Book id"]==input){
              
              print("This Item will be deleted : ${infoBook.thelist[i]}");
              infoBook.thelist.removeAt(i);
            }
           } 
    }

          else if (inputOfnumber ==5){

          print("---Please Choose The Book you want to Edit----");
           obj.printall();
         int index=int.parse(stdin.readLineSync()!);
  
            int? inputEdit;
            
          do {
      print("1- Edit the Book Title \n2- Edit the Book Author Name \n3- Edit the Book Price \n4- Edit the Book Quantity\n5-Done ");
           inputEdit=int.parse(stdin.readLineSync()!);
            methodEdit(inputEdit, index);// call method 
          }
          
           while (inputEdit !=5);
            }
       
         else if (inputOfnumber ==6){
          double VAT=0.15;
          
          print("_-_-_Which Book You Want to Buy_-_-_");
           obj.printall();
           int ? index;
          int input =int.parse(stdin.readLineSync()!);
          index = input-1 ;         // THE RECEIPT
                  
                  print("----RECEIPT----");
      print("Description:");
      print("BOOK NAME : ${infoBook.thelist[index]["Book title"]}");
      print("PRICE : ${infoBook.thelist[index]["Price"]}");
      print("15% VAT  : ${infoBook.thelist[index]["Price"] * VAT }");

      print("TOTAL PRICE : ${(infoBook.thelist[index]["Price"] * VAT)+infoBook.thelist[index]["Price"]}");
      print("DATE :${DateTime.now()}");
      print(">>>>>THANK YOU<<<<<");
      infoBook.thelist[index]["Quantity"]=infoBook.thelist[index]["Quantity"] -1;

    
 

         }// end of else if 
          else if (inputOfnumber ==7){ 
          print("    --Thank You-- ");
         } // end if 


          print("---------------------");   
  
         } while (inputOfnumber !=7); //end do while 
  
}   // end main


   
//----------------------------------------------------------------

abstract class  book{

  
  printall();

}
class infoBook extends book{

  static List thelist=[
{"Book id":"1","Book title":"START WITH WHY","Author":"SIMON SINEK","Price":80,"Quantity":13},
{"Book id":"2","Book title":"BUT HOW DO IT KNOW","Author":"J.CLARK SCOTT","Price":59,"Quantity":22},
{"Book id":"3","Book title":"CLEAN CODE","Author":"ROBERT CECIL MARTIN","Price":50,"Quantity":5},
{"Book id":"4","Book title":"ZERO TO ONE","Author":"PETER THIEL","Price":45,"Quantity":12},
{"Book id":"5","Book title":"YOU DONT KNOW JS","Author":"KYLE SIMPSON","Price":39.9,"Quantity":9}
];

  @override
  printall() {
  for(int i=0 ; i<thelist.length;i++){
    print("${i+1}-${thelist[i]}");
  }
    
  }

}//END CLASS 
   

   // method 1
      search(var inputOfsearch){     

     switch(inputOfsearch){

  case 1:
  print("-- Please Enter The Id --");
  inputOfsearch=stdin.readLineSync();
  printId(inputOfsearch);
  break;    // end case 1

  case 2://"Author"
      print("-- Please write Author Name --");
 String nameAuthor = stdin.readLineSync()!;
  printAuthor(nameAuthor.toUpperCase().trim());
     break;    // end case 2


  case 3: //"Book title"
      print("-- Please write Book title --");
 String nameTitle = stdin.readLineSync()!;
  printTitle(nameTitle.toUpperCase());
     break;
  case 4 :print("BACK");
  break;
  default:print("invalid number ");
    break;
}
}


  // method 2
printId(var inputOfsearch){
   for(int i=0 ; i<infoBook.thelist.length;i++){
    if(infoBook.thelist[i]["Book id"]==inputOfsearch){
      print(infoBook.thelist[i]);
    }
  }
   


}


     // method 3
   printTitle(String nameTitle){

      for(int i=0 ; i<infoBook.thelist.length;i++){
    if(infoBook.thelist[i]["Book title"]==nameTitle){
    print(infoBook.thelist[i]);
    }
   
  }
   
  }


       // method 4
    printAuthor(String nameAuthor){

      for(int i=0 ; i<infoBook.thelist.length;i++){
    if(infoBook.thelist[i]["Author"]==nameAuthor){
      print(infoBook.thelist[i]);
    }
   
  }
  }
    methodEdit(int inputEdit , int index){
            int index1= index-1 ;// decres to use it as a index
switch (inputEdit) {
  
    case 1:
    print("Enter the New Book Title");
   String? newindex=stdin.readLineSync();
   infoBook.thelist[index1]["Book title"]=newindex!.toUpperCase();

    break;
    case 2:
    print("Enter the New Author Name");
   String? newindex=stdin.readLineSync();
   infoBook.thelist[index1]["Author"]=newindex!.toUpperCase();
    break;
    case 3:
    print("Enter the New Book price");
    int newindex =int.parse(stdin.readLineSync()!);
    infoBook.thelist[index1]["Price"]=newindex;
    break;
    case 4:
    print("Enter the New Book Quantity");
    int newindex=int.parse(stdin.readLineSync()!);
    infoBook.thelist[index1]["Quantity"]=newindex;
    break;
    case 5:print(" <--");
    break;
  default: print("invalid");
}

          }