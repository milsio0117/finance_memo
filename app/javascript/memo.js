// contentが空の場合submitボタンを無効にする
function enableSubmitButton() {
    const submit = document.getElementById("submit");
    const content = document.getElementById("content");
  
    submit.disabled = true;
  
    content.addEventListener("input", function() {
      if (content.value !== "") {
        submit.disabled = false;
      } else {
        submit.disabled = true;
      }
    });
  }


  // memoのHTMLを生成
const buildHTML = (XHR) =>{
    const item = XHR.response.memo;
    const date = new Date(item.created_at);
    const formattedDate = `${date.getFullYear()}-${(date.getMonth()+1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`
    const html = `
        <div class="memo">
            <div class="post-content">
                ${item.content}
            </div>
            <div class="post-date">
                ${formattedDate} <a id="delete_link_${item.id}" class = "memo-delete" href="/stocks/${item.stock_id}/memos/${item.id}" data-turbo-action="replace" data-turbo-method="delete">削除</a>
            </div>
        </div>`;
    return html;
};

// memoを送信
function memo(){
    const form = document.getElementById("form");

    form.addEventListener("submit",(e)=>{
        e.preventDefault();
        const formData = new FormData(form);
        const XHR = new XMLHttpRequest();
        const stockId = form.dataset.stockId;
        XHR.open("POST",`/stocks/${stockId}/memos`,true);
        XHR.responseType = "json";
        XHR.send(formData);
        XHR.onload=()=>{
            if (XHR.status < 200 || XHR.status >= 300){
                alert(`Error ${XHR.status}:${XHR.statusText}`);
                return null;
            };
            const list = document.getElementById("list");
            const formText = document.getElementById("content");
            
            list.insertAdjacentHTML("afterend",buildHTML(XHR))
            formText.value ="";
            submit.disabled = true;
        };
    });
};

window.addEventListener('turbo:load', enableSubmitButton);
window.addEventListener('turbo:load',memo)
