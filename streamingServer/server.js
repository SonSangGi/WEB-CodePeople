const express = require('express')
const fs = require('fs')
const path = require('path')
const app = express()

app.use(express.static(path.join(__dirname, 'public')))

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'))
});
    // 체크용
    var count = 0;

app.get('/video', function(req, res) {
	
	let fileName = req.param('fileName');
	console.log("==========================================", fileName);
	
    const filepath = "assets/" + fileName;
    const stat = fs.statSync(filepath);
    const fileSize = stat.size;
    console.log("filesize : ", fileSize);
    const range = req.headers.range;
    // range 는 서버에게 데이터의 일부분만 돌려줘야 한다는 것을 명시
    
    // 보낼 chunk 사이즈를 얼마로 할건지 여기서 결정
    if (range) {
        
        count++;
        // range는 bytes=0 - 2037; 형식으로 옴
        console.log("범위 :", range);
        // parts = ['o', '2037'] 로 변형
        const parts = range.replace(/bytes=/, "").split("-");
        // 시작 부분을 10진수로 받음
        const start = parseInt(parts[0], 10);
        // 끝 부분을 10진수로 받음
        const end = parts[1] ? parseInt(parts[1], 10) : fileSize-1;
        
        // 한 번에 내려보낼 파일 사이즈 설정
        const chunksize = 500000 * 2;
        const file = fs.createReadStream(filepath, {start, end});
        //console.log(file);
        
        const head = {
            'Content-Range': `bytes ${start}-${end}/${fileSize}`,
            'Accept-Ranges': 'bytes',
            'Content-Length': chunksize,
            'Content-Type': 'video/mp4',
        };
        /*
            응답 헤더에 담을 내용을 지정하자
            Content-Range : 데이터 range 표시
            Accept-Range : 형식이 뭔데?
            Content-length : 한 번에 얼마나 줄건데?
            Content-Type : 파일 타입이 뭔데?
        */ 
        console.log(head);
        // 체크용
        console.log(count);
        res.writeHead(206, head)
        // 요청과 응답을 파이프로 연결해주자
        file.pipe(res);
    }
    
    
//    const filepath = "assets/sample.mp4";
//    const stat = fs.statSync(filepath);
//    const fileSize = stat.size;

//        stream.on('data', (data) => {
//            console.log(data);
//            res.write(data);
//        });
//        
//        stream.on('end', () => {
//            res.end();
//        })
//    }
    
})

app.listen(3000, function () {
  console.log('스트리밍 서버가 정상적으로 열렸습니다. 포트번호 3000')
})