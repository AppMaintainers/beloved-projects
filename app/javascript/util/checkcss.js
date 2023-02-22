import { CheckCSS } from 'checkcss';

const checkcss = new CheckCSS();

checkcss.onClassnameDetected = function (classname, element) {
  if(document.querySelector('.profiler-results')?.contains(element)) {
    return false;
  }

  return true;
};

checkcss.scan().watch();
