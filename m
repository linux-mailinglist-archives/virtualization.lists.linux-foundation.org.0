Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49687F6A
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:16:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 677C2E1D;
	Fri,  9 Aug 2019 16:15:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2DA4CD8B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B6B267F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E0CC5305D36B; Fri,  9 Aug 2019 19:01:44 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 97C8A305B7A1;
	Fri,  9 Aug 2019 19:01:44 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 92/92] kvm: x86: fallback to the single-step on
	multipage CMPXCHG emulation
Date: Fri,  9 Aug 2019 19:00:47 +0300
Message-Id: <20190809160047.8319-93-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlcmUgYXJlIGNh
c2VzIHdoZXJlIHdlIG5lZWQgdG8gZW11bGF0ZSBhIENNUFhDSEcgdGhhdCB0b3VjaGVzIHR3bwpw
YWdlcyAoNCBpbiBvbmUgYW5kIGFub3RoZXIgNCBpbiB0aGUgbmV4dCwgZm9yIGV4YW1wbGUpLiBC
ZWNhdXNlIGl0CmlzIG5vdCBlYXN5IHRvIG1hcCB0d28gcGFnZXMgaW4gdGhlIGtlcm5lbCBzbyB0
aGF0IHdlIGNhbiBkaXJlY3RseQpleGVjdXRlIHRoZSBleGNoYW5nZSBpbnN0cnVjdGlvbiwgd2Ug
ZmFsbGJhY2sgdG8gc2luZ2xlLXN0ZXBwaW5nLgpMdWNrbHksIHRoaXMgaXMgYW4gdW5jb21tb24g
b2NjdXJyZW5jZSBtYWtpbmcgdGhlIG92ZXJoZWFkIG9mIHRoZQpzaW5nbGUtc3RlcCBtZWNoYW5p
c20gYWNjZXB0YWJsZS4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVm
ZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS94ODYuYyB8IDE1ICsrKysrKysrKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggMGU5MDQ3
ODJkMzAzLi5lMjgzYjA3NGRiMjYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94ODYuYworKysg
Yi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTU2NzEsNiArNTY3MSwxMiBAQCBzdGF0aWMgaW50IGVt
dWxhdG9yX2NtcHhjaGdfZW11bGF0ZWQoc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCiAj
ZGVmaW5lIENNUFhDSEdfTUFYX0JZVEVTIDgKICNlbmRpZgogCisJZ3BhID0ga3ZtX21tdV9ndmFf
dG9fZ3BhX3dyaXRlKHZjcHUsIGFkZHIsIE5VTEwpOworCisJaWYgKGdwYSA9PSBVTk1BUFBFRF9H
VkEgfHwKKwkgICAgKGdwYSAmIFBBR0VfTUFTSykgPT0gQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSkK
KwkJZ290byBlbXVsX3dyaXRlOworCiAJLyogZ3Vlc3RzIGNtcHhjaGd7OCwxNn1iIGhhdmUgdG8g
YmUgZW11bGF0ZWQgYXRvbWljYWxseSAqLwogCWlmIChieXRlcyA+IENNUFhDSEdfTUFYX0JZVEVT
IHx8IChieXRlcyAmIChieXRlcyAtIDEpKSkKIAkJZ290byBlbXVsX3dyaXRlOwpAQCAtNTY3OCwx
MiArNTY4NCw2IEBAIHN0YXRpYyBpbnQgZW11bGF0b3JfY21weGNoZ19lbXVsYXRlZChzdHJ1Y3Qg
eDg2X2VtdWxhdGVfY3R4dCAqY3R4dCwKIAlpZiAoYnl0ZXMgPT0gMTYgJiYgIXN5c3RlbV9oYXNf
Y21weGNoZ19kb3VibGUoKSkKIAkJZ290byBlbXVsX3dyaXRlOwogCi0JZ3BhID0ga3ZtX21tdV9n
dmFfdG9fZ3BhX3dyaXRlKHZjcHUsIGFkZHIsIE5VTEwpOwotCi0JaWYgKGdwYSA9PSBVTk1BUFBF
RF9HVkEgfHwKLQkgICAgKGdwYSAmIFBBR0VfTUFTSykgPT0gQVBJQ19ERUZBVUxUX1BIWVNfQkFT
RSkKLQkJZ290byBlbXVsX3dyaXRlOwotCiAJaWYgKCgoZ3BhICsgYnl0ZXMgLSAxKSAmIFBBR0Vf
TUFTSykgIT0gKGdwYSAmIFBBR0VfTUFTSykpCiAJCWdvdG8gZW11bF93cml0ZTsKIApAQCAtNTc3
Miw2ICs1NzcyLDkgQEAgc3RhdGljIGludCBlbXVsYXRvcl9jbXB4Y2hnX2VtdWxhdGVkKHN0cnVj
dCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LAogCXJldHVybiBYODZFTVVMX0NPTlRJTlVFOwogCiBl
bXVsX3dyaXRlOgorCWlmIChrdm1pX3RyYWNrZWRfZ2ZuKHZjcHUsIGdwYSA+PiBQQUdFX1NISUZU
KSkKKwkJcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOworCiAJcHJpbnRrX29uY2UoS0VSTl9X
QVJOSU5HICJrdm06IGVtdWxhdGluZyBleGNoYW5nZSBhcyB3cml0ZVxuIik7CiAKIAlyZXR1cm4g
ZW11bGF0b3Jfd3JpdGVfZW11bGF0ZWQoY3R4dCwgYWRkciwgbmV3LCBieXRlcywgZXhjZXB0aW9u
KTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
