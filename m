Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E69578819D
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:50:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 17100DDC;
	Fri,  9 Aug 2019 17:50:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B89C2CBB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:49:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A38DC8A0
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:49:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	A22CB305D356; Fri,  9 Aug 2019 19:01:28 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 58C85305B7A3;
	Fri,  9 Aug 2019 19:01:28 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 65/92] kvm: introspection: add KVMI_EVENT_SINGLESTEP
Date: Fri,  9 Aug 2019 19:00:20 +0300
Message-Id: <20190809160047.8319-66-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGV2ZW50
IGlzIHNlbnQgd2hlbiB0aGUgY3VycmVudCBpbnN0cnVjdGlvbiBoYXMgYmVlbiBzaW5nbGUgc3Rl
cHBlZAphcyBhIHJlc3VsdCBvZiBhIEtWTUlfRVZFTlRfUEYgZXZlbnQgdG8gd2hpY2ggdGhlIGlu
dHJvc3BlY3Rpb24gdG9vbApzZXQgdGhlIHNpbmdsZXN0ZXAgZmllbGQgYW5kIHJlc3BvbmRlZCB3
aXRoIENPTlRJTlVFLgoKU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRk
ZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRl
ZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0IHwgMjUg
KysrKysrKysrKysrKysrKysrKwogdmlydC9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICB8
IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2NSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1p
LnJzdCBiL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QKaW5kZXggODcyMWE0NzBk
ZTg3Li41NzJhYmFiMWY2ZWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0v
a3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdApAQCAtMTU3
NCwzICsxNTc0LDI4IEBAIGludHJvc3BlY3Rpb24gaGFzIGJlZW4gZW5hYmxlZCBmb3IgdGhpcyBl
dmVudCAoc2VlICoqS1ZNSV9DT05UUk9MX0VWRU5UUyoqKS4KIAlLVk1JX0RFU0NfVFIKIAogYGB3
cml0ZWBgIGlzIDEgaWYgdGhlIGRlc2NyaXB0b3Igd2FzIHdyaXR0ZW4sIDAgb3RoZXJ3aXNlLgor
CisxMi4gS1ZNSV9FVkVOVF9TSU5HTEVTVEVQCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisK
KzpBcmNoaXRlY3R1cmVzOiB4ODYKKzpWZXJzaW9uczogPj0gMQorOkFjdGlvbnM6IENPTlRJTlVF
LCBDUkFTSAorOlBhcmFtZXRlcnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9ldmVudDsKKworOlJl
dHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2hkcjsKKwlzdHJ1Y3Qga3ZtaV9ldmVu
dF9yZXBseTsKKworVGhpcyBldmVudCBpcyBzZW50IHdoZW4gdGhlIGN1cnJlbnQgaW5zdHJ1Y3Rp
b24gaGFzIGJlZW4gZXhlY3V0ZWQKKyhhcyBhIHJlc3VsdCBvZiBhICpLVk1JX0VWRU5UX1BGKiBl
dmVudCB0byB3aGljaCB0aGUgaW50cm9zcGVjdGlvbgordG9vbCBzZXQgdGhlIGBgc2luZ2xlc3Rl
cGBgIGZpZWxkIGFuZCByZXNwb25kZWQgd2l0aCAqQ09OVElOVUUqKQorYW5kIHRoZSBpbnRyb3Nw
ZWN0aW9uIGhhcyBiZWVuIGVuYWJsZWQgZm9yIHRoaXMgZXZlbnQKKyhzZWUgKipLVk1JX0NPTlRS
T0xfRVZFTlRTKiopLgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtaS5jIGIvdmlydC9rdm0va3Zt
aS5jCmluZGV4IGEzYTVhZjkwODBhOS4uM2RmZWRmM2FlNzM5IDEwMDY0NAotLS0gYS92aXJ0L2t2
bS9rdm1pLmMKKysrIGIvdmlydC9rdm0va3ZtaS5jCkBAIC0xMTgyLDYgKzExODIsNDQgQEAgdm9p
ZCBrdm1pX3RyYXBfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCWt2bWlfcHV0KHZjcHUt
Pmt2bSk7CiB9CiAKK3N0YXRpYyB1MzIga3ZtaV9zZW5kX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQoreworCWludCBlcnIsIGFjdGlvbjsKKworCWVyciA9IGt2bWlfc2VuZF9ldmVu
dCh2Y3B1LCBLVk1JX0VWRU5UX1NJTkdMRVNURVAsIE5VTEwsIDAsCisJCQkgICAgICBOVUxMLCAw
LCAmYWN0aW9uKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElO
VUU7CisKKwlyZXR1cm4gYWN0aW9uOworfQorCitzdGF0aWMgdm9pZCBfX2t2bWlfc2luZ2xlc3Rl
cF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJdTMyIGFjdGlvbjsKKworCWFjdGlv
biA9IGt2bWlfc2VuZF9zaW5nbGVzdGVwKHZjcHUpOworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2Fz
ZSBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRToKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJa3Zt
aV9oYW5kbGVfY29tbW9uX2V2ZW50X2FjdGlvbnModmNwdSwgYWN0aW9uLCAiU0lOR0xFU1RFUCIp
OworCX0KK30KKworc3RhdGljIHZvaWQga3ZtaV9zaW5nbGVzdGVwX2V2ZW50KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtaV92Y3B1ICppdmNwdSA9IElWQ1BVKHZjcHUpOwor
CisJaWYgKCFpdmNwdS0+c3NfcmVxdWVzdGVkKQorCQlyZXR1cm47CisKKwlpZiAoaXNfZXZlbnRf
ZW5hYmxlZCh2Y3B1LCBLVk1JX0VWRU5UX1NJTkdMRVNURVApKQorCQlfX2t2bWlfc2luZ2xlc3Rl
cF9ldmVudCh2Y3B1KTsKKworCWl2Y3B1LT5zc19yZXF1ZXN0ZWQgPSBmYWxzZTsKK30KKwogc3Rh
dGljIGJvb2wgX19rdm1pX2NyZWF0ZV92Y3B1X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IHsKIAl1MzIgYWN0aW9uOwpAQCAtMTYxNiw2ICsxNjU0LDggQEAgdm9pZCBrdm1pX3N0b3Bfc3Mo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCiAJaXZjcHUtPnNzX293bmVyID0gZmFsc2U7CiAKKwlr
dm1pX3NpbmdsZXN0ZXBfZXZlbnQodmNwdSk7CisKIG91dDoKIAlrdm1pX3B1dChrdm0pOwogfQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
