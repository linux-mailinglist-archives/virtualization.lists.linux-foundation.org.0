Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6328820C
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:10:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E0D70DCB;
	Fri,  9 Aug 2019 18:10:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 467CCD09
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:09:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 81FCC89D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:09:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	A4D1C305D35C; Fri,  9 Aug 2019 19:01:38 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id E68C0305B7A1;
	Fri,  9 Aug 2019 19:01:35 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 74/92] kvm: x86: do not unconditionally patch the
	hypercall instruction during emulation
Date: Fri,  9 Aug 2019 19:00:29 +0300
Message-Id: <20190809160047.8319-75-alazar@bitdefender.com>
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
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	Joerg Roedel <joro@8bytes.org>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKSXQgY2FuIGhhcHBl
bmVkIGZvciB1cyB0byBlbmQgdXAgZW11bGF0aW5nIHRoZSBWTUNBTEwgaW5zdHJ1Y3Rpb24gYXMg
YQpyZXN1bHQgb2YgdGhlIGhhbmRsaW5nIG9mIGFuIEVQVCB3cml0ZSBmYXVsdC4gSW4gdGhpcyBz
aXR1YXRpb24sIHRoZQplbXVsYXRvciB3aWxsIHRyeSB0byB1bmNvbmRpdGlvbmFsbHkgcGF0Y2gg
dGhlIGNvcnJlY3QgaHlwZXJjYWxsIG9wY29kZQpieXRlcyB1c2luZyBlbXVsYXRvcl93cml0ZV9l
bXVsYXRlZCgpLiBIb3dldmVyLCB0aGlzIGxhc3QgY2FsbCB1c2VzIHRoZQpmYXVsdCBHUEEgKGlm
IGF2YWlsYWJsZSkgb3Igd2Fsa3MgdGhlIGd1ZXN0IHBhZ2UgdGFibGVzIGF0IFJJUCwKb3RoZXJ3
aXNlLiBUaGUgdHJvdWJsZSBiZWdpbnMgd2hlbiB1c2luZyBLVk1JLCB3aGVuIHdlIGZvcmJpZCB0
aGUgdXNlIG9mCnRoZSBmYXVsdCBHUEEgYW5kIGZhbGxiYWNrIHRvIHRoZSBndWVzdCBwdCB3YWxr
OiBpbiBXaW5kb3dzICg4LjEgYW5kCm5ld2VyKSB0aGUgcGFnZSB0aGF0IHdlIHRyeSB0byB3cml0
ZSBpbnRvIGlzIG1hcmtlZCByZWFkLWV4ZWN1dGUgYW5kIGFzCnN1Y2ggZW11bGF0b3Jfd3JpdGVf
ZW11bGF0ZWQoKSBmYWlscyBhbmQgd2UgaW5qZWN0IGEgd3JpdGUgI1BGLCBsZWFkaW5nCnRvIGEg
Z3Vlc3QgY3Jhc2guCgpUaGUgZml4IGlzIHJhdGhlciBzaW1wbGU6IGNoZWNrIHRoZSBleGlzdGlu
ZyBpbnN0cnVjdGlvbiBieXRlcyBiZWZvcmUKZG9pbmcgdGhlIHBhdGNoaW5nLiBUaGlzIGRvZXMg
bm90IGNoYW5nZSB0aGUgbm9ybWFsIEtWTSBiZWhhdmlvdXIsIGJ1dApkb2VzIGhlbHAgd2hlbiB1
c2luZyBLVk1JIGFzIHdlIG5vIGxvbmdlciBpbmplY3QgYSB3cml0ZSAjUEYuCgpDQzogSm9lcmcg
Um9lZGVsIDxqb3JvQDhieXRlcy5vcmc+ClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRv
bnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6
YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS94ODYuYyB8IDIzICsrKysrKysr
KysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMKaW5kZXggMDRiMWQyOTE2YTBhLi45NjVjNGYwMTA4ZWIgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTczNjMsMTYgKzczNjMs
MzMgQEAgaW50IGt2bV9lbXVsYXRlX2h5cGVyY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB9
CiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fZW11bGF0ZV9oeXBlcmNhbGwpOwogCisjZGVmaW5lIEtW
TV9IWVBFUkNBTExfSU5TTl9MRU4gMworCiBzdGF0aWMgaW50IGVtdWxhdG9yX2ZpeF9oeXBlcmNh
bGwoc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCiB7CisJaW50IGVycjsKIAlzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUgPSBlbXVsX3RvX3ZjcHUoY3R4dCk7Ci0JY2hhciBpbnN0cnVjdGlvblsz
XTsKKwljaGFyIGJ1ZltLVk1fSFlQRVJDQUxMX0lOU05fTEVOXTsKKwljaGFyIGluc3RydWN0aW9u
W0tWTV9IWVBFUkNBTExfSU5TTl9MRU5dOwogCXVuc2lnbmVkIGxvbmcgcmlwID0ga3ZtX3JpcF9y
ZWFkKHZjcHUpOwogCisJZXJyID0gZW11bGF0b3JfcmVhZF9lbXVsYXRlZChjdHh0LCByaXAsIGJ1
Ziwgc2l6ZW9mKGJ1ZiksCisJCQkJICAgICAmY3R4dC0+ZXhjZXB0aW9uKTsKKwlpZiAoZXJyICE9
IFg4NkVNVUxfQ09OVElOVUUpCisJCXJldHVybiBlcnI7CisKIAlrdm1feDg2X29wcy0+cGF0Y2hf
aHlwZXJjYWxsKHZjcHUsIGluc3RydWN0aW9uKTsKKwlpZiAoIW1lbWNtcChpbnN0cnVjdGlvbiwg
YnVmLCBzaXplb2YoaW5zdHJ1Y3Rpb24pKSkKKwkJLyoKKwkJICogVGhlIGh5cGVyY2FsbCBpbnN0
cnVjdGlvbiBpcyB0aGUgY29ycmVjdCBvbmUuIFJldHJ5CisJCSAqIGl0cyBleGVjdXRpb24gbWF5
YmUgd2UgZ290IGhlcmUgYXMgYSByZXN1bHQgb2YgYW4KKwkJICogZXZlbnQgb3RoZXIgdGhhbiAj
VUQgd2hpY2ggaGFzIGJlZW4gcmVzb2x2ZWQgaW4gdGhlCisJCSAqIG1lYW4gdGltZS4KKwkJICov
CisJCXJldHVybiBYODZFTVVMX0NPTlRJTlVFOwogCi0JcmV0dXJuIGVtdWxhdG9yX3dyaXRlX2Vt
dWxhdGVkKGN0eHQsIHJpcCwgaW5zdHJ1Y3Rpb24sIDMsCi0JCSZjdHh0LT5leGNlcHRpb24pOwor
CXJldHVybiBlbXVsYXRvcl93cml0ZV9lbXVsYXRlZChjdHh0LCByaXAsIGluc3RydWN0aW9uLAor
CQkJCSAgICAgICBzaXplb2YoaW5zdHJ1Y3Rpb24pLCAmY3R4dC0+ZXhjZXB0aW9uKTsKIH0KIAog
c3RhdGljIGludCBkbV9yZXF1ZXN0X2Zvcl9pcnFfaW5qZWN0aW9uKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
