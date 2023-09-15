/*********************************************
 * OPL 22.1.1.0 Model
 * Author: ZZ01OK862
 * Creation Date: Jul 24, 2023 at 3:53:23 PM
 *********************************************/
int JeanProducts=...;
range Jeans=1..JeanProducts;

float Mean[Jeans]=...;
float comp_1[Jeans]=...;
float comp_2[Jeans]=...;
float comp_3[Jeans]=...;
float rating[Jeans]=...;
int sales[Jeans]=...;
float cost[Jeans]=...;

string stock_availability[Jeans]=...;

dvar boolean x[Jeans];

/*tuple STOCK
{string stock_availability;}
{STOCK} stock_availability[Jeans]=...; */

dexpr float Profit = sum(i,j in Jeans: i!=j) ((Mean[i]-cost[i])*x[i]*sales[i] + (Mean[j]-cost[j])*x[j]*sales[j]) ;

maximize Profit;

subject to
{
  forall(i in Jeans) Mean[i]*x[i] <= comp_1[i]*x[i];
  forall(i in Jeans) Mean[i]*x[i] <= comp_2[i]*x[i];
  forall(i in Jeans) Mean[i]*x[i] <= comp_3[i]*x[i];
  forall(i in Jeans) if( "No" == stock_availability[i]) 0 >= x[i] ;
  forall(i in Jeans) if (rating[i] <= 3.5) x[i]<=0;
  forall(i in Jeans) Mean[i]*x[i] >= cost[i]*x[i];
  
  forall(j in Jeans) Mean[j]*x[j] <= comp_1[j]*x[j];
  forall(j in Jeans) Mean[j]*x[j] <= comp_2[j]*x[j];
  forall(j in Jeans) Mean[j]*x[j] <= comp_3[j]*x[j];
  forall(j in Jeans) if( "No" == stock_availability[j]) 0 >= x[j] ;
  forall(j in Jeans) if (rating[j] <= 3.5) x[j]<=0;
  forall(j in Jeans) Mean[j]*x[j] >= cost[j]*x[j];
  
  sum(i in Jeans) x[i] == 5;
  sum(j in Jeans) x[j] == 5;
}

