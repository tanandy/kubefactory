# gcloud auth application-default login

resource google_service_account kubefactory_sa {
  account_id   = "kubefactory"
  display_name = "kubefactory operator"
}

data google_iam_policy rancher {
  binding {
      # complete from rancher tuto
    role = "roles/iam.serviceAccountUser"
    
    members = [
      "serviceAccount:${google_service_account.kubefactory_sa.email}"
    ]
  }
}

resource google_service_account_iam_policy admin_account_iam {
  service_account_id = google_service_account.kubefactory_sa.name
  policy_data        = data.google_iam_policy.rancher.policy_data
}