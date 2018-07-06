/**
 * Created by ganeshkb on 7/5/18.
 */

public class stockBuySell {


    static int maxProfit(int[] prices) {
       int minValue = 0;
       int maxValue = 1;

       int currentMin = 0;
       int maxProfit = 0;

       if (prices.length < 2){
           throw new Error("needs at least two items");
       }

       for (int i =1; i < prices.length; i++){
           if(prices[i] < prices[currentMin]) {
               currentMin = i;
           }

           if(prices[maxValue] - prices[minValue] < prices[i] - prices[currentMin]) {
               maxValue = i;
               minValue = currentMin;
           }
       }

        maxProfit = prices[maxValue] - prices[minValue];
        return maxProfit;
    }


    public static void main(String args[]) {
        int[] intArray = new int[]{ 44, 30, 24, 32, 35, 30, 40, 38, 15 };
        int[] testArray = new int[] { 4, 1 };
        System.out.println("================");
        System.out.println(maxProfit(intArray));
        System.out.println(maxProfit(testArray));
        System.out.println("================");
    }
}
