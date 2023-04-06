object UniServerModule: TUniServerModule
  TempFolder = 'temp\'
  Port = 9499
  Title = 'New Application'
  SuppressErrors = []
  Bindings = <>
  CustomCSS.Strings = (
    '.CR {'
    #9'border-radius: 5px !important;'
    '  }')
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 480
  Width = 640
end
