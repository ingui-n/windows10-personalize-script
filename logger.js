const fullLog = [];

const log = ({message = '', source = ''}) => {
  if (source.length === 0) {
    fullLog.push(`| ${message}`);
  } else {
    fullLog.push(`|| ${source} | ${message}`);
  }
};

export {log, fullLog};
