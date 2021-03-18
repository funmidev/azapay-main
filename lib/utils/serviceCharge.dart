class ServiceCharge {
  int getServiceCharge(int withdrawalAmount) {
    if (withdrawalAmount <= 1000) {
      return 2;
    } else if (withdrawalAmount > 1000 || withdrawalAmount <= 2000) {
      return 3;
    }
    return withdrawalAmount;
  }
}
