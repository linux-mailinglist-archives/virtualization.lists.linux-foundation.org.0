Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C72C3CF3
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75AAC86B57;
	Wed, 25 Nov 2020 09:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5egF4qLXbaCX; Wed, 25 Nov 2020 09:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B75B586B54;
	Wed, 25 Nov 2020 09:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADD4CC0052;
	Wed, 25 Nov 2020 09:52:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31955C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1F6638748B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svCwEQiwwYWC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDE10874AA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BFDFD305D517; Wed, 25 Nov 2020 11:35:48 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9FF153072785;
 Wed, 25 Nov 2020 11:35:48 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 37/81] KVM: introspection: add KVMI_VM_CHECK_COMMAND and
 KVMI_VM_CHECK_EVENT
Date: Wed, 25 Nov 2020 11:35:16 +0200
Message-Id: <20201125093600.2766-38-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

VGhlc2UgY29tbWFuZHMgYXJlIHVzZWQgdG8gY2hlY2sgd2hhdCBpbnRyb3NwZWN0aW9uIGNvbW1h
bmRzIGFuZCBldmVudHMKYXJlIHN1cHBvcnRlZCAoa2VybmVsKSBhbmQgYWxsb3dlZCAoZGV2aWNl
IG1hbmFnZXIpLgoKVGhlc2UgYXJlIGFsdGVybmF0aXZlIG1ldGhvZHMgdG8gS1ZNSV9HRVRfVkVS
U0lPTiBpbiBjaGVja2luZyBpZiB0aGUKaW50cm9zcGVjdGlvbiBzdXBwb3J0cyBhIHNwZWNpZmlj
IGNvbW1hbmQvZXZlbnQuCgpBcyB3aXRoIHRoZSBLVk1JX0dFVF9WRVJTSU9OIGNvbW1hbmQsIHRo
ZXNlIHR3byBjb21tYW5kcyBjYW4gbmV2ZXIgYmUKZGlzYWxsb3dlZCBieSB0aGUgZGV2aWNlIG1h
bmFnZXIuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRl
ci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAgICAg
IHwgNjIgKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAg
ICAgICAgICAgICAgICAgIHwgMTYgKysrKy0KIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2
XzY0L2t2bWlfdGVzdC5jICB8IDQ1ICsrKysrKysrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWkuYyAgICAgICAgICAgICAgICAgfCAxOSArKysrKysKIHZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaV9pbnQuaCAgICAgICAgICAgICB8ICAyICsKIHZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaV9tc2cuYyAgICAgICAgICAgICB8IDQwICsrKysrKysrKysrLQogNiBmaWxlcyBjaGFu
Z2VkLCAxODIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1p
LnJzdAppbmRleCBkM2Q2NzJhMDc4NzIuLjEzMTY5NTc1Zjc1ZiAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2
bWkucnN0CkBAIC0yNTAsMyArMjUwLDY1IEBAIGxhcmdlciBtZXNzYWdlcy4KIFRoZSBpbnRyb3Nw
ZWN0aW9uIHRvb2wgc2hvdWxkIHVzZSB0aGlzIGNvbW1hbmQgdG8gaWRlbnRpZnkgdGhlIGZlYXR1
cmVzCiBzdXBwb3J0ZWQgYnkgdGhlIGtlcm5lbCBzaWRlIGFuZCB3aGF0IG1lc3NhZ2VzIG11c3Qg
YmUgdXNlZCBmb3IgZXZlbnQKIHJlcGxpZXMuCisKKzIuIEtWTUlfVk1fQ0hFQ0tfQ09NTUFORAor
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKKzpBcmNoaXRlY3R1cmVzOiBhbGwKKzpWZXJzaW9u
czogPj0gMQorOlBhcmFtZXRlcnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV92bV9jaGVja19jb21t
YW5kIHsKKwkJX191MTYgaWQ7CisJCV9fdTE2IHBhZGRpbmcxOworCQlfX3UzMiBwYWRkaW5nMjsK
Kwl9OworCis6UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1pX2Vycm9yX2NvZGU7CisKK0No
ZWNrcyBpZiB0aGUgY29tbWFuZCBzcGVjaWZpZWQgYnkgYGBpZGBgIGlzIHN1cHBvcnRlZCBhbmQg
YWxsb3dlZC4KKworVGhpcyBjb21tYW5kIGlzIGFsd2F5cyBhbGxvd2VkLgorCis6RXJyb3JzOgor
CisqIC1LVk1fRU5PRU5UIC0gdGhlIGNvbW1hbmQgc3BlY2lmaWVkIGJ5IGBgaWRgYCBpcyB1bnN1
cHBvcnRlZAorKiAtS1ZNX0VQRVJNIC0gdGhlIGNvbW1hbmQgc3BlY2lmaWVkIGJ5IGBgaWRgYCBp
cyBkaXNhbGxvd2VkCisqIC1LVk1fRUlOVkFMIC0gdGhlIHBhZGRpbmcgaXMgbm90IHplcm8KKwor
My4gS1ZNSV9WTV9DSEVDS19FVkVOVAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0
ZWN0dXJlczogYWxsCis6VmVyc2lvbnM6ID49IDEKKzpQYXJhbWV0ZXJzOgorCis6OgorCisJc3Ry
dWN0IGt2bWlfdm1fY2hlY2tfZXZlbnQgeworCQlfX3UxNiBpZDsKKwkJX191MTYgcGFkZGluZzE7
CisJCV9fdTMyIHBhZGRpbmcyOworCX07CisKKzpSZXR1cm5zOgorCis6OgorCisJc3RydWN0IGt2
bWlfZXJyb3JfY29kZTsKKworQ2hlY2tzIGlmIHRoZSBldmVudCBzcGVjaWZpZWQgYnkgYGBpZGBg
IGlzIHN1cHBvcnRlZCBhbmQgYWxsb3dlZC4KKworVGhpcyBjb21tYW5kIGlzIGFsd2F5cyBhbGxv
d2VkLgorCis6RXJyb3JzOgorCisqIC1LVk1fRU5PRU5UIC0gdGhlIGV2ZW50IHNwZWNpZmllZCBi
eSBgYGlkYGAgaXMgdW5zdXBwb3J0ZWQKKyogLUtWTV9FUEVSTSAtIHRoZSBldmVudCBzcGVjaWZp
ZWQgYnkgYGBpZGBgIGlzIGRpc2FsbG93ZWQKKyogLUtWTV9FSU5WQUwgLSB0aGUgcGFkZGluZyBp
cyBub3QgemVybwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCBiL2luY2x1
ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5kZXggNzdkZDcyN2RmZTE4Li4wYzJkMGNlZGRlNmYgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2t2bWkuaApAQCAtMTcsNyArMTcsOSBAQCBlbnVtIHsKICNkZWZpbmUgS1ZNSV9WQ1BVX01F
U1NBR0VfSUQoaWQpICgoKGlkKSA8PCAxKSB8IDEpCiAKIGVudW0gewotCUtWTUlfR0VUX1ZFUlNJ
T04gPSBLVk1JX1ZNX01FU1NBR0VfSUQoMSksCisJS1ZNSV9HRVRfVkVSU0lPTiAgICAgID0gS1ZN
SV9WTV9NRVNTQUdFX0lEKDEpLAorCUtWTUlfVk1fQ0hFQ0tfQ09NTUFORCA9IEtWTUlfVk1fTUVT
U0FHRV9JRCgyKSwKKwlLVk1JX1ZNX0NIRUNLX0VWRU5UICAgPSBLVk1JX1ZNX01FU1NBR0VfSUQo
MyksCiAKIAlLVk1JX05FWFRfVk1fTUVTU0FHRQogfTsKQEAgLTUzLDQgKzU1LDE2IEBAIHN0cnVj
dCBrdm1pX2dldF92ZXJzaW9uX3JlcGx5IHsKIAlfX3UzMiBtYXhfbXNnX3NpemU7CiB9OwogCitz
dHJ1Y3Qga3ZtaV92bV9jaGVja19jb21tYW5kIHsKKwlfX3UxNiBpZDsKKwlfX3UxNiBwYWRkaW5n
MTsKKwlfX3UzMiBwYWRkaW5nMjsKK307CisKK3N0cnVjdCBrdm1pX3ZtX2NoZWNrX2V2ZW50IHsK
KwlfX3UxNiBpZDsKKwlfX3UxNiBwYWRkaW5nMTsKKwlfX3UzMiBwYWRkaW5nMjsKK307CisKICNl
bmRpZiAvKiBfVUFQSV9fTElOVVhfS1ZNSV9IICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCAzMGFjZDNhMmQwMzAuLmNkOGYxNmEzY2Uz
YSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rl
c3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5j
CkBAIC05Myw2ICs5Myw4IEBAIHN0YXRpYyB2b2lkIGhvb2tfaW50cm9zcGVjdGlvbihzdHJ1Y3Qg
a3ZtX3ZtICp2bSkKIAlkb19ob29rX2lvY3RsKHZtLCBLdm1fc29ja2V0LCBFRVhJU1QpOwogCiAJ
c2V0X2NvbW1hbmRfcGVybSh2bSwgS1ZNSV9HRVRfVkVSU0lPTiwgZGlzYWxsb3csIEVQRVJNKTsK
KwlzZXRfY29tbWFuZF9wZXJtKHZtLCBLVk1JX1ZNX0NIRUNLX0NPTU1BTkQsIGRpc2FsbG93LCBF
UEVSTSk7CisJc2V0X2NvbW1hbmRfcGVybSh2bSwgS1ZNSV9WTV9DSEVDS19FVkVOVCwgZGlzYWxs
b3csIEVQRVJNKTsKIAlzZXRfY29tbWFuZF9wZXJtKHZtLCBhbGxfSURzLCBhbGxvd19pbnZhbCwg
RUlOVkFMKTsKIAlzZXRfY29tbWFuZF9wZXJtKHZtLCBhbGxfSURzLCBkaXNhbGxvdywgMCk7CiAJ
c2V0X2NvbW1hbmRfcGVybSh2bSwgYWxsX0lEcywgYWxsb3csIDApOwpAQCAtMjQxLDYgKzI0Myw0
NyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NtZF9nZXRfdmVyc2lvbih2b2lkKQogCXByX2RlYnVnKCJN
YXggbWVzc2FnZSBzaXplOiAldVxuIiwgcnBsLm1heF9tc2dfc2l6ZSk7CiB9CiAKK3N0YXRpYyB2
b2lkIGNtZF92bV9jaGVja19jb21tYW5kKF9fdTE2IGlkLCBpbnQgZXhwZWN0ZWRfZXJyKQorewor
CXN0cnVjdCB7CisJCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCQlzdHJ1Y3Qga3ZtaV92bV9j
aGVja19jb21tYW5kIGNtZDsKKwl9IHJlcSA9IHt9OworCisJcmVxLmNtZC5pZCA9IGlkOworCisJ
dGVzdF92bV9jb21tYW5kKEtWTUlfVk1fQ0hFQ0tfQ09NTUFORCwgJnJlcS5oZHIsIHNpemVvZihy
ZXEpLCBOVUxMLCAwLAorCQkJZXhwZWN0ZWRfZXJyKTsKK30KKworc3RhdGljIHZvaWQgdGVzdF9j
bWRfdm1fY2hlY2tfY29tbWFuZCh2b2lkKQoreworCV9fdTE2IHZhbGlkX2lkID0gS1ZNSV9HRVRf
VkVSU0lPTiwgaW52YWxpZF9pZCA9IDB4ZmZmZjsKKworCWNtZF92bV9jaGVja19jb21tYW5kKHZh
bGlkX2lkLCAwKTsKKwljbWRfdm1fY2hlY2tfY29tbWFuZChpbnZhbGlkX2lkLCAtS1ZNX0VOT0VO
VCk7Cit9CisKK3N0YXRpYyB2b2lkIGNtZF92bV9jaGVja19ldmVudChfX3UxNiBpZCwgaW50IGV4
cGVjdGVkX2VycikKK3sKKwlzdHJ1Y3QgeworCQlzdHJ1Y3Qga3ZtaV9tc2dfaGRyIGhkcjsKKwkJ
c3RydWN0IGt2bWlfdm1fY2hlY2tfZXZlbnQgY21kOworCX0gcmVxID0ge307CisKKwlyZXEuY21k
LmlkID0gaWQ7CisKKwl0ZXN0X3ZtX2NvbW1hbmQoS1ZNSV9WTV9DSEVDS19FVkVOVCwgJnJlcS5o
ZHIsIHNpemVvZihyZXEpLCBOVUxMLCAwLAorCQkJZXhwZWN0ZWRfZXJyKTsKK30KKworc3RhdGlj
IHZvaWQgdGVzdF9jbWRfdm1fY2hlY2tfZXZlbnQodm9pZCkKK3sKKwlfX3UxNiBpbnZhbGlkX2lk
ID0gMHhmZmZmOworCisJY21kX3ZtX2NoZWNrX2V2ZW50KGludmFsaWRfaWQsIC1LVk1fRU5PRU5U
KTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZt
KQogewogCXNldHVwX3NvY2tldCgpOwpAQCAtMjQ4LDYgKzI5MSw4IEBAIHN0YXRpYyB2b2lkIHRl
c3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAogCXRlc3RfY21kX2ludmFsaWQo
KTsKIAl0ZXN0X2NtZF9nZXRfdmVyc2lvbigpOworCXRlc3RfY21kX3ZtX2NoZWNrX2NvbW1hbmQo
KTsKKwl0ZXN0X2NtZF92bV9jaGVja19ldmVudCgpOwogCiAJdW5ob29rX2ludHJvc3BlY3Rpb24o
dm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCA1MjBiZTk0Nzg2OTcuLjkxMjVlNmM5MmRl
ZCAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTE2LDYgKzE2LDcgQEAKICNkZWZpbmUgS1ZNSV9N
U0dfU0laRV9BTExPQyAoc2l6ZW9mKHN0cnVjdCBrdm1pX21zZ19oZHIpICsgS1ZNSV9NQVhfTVNH
X1NJWkUpCiAKIHN0YXRpYyBERUNMQVJFX0JJVE1BUChLdm1pX2Fsd2F5c19hbGxvd2VkX2NvbW1h
bmRzLCBLVk1JX05VTV9DT01NQU5EUyk7CitzdGF0aWMgREVDTEFSRV9CSVRNQVAoS3ZtaV9rbm93
bl9ldmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7CiAKIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAq
bXNnX2NhY2hlOwogCkBAIC01NSwxNSArNTYsMzMgQEAgYm9vbCBrdm1pX2lzX2NvbW1hbmRfYWxs
b3dlZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIHUxNiBpZCkKIAlyZXR1cm4gaWQg
PCBLVk1JX05VTV9DT01NQU5EUyAmJiB0ZXN0X2JpdChpZCwga3ZtaS0+Y21kX2FsbG93X21hc2sp
OwogfQogCitib29sIGt2bWlfaXNfZXZlbnRfYWxsb3dlZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gKmt2bWksIHUxNiBpZCkKK3sKKwlyZXR1cm4gaWQgPCBLVk1JX05VTV9FVkVOVFMgJiYgdGVz
dF9iaXQoaWQsIGt2bWktPmV2ZW50X2FsbG93X21hc2spOworfQorCitib29sIGt2bWlfaXNfa25v
d25fZXZlbnQodTE2IGlkKQoreworCXJldHVybiBpZCA8IEtWTUlfTlVNX0VWRU5UUyAmJiB0ZXN0
X2JpdChpZCwgS3ZtaV9rbm93bl9ldmVudHMpOworfQorCiBzdGF0aWMgdm9pZCBrdm1pX2luaXRf
YWx3YXlzX2FsbG93ZWRfY29tbWFuZHModm9pZCkKIHsKIAliaXRtYXBfemVybyhLdm1pX2Fsd2F5
c19hbGxvd2VkX2NvbW1hbmRzLCBLVk1JX05VTV9DT01NQU5EUyk7CiAJc2V0X2JpdChLVk1JX0dF
VF9WRVJTSU9OLCBLdm1pX2Fsd2F5c19hbGxvd2VkX2NvbW1hbmRzKTsKKwlzZXRfYml0KEtWTUlf
Vk1fQ0hFQ0tfQ09NTUFORCwgS3ZtaV9hbHdheXNfYWxsb3dlZF9jb21tYW5kcyk7CisJc2V0X2Jp
dChLVk1JX1ZNX0NIRUNLX0VWRU5ULCBLdm1pX2Fsd2F5c19hbGxvd2VkX2NvbW1hbmRzKTsKK30K
Kworc3RhdGljIHZvaWQga3ZtaV9pbml0X2tub3duX2V2ZW50cyh2b2lkKQoreworCWJpdG1hcF96
ZXJvKEt2bWlfa25vd25fZXZlbnRzLCBLVk1JX05VTV9FVkVOVFMpOwogfQogCiBpbnQga3ZtaV9p
bml0KHZvaWQpCiB7CiAJa3ZtaV9pbml0X2Fsd2F5c19hbGxvd2VkX2NvbW1hbmRzKCk7CisJa3Zt
aV9pbml0X2tub3duX2V2ZW50cygpOwogCiAJcmV0dXJuIGt2bWlfY2FjaGVfY3JlYXRlKCk7CiB9
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggMjA2YWFmOTNmOGJhLi4xZTFkMWZhZDQw
MzUgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysgYi92
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTIzLDUgKzIzLDcgQEAgYm9vbCBr
dm1pX21zZ19wcm9jZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSk7CiB2b2lkICpr
dm1pX21zZ19hbGxvYyh2b2lkKTsKIHZvaWQga3ZtaV9tc2dfZnJlZSh2b2lkICphZGRyKTsKIGJv
b2wga3ZtaV9pc19jb21tYW5kX2FsbG93ZWQoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1p
LCB1MTYgaWQpOworYm9vbCBrdm1pX2lzX2V2ZW50X2FsbG93ZWQoc3RydWN0IGt2bV9pbnRyb3Nw
ZWN0aW9uICprdm1pLCB1MTYgaWQpOworYm9vbCBrdm1pX2lzX2tub3duX2V2ZW50KHUxNiBpZCk7
CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5j
IGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCmluZGV4IDU3NzA4ZGEyYWYyMC4u
NjUzOGM3YWY3MTBhIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNn
LmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCkBAIC0xMiw2ICsxMiw4
IEBAIHR5cGVkZWYgaW50ICgqa3ZtaV92bV9tc2dfZmN0KShzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gKmt2bWksCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAogCQkJ
ICAgICAgIGNvbnN0IHZvaWQgKnJlcSk7CiAKK3N0YXRpYyBib29sIGlzX3ZtX2NvbW1hbmQodTE2
IGlkKTsKKwogYm9vbCBrdm1pX3NvY2tfZ2V0KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3Zt
aSwgaW50IGZkKQogewogCXN0cnVjdCBzb2NrZXQgKnNvY2s7CkBAIC0xMTQsMTEgKzExNiw0NyBA
QCBzdGF0aWMgaW50IGhhbmRsZV9nZXRfdmVyc2lvbihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24g
Kmt2bWksCiAJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywgMCwgJnJwbCwgc2l6
ZW9mKHJwbCkpOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV92bV9jaGVja19jb21tYW5kKHN0cnVj
dCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCQkgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2df
aGRyICptc2csCisJCQkJICAgY29uc3Qgdm9pZCAqX3JlcSkKK3sKKwljb25zdCBzdHJ1Y3Qga3Zt
aV92bV9jaGVja19jb21tYW5kICpyZXEgPSBfcmVxOworCWludCBlYyA9IDA7CisKKwlpZiAocmVx
LT5wYWRkaW5nMSB8fCByZXEtPnBhZGRpbmcyKQorCQllYyA9IC1LVk1fRUlOVkFMOworCWVsc2Ug
aWYgKCFpc192bV9jb21tYW5kKHJlcS0+aWQpKQorCQllYyA9IC1LVk1fRU5PRU5UOworCWVsc2Ug
aWYgKCFrdm1pX2lzX2NvbW1hbmRfYWxsb3dlZChrdm1pLCByZXEtPmlkKSkKKwkJZWMgPSAtS1ZN
X0VQRVJNOworCisJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywgZWMsIE5VTEws
IDApOworfQorCitzdGF0aWMgaW50IGhhbmRsZV92bV9jaGVja19ldmVudChzdHJ1Y3Qga3ZtX2lu
dHJvc3BlY3Rpb24gKmt2bWksCisJCQkJIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywK
KwkJCQkgY29uc3Qgdm9pZCAqX3JlcSkKK3sKKwljb25zdCBzdHJ1Y3Qga3ZtaV92bV9jaGVja19l
dmVudCAqcmVxID0gX3JlcTsKKwlpbnQgZWMgPSAwOworCisJaWYgKHJlcS0+cGFkZGluZzEgfHwg
cmVxLT5wYWRkaW5nMikKKwkJZWMgPSAtS1ZNX0VJTlZBTDsKKwllbHNlIGlmICgha3ZtaV9pc19r
bm93bl9ldmVudChyZXEtPmlkKSkKKwkJZWMgPSAtS1ZNX0VOT0VOVDsKKwllbHNlIGlmICgha3Zt
aV9pc19ldmVudF9hbGxvd2VkKGt2bWksIHJlcS0+aWQpKQorCQllYyA9IC1LVk1fRVBFUk07CisK
KwlyZXR1cm4ga3ZtaV9tc2dfdm1fcmVwbHkoa3ZtaSwgbXNnLCBlYywgTlVMTCwgMCk7Cit9CisK
IC8qCiAgKiBUaGVzZSBjb21tYW5kcyBhcmUgZXhlY3V0ZWQgYnkgdGhlIHJlY2VpdmluZyB0aHJl
YWQuCiAgKi8KIHN0YXRpYyBrdm1pX3ZtX21zZ19mY3QgY29uc3QgbXNnX3ZtW10gPSB7Ci0JW0tW
TUlfR0VUX1ZFUlNJT05dID0gaGFuZGxlX2dldF92ZXJzaW9uLAorCVtLVk1JX0dFVF9WRVJTSU9O
XSAgICAgID0gaGFuZGxlX2dldF92ZXJzaW9uLAorCVtLVk1JX1ZNX0NIRUNLX0NPTU1BTkRdID0g
aGFuZGxlX3ZtX2NoZWNrX2NvbW1hbmQsCisJW0tWTUlfVk1fQ0hFQ0tfRVZFTlRdICAgPSBoYW5k
bGVfdm1fY2hlY2tfZXZlbnQsCiB9OwogCiBzdGF0aWMga3ZtaV92bV9tc2dfZmN0IGdldF92bV9t
c2dfaGFuZGxlcih1MTYgaWQpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
