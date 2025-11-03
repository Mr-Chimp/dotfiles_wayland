function fetchAndRender (name) {
    fetch(name + '.json')
        .then(response => response.json())
        .then(data => {
            const mysource = document.getElementById(name + '-template').innerHTML;
            const mytemplate = Handlebars.compile(mysource);
            const myresult = mytemplate(data);
            document.getElementById(name).innerHTML = myresult;
        });
}

function inlineAndRender(name) {
    const data = JSON.parse(document.getElementById(name + '-data').textContent);
    const mysource = document.getElementById(name + '-template').innerHTML;
    const mytemplate = Handlebars.compile(mysource);
    const myresult = mytemplate(data);
    document.getElementById(name).innerHTML = myresult;
}

function renderFromJS(name) {
    const data = window[name + 'Data']; // appsData, linksData, providersData
    const mysource = document.getElementById(name + '-template').innerHTML;
    const mytemplate = Handlebars.compile(mysource);
    const myresult = mytemplate(data);
    document.getElementById(name).innerHTML = myresult;
}


document.addEventListener('DOMContentLoaded', () => {
   // renderFromJS('apps');
    renderFromJS('links');
    //renderFromJS('providers');
});
