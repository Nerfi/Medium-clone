const selectOption = document.getElementById('click');

selectOption.addEventListener("click", (event) => {
  //event.preventDefault();
  selectOption.insertAdjacentHTML("beforeend", "<p> Inserted</p>");
});
  //console.log(selectOption);

export { selectOption };
