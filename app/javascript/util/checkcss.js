import { CheckCSS } from 'checkcss';

const checkcss = new CheckCSS();

checkcss.onClassnameDetected = function (classname, element) {
  if(document.querySelector('.profiler-results')?.contains(element)) {
    return false;
  }

  if(element.nodeName === "FORM" && element.id === classname) {
    return false;
  }

  return true;
};

checkcss.scan().watch();
