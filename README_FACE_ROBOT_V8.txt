# Face Robot App v8 배포 안내

## 핵심 변경
- index.html은 먼저 `vendor/` 폴더 안의 MediaPipe 파일을 불러옵니다.
- `vendor/` 폴더가 없으면 기존처럼 jsDelivr CDN을 한 번 더 시도합니다.
- 학교망에서 CDN이 차단되어도, GitHub Pages에 vendor 파일을 같이 올리면 얼굴 모델이 로딩됩니다.

## 사용 방법

1. 이 폴더에서 `face_robot_app_v8_index.html` 파일명을 `index.html`로 바꿉니다.
2. `download-mediapipe-files.ps1`을 같은 폴더에 둡니다.
3. PowerShell에서 이 폴더로 이동합니다.
4. 아래 명령 실행:

   powershell -ExecutionPolicy Bypass -File .\download-mediapipe-files.ps1

5. 생성된 구조가 아래와 같아야 합니다.

   index.html
   vendor/
     drawing_utils/
       drawing_utils.js
     face_mesh/
       face_mesh.js
       face_mesh.binarypb
       face_mesh_solution_packed_assets.data
       face_mesh_solution_packed_assets_loader.js
       face_mesh_solution_simd_wasm_bin.data
       face_mesh_solution_simd_wasm_bin.js
       face_mesh_solution_simd_wasm_bin.wasm
       face_mesh_solution_wasm_bin.js
       face_mesh_solution_wasm_bin.wasm

6. GitHub 저장소에 `index.html`과 `vendor` 폴더 전체를 업로드합니다.
7. GitHub Pages 주소로 접속합니다.

## 학교망에서 github.io 자체가 안 열리는 경우
이 경우 앱 문제가 아니라 학교 방화벽/보안 필터 문제입니다.
해결책은 다음 중 하나입니다.

- 학교 전산 담당자에게 `https://wade-afk.github.io/face-robot-app/` 허용 요청
- `*.github.io` 허용 요청
- 학교 도메인 예: `https://face-robot.jakjeon.hs.kr`을 GitHub Pages Custom Domain으로 연결
- 학교 내부 HTTPS 서버에 같은 파일을 올려 서비스

카메라와 Web Bluetooth는 HTTPS가 필요하므로 단순 HTTP 서버는 권장하지 않습니다.
