document.addEventListener("turbolinks:load", function() {
    document.getElementById("defaultTab").click();
});

function toggleTab(e, tabName) {
    let i, tileContent, tabItems;
    tileContent = document.getElementsByClassName("tile-content");
    for (i = 0; i < tileContent.length; i++) {
        tileContent[i].style.display = "none";
    }
    tabItems = document.getElementsByClassName("tab-item");
    for (i = 0; i < tabItems.length; i++) {
        tabItems[i].className = tabItems[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    e.currentTarget.className += " active";
}