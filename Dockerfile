FROM ghost:0.11.3

ADD runthis.sh /runthis.sh
RUN chmod +x /runthis.sh; sync; sleep 1; /runthis.sh

### colinmeinkes shall not use this
#COPY ./copy/index.js ./content/storage

## Override ghost entrypoint so we can add a wait for the database to initialize
COPY ./copy/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "start"]