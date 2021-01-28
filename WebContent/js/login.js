$('form').validate({
      rules:{
        adloginname:{
          required:true,
          maxlength:20
        },
        mgremail:{
          required:true,
          email:true
        },
        mgrphone:{
          required:true,
          number:true,
          minlength:11
        },
        adloginpass:{
          required:true,
          minlength:6

        },
        mgraddress:{
          required:true
        }


      }
    });