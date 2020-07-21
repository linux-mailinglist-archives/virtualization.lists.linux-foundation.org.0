Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 67688228AB1
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A16D86BD0;
	Tue, 21 Jul 2020 21:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZG2gqQQVEwc5; Tue, 21 Jul 2020 21:16:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C4F186C43;
	Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E91AAC016F;
	Tue, 21 Jul 2020 21:16:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A99B5C1830
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A1C2227AA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXxuoqm7G+9X
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 075FD2275A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5AE7E305D6CF; Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3D401304FA14;
 Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 29/84] KVM: x86: export kvm_inject_pending_exception()
Date: Wed, 22 Jul 2020 00:08:27 +0300
Message-Id: <20200721210922.7646-30-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIGlzIG5lZWRlZCBmb3IgdGhlIEtWTUlfVkNQVV9JTkpFQ1RfRVhDRVBUSU9OIGNvbW1hbmQu
CgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMSArCiBhcmNoL3g4Ni9rdm0v
eDg2LmMgICAgICAgICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IGU5MmExMjY0N2Y0ZC4uNDk5MmFmYzE5Y2Y2IDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTE1MDIsNiArMTUwMiw3IEBAIHVuc2lnbmVkIGxvbmcg
a3ZtX2dldF9yZmxhZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQga3ZtX3NldF9yZmxh
Z3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJmbGFncyk7CiBib29sIGt2
bV9yZHBtYyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCitib29sIGt2bV9pbmplY3RfcGVuZGlu
Z19leGNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQga3ZtX3F1ZXVlX2V4Y2Vw
dGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIG5yKTsKIHZvaWQga3ZtX3F1ZXVl
X2V4Y2VwdGlvbl9lKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbnIsIHUzMiBlcnJv
cl9jb2RlKTsKIHZvaWQga3ZtX3F1ZXVlX2V4Y2VwdGlvbl9wKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgbnIsIHVuc2lnbmVkIGxvbmcgcGF5bG9hZCk7CmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggMGJmYTgwMGQwY2E4Li41
MjE4MWViMTMxZGQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4
Ni9rdm0veDg2LmMKQEAgLTc3NzAsNiArNzc3MCwzNiBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfY3I4
X2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJa3ZtX3g4Nl9vcHMudXBkYXRlX2Ny
OF9pbnRlcmNlcHQodmNwdSwgdHByLCBtYXhfaXJyKTsKIH0KIAorYm9vbCBrdm1faW5qZWN0X3Bl
bmRpbmdfZXhjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAodmNwdS0+YXJj
aC5leGNlcHRpb24ucGVuZGluZykgeworCQl0cmFjZV9rdm1faW5qX2V4Y2VwdGlvbih2Y3B1LT5h
cmNoLmV4Y2VwdGlvbi5uciwKKwkJCQkJdmNwdS0+YXJjaC5leGNlcHRpb24uaGFzX2Vycm9yX2Nv
ZGUsCisJCQkJCXZjcHUtPmFyY2guZXhjZXB0aW9uLmVycm9yX2NvZGUpOworCisJCVdBUk5fT05f
T05DRSh2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5pbmplY3RlZCk7CisJCXZjcHUtPmFyY2guZXhjZXB0
aW9uLnBlbmRpbmcgPSBmYWxzZTsKKwkJdmNwdS0+YXJjaC5leGNlcHRpb24uaW5qZWN0ZWQgPSB0
cnVlOworCisJCWlmIChleGNlcHRpb25fdHlwZSh2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5ucikgPT0g
RVhDUFRfRkFVTFQpCisJCQlfX2t2bV9zZXRfcmZsYWdzKHZjcHUsIGt2bV9nZXRfcmZsYWdzKHZj
cHUpIHwKKwkJCQkJICAgICBYODZfRUZMQUdTX1JGKTsKKworCQlpZiAodmNwdS0+YXJjaC5leGNl
cHRpb24ubnIgPT0gREJfVkVDVE9SKSB7CisJCQlrdm1fZGVsaXZlcl9leGNlcHRpb25fcGF5bG9h
ZCh2Y3B1KTsKKwkJCWlmICh2Y3B1LT5hcmNoLmRyNyAmIERSN19HRCkgeworCQkJCXZjcHUtPmFy
Y2guZHI3ICY9IH5EUjdfR0Q7CisJCQkJa3ZtX3VwZGF0ZV9kcjcodmNwdSk7CisJCQl9CisJCX0K
KworCQlrdm1feDg2X29wcy5xdWV1ZV9leGNlcHRpb24odmNwdSk7CisJCXJldHVybiB0cnVlOwor
CX0KKworCXJldHVybiBmYWxzZTsKK30KKwogc3RhdGljIHZvaWQgaW5qZWN0X3BlbmRpbmdfZXZl
bnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sICpyZXFfaW1tZWRpYXRlX2V4aXQpCiB7CiAJ
aW50IHI7CkBAIC03ODIxLDI5ICs3ODUxLDggQEAgc3RhdGljIHZvaWQgaW5qZWN0X3BlbmRpbmdf
ZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sICpyZXFfaW1tZWRpYXRlX2V4aXQKIAl9
CiAKIAkvKiB0cnkgdG8gaW5qZWN0IG5ldyBldmVudCBpZiBwZW5kaW5nICovCi0JaWYgKHZjcHUt
PmFyY2guZXhjZXB0aW9uLnBlbmRpbmcpIHsKLQkJdHJhY2Vfa3ZtX2lual9leGNlcHRpb24odmNw
dS0+YXJjaC5leGNlcHRpb24ubnIsCi0JCQkJCXZjcHUtPmFyY2guZXhjZXB0aW9uLmhhc19lcnJv
cl9jb2RlLAotCQkJCQl2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5lcnJvcl9jb2RlKTsKLQotCQl2Y3B1
LT5hcmNoLmV4Y2VwdGlvbi5wZW5kaW5nID0gZmFsc2U7Ci0JCXZjcHUtPmFyY2guZXhjZXB0aW9u
LmluamVjdGVkID0gdHJ1ZTsKLQotCQlpZiAoZXhjZXB0aW9uX3R5cGUodmNwdS0+YXJjaC5leGNl
cHRpb24ubnIpID09IEVYQ1BUX0ZBVUxUKQotCQkJX19rdm1fc2V0X3JmbGFncyh2Y3B1LCBrdm1f
Z2V0X3JmbGFncyh2Y3B1KSB8Ci0JCQkJCSAgICAgWDg2X0VGTEFHU19SRik7Ci0KLQkJaWYgKHZj
cHUtPmFyY2guZXhjZXB0aW9uLm5yID09IERCX1ZFQ1RPUikgewotCQkJa3ZtX2RlbGl2ZXJfZXhj
ZXB0aW9uX3BheWxvYWQodmNwdSk7Ci0JCQlpZiAodmNwdS0+YXJjaC5kcjcgJiBEUjdfR0QpIHsK
LQkJCQl2Y3B1LT5hcmNoLmRyNyAmPSB+RFI3X0dEOwotCQkJCWt2bV91cGRhdGVfZHI3KHZjcHUp
OwotCQkJfQotCQl9Ci0KLQkJa3ZtX3g4Nl9vcHMucXVldWVfZXhjZXB0aW9uKHZjcHUpOworCWlm
IChrdm1faW5qZWN0X3BlbmRpbmdfZXhjZXB0aW9uKHZjcHUpKQogCQljYW5faW5qZWN0ID0gZmFs
c2U7Ci0JfQogCiAJLyoKIAkgKiBGaW5hbGx5LCBpbmplY3QgaW50ZXJydXB0IGV2ZW50cy4gIElm
IGFuIGV2ZW50IGNhbm5vdCBiZSBpbmplY3RlZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
