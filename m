Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D287F76
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:17:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8A174E60;
	Fri,  9 Aug 2019 16:15:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9CA3EE31
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id BD2FD1DCF0
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	59BC2305D369; Fri,  9 Aug 2019 19:01:44 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id C8C39305B7A1;
	Fri,  9 Aug 2019 19:01:43 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 90/92] kvm: x86: emulate lock cmpxchg8b atomically
Date: Fri,  9 Aug 2019 19:00:45 +0300
Message-Id: <20190809160047.8319-91-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKQXMgaXQgd2FzIHRo
ZSBjYXNlIGZvciBsb2NrIGNtcHhjaGcsIGxvY2sgY21weGNoZzhiIHdhcyBlbXVsYXRlZCBpbiB0
d28Kc3RlcHMgdGhlIGZpcnN0IG9uZSBzZXR0aW5nL2NsZWFyaW5nIHRoZSB6ZXJvIGZsYWcgYW5k
IHRoZSBsYXN0IG9uZQptYWtpbmcgdGhlIGFjdHVhbCBhdG9taWMgb3BlcmF0aW9uLgoKVGhpcyBw
YXRjaCBmaXhlcyB0aGF0IGJ5IGNvbWJpbmluZyB0aGUgdHdvLCBpZS4gdGhlIHdyaXRlYmFjayBz
dGVwIGlzCm5vIGxvbmdlciBuZWNlc3NhcnkgYXMgdGhlIGZpcnN0IHN0ZXAgbWFkZSB0aGUgY2hh
bmdlcyBkaXJlY3RseSBpbgptZW1vcnkuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1k
b250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxh
emFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vZW11bGF0ZS5jIHwgNDIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS9lbXVsYXRlLmMgYi9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCmluZGV4IGRhYzRjMGNhMWVlMy4u
MjAzOGU0MmMxZWFlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCisrKyBiL2Fy
Y2gveDg2L2t2bS9lbXVsYXRlLmMKQEAgLTIzMjAsNyArMjMyMCw0NyBAQCBzdGF0aWMgaW50IGVt
X2NhbGxfbmVhcl9hYnMoc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCiAKIHN0YXRpYyBp
bnQgZW1fY21weGNoZzhiKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0KQogewotCXU2NCBv
bGQgPSBjdHh0LT5kc3Qub3JpZ192YWw2NDsKKwl1NjQgb2xkOworCisJaWYgKGN0eHQtPmxvY2tf
cHJlZml4KSB7CisJCWludCByYzsKKwkJdWxvbmcgbGluZWFyOworCQl1NjQgbmV3ID0gKHJlZ19y
ZWFkKGN0eHQsIFZDUFVfUkVHU19SQlgpICYgKHUzMiktMSkgfAorCQkJKChyZWdfcmVhZChjdHh0
LCBWQ1BVX1JFR1NfUkNYKSAmICh1MzIpLTEpIDw8IDMyKTsKKworCQlvbGQgPSAocmVnX3JlYWQo
Y3R4dCwgVkNQVV9SRUdTX1JBWCkgJiAodTMyKS0xKSB8CisJCQkoKHJlZ19yZWFkKGN0eHQsIFZD
UFVfUkVHU19SRFgpICYgKHUzMiktMSkgPDwgMzIpOworCisJCS8qIGRpc2FibGUgd3JpdGViYWNr
IGFsdG9nZXRoZXIgKi8KKwkJY3R4dC0+ZCAmPSB+U3JjV3JpdGU7CisJCWN0eHQtPmQgfD0gTm9X
cml0ZTsKKworCQlyYyA9IGxpbmVhcml6ZShjdHh0LCBjdHh0LT5kc3QuYWRkci5tZW0sIDgsIHRy
dWUsICZsaW5lYXIpOworCQlpZiAocmMgIT0gWDg2RU1VTF9DT05USU5VRSkKKwkJCXJldHVybiBy
YzsKKworCQlyYyA9IGN0eHQtPm9wcy0+Y21weGNoZ19lbXVsYXRlZChjdHh0LCBsaW5lYXIsICZv
bGQsICZuZXcsCisJCQkJCQkgY3R4dC0+ZHN0LmJ5dGVzLAorCQkJCQkJICZjdHh0LT5leGNlcHRp
b24pOworCisJCXN3aXRjaCAocmMpIHsKKwkJY2FzZSBYODZFTVVMX0NPTlRJTlVFOgorCQkJY3R4
dC0+ZWZsYWdzIHw9IFg4Nl9FRkxBR1NfWkY7CisJCQlicmVhazsKKwkJY2FzZSBYODZFTVVMX0NN
UFhDSEdfRkFJTEVEOgorCQkJKnJlZ193cml0ZShjdHh0LCBWQ1BVX1JFR1NfUkFYKSA9IG9sZCAm
ICh1MzIpLTE7CisJCQkqcmVnX3dyaXRlKGN0eHQsIFZDUFVfUkVHU19SRFgpID0gKG9sZCA+PiAz
MikgJiAodTMyKS0xOworCisJCQljdHh0LT5lZmxhZ3MgJj0gflg4Nl9FRkxBR1NfWkY7CisKKwkJ
CXJjID0gWDg2RU1VTF9DT05USU5VRTsKKwkJCWJyZWFrOworCQl9CisKKwkJcmV0dXJuIHJjOwor
CX0KKworCW9sZCA9IGN0eHQtPmRzdC5vcmlnX3ZhbDY0OwogCiAJaWYgKGN0eHQtPmRzdC5ieXRl
cyA9PSAxNikKIAkJcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
