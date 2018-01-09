# vim:set ft=dockerfile:
FROM postgres:10.1-alpine
LABEL maintainer="Antiarchitect <voronkovaa@gmail.com>"


# Conditional user change for Dev
ARG gid
ARG uid
RUN [[ "x${uid}" = "x" ]] || deluser postgres
#RUN [[ "x${uid}" = "x" ]] || delgroup postgres
RUN [[ "x${gid}" = "x" ]] || addgroup -g ${gid} -S postgres
RUN [[ "x${gid}" = "x" || "x${uid}" = "x" ]] || adduser  -u ${uid} -g ${gid} -S postgres
RUN chown -R postgres:postgres /var/lib/postgresql/

USER ${uid:-${UID}}

