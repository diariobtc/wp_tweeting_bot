prompt_msg() {
 echo
 echo "============================================================================="
 echo $1
 echo "============================================================================="
 echo
}

abort_if_var_unset() {
  # Usage: abort_if_var_unset "OPENSSL_VERSION" ${OPENSSL_VERSION}
  var_name=${1}
  var_value=${2}
  if [[ ! -n ${var_value} ]]; then
    prompt_msg "Error ${var_name} not set. Aborting"
    exit 1
  fi
  echo ${var_name} set to ${var_value}
}
