## Encrypt/Decrypt Secrets

Get key alias
```
cd providers/aws/security/kms/
terragrunt refresh | grep devops_terraform_secrets_alias_arn
echo -n "somepassword" > file_with_secret

aws kms encrypt --key-id ${key} --plaintext fileb://file_with_secret --output text --query CiphertextBlob --encryption-context secrets=${name}
```

Follow this guide how to create encrypted data https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_secrets

### Error: Failed to install provider from shared cache

This means that providers cache was created on non-Linux workstation and needs to be updated with the following command:

```bash
terraform providers lock -platform=windows_amd64 -platform=darwin_amd64 -platform=linux_amd64
```

**Lock file shoud be always commited to the repository**
