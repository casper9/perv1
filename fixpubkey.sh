NO_PUBKEY='0E98404D386FA1D9' # CHANGE TO THE VALUE CITED IN YOUR ERROR MESSAGE!
KEYSERVER='keys.gnupg.net'

NO_PUBKEY_LEN="${#NO_PUBKEY}"
echo "NO_PUBKEY_LEN='${NO_PUBKEY_LEN}'"     # for sanity or debugging
# note following works because bash arrays have 0-based indices
NO_PUBKEY_2ND_HALF_START=$(( NO_PUBKEY_LEN/2 ))
echo "NO_PUBKEY_2ND_HALF_START='${NO_PUBKEY_2ND_HALF_START}'" # ditto
NO_PUBKEY_2ND_HALF="${NO_PUBKEY:${NO_PUBKEY_2ND_HALF_START}}"
echo "NO_PUBKEY_2ND_HALF='${NO_PUBKEY_2ND_HALF}'"             # ditto

for CMD in \
  'date' \
  "gpg --keyserver ${KEYSERVER} --recv-keys ${NO_PUBKEY_2ND_HALF}" \
  'date' \
  "gpg -a --export ${NO_PUBKEY_2ND_HALF} | sudo apt-key add -" \
; do
  echo -e "${CMD}"
  eval "${CMD}"
done
