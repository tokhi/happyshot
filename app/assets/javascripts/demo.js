// http://stackshare.io/500px/how-500px-serves-up-over-500tb-of-high-res-photos (managing images good post to read ~>  Cloudinary, Imgix and Firesize)
(function(window, document) {
  var createGIFButton = document.querySelector('#create-gif'),
    createGIFButtonVideo = document.querySelector('#create-gifVideo'),
    videoId = document.querySelector('#video_id'),
    gifSource = (videoId=="" ? 'webcam' : 'video'),
    // gifSource = 'video',
    gifType = "<option value='animated'>Animated</option>",//document.querySelector('#GIFType'),
    interval = document.querySelector("#interval"),
    numFrames = document.querySelector("#numFrames"),
    gifHeight = document.querySelector("#gifHeight"),
    gifWidth = document.querySelector("#gifWidth"),
    progressBar = document.querySelector("progress"),
    text = document.querySelector('#gifText'),
    fontWeight = document.querySelector('#fontWeight'),
    fontSize = document.querySelector('#fontSize'),
    fontFamily = document.querySelector('#fontFamily'),
    fontColor = document.querySelector('#fontColor'),
    textAlign = document.querySelector('#textAlign'),
    textBaseline = document.querySelector('#textBaseline'),
    sampleInterval = document.querySelector('#sampleInterval'),
    numWorkers = document.querySelector('#numWorkers'),
    gifshotImagePreview = document.querySelector('.gifshot-image-preview-section'),
    placeholderDiv = document.querySelector('.placeholder-div'),
    placeholderDivDimensions = document.querySelector('.placeholder-div-dimensions'),
    gifshotCode = document.querySelector('.gifshot-code'),
    gifshotCodeTemplate = document.querySelector('.gifshot-code-template'),
    getSelectedOptions = function() {
      videoId = document.querySelector('#video_id');
      // gifSource = (videoId=="" ? 'webcam' : 'video');
      if(interval === null){
        return;
      }
      document.querySelector('#atch_notify').innerHTML="";
      return {
        'gifWidth': 230,
        'gifHeight': 230,
        'images': "webcam" === 'images' ? ['http://moncdi.pagesperso-orange.fr/images/FAME/fame15.jpg', 'http://moncdi.pagesperso-orange.fr/images/FAME/fame15.jpg', 'http://cinema.arte.tv/sites/default/files/styles/cine_rectangle_1240/public/programs/055158-000_fame_12-1411879646304.jpg'] : false,
        
        'video': gifSource === 'video' ? ['/cache/'.concat(videoId.innerHTML)] : false,
         
        'interval': +interval.value,
        'numFrames': 10,
        'text': "happyShot.in",
        'fontWeight': "normal",
        'fontSize': 18 + 'px',
        'fontFamily': "Waltograph",
        'fontColor': "#ffffff",
        'textAlign': "left",
        'textBaseline': "bottom",
        'sampleInterval': 10,
        'numWorkers': 2
      }
    },
    passedOptions,
    updateCodeBlock = function(obj) {
      obj = obj || {};
      var targetElem = obj.targetElem,
        selectedOptions = getSelectedOptions(),
        options = (function() {
          var obj = {};

          _.each(selectedOptions, function(val, key) {
            if (val) {
              obj[key] = val;
            }
          });

          return obj;
        }()),
        template = "";
        // template = _.template(gifshotCodeTemplate.innerHTML, {
        //   gifshot: window.gifshot,
        //   selectedOptions: options,
        //   method: 'animated' === 'snapshot' ? 'takeSnapShot' : 'createGIF'
        // }),
        // code = escodegen.generate(esprima.parse(template), {
        //   format: {
        //     safeConcatenation: true
        //   }
        // });

      // gifshotCode.innerHTML = code;

      // Prism.highlightElement(gifshotCode);

      if (targetElem && (targetElem.id === 'gifWidth' || targetElem.id === 'gifHeight')) {
        if (selectedOptions.gifHeight && selectedOptions.gifWidth) {
          gifshotImagePreview.innerHTML = '';
          placeholderDiv.style.height = selectedOptions.gifHeight + 'px';
          placeholderDiv.style.width = selectedOptions.gifWidth + 'px';
          placeholderDivDimensions.innerHTML = selectedOptions.gifWidth + ' x ' + selectedOptions.gifHeight;
          if (selectedOptions.gifWidth < 60 || selectedOptions.gifHeight < 20) {
            placeholderDivDimensions.classList.add('hidden');
          } else {
            placeholderDivDimensions.classList.remove('hidden');
          }
          placeholderDiv.classList.remove('hidden');
        } else {
          placeholderDiv.classList.add('hidden');
        }
      }
    },
    bindEvents = function() {
      if(createGIFButton === null){
        return;
      }
      createGIFButton.addEventListener('click', function(e) {
        gifSource="webcam";
        
        process();
      }, false);

      createGIFButtonVideo.addEventListener('click', function(e) {
        
        gifSource="video";
        if(get_videoid().innerHTML =="")
          document.querySelector('#atch_notify').innerHTML="Please choose a video file!";
        else
          process();
      }, false);

      function get_videoid() {
        v = document.querySelector('#video_id');
        return v;
      }
      function process () {
        // console.log("selected options",getSelectedOptions());
        
        passedOptions = _.merge(_.clone(getSelectedOptions()), {
          'progressCallback': function(captureProgress) {
            gifshotImagePreview.innerHTML = '';
            placeholderDiv.classList.add('hidden');
            progressBar.classList.remove('hidden');
            progressBar.value = captureProgress;
          }
        });
        ;
        var method = gifType.value === 'snapshot' ? 'takeSnapShot' : 'createGIF';
        gifshot[method](passedOptions, function(obj) {
          if (!obj.error) {
            var image = obj.image,
              animatedImage = document.createElement('img');
            animatedImage.src = image;

            progressBar.classList.add('hidden');
            progressBar.value = 0;

            placeholderDiv.classList.add('hidden');
            gifshotImagePreview.innerHTML = '';
            gifshotImagePreview.appendChild(animatedImage);
          } else {
            console.log('obj.error', obj.error);
            console.log('obj.errorCode', obj.errorCode);
            console.log('obj.errorMsg', obj.errorMsg);
          }
        });
      }

      
      document.addEventListener('change', function(e) {
        updateCodeBlock({
          targetElem: e.target
        });
      });

      document.addEventListener('keyup', function(e) {
        updateCodeBlock({
          targetElem: e.target
        });
      });
    };

  bindEvents();
  updateCodeBlock({
    targetElem: gifWidth
  });
}(window, document));
