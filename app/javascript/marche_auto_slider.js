function initializeSliders() {
    console.log('=== 最終確実版実行 ===');
    
    const sliders = document.querySelectorAll('.auto-slider');
    console.log(`スライダー${sliders.length - 1}: 画像3枚、スライド3個`);
    
    sliders.forEach((slider, index) => {
        if (slider.offsetHeight > 0) {
            console.log('手動コントロール作成開始');
            // ここに既存のスライダー処理コードを配置
        }
    });
}

// DOMの読み込み状態に応じて実行
if (document.readyState === 'loading') {
    // まだ読み込み中の場合はイベントを待つ
    document.addEventListener('DOMContentLoaded', initializeSliders);
} else {
    // 既に読み込み完了している場合は即座に実行
    initializeSliders();
}
  
  function createManualSlider(slider, slides, sliderIndex) {
    const totalSlides = slides.length;
    let currentIndex = 0;
    
    // 既存のコントロールを削除
    const existingControls = document.querySelector(`#slider-controls-${sliderIndex}`);
    if (existingControls) {
      existingControls.remove();
    }
    
    // コントロールパネル作成
    const controlsDiv = document.createElement('div');
    controlsDiv.id = `slider-controls-${sliderIndex}`;
    controlsDiv.className = 'slider-controls mt-4 p-4 bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-lg shadow-sm';
    controlsDiv.innerHTML = `
      <div class="flex items-center justify-center space-x-4">
        <button class="prev-btn px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white font-semibold rounded-lg transition-colors duration-200 shadow-sm">
          ← 前の画像
        </button>
        
        <div class="flex items-center space-x-2 px-4 py-2 bg-white border border-gray-200 rounded-lg shadow-sm">
          <span class="current-slide font-bold text-lg text-gray-700">1</span>
          <span class="text-gray-500">/</span>
          <span class="total-slides font-semibold text-gray-600">${totalSlides}</span>
        </div>
        
        <button class="next-btn px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white font-semibold rounded-lg transition-colors duration-200 shadow-sm">
          次の画像 →
        </button>
        
        <div class="text-sm text-gray-500 ml-4">
          マルシェ画像スライダー
        </div>
      </div>
      
      <!-- インジケーター -->
      <div class="flex justify-center mt-3 space-x-2">
        ${Array.from({length: totalSlides}, (_, i) => 
          `<button class="indicator-dot w-3 h-3 rounded-full transition-colors duration-200 ${
            i === 0 ? 'bg-blue-500' : 'bg-gray-300'
          }" data-slide="${i}"></button>`
        ).join('')}
      </div>
    `;
    
    // スライダーの直後に挿入
    slider.parentNode.insertBefore(controlsDiv, slider.nextSibling);
    console.log(`スライダー${sliderIndex}のコントロール挿入完了`);
    
    // 要素を取得
    const prevBtn = controlsDiv.querySelector('.prev-btn');
    const nextBtn = controlsDiv.querySelector('.next-btn');
    const currentSlideSpan = controlsDiv.querySelector('.current-slide');
    const indicatorDots = controlsDiv.querySelectorAll('.indicator-dot');
    
    // スライド切り替え関数
    function showSlide(index) {
      console.log(`スライダー${sliderIndex}: スライド${index + 1}に切り替え`);
      
      // スライド表示切り替え
      slides.forEach((slide, i) => {
        slide.removeAttribute('style'); // 既存スタイルをクリア
        
        if (i === index) {
          slide.classList.remove('opacity-0');
          slide.classList.add('opacity-100');
        } else {
          slide.classList.remove('opacity-100');
          slide.classList.add('opacity-0');
        }
      });
      
      // UI更新
      currentSlideSpan.textContent = index + 1;
      
      // インジケーター更新
      indicatorDots.forEach((dot, i) => {
        if (i === index) {
          dot.classList.remove('bg-gray-300');
          dot.classList.add('bg-blue-500');
        } else {
          dot.classList.remove('bg-blue-500');
          dot.classList.add('bg-gray-300');
        }
      });
    }
    
    // 前へボタン
    prevBtn.addEventListener('click', () => {
      console.log(`スライダー${sliderIndex}: 前へボタンクリック`);
      currentIndex = currentIndex === 0 ? totalSlides - 1 : currentIndex - 1;
      showSlide(currentIndex);
    });
    
    // 次へボタン
    nextBtn.addEventListener('click', () => {
      console.log(`スライダー${sliderIndex}: 次へボタンクリック`);
      currentIndex = (currentIndex + 1) % totalSlides;
      showSlide(currentIndex);
    });
    
    // インジケータークリック
    indicatorDots.forEach((dot, index) => {
      dot.addEventListener('click', () => {
        console.log(`スライダー${sliderIndex}: インジケーター${index + 1}クリック`);
        currentIndex = index;
        showSlide(currentIndex);
      });
    });
    
    // 初期表示
    showSlide(currentIndex);
    console.log(`スライダー${sliderIndex}の手動コントロール作成完了`);
  }
