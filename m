Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6919788A
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 50AA387A24;
	Mon, 30 Mar 2020 10:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OX7Ug2n-gfl5; Mon, 30 Mar 2020 10:13:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF22D879AB;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2F10C07FF;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71925C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C40787F81
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELUuEPpZ08Z1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D6BA587D57
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5CE69307489E; Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3EE5C305B7A1;
 Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 30/81] KVM: x86: export kvm_inject_pending_exception()
Date: Mon, 30 Mar 2020 13:12:17 +0300
Message-Id: <20200330101308.21702-31-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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
eDg2LmMgICAgICAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDg1ZDNjOWMyOTgzZi4uOTc3MmUwN2Y4MjUzIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTE0NzMsNiArMTQ3Myw3IEBAIHVuc2lnbmVkIGxvbmcg
a3ZtX2dldF9yZmxhZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQga3ZtX3NldF9yZmxh
Z3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJmbGFncyk7CiBib29sIGt2
bV9yZHBtYyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCit2b2lkIGt2bV9pbmplY3RfcGVuZGlu
Z19leGNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQga3ZtX3F1ZXVlX2V4Y2Vw
dGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIG5yKTsKIHZvaWQga3ZtX3F1ZXVl
X2V4Y2VwdGlvbl9lKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbnIsIHUzMiBlcnJv
cl9jb2RlKTsKIHZvaWQga3ZtX3JlcXVldWVfZXhjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgbnIpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCmluZGV4IGVkNmViMTI0MWNmMS4uMzI4ZDZiODQyOWEyIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC03NjM2LDYg
Kzc2MzYsNDMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2NyOF9pbnRlcmNlcHQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQogCWt2bV94ODZfb3BzLT51cGRhdGVfY3I4X2ludGVyY2VwdCh2Y3B1LCB0cHIs
IG1heF9pcnIpOwogfQogCit2b2lkIGt2bV9pbmplY3RfcGVuZGluZ19leGNlcHRpb24oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQoreworCWlmICh2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5wZW5kaW5nKSB7
CisJCXRyYWNlX2t2bV9pbmpfZXhjZXB0aW9uKHZjcHUtPmFyY2guZXhjZXB0aW9uLm5yLAorCQkJ
CQl2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5oYXNfZXJyb3JfY29kZSwKKwkJCQkJdmNwdS0+YXJjaC5l
eGNlcHRpb24uZXJyb3JfY29kZSk7CisKKwkJV0FSTl9PTl9PTkNFKHZjcHUtPmFyY2guZXhjZXB0
aW9uLmluamVjdGVkKTsKKwkJdmNwdS0+YXJjaC5leGNlcHRpb24ucGVuZGluZyA9IGZhbHNlOwor
CQl2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5pbmplY3RlZCA9IHRydWU7CisKKwkJaWYgKGV4Y2VwdGlv
bl90eXBlKHZjcHUtPmFyY2guZXhjZXB0aW9uLm5yKSA9PSBFWENQVF9GQVVMVCkKKwkJCV9fa3Zt
X3NldF9yZmxhZ3ModmNwdSwga3ZtX2dldF9yZmxhZ3ModmNwdSkgfAorCQkJCQkgICAgIFg4Nl9F
RkxBR1NfUkYpOworCisJCWlmICh2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5uciA9PSBEQl9WRUNUT1Ip
IHsKKwkJCS8qCisJCQkgKiBUaGlzIGNvZGUgYXNzdW1lcyB0aGF0IG5TVk0gZG9lc24ndCB1c2UK
KwkJCSAqIGNoZWNrX25lc3RlZF9ldmVudHMoKS4gSWYgaXQgZG9lcywgdGhlCisJCQkgKiBEUjYv
RFI3IGNoYW5nZXMgc2hvdWxkIGhhcHBlbiBiZWZvcmUgTDEKKwkJCSAqIGdldHMgYSAjVk1FWElU
IGZvciBhbiBpbnRlcmNlcHRlZCAjREIgaW4KKwkJCSAqIEwyLiAgKFVuZGVyIFZNWCwgb24gdGhl
IG90aGVyIGhhbmQsIHRoZQorCQkJICogRFI2L0RSNyBjaGFuZ2VzIHNob3VsZCBub3QgaGFwcGVu
IGluIHRoZQorCQkJICogZXZlbnQgb2YgYSBWTS1leGl0IHRvIEwxIGZvciBhbiBpbnRlcmNlcHRl
ZAorCQkJICogI0RCIGluIEwyLikKKwkJCSAqLworCQkJa3ZtX2RlbGl2ZXJfZXhjZXB0aW9uX3Bh
eWxvYWQodmNwdSk7CisJCQlpZiAodmNwdS0+YXJjaC5kcjcgJiBEUjdfR0QpIHsKKwkJCQl2Y3B1
LT5hcmNoLmRyNyAmPSB+RFI3X0dEOworCQkJCWt2bV91cGRhdGVfZHI3KHZjcHUpOworCQkJfQor
CQl9CisKKwkJa3ZtX3g4Nl9vcHMtPnF1ZXVlX2V4Y2VwdGlvbih2Y3B1KTsKKwl9Cit9CisKIHN0
YXRpYyBpbnQgaW5qZWN0X3BlbmRpbmdfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29s
IHJlcV9pbnRfd2luKQogewogCWludCByOwpAQCAtNzY3OCwzOSArNzcxNSw3IEBAIHN0YXRpYyBp
bnQgaW5qZWN0X3BlbmRpbmdfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHJlcV9p
bnRfd2luKQogCX0KIAogCS8qIHRyeSB0byBpbmplY3QgbmV3IGV2ZW50IGlmIHBlbmRpbmcgKi8K
LQlpZiAodmNwdS0+YXJjaC5leGNlcHRpb24ucGVuZGluZykgewotCQl0cmFjZV9rdm1faW5qX2V4
Y2VwdGlvbih2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5uciwKLQkJCQkJdmNwdS0+YXJjaC5leGNlcHRp
b24uaGFzX2Vycm9yX2NvZGUsCi0JCQkJCXZjcHUtPmFyY2guZXhjZXB0aW9uLmVycm9yX2NvZGUp
OwotCi0JCVdBUk5fT05fT05DRSh2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5pbmplY3RlZCk7Ci0JCXZj
cHUtPmFyY2guZXhjZXB0aW9uLnBlbmRpbmcgPSBmYWxzZTsKLQkJdmNwdS0+YXJjaC5leGNlcHRp
b24uaW5qZWN0ZWQgPSB0cnVlOwotCi0JCWlmIChleGNlcHRpb25fdHlwZSh2Y3B1LT5hcmNoLmV4
Y2VwdGlvbi5ucikgPT0gRVhDUFRfRkFVTFQpCi0JCQlfX2t2bV9zZXRfcmZsYWdzKHZjcHUsIGt2
bV9nZXRfcmZsYWdzKHZjcHUpIHwKLQkJCQkJICAgICBYODZfRUZMQUdTX1JGKTsKLQotCQlpZiAo
dmNwdS0+YXJjaC5leGNlcHRpb24ubnIgPT0gREJfVkVDVE9SKSB7Ci0JCQkvKgotCQkJICogVGhp
cyBjb2RlIGFzc3VtZXMgdGhhdCBuU1ZNIGRvZXNuJ3QgdXNlCi0JCQkgKiBjaGVja19uZXN0ZWRf
ZXZlbnRzKCkuIElmIGl0IGRvZXMsIHRoZQotCQkJICogRFI2L0RSNyBjaGFuZ2VzIHNob3VsZCBo
YXBwZW4gYmVmb3JlIEwxCi0JCQkgKiBnZXRzIGEgI1ZNRVhJVCBmb3IgYW4gaW50ZXJjZXB0ZWQg
I0RCIGluCi0JCQkgKiBMMi4gIChVbmRlciBWTVgsIG9uIHRoZSBvdGhlciBoYW5kLCB0aGUKLQkJ
CSAqIERSNi9EUjcgY2hhbmdlcyBzaG91bGQgbm90IGhhcHBlbiBpbiB0aGUKLQkJCSAqIGV2ZW50
IG9mIGEgVk0tZXhpdCB0byBMMSBmb3IgYW4gaW50ZXJjZXB0ZWQKLQkJCSAqICNEQiBpbiBMMi4p
Ci0JCQkgKi8KLQkJCWt2bV9kZWxpdmVyX2V4Y2VwdGlvbl9wYXlsb2FkKHZjcHUpOwotCQkJaWYg
KHZjcHUtPmFyY2guZHI3ICYgRFI3X0dEKSB7Ci0JCQkJdmNwdS0+YXJjaC5kcjcgJj0gfkRSN19H
RDsKLQkJCQlrdm1fdXBkYXRlX2RyNyh2Y3B1KTsKLQkJCX0KLQkJfQotCi0JCWt2bV94ODZfb3Bz
LT5xdWV1ZV9leGNlcHRpb24odmNwdSk7Ci0JfQorCWt2bV9pbmplY3RfcGVuZGluZ19leGNlcHRp
b24odmNwdSk7CiAKIAkvKiBEb24ndCBjb25zaWRlciBuZXcgZXZlbnQgaWYgd2UgcmUtaW5qZWN0
ZWQgYW4gZXZlbnQgKi8KIAlpZiAoa3ZtX2V2ZW50X25lZWRzX3JlaW5qZWN0aW9uKHZjcHUpKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
