import fs from 'fs';

const fullLog = [];

const log = ({message = '', source = ''}) => {
  let log = new Date().toISOString();

  if (source.length === 0) {
    log += ` || ${message}`;
  } else {
    log += ` || ${source} | ${message}`;
  }

  fullLog.push(log);
  fs.appendFileSync('logs.txt', log + '\n');
};

export {log, fullLog};
