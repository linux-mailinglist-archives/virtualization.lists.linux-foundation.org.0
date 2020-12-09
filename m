Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB42D442E
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 15:25:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 480C72E244;
	Wed,  9 Dec 2020 14:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7yBxBYro0k8; Wed,  9 Dec 2020 14:25:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 638C52E2C9;
	Wed,  9 Dec 2020 14:25:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42FF5C0FA7;
	Wed,  9 Dec 2020 14:25:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BDBAC013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 42CBC2010F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uk7NEiHaHd4K
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 639AC2076B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 14:25:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0EA6ACE1;
 Wed,  9 Dec 2020 14:25:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 2/8] drm/ast: Only map cursor BOs during updates
Date: Wed,  9 Dec 2020 15:25:21 +0100
Message-Id: <20201209142527.26415-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

VGhlIEhXIGN1cnNvcidzIEJPIHVzZWQgdG8gYmUgbWFwcGVkIHBlcm1hbmVudGx5IGludG8gdGhl
IGtlcm5lbCdzCmFkZHJlc3Mgc3BhY2UuIEdFTSdzIHZtYXAgb3BlcmF0aW9uIHdpbGwgYmUgcHJv
dGVjdGVkIGJ5IGxvY2tzLCBhbmQKd2UgZG9uJ3Qgd2FudCB0byBsb2NrIHRoZSBCTydzIGZvciBh
biBpbmRlZmluYXRlIHBlcmlvZCBvZiB0aW1lLgoKQ2hhbmdlIHRoZSBjdXJzb3IgY29kZSB0byBt
YXAgdGhlIEhXIEJPcyBvbmx5IGR1cmluZyB1cGRhdGVzLiBUaGUKdm1hcCBvcGVyYXRpb24gaW4g
VlJBTSBoZWxwZXJzIGlzIGNoZWFwLCBhcyBhIG9uY2UgZXN0YWJpc2hlZCBtYXBwaW5nCmlzIGJl
aW5nIHJldXNlZCB1bnRpbCB0aGUgQk8gYWN0dWFsbHkgbW92ZXMuIEFzIHRoZSBIVyBjdXJzb3Ig
Qk9zIGFyZQpwZXJtYW5lbnRseSBwaW5uZWQsIHRoZXkgbmV2ZXIgbW92ZSBhdCBhbGwuCgp2MjoK
CSogZml4IHR5cG9zIGluIGNvbW1pdCBkZXNjcmlwdGlvbgoKU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfY3Vyc29yLmMgfCA1MSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmggICAgfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9jdXJzb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2N1cnNvci5jCmlu
ZGV4IDY4YmYzZDMzZjFlZC4uZmFjMWVlNzljMzcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9jdXJzb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9jdXJzb3Iu
YwpAQCAtMzksNyArMzksNiBAQCBzdGF0aWMgdm9pZCBhc3RfY3Vyc29yX2Zpbmkoc3RydWN0IGFz
dF9wcml2YXRlICphc3QpCiAKIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShhc3QtPmN1cnNv
ci5nYm8pOyArK2kpIHsKIAkJZ2JvID0gYXN0LT5jdXJzb3IuZ2JvW2ldOwotCQlkcm1fZ2VtX3Zy
YW1fdnVubWFwKGdibywgJmFzdC0+Y3Vyc29yLm1hcFtpXSk7CiAJCWRybV9nZW1fdnJhbV91bnBp
bihnYm8pOwogCQlkcm1fZ2VtX3ZyYW1fcHV0KGdibyk7CiAJfQpAQCAtNTMsMTQgKzUyLDEzIEBA
IHN0YXRpYyB2b2lkIGFzdF9jdXJzb3JfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpwdHIpCiB9CiAKIC8qCi0gKiBBbGxvY2F0ZSBjdXJzb3IgQk9zIGFuZCBwaW5zIHRoZW0g
YXQgdGhlIGVuZCBvZiBWUkFNLgorICogQWxsb2NhdGUgY3Vyc29yIEJPcyBhbmQgcGluIHRoZW0g
YXQgdGhlIGVuZCBvZiBWUkFNLgogICovCiBpbnQgYXN0X2N1cnNvcl9pbml0KHN0cnVjdCBhc3Rf
cHJpdmF0ZSAqYXN0KQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmYXN0LT5iYXNlOwog
CXNpemVfdCBzaXplLCBpOwogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm87Ci0Jc3Ry
dWN0IGRtYV9idWZfbWFwIG1hcDsKIAlpbnQgcmV0OwogCiAJc2l6ZSA9IHJvdW5kdXAoQVNUX0hX
Q19TSVpFICsgQVNUX0hXQ19TSUdOQVRVUkVfU0laRSwgUEFHRV9TSVpFKTsKQEAgLTc3LDE1ICs3
NSw3IEBAIGludCBhc3RfY3Vyc29yX2luaXQoc3RydWN0IGFzdF9wcml2YXRlICphc3QpCiAJCQlk
cm1fZ2VtX3ZyYW1fcHV0KGdibyk7CiAJCQlnb3RvIGVycl9kcm1fZ2VtX3ZyYW1fcHV0OwogCQl9
Ci0JCXJldCA9IGRybV9nZW1fdnJhbV92bWFwKGdibywgJm1hcCk7Ci0JCWlmIChyZXQpIHsKLQkJ
CWRybV9nZW1fdnJhbV91bnBpbihnYm8pOwotCQkJZHJtX2dlbV92cmFtX3B1dChnYm8pOwotCQkJ
Z290byBlcnJfZHJtX2dlbV92cmFtX3B1dDsKLQkJfQotCiAJCWFzdC0+Y3Vyc29yLmdib1tpXSA9
IGdibzsKLQkJYXN0LT5jdXJzb3IubWFwW2ldID0gbWFwOwogCX0KIAogCXJldHVybiBkcm1tX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBhc3RfY3Vyc29yX3JlbGVhc2UsIE5VTEwpOwpAQCAtOTQs
NyArODQsNiBAQCBpbnQgYXN0X2N1cnNvcl9pbml0KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0KQog
CXdoaWxlIChpKSB7CiAJCS0taTsKIAkJZ2JvID0gYXN0LT5jdXJzb3IuZ2JvW2ldOwotCQlkcm1f
Z2VtX3ZyYW1fdnVubWFwKGdibywgJmFzdC0+Y3Vyc29yLm1hcFtpXSk7CiAJCWRybV9nZW1fdnJh
bV91bnBpbihnYm8pOwogCQlkcm1fZ2VtX3ZyYW1fcHV0KGdibyk7CiAJfQpAQCAtMTY4LDMxICsx
NTcsMzggQEAgc3RhdGljIHZvaWQgdXBkYXRlX2N1cnNvcl9pbWFnZSh1OCBfX2lvbWVtICpkc3Qs
IGNvbnN0IHU4ICpzcmMsIGludCB3aWR0aCwgaW50IGgKIGludCBhc3RfY3Vyc29yX2JsaXQoc3Ry
dWN0IGFzdF9wcml2YXRlICphc3QsIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQogewogCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmYXN0LT5iYXNlOwotCXN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpnYm87Ci0Jc3RydWN0IGRtYV9idWZfbWFwIG1hcDsKLQlpbnQgcmV0OwotCXZvaWQg
KnNyYzsKKwlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZHN0X2dibyA9IGFzdC0+Y3Vyc29y
Lmdib1thc3QtPmN1cnNvci5uZXh0X2luZGV4XTsKKwlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVj
dCAqc3JjX2dibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0oZmItPm9ialswXSk7CisJc3RydWN0IGRt
YV9idWZfbWFwIHNyY19tYXAsIGRzdF9tYXA7CiAJdm9pZCBfX2lvbWVtICpkc3Q7CisJdm9pZCAq
c3JjOworCWludCByZXQ7CiAKIAlpZiAoZHJtX1dBUk5fT05fT05DRShkZXYsIGZiLT53aWR0aCA+
IEFTVF9NQVhfSFdDX1dJRFRIKSB8fAogCSAgICBkcm1fV0FSTl9PTl9PTkNFKGRldiwgZmItPmhl
aWdodCA+IEFTVF9NQVhfSFdDX0hFSUdIVCkpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZ2JvID0g
ZHJtX2dlbV92cmFtX29mX2dlbShmYi0+b2JqWzBdKTsKLQotCXJldCA9IGRybV9nZW1fdnJhbV92
bWFwKGdibywgJm1hcCk7CisJcmV0ID0gZHJtX2dlbV92cmFtX3ZtYXAoc3JjX2dibywgJnNyY19t
YXApOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0Jc3JjID0gbWFwLnZhZGRyOyAvKiBUT0RP
OiBVc2UgbWFwcGluZyBhYnN0cmFjdGlvbiBwcm9wZXJseSAqLworCXNyYyA9IHNyY19tYXAudmFk
ZHI7IC8qIFRPRE86IFVzZSBtYXBwaW5nIGFic3RyYWN0aW9uIHByb3Blcmx5ICovCiAKLQlkc3Qg
PSBhc3QtPmN1cnNvci5tYXBbYXN0LT5jdXJzb3IubmV4dF9pbmRleF0udmFkZHJfaW9tZW07CisJ
cmV0ID0gZHJtX2dlbV92cmFtX3ZtYXAoZHN0X2dibywgJmRzdF9tYXApOworCWlmIChyZXQpCisJ
CWdvdG8gZXJyX2RybV9nZW1fdnJhbV92dW5tYXA7CisJZHN0ID0gZHN0X21hcC52YWRkcl9pb21l
bTsgLyogVE9ETzogVXNlIG1hcHBpbmcgYWJzdHJhY3Rpb24gcHJvcGVybHkgKi8KIAogCS8qIGRv
IGRhdGEgdHJhbnNmZXIgdG8gY3Vyc29yIEJPICovCiAJdXBkYXRlX2N1cnNvcl9pbWFnZShkc3Qs
IHNyYywgZmItPndpZHRoLCBmYi0+aGVpZ2h0KTsKIAotCWRybV9nZW1fdnJhbV92dW5tYXAoZ2Jv
LCAmbWFwKTsKKwlkcm1fZ2VtX3ZyYW1fdnVubWFwKGRzdF9nYm8sICZkc3RfbWFwKTsKKwlkcm1f
Z2VtX3ZyYW1fdnVubWFwKHNyY19nYm8sICZzcmNfbWFwKTsKIAogCXJldHVybiAwOworCitlcnJf
ZHJtX2dlbV92cmFtX3Z1bm1hcDoKKwlkcm1fZ2VtX3ZyYW1fdnVubWFwKHNyY19nYm8sICZzcmNf
bWFwKTsKKwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgdm9pZCBhc3RfY3Vyc29yX3NldF9iYXNl
KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0LCB1NjQgYWRkcmVzcykKQEAgLTI0MywxNyArMjM5LDI2
IEBAIHN0YXRpYyB2b2lkIGFzdF9jdXJzb3Jfc2V0X2xvY2F0aW9uKHN0cnVjdCBhc3RfcHJpdmF0
ZSAqYXN0LCB1MTYgeCwgdTE2IHksCiB2b2lkIGFzdF9jdXJzb3Jfc2hvdyhzdHJ1Y3QgYXN0X3By
aXZhdGUgKmFzdCwgaW50IHgsIGludCB5LAogCQkgICAgIHVuc2lnbmVkIGludCBvZmZzZXRfeCwg
dW5zaWduZWQgaW50IG9mZnNldF95KQogeworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmYXN0
LT5iYXNlOworCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8gPSBhc3QtPmN1cnNvci5n
Ym9bYXN0LT5jdXJzb3IubmV4dF9pbmRleF07CisJc3RydWN0IGRtYV9idWZfbWFwIG1hcDsKIAl1
OCB4X29mZnNldCwgeV9vZmZzZXQ7CiAJdTggX19pb21lbSAqZHN0OwogCXU4IF9faW9tZW0gKnNp
ZzsKIAl1OCBqcmVnOworCWludCByZXQ7CiAKLQlkc3QgPSBhc3QtPmN1cnNvci5tYXBbYXN0LT5j
dXJzb3IubmV4dF9pbmRleF0udmFkZHI7CisJcmV0ID0gZHJtX2dlbV92cmFtX3ZtYXAoZ2JvLCAm
bWFwKTsKKwlpZiAoZHJtX1dBUk5fT05DRShkZXYsIHJldCwgImRybV9nZW1fdnJhbV92bWFwKCkg
ZmFpbGVkLCByZXQ9JWRcbiIsIHJldCkpCisJCXJldHVybjsKKwlkc3QgPSBtYXAudmFkZHJfaW9t
ZW07IC8qIFRPRE86IFVzZSBtYXBwaW5nIGFic3RyYWN0aW9uIHByb3Blcmx5ICovCiAKIAlzaWcg
PSBkc3QgKyBBU1RfSFdDX1NJWkU7CiAJd3JpdGVsKHgsIHNpZyArIEFTVF9IV0NfU0lHTkFUVVJF
X1gpOwogCXdyaXRlbCh5LCBzaWcgKyBBU1RfSFdDX1NJR05BVFVSRV9ZKTsKIAorCWRybV9nZW1f
dnJhbV92dW5tYXAoZ2JvLCAmbWFwKTsKKwogCWlmICh4IDwgMCkgewogCQl4X29mZnNldCA9ICgt
eCkgKyBvZmZzZXRfeDsKIAkJeCA9IDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oCmluZGV4IGNjYWZmODE5
MjRlZS4uZjg3MWZjMzZjMmY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaApAQCAtMjgsNyArMjgsNiBA
QAogI2lmbmRlZiBfX0FTVF9EUlZfSF9fCiAjZGVmaW5lIF9fQVNUX0RSVl9IX18KIAotI2luY2x1
ZGUgPGxpbnV4L2RtYS1idWYtbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvaTJjLmg+CiAjaW5jbHVk
ZSA8bGludXgvaTJjLWFsZ28tYml0Lmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4KQEAgLTEzMyw3
ICsxMzIsNiBAQCBzdHJ1Y3QgYXN0X3ByaXZhdGUgewogCiAJc3RydWN0IHsKIAkJc3RydWN0IGRy
bV9nZW1fdnJhbV9vYmplY3QgKmdib1tBU1RfREVGQVVMVF9IV0NfTlVNXTsKLQkJc3RydWN0IGRt
YV9idWZfbWFwIG1hcFtBU1RfREVGQVVMVF9IV0NfTlVNXTsKIAkJdW5zaWduZWQgaW50IG5leHRf
aW5kZXg7CiAJfSBjdXJzb3I7CiAKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
