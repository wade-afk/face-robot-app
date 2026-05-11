# download-mediapipe-files.ps1
# 실행 위치: index.html 파일이 있는 face-robot-app 폴더
# 목적: MediaPipe 파일을 vendor 폴더에 저장해서 학교망/CDN 차단 환경에서도 얼굴 모델이 로딩되게 함

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

New-Item -ItemType Directory -Force -Path "$root\vendor\drawing_utils" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\vendor\face_mesh" | Out-Null

$files = @(
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/drawing_utils/drawing_utils.js"; Out = "$root\vendor\drawing_utils\drawing_utils.js" },

  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh.js"; Out = "$root\vendor\face_mesh\face_mesh.js" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh.binarypb"; Out = "$root\vendor\face_mesh\face_mesh.binarypb" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_packed_assets.data"; Out = "$root\vendor\face_mesh\face_mesh_solution_packed_assets.data" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_packed_assets_loader.js"; Out = "$root\vendor\face_mesh\face_mesh_solution_packed_assets_loader.js" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_simd_wasm_bin.data"; Out = "$root\vendor\face_mesh\face_mesh_solution_simd_wasm_bin.data" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_simd_wasm_bin.js"; Out = "$root\vendor\face_mesh\face_mesh_solution_simd_wasm_bin.js" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_simd_wasm_bin.wasm"; Out = "$root\vendor\face_mesh\face_mesh_solution_simd_wasm_bin.wasm" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_wasm_bin.js"; Out = "$root\vendor\face_mesh\face_mesh_solution_wasm_bin.js" },
  @{ Url = "https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh_solution_wasm_bin.wasm"; Out = "$root\vendor\face_mesh\face_mesh_solution_wasm_bin.wasm" }
)

foreach ($file in $files) {
  Write-Host "Downloading $($file.Url)"
  Invoke-WebRequest -Uri $file.Url -OutFile $file.Out -UseBasicParsing
}

Write-Host ""
Write-Host "완료: vendor 폴더가 생성되었습니다."
Write-Host "이제 GitHub 저장소에 index.html과 vendor 폴더 전체를 업로드하세요."
