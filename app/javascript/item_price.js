 const calculation = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const tax = Math.floor(inputValue/10);
    const profit = inputValue - tax;
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;
  });
};

window.addEventListener("load", calculation);