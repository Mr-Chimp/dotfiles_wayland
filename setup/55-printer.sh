#!/usr/bin/env bash
set -euo pipefail

PRINTER="hll8240cdw"
PRINTER_MODEL="HLL8240CDW"
DRIVER_SRC="$(dirname "$0")/../drivers/brother-${PRINTER}"
OPT_DIR="/opt/brother/Printers/${PRINTER}"

if [ ! -f "${DRIVER_SRC}/cupswrapper/brother_${PRINTER}_printer_en.ppd" ]; then
    echo "==> Printer driver files not found in ${DRIVER_SRC}. Populate it first."
    exit 1
fi

echo "==> Installing Brother ${PRINTER_MODEL} printer driver"

sudo cp -a "${DRIVER_SRC}" "${OPT_DIR}"

sudo ln -sf "${OPT_DIR}/cupswrapper/brother_lpdwrapper_${PRINTER}" \
    /usr/lib/cups/filter/brother_lpdwrapper_${PRINTER}

sudo ln -sf "${OPT_DIR}/lpd/brprintconf_${PRINTER}" \
    /usr/bin/brprintconf_${PRINTER}

sudo mkdir -p /usr/share/cups/model/Brother /usr/share/ppd/Brother
sudo ln -sf "${OPT_DIR}/cupswrapper/brother_${PRINTER}_printer_en.ppd" \
    /usr/share/cups/model/Brother/brother_${PRINTER}_printer_en.ppd
sudo ln -sf "${OPT_DIR}/cupswrapper/brother_${PRINTER}_printer_en.ppd" \
    /usr/share/ppd/Brother/brother_${PRINTER}_printer_en.ppd

echo "==> Enabling and starting CUPS service"
sudo systemctl enable --now cups

echo "==> Registering printer with CUPS"
sudo lpadmin -p "${PRINTER_MODEL}" -E \
    -v "usb://dev/usb/lp0" \
    -P "${OPT_DIR}/cupswrapper/brother_${PRINTER}_printer_en.ppd"

echo "==> Brother ${PRINTER_MODEL} setup complete"
