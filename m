Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 08036228B25
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA6078825E;
	Tue, 21 Jul 2020 21:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHlObS6Fiuav; Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F3BE6882AC;
	Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC9BFC08A9;
	Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82342C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 715FC87A39
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbYA47a7QP3T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0FF287A72
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 27E0C305D4F1; Wed, 22 Jul 2020 00:09:28 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E52C2304FA12;
 Wed, 22 Jul 2020 00:09:27 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 57/84] KVM: introspection: add KVMI_VCPU_SET_REGISTERS
Date: Wed, 22 Jul 2020 00:08:55 +0300
Message-Id: <20200721210922.7646-58-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 virtualization@lists.linux-foundation.org
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKRHVyaW5nIGFuIGlu
dHJvc3BlY3Rpb24gZXZlbnQsIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgbWlnaHQgbmVlZCB0bwpj
aGFuZ2UgdGhlIHZDUFUgc3RhdGUsIGZvciBleGFtcGxlLCB0byBza2lwIHRoZSBjdXJyZW50IGlu
c3RydWN0aW9uLgoKVGhpcyBjb21tYW5kIGlzIGFsbG93ZWQgb25seSBkdXJpbmcgdkNQVSBldmVu
dHMgYW5kIHRoZSByZWdpc3RlcnMgd2lsbApiZSBzZXQgd2hlbiB0aGUgcmVwbHkgaGFzIGJlZW4g
cmVjZWl2ZWQuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRl
ci5jb20+CkNvLWRldmVsb3BlZC1ieTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJp
dGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBi
aXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJp
dGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0ICAgICAg
ICAgICAgICAgfCAyOSArKysrKysrKwogaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaCAgICAgICAg
ICAgICAgICAgICAgIHwgIDMgKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90
ZXN0LmMgIHwgNzMgKysrKysrKysrKysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9r
dm1pLmMgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWlfaW50LmggICAgICAgICAgICAgfCAgMyArCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWlfbXNnLmMgICAgICAgICAgICAgfCAxNyArKysrLQogNyBmaWxlcyBjaGFuZ2VkLCAxNDkgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmly
dC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IGY5
MDk1ZTFhOTQxNy4uYmQzNTAwMmMzMjU0IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQv
a3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTYx
Miw2ICs2MTIsMzUgQEAgcmVnaXN0ZXJzLCB0aGUgc3BlY2lhbCByZWdpc3RlcnMgYW5kIHRoZSBy
ZXF1ZXN0ZWQgc2V0IG9mIE1TUnMuCiAqIC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUg
Y2FuJ3QgYmUgaW50cm9zcGVjdGVkIHlldAogKiAtS1ZNX0VOT01FTSAtIHRoZXJlIGlzIG5vdCBl
bm91Z2ggbWVtb3J5IHRvIGFsbG9jYXRlIHRoZSByZXBseQogCisxMi4gS1ZNSV9WQ1BVX1NFVF9S
RUdJU1RFUlMKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczog
eDg2Cis6VmVyc2lvbnM6ID49IDEKKzpQYXJhbWV0ZXJzOgorCis6OgorCisJc3RydWN0IGt2bWlf
dmNwdV9oZHI7CisJc3RydWN0IGt2bV9yZWdzOworCis6UmV0dXJuczoKKworOjoKKworCXN0cnVj
dCBrdm1pX2Vycm9yX2NvZGUKKworU2V0cyB0aGUgZ2VuZXJhbCBwdXJwb3NlIHJlZ2lzdGVycyBm
b3IgdGhlIGdpdmVuIHZDUFUuIFRoZSBjaGFuZ2VzIGJlY29tZQordmlzaWJsZSB0byBvdGhlciB0
aHJlYWRzIGFjY2Vzc2luZyB0aGUgS1ZNIHZDUFUgc3RydWN0dXJlIGFmdGVyIHRoZSBldmVudAor
Y3VycmVudGx5IGJlaW5nIGhhbmRsZWQgaXMgcmVwbGllZCB0by4KKworOkVycm9yczoKKworKiAt
S1ZNX0VJTlZBTCAtIHRoZSBzZWxlY3RlZCB2Q1BVIGlzIGludmFsaWQKKyogLUtWTV9FSU5WQUwg
LSB0aGUgcGFkZGluZyBpcyBub3QgemVybworKiAtS1ZNX0VBR0FJTiAtIHRoZSBzZWxlY3RlZCB2
Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5ZXQKKyogLUtWTV9FT1BOT1RTVVBQIC0gdGhlIGNv
bW1hbmQgaGFzbid0IGJlZW4gcmVjZWl2ZWQgZHVyaW5nIGFuIGludHJvc3BlY3Rpb24gZXZlbnQK
KwogRXZlbnRzCiA9PT09PT0KIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3Qu
aCBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKaW5kZXggOTYyNWM4ZjE5Mzc5Li44NTdiNzVh
MjY2NGEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKKysrIGIvaW5jbHVk
ZS9saW51eC9rdm1pX2hvc3QuaApAQCAtMzMsNiArMzMsOSBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfaW50
cm9zcGVjdGlvbiB7CiAJYm9vbCB3YWl0aW5nX2Zvcl9yZXBseTsKIAogCXVuc2lnbmVkIGxvbmcg
KmV2X2VuYWJsZV9tYXNrOworCisJc3RydWN0IGt2bV9yZWdzIGRlbGF5ZWRfcmVnczsKKwlib29s
IGhhdmVfZGVsYXllZF9yZWdzOwogfTsKIAogc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uIHsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggYi9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtaS5oCmluZGV4IDM5ZmY1NGI0YjY2MS4uNWY2MzdhMjFhOTA3IDEwMDY0NAotLS0gYS9pbmNs
dWRlL3VhcGkvbGludXgva3ZtaS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAg
LTI5LDYgKzI5LDcgQEAgZW51bSB7CiAJS1ZNSV9WQ1BVX1BBVVNFICAgICAgICAgID0gOSwKIAlL
Vk1JX1ZDUFVfQ09OVFJPTF9FVkVOVFMgPSAxMCwKIAlLVk1JX1ZDUFVfR0VUX1JFR0lTVEVSUyAg
PSAxMSwKKwlLVk1JX1ZDUFVfU0VUX1JFR0lTVEVSUyAgPSAxMiwKIAogCUtWTUlfTlVNX01FU1NB
R0VTCiB9OwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9r
dm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0
LmMKaW5kZXggNzNhYWZjNWQ5NTlhLi5mZmQwMzM3ZDA1NjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpAQCAtOTYxLDYgKzk2MSw3OCBAQCBz
dGF0aWMgdm9pZCB0ZXN0X2NtZF92Y3B1X2dldF9yZWdpc3RlcnMoc3RydWN0IGt2bV92bSAqdm0p
CiAJdGVzdF9pbnZhbGlkX3ZjcHVfZ2V0X3JlZ2lzdGVycyh2bSk7CiB9CiAKK3N0YXRpYyBpbnQg
X19jbWRfdmNwdV9zZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdm0gKnZtLAorCQkJCSAgICBzdHJ1
Y3Qga3ZtX3JlZ3MgKnJlZ3MpCit7CisJc3RydWN0IHsKKwkJc3RydWN0IGt2bWlfbXNnX2hkciBo
ZHI7CisJCXN0cnVjdCBrdm1pX3ZjcHVfaGRyIHZjcHVfaGRyOworCQlzdHJ1Y3Qga3ZtX3JlZ3Mg
cmVnczsKKwl9IHJlcSA9IHt9OworCisJbWVtY3B5KCZyZXEucmVncywgcmVncywgc2l6ZW9mKHJl
cS5yZWdzKSk7CisKKwlyZXR1cm4gX19kb192Y3B1MF9jb21tYW5kKEtWTUlfVkNQVV9TRVRfUkVH
SVNURVJTLAorCQkJCSAgJnJlcS5oZHIsIHNpemVvZihyZXEpLCBOVUxMLCAwKTsKK30KKworc3Rh
dGljIHZvaWQgdGVzdF9pbnZhbGlkX2NtZF92Y3B1X3NldF9yZWdpc3RlcnMoc3RydWN0IGt2bV92
bSAqdm0pCit7CisJc3RydWN0IHZjcHVfd29ya2VyX2RhdGEgZGF0YSA9IHsudm0gPSB2bSwgLnZj
cHVfaWQgPSBWQ1BVX0lEfTsKKwlwdGhyZWFkX3QgdmNwdV90aHJlYWQ7CisJc3RydWN0IGt2bV9y
ZWdzIHJlZ3M7CisJaW50IHI7CisKKwl2Y3B1X3RocmVhZCA9IHN0YXJ0X3ZjcHVfd29ya2VyKCZk
YXRhKTsKKworCXIgPSBfX2NtZF92Y3B1X3NldF9yZWdpc3RlcnModm0sICZyZWdzKTsKKworCXN0
b3BfdmNwdV93b3JrZXIodmNwdV90aHJlYWQsICZkYXRhKTsKKworCVRFU1RfQVNTRVJUKHIgPT0g
LUtWTV9FT1BOT1RTVVBQLAorCQkiS1ZNSV9WQ1BVX1NFVF9SRUdJU1RFUlMgZGlkbid0IGZhaWxl
ZCB3aXRoIEtWTV9FT1BOT1RTVVBQLCBlcnJvciAlZCglcylcbiIsCisJCS1yLCBrdm1fc3RyZXJy
b3IoLXIpKTsKK30KKworc3RhdGljIHZvaWQgX19zZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdm0g
KnZtLAorCQkJICAgIHN0cnVjdCBrdm1fcmVncyAqcmVncykKK3sKKwlpbnQgcjsKKworCXIgPSBf
X2NtZF92Y3B1X3NldF9yZWdpc3RlcnModm0sIHJlZ3MpOworCVRFU1RfQVNTRVJUKHIgPT0gMCwK
KwkJIktWTUlfVkNQVV9TRVRfUkVHSVNURVJTIGZhaWxlZCwgZXJyb3IgJWQoJXMpXG4iLAorCQkt
ciwga3ZtX3N0cmVycm9yKC1yKSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfY21kX3ZjcHVfc2V0
X3JlZ2lzdGVycyhzdHJ1Y3Qga3ZtX3ZtICp2bSkKK3sKKwlzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0
YSBkYXRhID0gey52bSA9IHZtLCAudmNwdV9pZCA9IFZDUFVfSUR9OworCV9fdTE2IGV2ZW50X2lk
ID0gS1ZNSV9FVkVOVF9QQVVTRV9WQ1BVOworCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCXB0
aHJlYWRfdCB2Y3B1X3RocmVhZDsKKwlzdHJ1Y3Qga3ZtaV9ldmVudCBldjsKKwlzdHJ1Y3QgdmNw
dV9yZXBseSBycGwgPSB7fTsKKwlzdHJ1Y3Qga3ZtX3JlZ3MgcmVncyA9IHt9OworCisJY21kX3Zj
cHVfZ2V0X3JlZ2lzdGVycyh2bSwgJnJlZ3MpOworCisJdGVzdF9pbnZhbGlkX2NtZF92Y3B1X3Nl
dF9yZWdpc3RlcnModm0pOworCisJcGF1c2VfdmNwdSgpOworCisJdmNwdV90aHJlYWQgPSBzdGFy
dF92Y3B1X3dvcmtlcigmZGF0YSk7CisKKwlyZWNlaXZlX2V2ZW50KCZoZHIsICZldiwgc2l6ZW9m
KGV2KSwgZXZlbnRfaWQpOworCisJX19zZXRfcmVnaXN0ZXJzKHZtLCAmZXYuYXJjaC5yZWdzKTsK
KworCXJlcGx5X3RvX2V2ZW50KCZoZHIsICZldiwgS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElOVUUs
CisJCQkmcnBsLCBzaXplb2YocnBsKSk7CisKKwlzdG9wX3ZjcHVfd29ya2VyKHZjcHVfdGhyZWFk
LCAmZGF0YSk7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3Zt
X3ZtICp2bSkKIHsKIAlzcmFuZG9tKHRpbWUoMCkpOwpAQCAtOTc5LDYgKzEwNTEsNyBAQCBzdGF0
aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9wYXVz
ZSh2bSk7CiAJdGVzdF9jbWRfdmNwdV9jb250cm9sX2V2ZW50cyh2bSk7CiAJdGVzdF9jbWRfdmNw
dV9nZXRfcmVnaXN0ZXJzKHZtKTsKKwl0ZXN0X2NtZF92Y3B1X3NldF9yZWdpc3RlcnModm0pOwog
CiAJdW5ob29rX2ludHJvc3BlY3Rpb24odm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50
cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCAy
ODZhODFlNTVkOWQuLjJiZmZlOWVlNWI2OSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVj
dGlvbi9rdm1pLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTg2MSwz
ICs4NjEsMjcgQEAgaW50IGt2bWlfY21kX3ZjcHVfcGF1c2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBib29sIHdhaXQpCiAKIAlyZXR1cm4gMDsKIH0KKworaW50IGt2bWlfY21kX3ZjcHVfc2V0X3Jl
Z2lzdGVycyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJY29uc3Qgc3RydWN0IGt2bV9yZWdz
ICpyZWdzKQoreworCXN0cnVjdCBrdm1fdmNwdV9pbnRyb3NwZWN0aW9uICp2Y3B1aSA9IFZDUFVJ
KHZjcHUpOworCisJaWYgKCF2Y3B1aS0+d2FpdGluZ19mb3JfcmVwbHkpCisJCXJldHVybiAtS1ZN
X0VPUE5PVFNVUFA7CisKKwltZW1jcHkoJnZjcHVpLT5kZWxheWVkX3JlZ3MsIHJlZ3MsIHNpemVv
Zih2Y3B1aS0+ZGVsYXllZF9yZWdzKSk7CisJdmNwdWktPmhhdmVfZGVsYXllZF9yZWdzID0gdHJ1
ZTsKKworCXJldHVybiAwOworfQorCit2b2lkIGt2bWlfcG9zdF9yZXBseShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCit7CisJc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24gKnZjcHVpID0gVkNQ
VUkodmNwdSk7CisKKwlpZiAodmNwdWktPmhhdmVfZGVsYXllZF9yZWdzKSB7CisJCWt2bV9hcmNo
X3ZjcHVfc2V0X3JlZ3ModmNwdSwgJnZjcHVpLT5kZWxheWVkX3JlZ3MsIGZhbHNlKTsKKwkJdmNw
dWktPmhhdmVfZGVsYXllZF9yZWdzID0gZmFsc2U7CisJfQorfQpkaWZmIC0tZ2l0IGEvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
X2ludC5oCmluZGV4IDc0MGVlYTNhOTUzMS4uMWQ1YTA3Mjc3MDcyIDEwMDY0NAotLS0gYS92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlv
bi9rdm1pX2ludC5oCkBAIC00MCw2ICs0MCw3IEBAIGludCBrdm1pX2FkZF9qb2Ioc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAogCQkgdm9pZCAoKmZjdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lk
ICpjdHgpLAogCQkgdm9pZCAqY3R4LCB2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpOwogdm9p
ZCBrdm1pX3J1bl9qb2JzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bWlfcG9zdF9y
ZXBseShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogaW50IGt2bWlfY21kX3ZtX2NvbnRyb2xfZXZl
bnRzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKIAkJCQl1bnNpZ25lZCBpbnQgZXZl
bnRfaWQsIGJvb2wgZW5hYmxlKTsKIGludCBrdm1pX2NtZF92Y3B1X2NvbnRyb2xfZXZlbnRzKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKQEAgLTUyLDYgKzUzLDggQEAgaW50IGt2bWlfY21kX3JlYWRf
cGh5c2ljYWwoc3RydWN0IGt2bSAqa3ZtLCB1NjQgZ3BhLCBzaXplX3Qgc2l6ZSwKIGludCBrdm1p
X2NtZF93cml0ZV9waHlzaWNhbChzdHJ1Y3Qga3ZtICprdm0sIHU2NCBncGEsIHNpemVfdCBzaXpl
LAogCQkJICAgIGNvbnN0IHZvaWQgKmJ1Zik7CiBpbnQga3ZtaV9jbWRfdmNwdV9wYXVzZShzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgd2FpdCk7CitpbnQga3ZtaV9jbWRfdmNwdV9zZXRfcmVn
aXN0ZXJzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQljb25zdCBzdHJ1Y3Qga3ZtX3JlZ3Mg
KnJlZ3MpOwogCiAvKiBhcmNoICovCiBpbnQga3ZtaV9hcmNoX2NtZF92Y3B1X2dldF9pbmZvKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24v
a3ZtaV9tc2cuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwppbmRleCA2Yzdh
NjAwZGQ0NzcuLmVkNDNlNGQ1ZjViMiAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlv
bi9rdm1pX21zZy5jCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwpAQCAt
NDM3LDYgKzQzNywxOCBAQCBzdGF0aWMgaW50IGhhbmRsZV92Y3B1X2dldF9yZWdpc3RlcnMoY29u
c3Qgc3RydWN0IGt2bWlfdmNwdV9tc2dfam9iICpqb2IsCiAJcmV0dXJuIGVycjsKIH0KIAorc3Rh
dGljIGludCBoYW5kbGVfdmNwdV9zZXRfcmVnaXN0ZXJzKGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVf
bXNnX2pvYiAqam9iLAorCQkJCSAgICAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAor
CQkJCSAgICAgY29uc3Qgdm9pZCAqX3JlcSkKK3sKKwljb25zdCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJl
Z3MgPSBfcmVxOworCWludCBlYzsKKworCWVjID0ga3ZtaV9jbWRfdmNwdV9zZXRfcmVnaXN0ZXJz
KGpvYi0+dmNwdSwgcmVncyk7CisKKwlyZXR1cm4ga3ZtaV9tc2dfdmNwdV9yZXBseShqb2IsIG1z
ZywgZWMsIE5VTEwsIDApOworfQorCiAvKgogICogVGhlc2UgZnVuY3Rpb25zIGFyZSBleGVjdXRl
ZCBmcm9tIHRoZSB2Q1BVIHRocmVhZC4gVGhlIHJlY2VpdmluZyB0aHJlYWQKICAqIHBhc3NlcyB0
aGUgbWVzc2FnZXMgdXNpbmcgYSBuZXdseSBhbGxvY2F0ZWQgJ3N0cnVjdCBrdm1pX3ZjcHVfbXNn
X2pvYicKQEAgLTQ0OSw2ICs0NjEsNyBAQCBzdGF0aWMgaW50KCpjb25zdCBtc2dfdmNwdVtdKShj
b25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKiwKIAlbS1ZNSV9WQ1BVX0NPTlRST0xfRVZF
TlRTXSA9IGhhbmRsZV92Y3B1X2NvbnRyb2xfZXZlbnRzLAogCVtLVk1JX1ZDUFVfR0VUX0lORk9d
ICAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X2luZm8sCiAJW0tWTUlfVkNQVV9HRVRfUkVHSVNURVJT
XSAgPSBoYW5kbGVfdmNwdV9nZXRfcmVnaXN0ZXJzLAorCVtLVk1JX1ZDUFVfU0VUX1JFR0lTVEVS
U10gID0gaGFuZGxlX3ZjcHVfc2V0X3JlZ2lzdGVycywKIH07CiAKIHN0YXRpYyBib29sIGlzX3Zj
cHVfY29tbWFuZCh1MTYgaWQpCkBAIC03NDMsOCArNzU2LDEwIEBAIHN0YXRpYyBpbnQga3ZtaV9z
ZW5kX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGV2X2lkLAogCiAJZXJyID0gdmNw
dWktPnJlcGx5LmVycm9yOwogCi0JaWYgKCFlcnIpCisJaWYgKCFlcnIpIHsKKwkJa3ZtaV9wb3N0
X3JlcGx5KHZjcHUpOwogCQkqYWN0aW9uID0gdmNwdWktPnJlcGx5LmFjdGlvbjsKKwl9CiAKIG91
dDoKIAlpZiAoZXJyKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
