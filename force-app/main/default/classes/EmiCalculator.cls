Public class EmiCalculator {

    Public static Double LoanAmount;
    Public static Double InterestRate;
    Public static Double LoanTenure;

    Public Void emi (Decimal amount,Decimal Ir, Decimal Lt)
    {
        LoanAmount = amount;
        InterestRate = Ir;
        LoanTenure = Lt;

        Double x = (LoanAmount* InterestRate*Math.pow(1+InterestRate,LoanTenure) ) / (Math.pow(1+InterestRate,LoanTenure) -1) ;
        system.debug('kaj'+x);
    }

}

//EmiCalculator lp= new EmiCalculator () ;lp.emi(1200000.00,7.50,20.00) ;