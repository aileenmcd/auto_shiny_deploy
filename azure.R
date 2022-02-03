get_container = function() {
  blob = AzureStor::storage_endpoint(Sys.getenv("BLOB_ENDPOINT"),
                                     sas = Sys.getenv("BLOB_SAS"))
  AzureStor::storage_container(blob, "processed")
}

filename <- "lad19_eng_wales_sc_ni.geojson"
file_ext <- strsplit(filename, "\\.")[[1]][2]
tmp_path <- glue::glue("{tempfile()}.{file_ext}")

AzureStor::storage_download(get_container(),
                                src = filename,
                                dest = tmp_path)

data_temp_download <- sf::st_read(tmp_path)
